#include "stdio.h"
#include "sbicall.h"


void putchar(uint64 ch) {
  sbi_console_putchar(ch);
}

void shutdown(void) {
  sbi_shutdown();
}

int getchar(void) {
  return sbi_console_getchar();
}