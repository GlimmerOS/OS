#include "stdio.h"

static long sbi_console_putchar(int ch) {
  asm volatile (
      "li a7, 0x01\n\t"
      "ecall"
      :
      :
      :
      );
  
  return 0;
}

void putchar(int ch) {
  sbi_console_putchar(ch);
}
