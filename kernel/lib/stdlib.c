#include "lib/stdlib.h"

int abs(int x) {
  if (x < 0) {
    x = -x;
  }

  return x;
}
