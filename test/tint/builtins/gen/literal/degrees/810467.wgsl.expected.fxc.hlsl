void degrees_810467() {
  float2 res = (57.295780181884765625f).xx;
}

struct tint_symbol {
  float4 value : SV_Position;
};

float4 vertex_main_inner() {
  degrees_810467();
  return (0.0f).xxxx;
}

tint_symbol vertex_main() {
  float4 inner_result = vertex_main_inner();
  tint_symbol wrapper_result = (tint_symbol)0;
  wrapper_result.value = inner_result;
  return wrapper_result;
}

void fragment_main() {
  degrees_810467();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  degrees_810467();
  return;
}
