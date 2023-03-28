#include "lib/sbi.h"

struct sbiret sbi_debug_console_write(unsigned long num_bytes,
                                      unsigned long base_addr_lo,
                                      unsigned long base_addr_hi) {
  return sbi_call(DEBUG_CONSOLE_EXTENSION_ID, 0, 0, 0, 0, 0, 0);
}
