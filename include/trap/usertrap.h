#ifndef _USERTRAP_H
#define _USERTRAP_H

#include "stdint.h"

void uservec();
void usertrapret();
void user_trap_handler();
void userret(uint64_t satp);

#endif
