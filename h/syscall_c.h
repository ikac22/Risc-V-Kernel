#ifndef __syscallc__
#define __syscallc__

#include"../lib/hw.h"
#include"../h/_thread.hpp"
extern "C" void* mem_alloc (size_t size);
extern "C" int mem_free (void*);
extern "C" void thread_dispatch();
extern "C" int thread_create(thread_t* handle, 
    void(*start_routine)(void*), void* arg);
extern "C" int thread_exit();
#endif
