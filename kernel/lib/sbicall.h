#include "../type/types.h"

uint64 sbi_call(uint64 which, uint64 arg0, uint64 arg1, uint64 arg2);
extern void sbi_console_putchar(uint64 ch);
extern void sbi_set_timer(uint64 stime_value);


