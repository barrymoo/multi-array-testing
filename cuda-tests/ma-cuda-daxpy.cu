#include <boost/multi_array.hpp>
#include <omp.h>
#include <iostream>

#define N 100000000

__global__ void daxpy(int n, double alpha, double *x, double *y) {
  int idx = blockIdx.x * blockDim.x + threadIdx.x;
  if (idx < N) {
    y[idx] += alpha * x[idx];
  }
}

int main () {
  typedef boost::multi_array<double, 1> vector;
  typedef vector::index vector_index;

  vector x(boost::extents[N]);
  vector y(boost::extents[N]);

#pragma omp parallel for
  for (vector_index i = 0; i < N; i++) {
    x[i] = 1;
    y[i] = 1;
  }

  // device malloc
  double *device_x;
  double *device_y;
  cudaMalloc((void**) &device_x, N * sizeof(double));
  cudaMalloc((void**) &device_y, N * sizeof(double));
  // copy to device
  cudaMemcpy(&x, device_x, N * sizeof(double), cudaMemcpyHostToDevice);
  cudaMemcpy(&y, device_y, N * sizeof(double), cudaMemcpyHostToDevice);
  // launch kernel
  daxpy<<<N/64,64>>>(N, 1.0, device_x, device_y);
  // copy from device
  cudaMemcpy(&y, device_y, N * sizeof(double), cudaMemcpyDeviceToHost);
  // Free Cuda Memory
  cudaFree(device_x);
  cudaFree(device_y);

  std::cout << y[0] << '\n';

  return 0;
}
