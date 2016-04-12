# boost::multi-array as a tensor library

Basically, I am a scientist looking at boost::multi-array as a tensor
container. If it can be used to create code on many architectures (GPU/Intel
MIC etc.) than it could be useful to me.

Positive Features:
- It's an N-dimensional container with slicing, necessary.
- I can call other libraries (BLAS, cuBLAS, etc.)
- OpenMP/MPI will be trivial.

Next Feature Tests:
- Slicing on the GPU?
- MPI/OpenMP examples
- Speed vs. standard C arrays

Building it
===========

Need:
- `cmake`
- `boost::multi-array`

Optional, but basically the whole point of this repository:
- OpenMP
- CBLAS
- CUDA
- OpenACC: I haven't tested this yet

```
git clone https://github.com/barrymoo/multi-array-testing.git
cd multi-array-testing
mkdir build
cd build
cmake ..
make
```
