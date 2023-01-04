#include"../../../h/kernel_lib.h"

MemoryAllocator* MemoryAllocator::allocator = nullptr;

MemoryAllocator& MemoryAllocator::getInstance(){
    if(!allocator){
        allocator = (MemoryAllocator*)SlabAllocator::getInstance().kmalloc(sizeof(MemoryAllocator));
        allocator->node_cache = new ObjectCache("free_seg_meta_cache", sizeof(FreeSegment), 0, 0);
        if(!allocator->node_cache){ kprintString("MEM ALLOC node cache not allocated\n"); while(1); }
        
        allocator->fall_head = nullptr;
        //allocator->fmem_head = (FreeSegment*)NoAlloc::getEndAddress();
        allocator->fmem_head = (FreeSegment*)allocator->node_cache->alloc_obj();
        allocator->fmem_head->next = nullptr;

        size_t start_addr = (((size_t)NoAlloc::getEndAddress() - 1) & (~0xfff)) + 0x1000;
        KVALCHECKPRINT("MemoryAllocator start address: ", start_addr);
        allocator->fmem_head->addr = (void*) start_addr;
        allocator->fmem_head->size = ((size_t)HEAP_END_ADDR - start_addr);
        allocator->init = true;
    }
    return *allocator;
}

void* MemoryAllocator::mem_alloc(size_t size){
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    size = size*MEM_BLOCK_SIZE;


    while(curr){
        if(curr->size >= size)
            if (!best || (curr->size < best->size)){
                best = curr;     
                best_prev = prev;
            }
        prev = curr;
        curr = curr->next;
    } 
    if(!best)
        return nullptr;

    // if(best->size - size < sizeof(FreeSegment) + MEM_BLOCK_SIZE){
    //     if(!best_prev) fmem_head = best->next;
    //     else best_prev->next = best->next;
    // }else{
    //     curr = (FreeSegment*)((char*)best + sizeof(FreeSegment) + size);
    //     curr->next = best->next;
    //     curr->size = best->size - size - sizeof(FreeSegment);
    //     best->size = size;
    //     if(best_prev) best_prev->next = curr;
    //     else fmem_head = curr;
    // }
    if(best->size != size){
        curr = (FreeSegment*)node_cache->alloc_obj();
        curr->next = best->next;
        curr->size = best->size - size;
        curr->addr = (char*)best->addr + size;
        best->size = size;
    }
    else { curr = best->next; }

    if(!best_prev) fmem_head = curr;
    else best_prev->next = curr;
    
    best->next = fall_head;
    fall_head = best;
    // return (char*)best+sizeof(FreeSegment);
    // print_all_list();
    // print_list();
    return best->addr;
}

bool MemoryAllocator::wantToFreeAddress(void* adr){
    if(adr < HEAP_START_ADDR || adr >= HEAP_END_ADDR)
        return true;
    size_t t = (size_t)adr;
    FreeSegment* prev = nullptr, *cur = fall_head;
    while(cur)
    {
        // if(t == (size_t)cur+sizeof(FreeSegment))
        //     break;
        if(t == (size_t)cur->addr)
            break;    
        prev = cur;
        cur = cur->next;
    }
    if(cur)
    {
        if(prev)
            prev->next = cur->next;
        else
            fall_head = cur->next;
        cur->next = nullptr;
        return false;
    }
    else return true;
}

FreeSegment* MemoryAllocator::getAndRemoveFreeSegmentMeta(void* adr){
    size_t start_addr = (((size_t)NoAlloc::getEndAddress() - 1) & (~0xfff)) + 0x1000;
    if(adr < (void*)start_addr || adr >= HEAP_END_ADDR)
        return nullptr;
    size_t t = (size_t)adr;
    FreeSegment* prev = nullptr, *cur = fall_head;
    while(cur)
    {
        // if(t == (size_t)cur+sizeof(FreeSegment))
        //     break;
        if(t == (size_t)cur->addr)
            break;    
        prev = cur;
        cur = cur->next;
    }
    if(cur)
    {
        if(prev)
            prev->next = cur->next;
        else
            fall_head = cur->next;
        cur->next = nullptr;
        return cur;
    }
    else return nullptr;
}

FreeSegment* MemoryAllocator::mergeWithNext(FreeSegment* t){
    // if((char*)t + sizeof(FreeSegment) + t->size == (char*)t->next){
    //     t->size += t->next->size + sizeof(FreeSegment);
    //     t->next = t->next->next;
    //     return t;
    // }
    if((char*)t->addr + t->size == (char*)t->next->addr){
        t->size += t->next->size;
        FreeSegment* old = t->next;
        t->next = t->next->next;
        node_cache->free_obj(old);
        return t;
    }
    return t->next;
}

int MemoryAllocator::mem_free(void* adr){
    // if(wantToFreeAddress(adr)) return -1;
    FreeSegment* newsgm = getAndRemoveFreeSegmentMeta(adr);
    if(!newsgm){
        kprintString("MEM_ALLOC_FREEE GRESKA\n"); 
        KCHECKPRINT(adr);
        KCHECKPRINT(Riscv::r_sepc());
        return -1;
    }
    
    if(!fmem_head)
        // fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
        fmem_head = newsgm;
    else{
        FreeSegment/* * newsgm = (FreeSegment*)((char*)adr - sizeof(FreeSegment)),*/ *prev,* cur;
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
            // if((!prev || (size_t)adr > (size_t)prev) && (size_t)adr < (size_t)cur)
            if((!prev || (size_t)adr > (size_t)prev->addr) && (size_t)adr < (size_t)cur->addr)
                break;
        newsgm->next = cur;
        if(cur)
            mergeWithNext(newsgm);
        if(prev){
            prev->next = newsgm;
            mergeWithNext(prev);
        }
        else
            fmem_head = newsgm;
    }
    // print_all_list();
    // print_list();
    return 0;
}

FreeSegment* MemoryAllocator::getFreeSegmentMeta(void* adr){
   size_t start_addr = (((size_t)NoAlloc::getEndAddress() - 1) & (~0xfff)) + 0x1000;
    if(adr < (void*)start_addr || adr >= HEAP_END_ADDR)
        return nullptr;
    size_t t = (size_t)adr;
    FreeSegment *cur = fall_head;
    while(cur)
    {
        // if(t == (size_t)cur+sizeof(FreeSegment))
        //     break;
        if(t >= (size_t)cur->addr && t < (size_t)cur->addr + cur->size)
            break;    
        
        cur = cur->next;
    }
    if(cur)
        return cur;
    else return nullptr;
}

void MemoryAllocator::print_list(){

    kprintString("------Free Segment Lista------\n");
    if(!fmem_head)
        kprintString("LISTA JE PRAZNA!\n");
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
        kprintInt((uint64)curr, 16);
        kprintString("\n");
        kprintInt((uint64)curr->size, 16);
        kprintString("\n");
        kprintInt((uint64)curr->addr, 16);
        kprintString("\n");
    }
    kprintString("------------------------------\n");
}

void MemoryAllocator::print_all_list(){

    kprintString("------Allocated Segment Lista------\n");
    if(!fall_head)
        kprintString("LISTA JE PRAZNA!\n");
    for(FreeSegment* curr = fall_head; curr; curr = curr->next){
        kprintInt((uint64)curr, 16);
        kprintString("\n");
        kprintInt((uint64)curr->size,16);
        kprintString("\n");
        kprintInt((uint64)curr->addr, 16);
        kprintString("\n");
        kprintString("\n");
    }
    kprintString("------------------------------\n");
}