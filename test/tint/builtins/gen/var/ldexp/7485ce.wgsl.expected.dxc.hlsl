RWByteAddressBuffer prevent_dce : register(u0, space2);

void ldexp_7485ce() {
  vector<float16_t, 3> arg_0 = (float16_t(1.0h)).xxx;
  int3 arg_1 = (1).xxx;
  vector<float16_t, 3> res = ldexp(arg_0, arg_1);
  prevent_dce.Store<vector<float16_t, 3> >(0u, res);
}

struct tint_symbol {
  float4 value : SV_Position;
};

float4 vertex_main_inner() {
  ldexp_7485ce();
  return (0.0f).xxxx;
}

tint_symbol vertex_main() {
  float4 inner_result = vertex_main_inner();
  tint_symbol wrapper_result = (tint_symbol)0;
  wrapper_result.value = inner_result;
  return wrapper_result;
}

void fragment_main() {
  ldexp_7485ce();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  ldexp_7485ce();
  return;
}
