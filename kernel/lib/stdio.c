#include "stdc.h"
#include "common.h"
#include <stdarg.h>

int putchar(int ch) {
  return sbi_console_putchar(ch);
}

enum {
  TY_INT32,
  TY_INT64,
  TY_UINT32,
  TY_UINT64,
};

static void print_int32(int32_t num, int base);
static void print_int64(int64_t num, int base);
static void print_uint32(uint32_t num, int base);
static void print_uint64(uint64_t num, int base);
static void print_string(char *s);

static struct rule {
  char *target;
  int type;
} rules[] = {
  {"d", TY_INT32},
  {"ld", TY_INT64},
  ("u", TY_UINT32),
  {"lu", TY_UINT64},
};

static void print_int32(int32_t num, int base) {
  char buf[32];
  size_t i = 0;

  if (num < 0) {
    putchar('-');
    num = -num;
  }

  while (num > 0) {
    buf[i++] = digits[num % base];
    num /= base;
  }

  while (--i > 0) {
    putchar(buf[i]);
  }
}

static void print_int64(int64_t num, int base) {
  char buf[64];
  size_t i = 0;

  if (num < 0l) {
    putchar('-');
    num = -num;
  }

  while (num > 0l) {
    buf[i++] = digits[num % base];
    num /= base;
  }

  while (--i > 0) {
    putchar(buf[i]);
  }
}

static void print_uint32(uint32_t num, int base) {
  char buf[32];
  size_t i = 0;

  while (num > 0u) {
    buf[i++]  = digits[num % base];
    num /= base;
  }

  while (--i > 0) {
    putchar(buf[i]);
  }
}

static void print_uint64(uint64_t num, int base) {
  char buf[64];
  size_t i = 0;

  while (num > 0lu) {
    buf[i++]  = digits[num % base];
    num /= base;
  }

  while (--i > 0) {
    putchar(buf[i]);
  }
}

static void print_string(char *s) {
  size_t i = 0;
  while (s[i] != '\0') {
    putchar(s[i]);
    i++;
  }
}

void printf(char *fmt, ...) {
  va_list ap;
  size_t pos = 0;
  
  va_start(ap, fmt);
  while (fmt[pos] != '\0') {
    if (fmt[pos] == '%') {
      pos++;
    }
    pos++;
  }
  va_end(ap);
}
