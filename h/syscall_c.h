#ifndef __syscallc__
#define __syscallc__

#include"../lib/hw.h"


#include"../h/_thread.h"
#include"../h/_semaphore.h"

#ifdef __cplusplus
extern "C" {
#endif
    void* mem_alloc (size_t size);
    int mem_free (void*);
    void thread_dispatch();
    int thread_create(thread_t* handle, 
        void(*start_routine)(void*), void* arg);
    int thread_exit();
    int sem_open(sem_t* handle, unsigned val);
    int sem_close(sem_t handle);
    int sem_wait(sem_t id);
    int sem_signal(sem_t id);
    int time_sleep(time_t time);
    char getc();
    void putc(char c);
#ifdef __cplusplus
}
#endif

class _semaphore{
public:
    void operator delete(void* addr){
        sem_close((sem_t)addr);
    }
};


#endif
