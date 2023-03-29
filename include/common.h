#ifndef _COMMON_H
#define _COMMON_H

// 颜色属性
#define ANSI_FG_BLACK   "\e[1;30m"
#define ANSI_FG_RED     "\e[1;31m"
#define ANSI_FG_GREEN   "\e[1;32m"
#define ANSI_FG_YELLOW  "\e[1;33m"
#define ANSI_FG_BLUE    "\e[1;34m"
#define ANSI_FG_MAGENTA "\e[1;35m"
#define ANSI_FG_CYAN    "\e[1;36m"
#define ANSI_FG_WHITE   "\e[1;37m"
#define ANSI_BG_BLACK   "\e[1;40m"
#define ANSI_BG_RED     "\e[1;41m"
#define ANSI_BG_GREEN   "\e[1;42m"
#define ANSI_BG_YELLOW  "\e[1;43m"
#define ANSI_BG_BLUE    "\e[1;44m"
#define ANSI_BG_MAGENTA "\e[1;35m"
#define ANSI_BG_CYAN    "\e[1;46m"
#define ANSI_BG_WHITE   "\e[1;47m"
#define ANSI_NONE       "\e[0m"

// 以一种颜色输出
#define ANSI_FMT(str, fmt) fmt str ANSI_NONE

// 获取一个数组的长度，包括结构体数组
#define ARRLEN(arr) ( sizeof(arr) / sizeof(arr[0]) )

#endif
