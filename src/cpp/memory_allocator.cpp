#include"../../h/memory_allocator.hpp"
#include"../../h/testing.hpp"
#include"../../lib/console.h"
/*MemoryAllocator::MemoryAllocator(){
    print("aaaa");
    fmem_head = (FreeSegment*)HEAP_START_ADDR;
    fmem_head->next = nullptr;
    fmem_head->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(FreeSegment));
}*/

MemoryAllocator MemoryAllocator::allocator;

MemoryAllocator& MemoryAllocator::getInstance(){
    if(!allocator.init){
        allocator.fmem_head = (FreeSegment*)HEAP_START_ADDR;
        allocator.fmem_head->next = nullptr;
        allocator.fmem_head->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(FreeSegment));
        allocator.init = true;
    }
    return allocator;
}

void* MemoryAllocator::mem_alloc(size_t size){
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    //print("Alocirano blokova: ", size, 0);
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

    //print((uint64)best);
    //print((uint64)best->size);
    best->next = nullptr;
    //print("Na adresi: ", (uint64)best+sizeof(FreeSegment), 0);
    //print_list();
    return (char*)best+sizeof(FreeSegment);
}

bool MemoryAllocator::invalidFreeAddress(void* adr){
    if(adr < HEAP_START_ADDR || adr >= HEAP_END_ADDR)
        return true;
    size_t t = (size_t)adr;
    for(FreeSegment* cur = fmem_head; cur; cur = cur->next)
        if(t >= (size_t)cur && t < (size_t)cur+2*sizeof(FreeSegment)+cur->size)
            return true;
    return false;
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
    if(invalidFreeAddress(adr)) return -1;
    if(!fmem_head)
        fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
    else{
        FreeSegment* newsgm = (FreeSegment*)((char*)adr - sizeof(FreeSegment)), *prev,* cur;
        //print((uint64)newsgm);
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
            if((!prev || (size_t)adr > (size_t)prev) && (size_t)adr < (size_t)cur)
                break;
        //print((ull)prev);
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
    //print("MEM_BLOCK_SIZE: ", ' ');
    //print(MEM_BLOCK_SIZE, '\n', 0);
    print("------Free Segment Lista------");
    if(!fmem_head)
        print("LISTA JE PRAZNA!");
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
        print((uint64)curr, '\n', 0);
        print((uint64)curr->size, '\n', 0);
        __putc('\n');
    }
    print("------------------------------");
}

