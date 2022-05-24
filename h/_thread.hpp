#ifndef ___thread___hpp
#define ___thread___hpp

#include"../lib/hw.h"

class _thread{
public:
    void operator delete(void* ptr){
        asm volatile("li a0, 0x69");
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
        asm volatile("ecall");
    }
};

typedef _thread* thread_t;

#endif