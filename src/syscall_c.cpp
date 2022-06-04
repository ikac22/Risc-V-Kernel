#include"../lib/hw.h"
#include"../h/_thread.h"
#include"../h/_semaphore.h"

extern "C" void* mem_alloc(size_t size)
{
    size_t szblcks = (size-1)/MEM_BLOCK_SIZE + 1;
    char* adr = 0;

    __asm__ volatile("mv a1, %0" : : "r" (szblcks));
    __asm__ volatile("mv a0, %0" : : "r" (0x1));
    __asm__ volatile("ecall");
    __asm__ volatile("mv %0, a0" : "=r" (adr));
    
    return adr;  
}

extern "C" int mem_free (void* adr)
{
    int ret;

    __asm__ volatile("mv a1, %0" : : "r" ((uint64)adr));
    __asm__ volatile("mv a0, %0" : : "r" (0x2));
    __asm__ volatile("ecall");
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    
    return ret;
}

extern "C" void thread_dispatch()
{
    __asm__ volatile("mv a0, %0" : : "r" (0x13));
    __asm__ volatile("ecall");
}

extern "C" int thread_create(thread_t* handle, 
    void(*start_routine)(void*), void* arg)
{
   
    if(handle == nullptr) return -1;
    if(start_routine == nullptr) return -2;

    void* stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    if(stack_space == nullptr) return -3;
    //print("stack_space:", (uint64)stack_space, 0);

    int ret = 0;

    asm volatile("mv a4, %0" : : "r" ((uint64)stack_space));
    asm volatile("mv a3, %0" : : "r" ((uint64)arg));
    asm volatile("mv a2, %0" : : "r" ((uint64)start_routine));
    asm volatile("mv a1, %0" : : "r" ((uint64)handle));
    asm volatile("li a0, 0x11");
    
    asm volatile("ecall");   

    asm volatile("mv %0, a0" : "=r" (ret));
    return ret;
}

extern "C" int thread_exit()
{
    int ret = 0;

    asm volatile("li a0, 0x12");
    asm volatile("ecall");

    return ret;
}

extern "C" int sem_open(sem_t* handle, unsigned val)
{
    int ret = 0;
    if(handle == nullptr) return -1;

    asm volatile("mv a2, %0" : : "r" (val));
    asm volatile("mv a1, %0" : : "r" (handle));
    asm volatile("li a0, 0x21");
    asm volatile("ecall");

    asm volatile("mv %0, a0" : "=r" (ret));
    return ret;
}

extern "C" int sem_close(sem_t handle)
{
    int ret = 0;
    if(handle == nullptr) return -1;

    asm volatile("mv a1, %0" : : "r" (handle));
    asm volatile("li a0, 0x22");
    asm volatile("ecall");

    asm volatile("mv %0, a0" : "=r" (ret));
    return ret;
}

extern "C" int sem_wait(sem_t id)
{
    int ret = 0;
    if(id == nullptr) return -1;
    
    asm volatile("mv a1, %0" : : "r" (id));
    asm volatile("li a0, 0x23");
    asm volatile("ecall");

    asm volatile("mv %0, a0" : "=r" (ret));
    return ret;
}

extern "C" int sem_signal(sem_t id)
{
    int ret = 0;
    if(id == nullptr) return -1;

    asm volatile("mv a1, %0" : :"r"(id));
    asm volatile("li a0, 0x24");
    asm volatile("ecall");

    asm volatile("mv %0, a0" : "=r" (ret));
    return ret;
}

extern "C" int time_sleep(time_t time){
    int ret = 0;
    if(time == 0) return -1;

    asm volatile("mv a1, %0" : :"r"(time));
    asm volatile("li a0, 0x31");
    asm volatile("ecall");

    asm volatile("mv %0, a0" : "=r" (ret));
    return ret;
}

const int EOF = -1;
extern "C" char getc(){
    unsigned ret;

    asm volatile("li a0, 0x41");
    asm volatile("ecall");

    asm volatile("mv %0, a0" : "=r" (ret));
    if(ret < 256) return ret;
    else return EOF;
}

extern "C" void putc(char c){
    asm volatile("mv a1, a0");
    asm volatile("li a0, 0x42");
    asm volatile("ecall");
}