#ifndef _memory_h
#define _memory_h
#include"../lib/hw.h"

struct FreeSegment{
    FreeSegment* next;
    size_t size;
};

class MemoryAllocator{
private:
    bool init;
    FreeSegment* fmem_head;
    static MemoryAllocator allocator;

    MemoryAllocator() = default;
    bool invalidFreeAddress(void* adr);
    FreeSegment* mergeWithNext(FreeSegment*);
public:
    MemoryAllocator(const MemoryAllocator&) = delete;
    bool operator==(const MemoryAllocator&) = delete;

    static MemoryAllocator& getInstance();
    void* mem_alloc(size_t);
    int mem_free(void*);
    void print_list();
};

#endif