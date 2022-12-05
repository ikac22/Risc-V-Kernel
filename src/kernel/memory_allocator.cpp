#include"../../h/memory_allocator.hpp"
#include"../../h/kernel_funs.h"
MemoryAllocator MemoryAllocator::allocator;

MemoryAllocator& MemoryAllocator::getInstance(){
    if(!allocator.init){
        allocator.fall_head = nullptr;
        allocator.fmem_head = (FreeSegment*)HEAP_START_ADDR;
        allocator.fmem_head->next = nullptr;
        allocator.fmem_head->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(FreeSegment));
        allocator.init = true;
    }
    return allocator;
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
    if(best->size - size < sizeof(FreeSegment) + MEM_BLOCK_SIZE){
        if(!best_prev) fmem_head = best->next;
        else best_prev->next = best->next;
    }else{
        curr = (FreeSegment*)((char*)best + sizeof(FreeSegment) + size);
        curr->next = best->next;
        curr->size = best->size - size - sizeof(FreeSegment);
        best->size = size;
        if(best_prev) best_prev->next = curr;
        else fmem_head = curr;
    }
    best->next = fall_head;
    fall_head = best;
    return (char*)best+sizeof(FreeSegment);
}

bool MemoryAllocator::wantToFreeAddress(void* adr){
    if(adr < HEAP_START_ADDR || adr >= HEAP_END_ADDR)
        return true;
    size_t t = (size_t)adr;
    FreeSegment* prev = nullptr, *cur = fall_head;
    while(cur)
    {
        if(t == (size_t)cur+sizeof(FreeSegment))
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

FreeSegment* MemoryAllocator::mergeWithNext(FreeSegment* t){
    if((char*)t + sizeof(FreeSegment) + t->size == (char*)t->next){
        t->size += t->next->size + sizeof(FreeSegment);
        t->next = t->next->next;
        return t;
    }
    return t->next;
}

int MemoryAllocator::mem_free(void* adr){
    if(wantToFreeAddress(adr)) return -1;
    if(!fmem_head)
        fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
    else{
        FreeSegment* newsgm = (FreeSegment*)((char*)adr - sizeof(FreeSegment)), *prev,* cur;
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
            if((!prev || (size_t)adr > (size_t)prev) && (size_t)adr < (size_t)cur)
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
    return 0;
}

void MemoryAllocator::print_list(){

    kprintString("------Free Segment Lista------\n");
    if(!fmem_head)
        kprintString("LISTA JE PRAZNA!\n");
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
        kprintInt((uint64)curr);
        kprintString("\n");
        kprintInt((uint64)curr->size);
        kprintString("\n");
    }
    kprintString("------------------------------\n");
}

void MemoryAllocator::print_all_list(){

    kprintString("------Allocated Segment Lista------\n");
    if(!fall_head)
        kprintString("LISTA JE PRAZNA!\n");
    for(FreeSegment* curr = fall_head; curr; curr = curr->next){
        kprintInt((uint64)curr);
        kprintString("\n");
        kprintInt((uint64)curr->size);
        kprintString("\n");
    }
    kprintString("------------------------------\n");
}