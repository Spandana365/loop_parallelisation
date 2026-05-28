module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<f128, dense<128> : vector<2xi64>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi64>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi64>>, #dlti.dl_entry<i64, dense<64> : vector<2xi64>>, #dlti.dl_entry<i32, dense<32> : vector<2xi64>>, #dlti.dl_entry<f16, dense<16> : vector<2xi64>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi64>>, #dlti.dl_entry<f64, dense<64> : vector<2xi64>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi64>>, #dlti.dl_entry<i1, dense<8> : vector<2xi64>>, #dlti.dl_entry<i8, dense<8> : vector<2xi64>>, #dlti.dl_entry<i16, dense<16> : vector<2xi64>>, #dlti.dl_entry<i128, dense<128> : vector<2xi64>>, #dlti.dl_entry<f80, dense<128> : vector<2xi64>>, #dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<"dlti.stack_alignment", 128 : i64>>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-pc-linux-gnu"} {
  func.func @_QQmain() attributes {fir.bindc_name = "safe"} {
    %c1 = arith.constant 1 : index
    %c10_i32 = arith.constant 10 : i32
    %c1_i32 = arith.constant 1 : i32
    %c10 = arith.constant 10 : index
    %0 = fir.address_of(@_QFEa) : !fir.ref<!fir.array<10xi32>>
    %1 = fir.shape %c10 : (index) -> !fir.shape<1>
    %2 = fir.declare %0(%1) {uniq_name = "_QFEa"} : (!fir.ref<!fir.array<10xi32>>, !fir.shape<1>) -> !fir.ref<!fir.array<10xi32>>
    %3 = fir.address_of(@_QFEb) : !fir.ref<!fir.array<10xi32>>
    %4 = fir.shape %c10 : (index) -> !fir.shape<1>
    %5 = fir.declare %3(%4) {uniq_name = "_QFEb"} : (!fir.ref<!fir.array<10xi32>>, !fir.shape<1>) -> !fir.ref<!fir.array<10xi32>>
    %6 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %7 = fir.declare %6 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %8 = fir.convert %c1_i32 : (i32) -> index
    %9 = fir.convert %c10_i32 : (i32) -> index
    %10 = fir.convert %8 : (index) -> i32
    %11:2 = fir.do_loop %arg0 = %8 to %9 step %c1 iter_args(%arg1 = %10) -> (index, i32) {
      fir.store %arg1 to %7 : !fir.ref<i32>
      %12 = fir.load %7 : !fir.ref<i32>
      %13 = fir.convert %12 : (i32) -> i64
      %14 = fir.array_coor %5(%4) %13 : (!fir.ref<!fir.array<10xi32>>, !fir.shape<1>, i64) -> !fir.ref<i32>
      %15 = fir.load %14 : !fir.ref<i32>
      %16 = arith.addi %15, %c1_i32 : i32
      %17 = fir.load %7 : !fir.ref<i32>
      %18 = fir.convert %17 : (i32) -> i64
      %19 = fir.array_coor %2(%1) %18 : (!fir.ref<!fir.array<10xi32>>, !fir.shape<1>, i64) -> !fir.ref<i32>
      fir.store %16 to %19 : !fir.ref<i32>
      %20 = arith.addi %arg0, %c1 : index
      %21 = fir.convert %c1 : (index) -> i32
      %22 = fir.load %7 : !fir.ref<i32>
      %23 = arith.addi %22, %21 : i32
      fir.result %20, %23 : index, i32
    }
    fir.store %11#1 to %7 : !fir.ref<i32>
    return
  }
  fir.global internal @_QFEa : !fir.array<10xi32> {
    %0 = fir.zero_bits !fir.array<10xi32>
    fir.has_value %0 : !fir.array<10xi32>
  }
  fir.global internal @_QFEb : !fir.array<10xi32> {
    %0 = fir.zero_bits !fir.array<10xi32>
    fir.has_value %0 : !fir.array<10xi32>
  }
  fir.global @_QQEnvironmentDefaults constant : !fir.ref<tuple<i32, !fir.ref<!fir.array<0xtuple<!fir.ref<i8>, !fir.ref<i8>>>>>> {
    %0 = fir.zero_bits !fir.ref<tuple<i32, !fir.ref<!fir.array<0xtuple<!fir.ref<i8>, !fir.ref<i8>>>>>>
    fir.has_value %0 : !fir.ref<tuple<i32, !fir.ref<!fir.array<0xtuple<!fir.ref<i8>, !fir.ref<i8>>>>>>
  }
}
