#include <stdlib>

int main () {
  int N = 1000000;

  double a[N];
  double b[N];
  double c[N];

  for (int i = 0; i < N; i++) {
    a[i] = 1;
    b[i] = 1;
    c[i] = 0;
  }

  for (int i = 0; i < N; i++) {
    c[i] = a[i] + b[i];
  }

  return 0;
}
