int2 tint_first_trailing_bit(int2 v) {
  uint2 x = uint2(v);
  uint2 b16 = (bool2((x & (65535u).xx)) ? (0u).xx : (16u).xx);
  x = (x >> b16);
  uint2 b8 = (bool2((x & (255u).xx)) ? (0u).xx : (8u).xx);
  x = (x >> b8);
  uint2 b4 = (bool2((x & (15u).xx)) ? (0u).xx : (4u).xx);
  x = (x >> b4);
  uint2 b2 = (bool2((x & (3u).xx)) ? (0u).xx : (2u).xx);
  x = (x >> b2);
  uint2 b1 = (bool2((x & (1u).xx)) ? (0u).xx : (1u).xx);
  uint2 is_zero = ((x == (0u).xx) ? (4294967295u).xx : (0u).xx);
  return int2((((((b16 | b8) | b4) | b2) | b1) | is_zero));
}

RWByteAddressBuffer prevent_dce : register(u0, space2);

void firstTrailingBit_50c072() {
  int2 arg_0 = (1).xx;
  int2 res = tint_first_trailing_bit(arg_0);
  prevent_dce.Store2(0u, asuint(res));
}

struct tint_symbol {
  float4 value : SV_Position;
};

float4 vertex_main_inner() {
  firstTrailingBit_50c072();
  return (0.0f).xxxx;
}

tint_symbol vertex_main() {
  float4 inner_result = vertex_main_inner();
  tint_symbol wrapper_result = (tint_symbol)0;
  wrapper_result.value = inner_result;
  return wrapper_result;
}

void fragment_main() {
  firstTrailingBit_50c072();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  firstTrailingBit_50c072();
  return;
}
