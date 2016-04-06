#include <boost/multi_array.hpp>
#include <omp.h>
#include <iostream>

#define N 100000000

__global__ void daxpy_simple(int n, double alpha, double *x, double *y) {
  int idx = blockIdx.x * blockDim.x + threadIdx.x;
  if (idx < n) {
    y[idx] += alpha * x[idx];
  }
}

__global__ void daxpy(int n, double alpha, double *x, double *y) {
  for (int idx = blockIdx.x * blockDim.x + threadIdx.x;
       idx < n;
       idx += blockDim.x * gridDim.x) {       
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
  cudaMemcpy(device_x, &x[0], N * sizeof(double), cudaMemcpyHostToDevice);
  cudaMemcpy(device_y, &y[0], N * sizeof(double), cudaMemcpyHostToDevice);

  // Launch Kernel in Fast 
  int numSMs;
  cudaDeviceGetAttribute(&numSMs, cudaDevAttrMultiProcessorCount, 0);
  daxpy<<<32*numSMs,256>>>(N, 1.0, device_x, device_y);

  // copy from device
  cudaMemcpy(&y[0], device_y, N * sizeof(double), cudaMemcpyDeviceToHost);
  // Free Cuda Memory
  cudaFree(device_x);
  cudaFree(device_y);

  std::cout << y[N-1] << '\n';

  return 0;
}
