#ifndef SLAB_ALLOCATOR_H
#define SLAB_ALLOCATOR_H
#include"../h/object_cache.h"
#include"../lib/hw.h"
#include "list.h"
#include "noalloc_allocator.hpp"
#include "kernel_funs.h"

#define __SLAB_ALLOCATION__(typename, ctor, dtor) \
    void* operator new(size_t sz){ \
        if(!cache){ \
            cache = new ObjectCache( #typename "_cache", sz, ctor, dtor); \
        } \
        return cache->alloc_obj(); \
    } \
    void* operator new[](size_t sz){ \
        return SlabAllocator::getInstance().kmalloc(sz);\
    }  \
    void operator delete(void* ptr){ \
        cache->free_obj(ptr); \
    }  \
    void operator delete[](void* ptr){ \
        SlabAllocator::getInstance().kfree(ptr); \
    }\


typedef class SlabAllocator{
    typedef ObjectCache::SlabMetaType SMT;
    friend ObjectCache;
    friend Slab;
    
    static const char* buff_cache_names[13];
    static SlabAllocator* allocator;

    static const int MIN_BUFFER_ORDER = 5,
        MAX_BUFFER_ORDER = 17;
    ObjectCache objcache_cache;
    ObjectCache slab_cache;
    ObjectCache smb_caches[13];
    list_t* cache_head;

    __NOALLOC_OPERATORS__

    SlabAllocator();
    bool operator=(SlabAllocator&) = delete;
    SlabAllocator(const SlabAllocator&) = delete;
    
public:
    ObjectCache* create_cache(const char* name, size_t objsize,
        void (*ctor)(void*), void (*dtor)(void*) );
    int cache_destroy(ObjectCache*);

    static SlabAllocator& getInstance();

    void print_state(char flag);

    void* kmalloc(size_t);
    int kfree(void*);

} SlabAl;

class Slab{
    friend ObjectCache;
    friend SlabAllocator;
    
    static const uchar RB_SIZE = 128;
    ObjectCache* parent;
    uchar round_buffer[RB_SIZE], front, rear, cap; //wich positions are free
    uchar map[RB_SIZE >> 3]; //used bit map
    char* addr_start;
    list_t node;

    Slab(uchar cap, void* addr, ObjectCache*);
    void set_bit(uchar index);
    void clear_bit(uchar index);
    bool get_bit(uchar index);
public:
    enum pb_mask: char{
        CLEAR = 0,
        FREE = 1,
        ALLOC = 2,
    };

    Slab() = default;
    Slab& operator=(const Slab&) = default;
    void* get_obj();
    int put_obj(void*);
    bool full(){ return front == RB_SIZE; }
    bool free(){ return rear == front; }
    void print_info(char flag = pb_mask::FREE);
    bool contains(void* ptr);
};  


#endif