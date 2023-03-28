#include "stdint.h"

#define SBI_SET_TIMER  0x00
#define SBI_CONSOLE_PUTCHAR  0x01
#define SBI_CONSOLE_GETCHAR 0x02
#define SBI_CLEAR_IPI 0x03
#define SBI_SEND_IPI 0x04
#define SBI_REMOTE_FENCE_I 0x05
#define SBI_REMOTE_SFENCE_VMA 0x06
#define SBI_REMOTE_SFENCE_VMA_ASID 0x07
#define SBI_SHUTDOWN 0x08

/*
 * @eid: extension ID
 * @arg0: first argument
 * @arg1: second argument
 * @arg2: thrid argument
 * @arg3: fourth argument
 * call the function mapped by eid
 */
static inline uint64_t legacy_sbi_call(uint64_t eid, uint64_t arg0, uint64_t arg1, uint64_t arg2, uint64_t arg3) {
    uint64_t ret;
    asm volatile(
        "mv a7, %[eid]\n"
        "mv a0, %[arg0]\n"
        "mv a1, %[arg1]\n"
        "mv a2, %[arg2]\n"
        "mv a3, %[arg3]\n"
        "ecall\n"
        "mv %[ret], a0"
        : [ret] "=r" (ret)
        : [eid] "r" (eid), [arg0] "r" (arg0), [arg1] "r" (arg1), [arg2] "r" (arg2), [arg3] "r" (arg3)
        : "memory"
    );
    return ret;
}

int64_t sbi_set_timer(uint64_t stime_value);
int64_t sbi_console_putchar(int32_t ch);
int64_t sbi_console_getchar(void);
// int64_t sbi_clear_ipi(void);
// void sbi_shutdown(void);
