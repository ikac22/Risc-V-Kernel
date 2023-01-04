#ifndef _memory_h
#define _memory_h
#include"../lib/hw.h"
#include "object_cache.h"


/* NEED TO BE CHANGED */

/* structure that acts as a free memory segment header */ 
struct FreeSegment{
    struct FreeSegment* next;
    size_t size;
    void* addr;
};


/* kernel class responsible for alocating memory */
class MemoryAllocator{
private:

    bool init;
    FreeSegment* fmem_head; /* free memory sectors list head */
    FreeSegment* fall_head; /* allocated memory sectors list head */
    ObjectCache* node_cache;

    static MemoryAllocator* allocator;

    MemoryAllocator() = default;
    
    
    bool wantToFreeAddress(void* adr); /* is given address valid to deallocate */
    FreeSegment* getAndRemoveFreeSegmentMeta(void* adr);
    FreeSegment* mergeWithNext(FreeSegment*); /* merge two free segments to new free segment */
public:
    
    MemoryAllocator(const MemoryAllocator&) = delete;
    bool operator==(const MemoryAllocator&) = delete;
    MemoryAllocator& operator=(const MemoryAllocator&) = delete;
    
    FreeSegment* getFreeSegmentMeta(void* adr);
    bool initalized(){ return init;}
    static MemoryAllocator& getInstance();
    void* mem_alloc(size_t);
    int mem_free(void*);
    void print_list();
    void print_all_list();
};

#endif