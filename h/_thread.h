#ifndef ___thread___hpp
#define ___thread___hpp

#include"../lib/hw.h"

/* 
*   class that abstracts Kernel thread 
*   (the address returned is the address of kernel object)  
*/

class _thread{
public:
    void operator delete(void* ptr);
};

typedef _thread* thread_t;

#endif