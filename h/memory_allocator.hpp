#ifndef _memory_h
#define _memory_h
#include"../lib/hw.h"

/* NEED TO BE CHANGED */

/* structure that acts as a free memory segment header */ 
struct FreeSegment{
    struct FreeSegment* next;
    size_t size;
};


/* kernel class responsible for alocating memory */
class MemoryAllocator{
private:

    /* structure that keeps metadata about memory segment */
    struct MemorySegmentMeta{
        struct MemorySegmentMeta* next;
        size_t size;
        void* address;
    };

    bool init;
    FreeSegment* fmem_head; /* free memory sectors list head */
    FreeSegment* fall_head; /* allocated memory sectors list head */
    static MemoryAllocator allocator;

    MemoryAllocator() = default;
    
    bool wantToFreeAddress(void* adr); /* is given address valid to deallocate */
    FreeSegment* mergeWithNext(FreeSegment*); /* merge two free segments to new free segment */
public:
    
    MemoryAllocator(const MemoryAllocator&) = delete;
    bool operator==(const MemoryAllocator&) = delete;
    MemoryAllocator& operator=(const MemoryAllocator&) = delete;
    
    bool initalized(){ return init;}
    static MemoryAllocator& getInstance();
    void* mem_alloc(size_t);
    int mem_free(void*);
    void print_list();
    void print_all_list();
};

#endif