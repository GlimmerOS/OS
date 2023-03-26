#include "lib/string.h"

/*
 * @addr: the address of the area
 * @c: the byte value need to set
 * @n: the size of the area need to set value
 * return the address of the area
 */
void *memset(void *addr, int c, size_t n) {
  char *ptr = (char*)addr;

  for (int i = 0; i < n; ++i) {
    ptr[i] = c;
  }

  return ptr;
}

/*
 * @s: the address of the string
 * return the length of input string
 */
size_t strlen(const char *s) {
  size_t length = 0;

  while (s[length] != '\0') {
    length++;
  }

  return length;
}

/*
 * @dest: the destination string
 * @src: the source string
 * return the destination string address
 */
char *strcpy(char *dest, const char *src) {
  size_t i = 0;

  while (src[i] != '\0') {
    dest[i] = src[i];
  }

  return dest;
}

/*
 * @dest: the destination string
 * @src: the source string
 * @n: the size of string needed to copy
 * return the destination string address
 */
char *strncpy(char *dest, const char *src, size_t n) {
  size_t i;

  for (i = 0; i < n && src[i] != '\0'; i++) {
    dest[i] = src[i];
  }
  for (; i < n; i++) {
    dest[i] = '\0';
  }

  return dest;
}

/*
 * @s1: first string
 * @s2: second string
 * return an integer less than,
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

/*
 * @s1: first string
 * @s2: second string
 * @n: the size of string needed to compare
 * return an integer less than,
 * equal to, or greater than zero if s1 (or the first n
 * bytes thereof) is found, respectively, to 
 * be less than, to match, or be greater than s2.
 */
int strncmp(const char *s1, const char *s2, size_t n) {
  size_t i = 0;

  while (i < n && s1[i] != '\0' && s2[i] != '\0' && s1[i] == s2[i]) {
    i++;
  }

  return s1[i] - s2[i];
}
