#version 310 es

void fract_2eddfe() {
  float res = 0.25f;
}

vec4 vertex_main() {
  fract_2eddfe();
  return vec4(0.0f);
}

void main() {
  gl_PointSize = 1.0;
  vec4 inner_result = vertex_main();
  gl_Position = inner_result;
  gl_Position.y = -(gl_Position.y);
  gl_Position.z = ((2.0f * gl_Position.z) - gl_Position.w);
  return;
}
#version 310 es
precision highp float;
precision highp int;

void fract_2eddfe() {
  float res = 0.25f;
}

void fragment_main() {
  fract_2eddfe();
}

void main() {
  fragment_main();
  return;
}
#version 310 es

void fract_2eddfe() {
  float res = 0.25f;
}

void compute_main() {
  fract_2eddfe();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
