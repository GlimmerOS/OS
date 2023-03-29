#include "lib/stdio.h"
#include "stdint.h"
#include "string.h"
#include "common.h"
#include <stdarg.h>

static char digits[] = "0123456789abcdef";

int putchar(int ch) {
  return sbi_console_putchar(ch);
}

enum {
  TY_INT32_10,
  TY_INT64_10,
  TY_UINT32_10,
  TY_UINT64_10,
  TY_STRING,
  TY_POINTER,

  TY_PERCENT,
};

static struct rule {
  char *target;
  int type;
} rules[] = {
  {"%d", TY_INT32_10},
  {"%ld", TY_INT64_10},
  {"%u", TY_UINT32_10},
  {"%lu", TY_UINT64_10},
  {"%s", TY_STRING},
  {"%p", TY_POINTER},

  {"%%", TY_PERCENT},
};

#define NR_RULES ARRLEN(rules)

static void print_int32(int32_t num, int base) {
  char buf[32];
  int i = 0;

  if (num < 0) {
    sbi_console_putchar('-');
    num = -num;
  }

  while (num > 0) {
    buf[i++] = digits[num % base];
    num /= base;
  }

  while (--i >= 0) {
    sbi_console_putchar(buf[i]);
  }
}

static void print_int64(int64_t num, int base) {
  char buf[64];
  int i = 0;

  if (num < 0l) {
    sbi_console_putchar('-');
    num = -num;
  }

  while (num > 0l) {
    buf[i++] = digits[num % base];
    num /= base;
  }

  while (--i >= 0) {
    sbi_console_putchar(buf[i]);
  }
}

static void print_uint32(uint32_t num, int base) {
  char buf[32];
  int i = 0;

  while (num > 0u) {
    buf[i++]  = digits[num % base];
    num /= base;
  }

  while (--i >= 0) {
    sbi_console_putchar(buf[i]);
  }
}

static void print_uint64(uint64_t num, int base) {
  char buf[64];
  int i = 0;

  while (num > 0lu) {
    buf[i++]  = digits[num % base];
    num /= base;
  }

  while (--i >= 0) {
    sbi_console_putchar(buf[i]);
  }
}

static void print_pointer(void *ptr) {
  uint64_t address = (uint64_t)ptr;
  sbi_console_putchar('0');
  sbi_console_putchar('x');
  print_uint64(address, 16);
}

static void print_string(char *s) {
  size_t i = 0;
  while (s[i] != '\0') {
    sbi_console_putchar(s[i]);
    i++;
  }
}

void printf(char *fmt, ...) {
  va_list ap;
  size_t pos = 0;
  size_t num;
  void *ptr;
  
  va_start(ap, fmt);
  while (fmt[pos] != '\0') {
    if (fmt[pos] != '%') {
      // not a formot
      sbi_console_putchar(fmt[pos]);
      pos++;
      continue;
    }

    // a format
    int i;
    for (i = 0; i < NR_RULES; ++i) {
      if (strncmp(fmt+pos, rules[i].target, strlen(rules[i].target)) == 0) {
        break;
      }
    }

    if (i == NR_RULES) {
      // invalid format
      sbi_console_putchar('%');
      pos++;
      continue;
    }

    // valid format
    switch (rules[i].type) {
      case TY_INT32_10:
        num = va_arg(ap, int32_t);
        print_int32(num, 10);
        break;
      case TY_INT64_10:
        num = va_arg(ap, int64_t);
        print_int64(num, 10);
        break;
      case TY_UINT32_10:
        num = va_arg(ap, uint32_t);
        print_uint32(num, 10);
        break;
      case TY_UINT64_10:
        num = va_arg(ap, uint64_t);
        print_uint64(num, 10);
        break;
      case TY_POINTER:
        ptr = va_arg(ap, void *);
        print_pointer(ptr);
        break;
      case TY_STRING:
        ptr = va_arg(ap, char *);
        print_string(ptr);
        break;
      case TY_PERCENT:
        sbi_console_putchar('%');
        break;
      default:
        break;
    }

    pos += strlen(rules[i].target);
  }
  va_end(ap);
}
