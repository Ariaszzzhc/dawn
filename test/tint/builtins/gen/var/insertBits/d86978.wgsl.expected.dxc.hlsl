int4 tint_insert_bits(int4 v, int4 n, uint offset, uint count) {
  uint e = (offset + count);
  uint mask = ((((offset < 32u) ? (1u << offset) : 0u) - 1u) ^ (((e < 32u) ? (1u << e) : 0u) - 1u));
  return ((((offset < 32u) ? (n << uint4((offset).xxxx)) : (0).xxxx) & int4((int(mask)).xxxx)) | (v & int4((int(~(mask))).xxxx)));
}

RWByteAddressBuffer prevent_dce : register(u0, space2);

void insertBits_d86978() {
  int4 arg_0 = (1).xxxx;
  int4 arg_1 = (1).xxxx;
  uint arg_2 = 1u;
  uint arg_3 = 1u;
  int4 res = tint_insert_bits(arg_0, arg_1, arg_2, arg_3);
  prevent_dce.Store4(0u, asuint(res));
}

struct tint_symbol {
  float4 value : SV_Position;
};

float4 vertex_main_inner() {
  insertBits_d86978();
  return (0.0f).xxxx;
}

tint_symbol vertex_main() {
  float4 inner_result = vertex_main_inner();
  tint_symbol wrapper_result = (tint_symbol)0;
  wrapper_result.value = inner_result;
  return wrapper_result;
}

void fragment_main() {
  insertBits_d86978();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  insertBits_d86978();
  return;
}
