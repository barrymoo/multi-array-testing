# Boost multi-array Testing

Basically, I want to make sure this could be impactful in the scientific community before I start using it.

Positive Features:
- It's an N-dimensional container with slicing, which I think will become necessary.
- I can call necessary libraries (cblas_daxpy in ma-cblas.cpp)
- I have no problem using OpenMP (various examples)

Next Feature Tests:
- Can we get everything parallelized on the GPU with CUDA?

Building it (you'll need `cmake`, `boost`, `openmp` capable compiler, and `cblas` installed in standard locations, or modify `CMakeLists.txt`):
```
git clone https://github.com/barrymoo/multi-array-testing.git
cd multi-array-testing
mkdir build
cd build
cmake ..
make
```
