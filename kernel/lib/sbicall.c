//sbicall
#include "sbicall.h"

#define SBI_SET_TIMER  0
#define SBI_CONSOLE_PUTCHAR  1


uint64 sbi_call(uint64 which, uint64 arg0, uint64 arg1, uint64 arg2){
    uint64 ret;
    __asm__ volatile(
        "mv x17, %[which]\n"
        "mv x10, %[arg0]\n"
        "mv x11, %[arg1]\n"
        "mv x12, %[arg2]\n"
        "ecall\n"
        "mv %[ret], x10"
        : [ret] "=r" (ret)
        : [which] "r" (which), [arg0] "r" (arg0), [arg1] "r" (arg1), [arg2] "r" (arg2)
        : "memory"
    );
    return ret;
}

void sbi_console_putchar(uint64 ch) {
    sbi_call(SBI_CONSOLE_PUTCHAR, ch, 0, 0);
}

void sbi_set_timer(uint64 stime_value){
    sbi_call(SBI_SET_TIMER, stime_value, 0, 0);
}