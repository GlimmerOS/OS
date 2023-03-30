#ifndef _SBI_H
#define _SBI_H
#include "lib/stdint.h"


#define DEBUG_CONSOLE_EXTENSION_ID 0x4442434E

/*
 * sbi return structure
 */
struct sbiret {
  long error;
  long value;
};

struct sbiret sbi_debug_console_write(unsigned long num_bytes,
                                      unsigned long base_addr_lo,
                                      unsigned long base_addr_hi);

#endif
