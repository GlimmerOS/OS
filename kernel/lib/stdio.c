#include "lib/stdio.h"
#include "stdint.h"
#include "string.h"
#include "common.h"

// static char digits[] = "0123456789abcdef";

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
