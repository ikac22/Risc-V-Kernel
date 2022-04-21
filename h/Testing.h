#ifndef testing_h
#define testing_h

#include"../lib/console.h"
#include"../h/MemoryAllocator.h"

typedef long long ll;
typedef unsigned long long ull;

int print(ll, char end = '\n');
int print(ull, char end = '\n');
int print(const char*, char end = '\n');
void test1();
void* allocTest(MemoryAllocator& allocator, size_t size);
void freeTest(MemoryAllocator& allocator, void* adr);
void memTest();
#endif
