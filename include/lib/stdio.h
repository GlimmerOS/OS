#ifndef _STDIO_H
#define _STDIO_H

#include "lib/legacysbi.h"

int putchar(int ch);
int getchar(void);

/**
 * 打印内容至终端
 *
 * @param fmt 内容格式串
 *
 * @return 无返回
 */
void printf(char *fmt, ...);
void print_glimmeros(void);

#endif
