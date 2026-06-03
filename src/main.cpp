#include "mlir/Tools/mlir-opt/MlirOptMain.h"
#include "mlir/Pass/PassRegistry.h"

int main(int argc, char **argv) {
    // This automatically handles file reading, parsing, and pass execution
    return mlir::MlirOptMain(argc, argv, "Loop Parallelizer Tool", /*preloadDialects=*/true);
}