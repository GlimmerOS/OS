#include "stdc.h"
#include <stdio.h>
#include "debug.h"

__attribute__ (( aligned(16) )) char boot_stack[4096]; 

void main() {
  Log("abc");
  int i = 1;
  printf("%d %s, %u\n, 00, %lu", i, "hello, world!\n", 12, -1);
  printf("\nthe address of i is %p; %ld\n", &i, -1234567890);
  printf("\e[31;3mcolor\e[0m\n");

  Assert(i == 0, "i is not equal to 1");
}
