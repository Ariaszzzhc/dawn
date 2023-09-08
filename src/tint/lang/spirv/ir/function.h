// Copyright 2023 The Tint Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

////////////////////////////////////////////////////////////////////////////////
// File generated by 'tools/src/cmd/gen' using the template:
//   src/tint/lang/spirv/ir/function.h.tmpl
//
// To regenerate run: './tools/run gen'
//
//                       Do not modify this file directly
////////////////////////////////////////////////////////////////////////////////

#ifndef SRC_TINT_LANG_SPIRV_IR_FUNCTION_H_
#define SRC_TINT_LANG_SPIRV_IR_FUNCTION_H_

#include <cstdint>
#include <string>

#include "src/tint/utils/traits/traits.h"

// \cond DO_NOT_DOCUMENT
namespace tint::spirv::ir {

/// Enumerator of all builtin functions
enum class Function : uint8_t {
    kArrayLength,
    kAtomicAnd,
    kAtomicCompareExchange,
    kAtomicExchange,
    kAtomicIadd,
    kAtomicIsub,
    kAtomicLoad,
    kAtomicOr,
    kAtomicSmax,
    kAtomicSmin,
    kAtomicStore,
    kAtomicUmax,
    kAtomicUmin,
    kAtomicXor,
    kDot,
    kMatrixTimesMatrix,
    kMatrixTimesScalar,
    kMatrixTimesVector,
    kVectorTimesMatrix,
    kSelect,
    kVectorTimesScalar,
    kNone,
};

/// @returns the name of the builtin function type. The spelling, including
/// case, matches the name in the WGSL spec.
const char* str(Function i);

/// Emits the name of the builtin function type. The spelling, including case,
/// matches the name in the WGSL spec.
template <typename STREAM, typename = traits::EnableIfIsOStream<STREAM>>
auto& operator<<(STREAM& o, Function i) {
    return o << str(i);
}

}  // namespace tint::spirv::ir
// \endcond

#endif  // SRC_TINT_LANG_SPIRV_IR_FUNCTION_H_
