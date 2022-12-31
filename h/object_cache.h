#ifndef OBJECT_CACHE_H
#define OBJECT_CACHE_H
#include"../lib/hw.h"
#include"../h/list.h"

class SlabAllocator;
class Slab;

class ObjectCache{

public:
    enum SlabMetaType{
        NONE ,
        OFF_SLAB ,
        SLAB_SLAB ,
        ON_SLAB,
        BUFF_SLAB
    };

    ObjectCache() = default;
    ObjectCache(const char* name_t, size_t objsize_t,
        void (*ctor_t)(void*), void (*dtor)(void*),
        SlabMetaType t_type = NONE);
    
    void* operator new(size_t size);
    void operator delete(void* addr);
    
    void* alloc_obj();
    int free_obj(void*);
    int shrink();

    void printInfo(char flag);
    static void linking_ctor(void*);
    void zero_out(void* t);

private:
    friend SlabAllocator;
    friend Slab;
    
    const char* name,*error;
    size_t objsize; 
    SlabMetaType type;   

    list_t* free_head,* part_head,* full_head ;
    list_t node;

    void (*ctor)(void*);
    void (*dtor)(void*);
    
    Slab* find_slab(void* addr, list_t* head);
    Slab* slab_alloc();
    SlabMetaType calculate_type();
    size_t get_slab_size(uchar* buddy_level=nullptr);
    void list_update_free(Slab* slab_meta, bool was_full);
    void list_update_alloc(Slab* slab_meta, bool was_free);
};

#endif