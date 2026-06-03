cmake_minimum_required(VERSION 3.20)
project(LoopParallelizer)

# 1. Setup paths to your custom build
set(LLVM_DIR "D:/llvm_el/llvm-project/build/lib/cmake/llvm")
set(MLIR_DIR "D:/llvm_el/llvm-project/build/lib/cmake/mlir")

# 2. Find packages and include necessary macros
find_package(LLVM REQUIRED CONFIG)
find_package(MLIR REQUIRED CONFIG)

list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(AddLLVM) # This provides llvm_update_compile_flags

# 3. Define include directories
include_directories(${LLVM_INCLUDE_DIRS})
include_directories(${MLIR_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

# 4. Define your executable
add_executable(loop-parallelizer src/main.cpp src/LoopParallelPass.cpp)

# 5. Link libraries
# Include LLVM Core and MLIR components
llvm_map_components_to_libnames(llvm_libs support core irreader)

target_link_libraries(loop-parallelizer 
    PRIVATE 
    ${llvm_libs}
    MLIRSCF
    MLIRIR
    MLIRPass
    MLIRParser
    MLIRSupport
)

# 6. Apply LLVM compiler flags
llvm_update_compile_flags(loop-parallelizer)