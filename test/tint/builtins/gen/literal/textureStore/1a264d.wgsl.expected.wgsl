enable chromium_internal_graphite;

@group(1) @binding(0) var arg_0 : texture_storage_3d<r8unorm, write>;

fn textureStore_1a264d() {
  textureStore(arg_0, vec3<i32>(1i), vec4<f32>(1.0f));
}

@vertex
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureStore_1a264d();
  return vec4<f32>();
}

@fragment
fn fragment_main() {
  textureStore_1a264d();
}

@compute @workgroup_size(1)
fn compute_main() {
  textureStore_1a264d();
}
