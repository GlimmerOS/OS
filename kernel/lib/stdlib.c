#include "lib/stdlib.h"

/**
 * 取32位整形数的绝对值
 *
 * @param x 32位整形数
 *
 * @return int 32位绝对值整形数
 */
int abs(int x) {
  if (x < 0) {
    x = -x;
  }

  return x;
}
