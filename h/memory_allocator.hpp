#ifndef _memory_h
#define _memory_h
#include"../lib/hw.h"

struct FreeSegment{
    struct FreeSegment* next;
    size_t size;
};

class MemoryAllocator{
private:
    bool init;
    FreeSegment* fmem_head;
    static MemoryAllocator allocator;

    MemoryAllocator() = default;
    
    FreeSegment* mergeWithNext(FreeSegment*);
public:
    bool invalidFreeAddress(void* adr);
    MemoryAllocator(const MemoryAllocator&) = delete;
    bool operator==(const MemoryAllocator&) = delete;
    MemoryAllocator& operator=(const MemoryAllocator&) = delete;
    
    bool initalized(){ return init;}
    static MemoryAllocator& getInstance();
    void* mem_alloc(size_t);
    int mem_free(void*);
    void print_list();
};

#endif