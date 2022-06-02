#ifndef testing_h
#define testing_h

#include"../lib/console.h"
#include"../h/memory_allocator.hpp"
#include"../h/riscv.hpp"
#include"../h/syscall_c.h"

void print(uint64, char end = '\n', bool hex = 1);
void print(const char*, char end = '\n');
void* allocTest(MemoryAllocator& allocator, size_t size);
void freeTest(MemoryAllocator& allocator, void* adr);
void memTest();
void print_a0();
void print_sup_registers();
void print(const char* str, uint64 t, bool hex = 1);
void* kmalloc(size_t size);



#endif
