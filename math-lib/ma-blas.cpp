#include <boost/multi_array.hpp>
#include <iostream>

#include "cblas.h"

int main () {
  typedef boost::multi_array<double, 1> vector;
  typedef vector::index vector_index;

  int N = 100000000;

  vector x(boost::extents[N]);
  vector y(boost::extents[N]);
  vector a(boost::extents[N]);

#pragma omp parallel for
  for (vector_index i = 0; i < N; i++) {
    x[i] = 1;
    y[i] = 1;
    a[i] = y[i];
  }

  cblas_daxpy(N, 1.0, &x[0], 1, &a[0], 1);

  std::cout << a[0] << '\n';

  return 0;
}
