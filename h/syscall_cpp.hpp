#ifndef __sys__cpp__h
#define __sys__cpp__h

#include"../h/syscall_c.h"

void* operator new(size_t sz){return mem_alloc(sz);}
void operator delete(void* ptr){mem_free(ptr);}

void* operator new[](size_t sz){return mem_alloc(sz);}
void operator delete[](void* ptr){mem_free(ptr);}


#endif