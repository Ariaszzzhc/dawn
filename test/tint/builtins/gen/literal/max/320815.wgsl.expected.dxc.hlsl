RWByteAddressBuffer prevent_dce : register(u0, space2);

void max_320815() {
  uint2 res = (1u).xx;
  prevent_dce.Store2(0u, asuint(res));
}

struct tint_symbol {
  float4 value : SV_Position;
};

float4 vertex_main_inner() {
  max_320815();
  return (0.0f).xxxx;
}

tint_symbol vertex_main() {
  float4 inner_result = vertex_main_inner();
  tint_symbol wrapper_result = (tint_symbol)0;
  wrapper_result.value = inner_result;
  return wrapper_result;
}

void fragment_main() {
  max_320815();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  max_320815();
  return;
}
