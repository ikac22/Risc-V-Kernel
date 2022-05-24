#ifndef __syscallc__
#define __syscallc__

#include"../lib/hw.h"
#include"../h/_thread.hpp"
extern "C" void* mem_alloc (size_t size);
extern "C" int mem_free (void*);
extern "C" void thread_dispatch();
extern "C" void thread_create();
#endif
