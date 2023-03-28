//sbicall 应该比较易懂，是对几个sbicall的封装
#include "lib/legacysbi.h"

/*
 * @stime_value: set time value
 * Programs the clock for next event after stime_value time. This function also clears the pending timer
 * interrupt bit.
 * This SBI call returns 0 upon success or an implementation specific negative error code.
 */
int64_t sbi_set_timer(uint64_t stime_value) {
    return legacy_sbi_call(SBI_SET_TIMER, stime_value, 0, 0, 0);
}

/*
 * @ch: the char needed to print
 * Write data present in ch to debug console.
 * This SBI call returns 0 upon success or an implementation specific negative error code.
 */
int64_t sbi_console_putchar(int32_t ch) {
    return legacy_sbi_call(SBI_CONSOLE_PUTCHAR, ch, 0, 0, 0);
}

/*
 * Read a byte from debug console.
 * The SBI call returns the byte on success, or -1 for failure.
 */
int64_t sbi_console_getchar(void) {
    return legacy_sbi_call(SBI_CONSOLE_GETCHAR, 0, 0, 0, 0);
}

/* int64_t sbi_clear_ipi(void) {
    return legacy_sbi_call(SBI_CLEAR_IPI, 0, 0, 0, 0);
}

void sbi_shutdown(void) {
    legacy_sbi_call(SBI_SHUTDOWN, 0, 0, 0, 0);
} */
