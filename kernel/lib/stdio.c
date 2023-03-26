#include "stdio.h"
#include "sbicall.h"


void putchar(uint64 ch) {
  sbi_console_putchar(ch);
}
