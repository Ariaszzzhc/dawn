RWByteAddressBuffer prevent_dce : register(u0, space2);

void reverseBits_a6ccd4() {
  uint3 arg_0 = (1u).xxx;
  uint3 res = reversebits(arg_0);
  prevent_dce.Store3(0u, asuint(res));
}

struct tint_symbol {
  float4 value : SV_Position;
};

float4 vertex_main_inner() {
  reverseBits_a6ccd4();
  return (0.0f).xxxx;
}

tint_symbol vertex_main() {
  float4 inner_result = vertex_main_inner();
  tint_symbol wrapper_result = (tint_symbol)0;
  wrapper_result.value = inner_result;
  return wrapper_result;
}

void fragment_main() {
  reverseBits_a6ccd4();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  reverseBits_a6ccd4();
  return;
}
