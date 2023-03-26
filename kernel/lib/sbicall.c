//sbicall 应该比较易懂，是对几个sbicall的封装
#include "sbicall.h"

#define SBI_SET_TIMER  0
#define SBI_CONSOLE_PUTCHAR  1
#define SBI_CONSOLE_GETCHAR 2
#define SBI_CLEAR_IPI 3
#define SBI_SEND_IPI 4
#define SBI_REMOTE_FENCE_I 5
#define SBI_REMOTE_SFENCE_VMA 6
#define SBI_REMOTE_SFENCE_VMA_ASID 7
#define SBI_SHUTDOWN 8

uint64 sbi_call(uint64 which, uint64 arg0, uint64 arg1, uint64 arg2) {
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

void sbi_set_timer(uint64 stime_value) {
    sbi_call(SBI_SET_TIMER, stime_value, 0, 0);
}

int sbi_console_getchar(void) {
    return sbi_call(SBI_CONSOLE_GETCHAR, 0, 0, 0);
}

void sbi_clear_ipi(void) {
    sbi_call(SBI_CLEAR_IPI, 0, 0, 0);
}

void sbi_shutdown(void) {
    sbi_call(SBI_SHUTDOWN, 0, 0, 0);
}
