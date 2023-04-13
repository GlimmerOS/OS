#include "lib/string.h"

/**
 * 初始化内存值
 *
 * @param addr the address of the area
 * @param c the byte value need to set
 * @param n the size of the area need to set value
 *
 * @return void* the address of the area
 */
void *memset(void *addr, int c, size_t n) {
  char *ptr = (char*)addr;

  for (int i = 0; i < n; ++i) {
    ptr[i] = c;
  }

  return ptr;
}

/**
 * 获取字符串的长度
 *
 * @param s the address of the string
 *
 * @return size_t the length of input string
 */
size_t strlen(const char *s) {
  size_t length = 0;

  while (s[length] != '\0') {
    length++;
  }

  return length;
}

/**
 * 复制字符串
 *
 * @param dest the destination string
 * @param src the source string
 *
 * @return char* the destination string address
 */
char *strcpy(char *dest, const char *src) {
  size_t i = 0;

  while (src[i] != '\0') {
    dest[i] = src[i];
    i++;
  }

  dest[i] = '\0';

  return dest;
}

/**
 * 复制长度为n的字符串
 *
 * @param dest the destination string
 * @param src the source string
 * @param n the size of string needed to copy
 *
 * @return char* the destination string address
 */
char *strncpy(char *dest, const char *src, size_t n) {
  size_t i = 0;

  while (i < n && src[i] != '\0') {
    dest[i] = src[i];
    i++;
  }

  if (i != n) {
    dest[i] = '\0';
  }

  return dest;
}

/**
 * 字符串比较
 *
 * @param s1 first string
 * @param s2 second string
 *
 * @return int an integer less than,
 * equal to, or greater than zero if s1 (or the first n
 * bytes thereof) is found, respectively, to
 * be less than, to match, or be greater than s2.
 */
int strcmp(const char *s1, const char *s2) {
  size_t i = 0;

  while (s1[i] != '\0' && s2[i] != '\0' && s1[i] == s2[i]) {
    i++;
  }

  return s1[i] - s2[i];
}

/**
 * 比较长度为n的字符串
 *
 * @param s1 first string
 * @param s2 second string
 * @param n the size of string needed to compare
 *
 * @return int an integer less than,
 * equal to, or greater than zero if s1 (or the first n
 * bytes thereof) is found, respectively, to
 * be less than, to match, or be greater than s2.
 */
int strncmp(const char *s1, const char *s2, size_t n) {
  size_t i = 0;

  while (i < n && s1[i] != '\0' && s2[i] != '\0' && s1[i] == s2[i]) {
    i++;
  }

  return i == n ? 0 : s1[i] - s2[i];
}
