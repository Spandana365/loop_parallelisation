#include "LoopParallelPass.h"

#include <iostream>

int main(int argc, char *argv[]) {

    if(argc != 2) {

        std::cout
            << "Usage:\n"
            << "./detector file.mlir\n";

        return 1;
    }

    analyzeMLIR(argv[1]);

    return 0;
}