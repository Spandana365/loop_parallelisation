cmake_minimum_required(VERSION 3.20)

project(LoopParallelDetector)

set(CMAKE_CXX_STANDARD 17)

include_directories(
    include
)

add_executable(detector

    src/main.cpp
    src/LoopParallelPass.cpp
)