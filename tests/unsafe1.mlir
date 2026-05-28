module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<i32, dense<32> : vector<2xi64>>, #dlti.dl_entry<i16, dense<16> : vector<2xi64>>, #dlti.dl_entry<i8, dense<8> : vector<2xi64>>, #dlti.dl_entry<i1, dense<8> : vector<2xi64>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi64>>, #dlti.dl_entry<f80, dense<128> : vector<2xi64>>, #dlti.dl_entry<i128, dense<128> : vector<2xi64>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi64>>, #dlti.dl_entry<i64, dense<64> : vector<2xi64>>, #dlti.dl_entry<f128, dense<128> : vector<2xi64>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi64>>, #dlti.dl_entry<f16, dense<16> : vector<2xi64>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi64>>, #dlti.dl_entry<f64, dense<64> : vector<2xi64>>, #dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<"dlti.stack_alignment", 128 : i64>>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-pc-linux-gnu"} {
  func.func @_QQmain() attributes {fir.bindc_name = "unsafe1"} {
    %c1 = arith.constant 1 : index
    %c100_i32 = arith.constant 100 : i32
    %c1_i32 = arith.constant 1 : i32
    %0 = fir.alloca i32 {bindc_name = "counter", uniq_name = "_QFEcounter"}
    %1 = fir.declare %0 {uniq_name = "_QFEcounter"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %2 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %3 = fir.declare %2 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %4 = fir.convert %c1_i32 : (i32) -> index
    %5 = fir.convert %c100_i32 : (i32) -> index
    %6 = fir.convert %4 : (index) -> i32
    %7:2 = fir.do_loop %arg0 = %4 to %5 step %c1 iter_args(%arg1 = %6) -> (index, i32) {
      fir.store %arg1 to %3 : !fir.ref<i32>
      %8 = fir.load %1 : !fir.ref<i32>
      %9 = arith.addi %8, %c1_i32 : i32
      fir.store %9 to %1 : !fir.ref<i32>
      %10 = arith.addi %arg0, %c1 : index
      %11 = fir.convert %c1 : (index) -> i32
      %12 = fir.load %3 : !fir.ref<i32>
      %13 = arith.addi %12, %11 : i32
      fir.result %10, %13 : index, i32
    }
    fir.store %7#1 to %3 : !fir.ref<i32>
    return
  }
  fir.global @_QQEnvironmentDefaults constant : !fir.ref<tuple<i32, !fir.ref<!fir.array<0xtuple<!fir.ref<i8>, !fir.ref<i8>>>>>> {
    %0 = fir.zero_bits !fir.ref<tuple<i32, !fir.ref<!fir.array<0xtuple<!fir.ref<i8>, !fir.ref<i8>>>>>>
    fir.has_value %0 : !fir.ref<tuple<i32, !fir.ref<!fir.array<0xtuple<!fir.ref<i8>, !fir.ref<i8>>>>>>
  }
}
