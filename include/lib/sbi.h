#ifndef _SBI_H
#define _SBI_H
#include "lib/stdint.h"


struct sbiret {
  long error;
  long value;
};

struct sbiret sbi_debug_console_read(unsigned long num_bytes,
  unsigned long base_addr_lo,
  unsigned long base_addr_hi);

struct sbiret sbi_debug_console_write(unsigned long num_bytes,
  unsigned long base_addr_lo,
  unsigned long base_addr_hi);

struct sbiret sbi_debug_console_write_byte(uint8_t byte);


#endif
