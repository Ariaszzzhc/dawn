SKIP: FAILED


enable chromium_experimental_read_write_storage_texture;

@group(1) @binding(0) var arg_0 : texture_storage_1d<rgba16sint, read_write>;

fn textureDimensions_c27466() {
  var res : u32 = textureDimensions(arg_0);
  prevent_dce = res;
}

@group(2) @binding(0) var<storage, read_write> prevent_dce : u32;

@vertex
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureDimensions_c27466();
  return vec4<f32>();
}

@fragment
fn fragment_main() {
  textureDimensions_c27466();
}

@compute @workgroup_size(1)
fn compute_main() {
  textureDimensions_c27466();
}

Failed to generate: builtins/gen/literal/textureDimensions/c27466.wgsl:24:8 error: HLSL backend does not support extension 'chromium_experimental_read_write_storage_texture'
enable chromium_experimental_read_write_storage_texture;
       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

