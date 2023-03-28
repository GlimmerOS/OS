#include "stdc.h"

__attribute__ (( aligned(16) )) char boot_stack[4096]; 

void main() {
  int i = 1;
  printf("%d %s, %u\n, 00, %lu", i, "hello, world!\n", 12, -1);
}
