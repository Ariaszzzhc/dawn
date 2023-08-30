Texture2D<float4> arg_1 : register(t1, space1);
SamplerState arg_2 : register(s2, space1);
RWByteAddressBuffer prevent_dce : register(u0, space2);

void textureGather_d6507c() {
  float2 arg_3 = (1.0f).xx;
  float4 res = arg_1.GatherGreen(arg_2, arg_3, int2((1).xx));
  prevent_dce.Store4(0u, asuint(res));
}

struct tint_symbol {
  float4 value : SV_Position;
};

float4 vertex_main_inner() {
  textureGather_d6507c();
  return (0.0f).xxxx;
}

tint_symbol vertex_main() {
  const float4 inner_result = vertex_main_inner();
  tint_symbol wrapper_result = (tint_symbol)0;
  wrapper_result.value = inner_result;
  return wrapper_result;
}

void fragment_main() {
  textureGather_d6507c();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureGather_d6507c();
  return;
}
