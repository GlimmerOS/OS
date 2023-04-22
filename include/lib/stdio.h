#ifndef _STDIO_H
#define _STDIO_H

#include "lib/legacysbi.h"
#include <stdarg.h>

int putchar(int ch);
int getchar(void);

int printf(const char *format, ...);
int sprintf(char *str, const char *format, ...);
int snprintf(char *str, size_t size, const char *format, ...);
int vsprintf(char *str, const char *format, va_list ap);
int vsnprintf(char *str, size_t size, const char *format, va_list ap);

void print_logo();
void print_init();

#endif
