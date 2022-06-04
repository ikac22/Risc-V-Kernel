#ifndef ___kernel_funs___
#define ___kernel_funs___

#include"../lib/hw.h"

extern "C" void interruptvec();

extern void userMain();

void userMainWrapper(void*);
void idleFunction(void*);
void* kmalloc(size_t size);
void kprintString(const char*);
void kprintInt(uint64 num, int base = 10);
int kernelInit();

#endif