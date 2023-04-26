#include "lib/sbi.h"

/*
 * @eid: extension ID
 * @fid: function ID
 * @arg0
 * @arg1
 * @arg2
 * @arg3
 * @arg4
 * this function call the sbi function mapped by eid and fid
 */
static struct sbiret sbi_call(unsigned long eid,
                                     unsigned long fid,
                                     unsigned long arg0,
                                     unsigned long arg1,
                                     unsigned long arg2,
                                     unsigned long arg3,
                                     unsigned long arg4) {

  struct sbiret ret;

  asm volatile(
      "mv a7, %[eid]\n"
      "mv a6, %[fid]\n"
      "mv a0, %[arg0]\n"
      "mv a1, %[arg1]\n"
      "mv a2, %[arg2]\n"
      "mv a3, %[arg3]\n"
      "mv a4, %[arg4]\n"
      "ecall\n"
      "mv %[error], a0\n"
      "mv %[value], a1"
      :[error]"=r"(ret.error), [value]"=r"(ret.value)
      :[eid]"r"(eid), [fid]"r"(fid), [arg0]"r"(arg0), [arg1]"r"(arg1), [arg2]"r"(arg2), [arg3]"r"(arg3), [arg4]"r"(arg4)
      :"memory"
      );

  return ret;
}

struct sbiret sbi_debug_console_write(unsigned long num_bytes,
                                      unsigned long base_addr_lo,
                                      unsigned long base_addr_hi) {
  return sbi_call(DEBUG_CONSOLE_EXTENSION_ID, 0, base_addr_lo, base_addr_hi, 0, 0, 0);
}
