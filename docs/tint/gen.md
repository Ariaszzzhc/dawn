# Code generation

Tint makes use of code generation tooling to emit source code and build files
used to build Tint.

All code is generated with `./tools/run gen`.

The generator uses heavy use of Go's [text/template](https://pkg.go.dev/text/template)
package. This is augmented with the functions declared in [`tools/src/template/template.go`](../../tools/src/template/template.go), and the data types provided by the tooling.

## Build file generation

The generator will scan all the Tint source directories to produce `BUILD.gn`
and `BUILD.cmake` files. These files contain the per-directory targets,
conditionals and inter-target dependency information which is labour-intensive
to maintain by hand.

The bulk of the build generator logic is in the file: [`tools/src/cmd/gen/build/build.go`](../../tools/src/cmd/gen/build/build.go)

### Targets

There are 4 kinds of build target:

* `lib` targets are libraries used in production code, and can also be used as
  a dependency by any other target kind .
* `test` targets are libraries used by Tint unittests. Must not be used by
  production code.
* `bench` targets are libraries used by Tint benchmarks. Must not be used by
  production code.
* `cmd` targets are executables.

The build generator uses a file naming convention to classify each source file to a single target kind:

* Source files with a `_test` suffix before the file extension are classed as
  `test` targets. Example: `parser_test.cc`.
* Source files with a `_bench` suffix before the file extension are classed as
  `bench` targets. Example: `writer_bench.cc`.
* Source files with the name `main.cc` are classed as executable entry-points.
  These typically exist under `src/tint/cmd`. Example: `main.cc`.
* All other files are considered `lib` targets. Example: `parser.cc`.

Each source directory can have at most one `lib`, `test`, `bench` or `cmd`
target.

The graph of target dependencies must be acyclic (DAG).

Target dependencies are automatically inferred from `#include`s made by the source files.
Additional target dependencies can be added with the use of a [`BUILD.cfg` file](#buildcfg-files).

### `GEN_BUILD` directives

Source and build files can be annotated with special directives in comments to control the build file generation.

| Directive | Description |
|-----------|-------------|
| `GEN_BUILD:IGNORE` | Apply to the end of a `#include` in a source file to ignore this include for dependency analysis <br> Example: `#include "foo/bar.h"  // GEN_BUILD:IGNORE` |
| `GEN_BUILD:CONDITION(`_cond_`)` | Applies the build condition for this source file. <br> Example: `// GEN_BUILD:CONDITION(is_linux)` |
| `GEN_BUILD:DO_NOT_GENERATE` | Prevents the `BUILD.*` file from being generated. <br> Example: `# GEN_BUILD:DO_NOT_GENERATE` |

### `BUILD.cfg` files

A source directory may have an optional `BUILD.cfg` JSON file. The syntax of this file is:

```json
{
  /* Build condition to apply to all targets of this directory. */
  "Condition": "cond",
  /* Options for the 'lib' target */
  "lib": { /* see TargetConfig */ },
  /* Options for the 'test' target */
  "test": { /* see TargetConfig */ },
  /* Options for the 'bench' target */
  "bench": { /* see TargetConfig */ },
  /* Options for the 'cmd' target */
  "cmd": { /* see TargetConfig */ },
}
```

All fields are optional.

The syntax of `TargetConfig` is:

```json
{
  "AdditionalDependencies": [
    /*
    A list of target patterns that should in added as dependencies to this target.
    And use the '*' wildcard for a single directory, or '**' as a multi-directory
    wildcard.
    */
  ],
}
```

All fields are optional.

## Templates

The build generator will emit a `BUILD.`_ext_ file in each source directory, for each `BUILD.`_ext_`.tmpl` file found in [`tools/src/cmd/gen/build`](../../tools/src/cmd/gen/build).

The template will be passed the [`Directory`](../../tools/src/cmd/gen/build/directory.go) as `$`.