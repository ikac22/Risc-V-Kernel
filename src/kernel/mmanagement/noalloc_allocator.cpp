#include"../../../h/kernel_lib.h"

void* NoAlloc::NOALLOC_END_ADDR;
bool NoAlloc::working = false;

void* NoAlloc::mem_alloc(size_t size){
    /* not initalized */
    if(!working) return nullptr;
    if(!NOALLOC_END_ADDR) return nullptr;

    /* not enough memory */
    if((size_t) NOALLOC_END_ADDR + size >= (uint64)HEAP_END_ADDR)
        return nullptr;
    
    void* ret = NOALLOC_END_ADDR;
    NOALLOC_END_ADDR = (void*) ((size_t)NOALLOC_END_ADDR + size); /* increase end addr by size of object */
    
    return ret; 
}

void NoAlloc::init(){
    if(!NOALLOC_END_ADDR){
        NOALLOC_END_ADDR = (void*)HEAP_START_ADDR;
        working = true;
    }
}