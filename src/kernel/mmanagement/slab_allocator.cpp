#include "../../../h/kernel_lib.h"



SlabAllocator* SlabAllocator::allocator;
const char* SlabAllocator::buff_cache_names[13] = 
        { "smb_cache_5", "smb_cache_6", "smb_cache_7" 
        , "smb_cache_8", "smb_cache_9", "smb_cache_10"
        , "smb_cache_11", "smb_cache_12", "smb_cache_13"
        , "smb_cache_14", "smb_cache_15", "smb_cache_16"
        , "smb_cache_17" };



SlabAllocator::SlabAllocator():objcache_cache("objcache_cache", sizeof(ObjectCache),nullptr,nullptr),
    slab_cache("slab_meta_cache", sizeof(Slab), nullptr, nullptr, SMT::SLAB_SLAB){

    for(int i = MIN_BUFFER_ORDER; i <= MAX_BUFFER_ORDER; i++)
        smb_caches[i-MIN_BUFFER_ORDER] = 
            ObjectCache(buff_cache_names[i-MIN_BUFFER_ORDER], 1 << i
                , nullptr, nullptr, SMT::BUFF_SLAB);

}



SlabAllocator& SlabAllocator::getInstance(){
    
    if(!allocator) { allocator = new SlabAllocator; }

    return *allocator;
}



void SlabAllocator::print_state(char flags){

    objcache_cache.printInfo(flags);
    slab_cache.printInfo(flags);

    for(int i = MIN_BUFFER_ORDER; i <= MAX_BUFFER_ORDER; i++)
        smb_caches[i - MIN_BUFFER_ORDER].printInfo(flags);

}



void* SlabAllocator::kmalloc(size_t size){
    if(size == 0)
        return nullptr;
    
    uchar size_order = log2(size - 1) + 1;
    if(size_order > 17)
        return nullptr;
    
    if(size_order < 5)
        size_order = 5;

    return smb_caches[size_order-5].alloc_obj();
}



int SlabAllocator::kfree(void* p){
    for(ObjectCache& smb_cache: smb_caches){
        if(!smb_cache.free_obj(p)){
            smb_cache.shrink();
            return 0;
        }
    }
    return 1;
}


