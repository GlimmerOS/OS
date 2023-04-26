#ifndef _USERTRAP_H
#define _USERTRAP_H

#include "stdint.h"

void uservec();
void userret(uint64_t satp);

#endif
