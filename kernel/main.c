#include "lib/stdio.h"

__attribute__ (( aligned(16) )) char boot_stack[4096]; 

void main() {
  putchar('G');
  putchar('l');
  putchar('i');
  putchar('m');
  putchar('m');
  putchar('e');
  putchar('r');
  putchar('O');
  putchar('S');
  putchar('\n');
  shutdown();
}
