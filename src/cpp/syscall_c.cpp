#include"../../lib/hw.h"
#include"../../h/_thread.hpp"
extern "C" void* mem_alloc(size_t size){
    size_t szblcks = (size-1)/MEM_BLOCK_SIZE + 1;
    char* adr = 0;

    __asm__ volatile("mv a1, %0" : : "r" (szblcks));
    __asm__ volatile("mv a0, %0" : : "r" (0x1));
    __asm__ volatile("ecall");
    __asm__ volatile("mv %0, a0" : "=r" (adr));
    
    return adr;  
}

extern "C" int mem_free (void* adr){
    int ret;

    __asm__ volatile("mv a1, %0" : : "r" ((uint64)adr));
    __asm__ volatile("mv a0, %0" : : "r" (0x2));
    __asm__ volatile("ecall");
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    
    return ret;
}

extern "C" void thread_dispatch(){
    __asm__ volatile("mv a0, %0" : : "r" (0x13));
    __asm__ volatile("ecall");
}



extern "C" void thread_create(thread_t* handle, 
    void(*start_routine)(void*), void* arg){
   
    void* stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    
    asm volatile("li a0, 0x11");
    asm volatile("mv a1, %0" : : "r" ((uint64)handle));
    asm volatile("mv a2, %0" : : "r" ((uint64)start_routine));
    asm volatile("mv a3, %0" : : "r" ((uint64)arg));
    asm volatile("mv a4, %0" : : "r" ((uint64)stack_space));
    

}