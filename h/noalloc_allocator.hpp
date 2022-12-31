#ifndef NOALLOC_ALLOCATOR_H
#define NOALLOC_ALLOCATOR_H

#include"../lib/hw.h"

/* CHECK THIS !!!!!
*
* No existing allocator operator functions;
* Used for allocating allocator objects;
* Allocators are not deallocated so operator delete is not needed;
*
*/
#define __NOALLOC_OPERATORS__ \
void* operator new(size_t sz){ return NoAlloc::mem_alloc(sz); } \
void* operator new[](size_t sz){ return NoAlloc::mem_alloc(sz); } \
void operator delete(void* ptr){  } \
void operator delete[](void* ptr){  }


/* 
* Continual allocation used when there is no allocator;
* -----USED FOR ALLOCATING ALLOCATOR OBJECTS-----
*/
class NoAlloc{ /* singleton */ 
    static bool working;
    static void* NOALLOC_END_ADDR; 
public:
    static void init(); /* set NOALLOC END ADDR = HEAP START ADDR */
    static void* getEndAddress(){ return NOALLOC_END_ADDR; } /* get end address of allocated objects by this allocator */
    static void* mem_alloc(size_t); /* allocate */
    static void turn_off() { working = false; }
    
};

#endif