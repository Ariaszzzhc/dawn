RWByteAddressBuffer prevent_dce : register(u0, space2);

void tan_7ea104() {
  float3 res = (1.55740773677825927734f).xxx;
  prevent_dce.Store3(0u, asuint(res));
}

struct tint_symbol {
  float4 value : SV_Position;
};

float4 vertex_main_inner() {
  tan_7ea104();
  return (0.0f).xxxx;
}

tint_symbol vertex_main() {
  float4 inner_result = vertex_main_inner();
  tint_symbol wrapper_result = (tint_symbol)0;
  wrapper_result.value = inner_result;
  return wrapper_result;
}

void fragment_main() {
  tan_7ea104();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  tan_7ea104();
  return;
}
