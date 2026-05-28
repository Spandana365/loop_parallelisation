module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<i32, dense<32> : vector<2xi64>>, #dlti.dl_entry<i16, dense<16> : vector<2xi64>>, #dlti.dl_entry<i8, dense<8> : vector<2xi64>>, #dlti.dl_entry<i1, dense<8> : vector<2xi64>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi64>>, #dlti.dl_entry<f128, dense<128> : vector<2xi64>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi64>>, #dlti.dl_entry<f64, dense<64> : vector<2xi64>>, #dlti.dl_entry<f16, dense<16> : vector<2xi64>>, #dlti.dl_entry<i128, dense<128> : vector<2xi64>>, #dlti.dl_entry<i64, dense<64> : vector<2xi64>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi64>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi64>>, #dlti.dl_entry<f80, dense<128> : vector<2xi64>>, #dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<"dlti.stack_alignment", 128 : i64>>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-pc-linux-gnu"} {
  func.func @_QQmain() attributes {fir.bindc_name = "unsafe"} {
    %c31_i32 = arith.constant 31 : i32
    %c10_i32 = arith.constant 10 : i32
    %c26_i32 = arith.constant 26 : i32
    %c6_i32 = arith.constant 6 : i32
    %c1_i32 = arith.constant 1 : i32
    %c1 = arith.constant 1 : index
    %c100_i32 = arith.constant 100 : i32
    %c2_i32 = arith.constant 2 : i32
    %c100 = arith.constant 100 : index
    %0 = fir.address_of(@_QFEa) : !fir.ref<!fir.array<100xi32>>
    %1 = fir.shape %c100 : (index) -> !fir.shape<1>
    %2 = fir.declare %0(%1) {uniq_name = "_QFEa"} : (!fir.ref<!fir.array<100xi32>>, !fir.shape<1>) -> !fir.ref<!fir.array<100xi32>>
    %3 = fir.alloca i32 {bindc_name = "global_count", uniq_name = "_QFEglobal_count"}
    %4 = fir.declare %3 {uniq_name = "_QFEglobal_count"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %5 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %6 = fir.declare %5 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %7 = fir.alloca i32 {bindc_name = "sum", uniq_name = "_QFEsum"}
    %8 = fir.declare %7 {uniq_name = "_QFEsum"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %9 = fir.alloca i32 {bindc_name = "x", uniq_name = "_QFEx"}
    %10 = fir.declare %9 {uniq_name = "_QFEx"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %11 = fir.convert %c2_i32 : (i32) -> index
    %12 = fir.convert %c100_i32 : (i32) -> index
    %13 = fir.convert %11 : (index) -> i32
    %14:2 = fir.do_loop %arg0 = %11 to %12 step %c1 iter_args(%arg1 = %13) -> (index, i32) {
      fir.store %arg1 to %6 : !fir.ref<i32>
      %39 = fir.load %6 : !fir.ref<i32>
      %40 = arith.subi %39, %c1_i32 : i32
      %41 = fir.convert %40 : (i32) -> i64
      %42 = fir.array_coor %2(%1) %41 : (!fir.ref<!fir.array<100xi32>>, !fir.shape<1>, i64) -> !fir.ref<i32>
      %43 = fir.load %42 : !fir.ref<i32>
      %44 = arith.addi %43, %c1_i32 : i32
      %45 = fir.load %6 : !fir.ref<i32>
      %46 = fir.convert %45 : (i32) -> i64
      %47 = fir.array_coor %2(%1) %46 : (!fir.ref<!fir.array<100xi32>>, !fir.shape<1>, i64) -> !fir.ref<i32>
      fir.store %44 to %47 : !fir.ref<i32>
      %48 = arith.addi %arg0, %c1 : index
      %49 = fir.convert %c1 : (index) -> i32
      %50 = fir.load %6 : !fir.ref<i32>
      %51 = arith.addi %50, %49 : i32
      fir.result %48, %51 : index, i32
    }
    fir.store %14#1 to %6 : !fir.ref<i32>
    %15 = fir.convert %c1_i32 : (i32) -> index
    %16 = fir.convert %c100_i32 : (i32) -> index
    %17 = fir.convert %15 : (index) -> i32
    %18:2 = fir.do_loop %arg0 = %15 to %16 step %c1 iter_args(%arg1 = %17) -> (index, i32) {
      fir.store %arg1 to %6 : !fir.ref<i32>
      %39 = fir.load %10 : !fir.ref<i32>
      %40 = fir.load %6 : !fir.ref<i32>
      %41 = arith.addi %39, %40 : i32
      fir.store %41 to %10 : !fir.ref<i32>
      %42 = arith.addi %arg0, %c1 : index
      %43 = fir.convert %c1 : (index) -> i32
      %44 = fir.load %6 : !fir.ref<i32>
      %45 = arith.addi %44, %43 : i32
      fir.result %42, %45 : index, i32
    }
    fir.store %18#1 to %6 : !fir.ref<i32>
    %19 = fir.convert %c1_i32 : (i32) -> index
    %20 = fir.convert %c100_i32 : (i32) -> index
    %21 = fir.convert %19 : (index) -> i32
    %22:2 = fir.do_loop %arg0 = %19 to %20 step %c1 iter_args(%arg1 = %21) -> (index, i32) {
      fir.store %arg1 to %6 : !fir.ref<i32>
      %39 = fir.load %8 : !fir.ref<i32>
      %40 = fir.load %6 : !fir.ref<i32>
      %41 = fir.convert %40 : (i32) -> i64
      %42 = fir.array_coor %2(%1) %41 : (!fir.ref<!fir.array<100xi32>>, !fir.shape<1>, i64) -> !fir.ref<i32>
      %43 = fir.load %42 : !fir.ref<i32>
      %44 = arith.addi %39, %43 : i32
      fir.store %44 to %8 : !fir.ref<i32>
      %45 = arith.addi %arg0, %c1 : index
      %46 = fir.convert %c1 : (index) -> i32
      %47 = fir.load %6 : !fir.ref<i32>
      %48 = arith.addi %47, %46 : i32
      fir.result %45, %48 : index, i32
    }
    fir.store %22#1 to %6 : !fir.ref<i32>
    %23 = fir.convert %c1_i32 : (i32) -> index
    %24 = fir.convert %c100_i32 : (i32) -> index
    %25 = fir.convert %23 : (index) -> i32
    %26:2 = fir.do_loop %arg0 = %23 to %24 step %c1 iter_args(%arg1 = %25) -> (index, i32) {
      fir.store %arg1 to %6 : !fir.ref<i32>
      %39 = fir.address_of(@_QQclXe0b1773bc6f1fff8ddca705a55714535) : !fir.ref<!fir.char<1,53>>
      %40 = fir.convert %39 : (!fir.ref<!fir.char<1,53>>) -> !fir.ref<i8>
      %41 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %40, %c26_i32) fastmath<contract> : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
      %42 = fir.load %6 : !fir.ref<i32>
      %43 = fir.call @_FortranAioOutputInteger32(%41, %42) fastmath<contract> : (!fir.ref<i8>, i32) -> i1
      %44 = fir.call @_FortranAioEndIoStatement(%41) fastmath<contract> : (!fir.ref<i8>) -> i32
      %45 = arith.addi %arg0, %c1 : index
      %46 = fir.convert %c1 : (index) -> i32
      %47 = fir.load %6 : !fir.ref<i32>
      %48 = arith.addi %47, %46 : i32
      fir.result %45, %48 : index, i32
    }
    fir.store %26#1 to %6 : !fir.ref<i32>
    %27 = fir.convert %c1_i32 : (i32) -> index
    %28 = fir.convert %c100_i32 : (i32) -> index
    %29 = fir.convert %27 : (index) -> i32
    %30:2 = fir.do_loop %arg0 = %27 to %28 step %c1 iter_args(%arg1 = %29) -> (index, i32) {
      fir.store %arg1 to %6 : !fir.ref<i32>
      %39 = fir.address_of(@_QQclXe0b1773bc6f1fff8ddca705a55714535) : !fir.ref<!fir.char<1,53>>
      %40 = fir.convert %39 : (!fir.ref<!fir.char<1,53>>) -> !fir.ref<i8>
      %41 = fir.call @_FortranAioBeginExternalListOutput(%c10_i32, %40, %c31_i32) fastmath<contract> : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
      %42 = fir.load %6 : !fir.ref<i32>
      %43 = fir.convert %42 : (i32) -> i64
      %44 = fir.array_coor %2(%1) %43 : (!fir.ref<!fir.array<100xi32>>, !fir.shape<1>, i64) -> !fir.ref<i32>
      %45 = fir.load %44 : !fir.ref<i32>
      %46 = fir.call @_FortranAioOutputInteger32(%41, %45) fastmath<contract> : (!fir.ref<i8>, i32) -> i1
      %47 = fir.call @_FortranAioEndIoStatement(%41) fastmath<contract> : (!fir.ref<i8>) -> i32
      %48 = arith.addi %arg0, %c1 : index
      %49 = fir.convert %c1 : (index) -> i32
      %50 = fir.load %6 : !fir.ref<i32>
      %51 = arith.addi %50, %49 : i32
      fir.result %48, %51 : index, i32
    }
    fir.store %30#1 to %6 : !fir.ref<i32>
    %31 = fir.convert %c1_i32 : (i32) -> index
    %32 = fir.convert %c100_i32 : (i32) -> index
    %33 = fir.convert %31 : (index) -> i32
    %34:2 = fir.do_loop %arg0 = %31 to %32 step %c1 iter_args(%arg1 = %33) -> (index, i32) {
      fir.store %arg1 to %6 : !fir.ref<i32>
      fir.call @_QPupdate_global(%6) fastmath<contract> : (!fir.ref<i32>) -> ()
      %39 = arith.addi %arg0, %c1 : index
      %40 = fir.convert %c1 : (index) -> i32
      %41 = fir.load %6 : !fir.ref<i32>
      %42 = arith.addi %41, %40 : i32
      fir.result %39, %42 : index, i32
    }
    fir.store %34#1 to %6 : !fir.ref<i32>
    %35 = fir.convert %c1_i32 : (i32) -> index
    %36 = fir.convert %c100_i32 : (i32) -> index
    %37 = fir.convert %35 : (index) -> i32
    %38:2 = fir.do_loop %arg0 = %35 to %36 step %c1 iter_args(%arg1 = %37) -> (index, i32) {
      fir.store %arg1 to %6 : !fir.ref<i32>
      %39 = fir.load %4 : !fir.ref<i32>
      %40 = arith.addi %39, %c1_i32 : i32
      fir.store %40 to %4 : !fir.ref<i32>
      %41 = arith.addi %arg0, %c1 : index
      %42 = fir.convert %c1 : (index) -> i32
      %43 = fir.load %6 : !fir.ref<i32>
      %44 = arith.addi %43, %42 : i32
      fir.result %41, %44 : index, i32
    }
    fir.store %38#1 to %6 : !fir.ref<i32>
    return
  }
  fir.global internal @_QFEa : !fir.array<100xi32> {
    %0 = fir.zero_bits !fir.array<100xi32>
    fir.has_value %0 : !fir.array<100xi32>
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXe0b1773bc6f1fff8ddca705a55714535 constant : !fir.char<1,53> {
    %0 = fir.string_lit "/home/spandana/loop_parallelisation/tests/unsafe.f90\00"(53) : !fir.char<1,53>
    fir.has_value %0 : !fir.char<1,53>
  }
  func.func private @_FortranAioOutputInteger32(!fir.ref<i8>, i32) -> i1 attributes {fir.io, fir.runtime}
  func.func private @_FortranAioEndIoStatement(!fir.ref<i8>) -> i32 attributes {fir.io, fir.runtime}
  func.func private @_QPupdate_global(!fir.ref<i32>)
  fir.global @_QQEnvironmentDefaults constant : !fir.ref<tuple<i32, !fir.ref<!fir.array<0xtuple<!fir.ref<i8>, !fir.ref<i8>>>>>> {
    %0 = fir.zero_bits !fir.ref<tuple<i32, !fir.ref<!fir.array<0xtuple<!fir.ref<i8>, !fir.ref<i8>>>>>>
    fir.has_value %0 : !fir.ref<tuple<i32, !fir.ref<!fir.array<0xtuple<!fir.ref<i8>, !fir.ref<i8>>>>>>
  }
}
