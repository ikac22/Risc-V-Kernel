#include "../../../h/kernel_lib.h"

Slab::Slab(uchar cap, void* addr, ObjectCache* parent){
    this->cap = cap;
    this->addr_start = (char*)addr;
    node.next = node.prev = nullptr;
    this->parent = parent;

    for(uint a = 0; a < cap; a++)
        round_buffer[a] = a;
    front = rear = 0;
    
    for(uint a = 0; a < (RB_SIZE >> 3); a++){
        map[a] = 0;
    }
}



void* Slab::get_obj(){
    if(full()) return nullptr;
    
    void* ret = 
        (void*) (addr_start + round_buffer[front] * parent->objsize);
    
    set_bit(round_buffer[front]);

    front = front+1;
    if(front >= cap) front = 0;
    if(front == rear) front = RB_SIZE;

    return ret;
}



bool Slab::contains(void *ptr){
    if((char*)ptr < addr_start) return 0;

    size_t diff = (char*)ptr - addr_start;
    if(diff % parent->objsize
        || diff > parent->objsize*cap) return 0;
    
    return 1;
}



int Slab::put_obj(void *ptr){

    if(free()) return -4;
    if((char*)ptr < addr_start) return -1;

    size_t diff = (char*)ptr - addr_start;
    if(diff % parent->objsize
        || diff > parent->objsize*cap) return -2;

    size_t num = diff/parent->objsize;
    if(!get_bit(num)) return -5;

    if(parent->dtor) parent->dtor(ptr);
    clear_bit(num);

    round_buffer[rear] = num;
    if(front == RB_SIZE) front = rear;
    rear = rear+1;
    if(rear >= cap) rear = 0;
     

    return 0;

}




void Slab::print_info(char flag){
    
    kprintString("Slab info:\n");
    KVALCHECKPRINT(Slab Meta Address, this);
    KVALCHECKPRINT(Slab Address, addr_start);
    
    uchar t = front;
    if(flag & pb_mask::FREE){
        if(front == rear){
            KPRINTARR(FreeSlot, round_buffer[front], 1);
            if(cap > 1)
                t++;
        }
        else
            t = front;
        if(front != RB_SIZE) 
            for(;  t < RB_SIZE && t != rear;  t = (t + 1)%cap){
                KPRINTARR(FreeSlot, round_buffer[t], 1);
            }
        kprintString("\n");
    }
    
    if(flag & pb_mask::ALLOC){
        for(uint i = 0; i < cap; i++){
            if(get_bit(i)){
                KPRINTARR(UsedSlot, i, 1);
            }
        }
        
    }

    
}




bool Slab::get_bit(uchar index){
    return map[index >> 3] & (1U << (index & 7U));
}




void Slab::set_bit(uchar index){
    map[index >> 3] |= (1 << (index & 7));
}




void Slab::clear_bit(uchar index){
    map[index >> 3] &= ~(1 << (index & 7));
}
