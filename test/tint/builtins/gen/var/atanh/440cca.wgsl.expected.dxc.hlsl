float3 tint_atanh(float3 x) {
  return (log(((1.0f + x) / (1.0f - x))) * 0.5f);
}

RWByteAddressBuffer prevent_dce : register(u0, space2);

void atanh_440cca() {
  float3 arg_0 = (0.5f).xxx;
  float3 res = tint_atanh(arg_0);
  prevent_dce.Store3(0u, asuint(res));
}

struct tint_symbol {
  float4 value : SV_Position;
};

float4 vertex_main_inner() {
  atanh_440cca();
  return (0.0f).xxxx;
}

tint_symbol vertex_main() {
  float4 inner_result = vertex_main_inner();
  tint_symbol wrapper_result = (tint_symbol)0;
  wrapper_result.value = inner_result;
  return wrapper_result;
}

void fragment_main() {
  atanh_440cca();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  atanh_440cca();
  return;
}
