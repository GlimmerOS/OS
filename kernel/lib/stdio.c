#include "lib/stdio.h"
#include "stdint.h"
#include "string.h"
#include "common.h"

static char digits[] = "0123456789abcdef";
static int out_target = 0; // 0 is stdout, 1 is buffer
static int base = 0; // out integer base
static int negtive = 0; // 0 is unsigned, 1 is signed

static long number = 0; // the number need to print
static char* string = 0; // the string need to print

static char* buffer = 0; // out buffer

static int ret = 0; // the return value of print function

static void output(int ch) {
  if (out_target == 0) {
    sbi_console_putchar(ch);
  } else {
    *buffer = ch;
    buffer++;
  }
}

static void printf_num() {
  ret++;
  char buf[30];
  int i = 0;

  if (negtive == 1) {
    if (number < 0) {
      output('-');
      number = -number;
    }

    while (number) {
      buf[i++] = digits[number % base];
      number /= base;
    }
  } else {
    unsigned long unumber = number;
    while (unumber) {
      buf[i++] = digits[unumber % base];
      unumber /= base;
    }
  }

  while (i > 0) {
    output(buf[--i]);
  }
}

static void print_string() {
  ret++;
  while (*string) {
    output(*string);
    string++;
  }
}

int printf(const char *format, ...) {
  ret = 0;

  va_list ap;
  va_start(ap, format);
  ret = vprintf(format, ap);
  va_end(ap) ;
  
  return ret;
}

int vprintf(const char *format, va_list ap) {
  return ret;
}

int vsprintf(char *out, const char *format, va_list ap) {
  ret = 0;

  out_target = 1;
  buffer = out;

  vprintf(format, ap);

  *buffer = '\0';
  buffer = 0;
  out_target = 0;

  return ret;
}

int sprintf(char *out, const char *format, ...) {
  ret = 0;

  va_list ap;
  va_start(ap, format);
  ret = vsprintf(out, format, ap);
  va_end(ap) ;
  
  return ret;
}

int snprintf(char *out, size_t n, const char *format, ...) {
  return 0;
}

int vsnprintf(char *out, size_t n, const char *format, va_list ap) {
  return 0;
}

int putchar(int ch) {
  output(ch);
  return ch;
}

/**
 * 打印LOGO
 */
void print_logo(void) {
  putchar('\n');
  printf("\
       ______   __   _                                  ____  _____\n\
      / ____/  / /  (_)___ ___  ____ ___  ___  _____   / __ \\/ ___/ \n\
     / / __   / /  / / __ `__ \\/ __ `__ \\/ _ \\/ ___/  / / / /\\__ \\ \n\
    / /_/ /  / /  / / / / / / / / / / / /  __/ /     / /_/ /___/ /  \n\
    \\____/  /_/  /_/_/ /_/ /_/_/ /_/ /_/\\___/_/      \\____//____/  \n\n");
}
