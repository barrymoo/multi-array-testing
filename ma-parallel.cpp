#include <boost/multi_array.hpp>
#include <omp.h>
#include <iostream>

int main () {
  typedef boost::multi_array<double, 1> vector;
  typedef vector::index vector_index;

  int N = 100000000;

  vector a(boost::extents[N]);
  vector b(boost::extents[N]);
  vector c(boost::extents[N]);

  #pragma omp parallel for
  for (vector_index i = 0; i < N; i++) {
    a[i] = 1;
    b[i] = 1;
    c[i] = 0;
  }

  #pragma omp parallel for
  for (vector_index i = 0; i < N; i++) {
    c[i] = a[i] + b[i];
  }

  return 0;
}
