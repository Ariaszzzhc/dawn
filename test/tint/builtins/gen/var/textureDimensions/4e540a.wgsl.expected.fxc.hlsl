SKIP: FAILED


enable chromium_experimental_read_write_storage_texture;

@group(1) @binding(0) var arg_0 : texture_storage_1d<r32sint, read_write>;

fn textureDimensions_4e540a() {
  var res : u32 = textureDimensions(arg_0);
  prevent_dce = res;
}

@group(2) @binding(0) var<storage, read_write> prevent_dce : u32;

@vertex
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureDimensions_4e540a();
  return vec4<f32>();
}

@fragment
fn fragment_main() {
  textureDimensions_4e540a();
}

@compute @workgroup_size(1)
fn compute_main() {
  textureDimensions_4e540a();
}

Failed to generate: builtins/gen/var/textureDimensions/4e540a.wgsl:24:8 error: HLSL backend does not support extension 'chromium_experimental_read_write_storage_texture'
enable chromium_experimental_read_write_storage_texture;
       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

