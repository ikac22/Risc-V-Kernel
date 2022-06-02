#ifndef __syscallc__
#define __syscallc__

#include"../lib/hw.h"
#include"../h/_thread.hpp"
#include"../h/_semaphore.hpp"

extern "C" void* mem_alloc (size_t size);
extern "C" int mem_free (void*);
extern "C" void thread_dispatch();
extern "C" int thread_create(thread_t* handle, 
    void(*start_routine)(void*), void* arg);
extern "C" int thread_exit();
extern "C" int sem_open(sem_t* handle, unsigned val);
extern "C" int sem_close(sem_t handle);
extern "C" int sem_wait(sem_t id);
extern "C" int sem_signal(sem_t id);
extern "C" int time_sleep(time_t time);
extern "C" char getc();
extern "C" void putc(char c);

#endif
