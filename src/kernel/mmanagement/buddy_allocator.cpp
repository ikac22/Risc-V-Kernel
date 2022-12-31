#include"../../../h/kernel_lib.h"
#define BLOCK_IND(addr) \
( ((uint64)addr - (uint64)start_address) >> BLOCK_SIZE_BIT_LEN)
 
Buddy* Buddy::buddy = nullptr;
uchar Buddy::BLOCK_SIZE_BIT_LEN = 0;

Buddy::Buddy(void* saddr, uchar level){
    start_address = saddr;
    max_level = level;
    
    /* reserve memory */
    uint64 x = (uint64)NoAlloc::getEndAddress();
    uint64 y = (uint64)saddr + (BLOCK_SIZE << max_level);
    void* ind = NoAlloc::mem_alloc(y - x);

    if(!ind) { /* panic */ }

    /* alloc free map */
    x = 1 << (BLOCK_SIZE_BIT_LEN - 3);
    fmap = (uchar*)NoAlloc::mem_alloc(x);
    if(!fmap) { /* panic */ }
    for(uint64 i = 0; i < x; i++) fmap[i] = 0;
    
    /* alloc list heads */
    lhp = (mmeta_t**)NoAlloc::mem_alloc((level+1)*sizeof(mmeta_t*));
    if(!lhp) { /* panic */ }
    for(uchar i = 0; i < max_level + 1; i++)
        lhp[i] = nullptr;


    /* add just biggest element (whole memory) to last list */
    fmap[0] |= 1;
    int code = add_to_list(max_level, (mmeta_t*)start_address);
    if ( code < 0) {
        kprintString("addtolist panic: ");
        kprintInt(code, 16);
        kprintString("\n");
    }
}

int Buddy::initalize(void* saddr, uchar level){
    BLOCK_SIZE_BIT_LEN = log2(BLOCK_SIZE);
    uint64 laa = (uint64)NoAlloc::getEndAddress();
    if((uint64)saddr < laa + sizeof(Buddy))
        return 1;
    saddr = (void*) blockAlign((uint64)saddr);
    buddy = new Buddy(saddr, level);
    if(!buddy)  return 1;

    return 0;
}

Buddy& Buddy::getInstance(){
    if(!buddy) {  /* panic */ }
    return (*buddy);
}

void* Buddy::mem_alloc(uchar level){
    
    if(level > max_level) return nullptr;
    uchar i = level;
    /*  iterate through levels until we find not-empty list 
    *   and get free chunk
    */
    for(; i <= max_level; i++)
        if(lhp[i]) break;
    if(i > max_level) return nullptr;
    mmeta_t* chunk = get_from_list(i);

    /* split chunk until we get to given level */
    for(;i > level; i--){
        mmeta_t* t = split(chunk);
        set_bit(BLOCK_IND(t));
        add_to_list(i-1, t);
        chunk->level--;
    }
    /* set allocate curr chunk */
    clr_bit(BLOCK_IND(chunk));
    return chunk;
}



int Buddy::mem_free(void* addr, uchar level){
    
    if(( (uint64)addr & (BLOCK_SIZE - 1) )
    || addr < start_address) return -1;
    
    if(level > max_level) return -4;
    /* check bn */
    uint64 bind = BLOCK_IND(addr);
    if(bind >= (1ULL << max_level)) return -3;
    if(get_bit_val(bind)) return -2;

    /*let the merging begin */ 
    mmeta_t* chunk = (mmeta_t*)addr;
    chunk->level = level;
    chunk->prev = chunk->next = nullptr;
    set_bit(bind);
    while(chunk->level < max_level){
        mmeta_t* maddr = merge_ip(chunk);
        if(maddr)
            chunk = maddr;
        else
            break;
    }
    add_to_list(chunk->level, chunk);
    return 0;
}



int Buddy::add_to_list(uchar level, mmeta_t* chunk){
    if(level > max_level) return -4;
    if( !chunk || ((uint64)chunk & (BLOCK_SIZE - 1)) ) return -1;
    if(!get_bit_val(BLOCK_IND(chunk))) return -2;
    
    /* add it to the front of the list */
    chunk -> next = lhp[level];
    chunk -> prev = 0;
    chunk -> level = level;
    if(lhp[level]) lhp[level] -> prev = chunk;
    lhp[level] = chunk;

    return 0;
}

mmeta_t* Buddy::get_from_list(uchar level){
    /* chk if level is valid */
    if(level > max_level) return nullptr;
    mmeta_t* ret = lhp[level];
    if(ret){
        if(ret->next) ret->next->prev = 0;
        lhp[level] = ret->next;    
    }
    ret->next = 0;
    return ret;
}

int Buddy::remove_from_list(uchar level, mmeta_t* chunk){
    
    if(level > max_level) return -4;
    if( !chunk || ((uint64)chunk & (BLOCK_SIZE - 1)) ) return -1;
    if(!get_bit_val(BLOCK_IND(chunk))) return -2;
    if(!(chunk->level == level)) return -3;

    /* check if it is on the front */
    if(lhp[level] == chunk){
        get_from_list(level);
        return 0;
    }

    /* if it is not on the front */
    chunk->prev->next = chunk->next;
    /* if it isn't last */
    if(chunk->next) chunk->next->prev = chunk->prev;
    chunk->next = chunk->prev = 0;
    return 0;

}


mmeta_t* Buddy::split(mmeta_t* chunk){
    /* chk if address is valid */
    if( ((uint64)chunk & (BLOCK_SIZE - 1)) || chunk < start_address ) return nullptr;
    return (mmeta_t*)( (uint64)chunk + (BLOCK_SIZE << (chunk->level - 1)) ) ;
}

mmeta_t* Buddy::merge_ip(mmeta_t* chunk){
    size_t bi = BLOCK_IND(chunk);
    size_t budd_bi;

    budd_bi = bi ^ (1ULL << chunk->level);

    if(!get_bit_val(bi)) return nullptr;
    /* get buddy address */
    mmeta_t* budd_addr = (mmeta_t*)((budd_bi << BLOCK_SIZE_BIT_LEN) + (size_t)start_address);
    if(budd_addr->level != chunk->level) return nullptr;
   
    int code = remove_from_list(budd_addr->level, budd_addr);    
    if(code < 0) return nullptr;

    if(budd_bi < bi){
        swap(bi, budd_bi);
        swap(chunk, budd_addr);
    }
    clr_bit(budd_bi);
    set_bit(bi);
    chunk->level = chunk->level + 1;

    return chunk;
}

bool Buddy::get_bit_val(size_t index){
    size_t entry = index >> 3;
    return fmap[entry] & ( 1 << (index & 7) );
}

void Buddy::set_bit(size_t index){
    size_t entry = index >> 3;
    fmap[entry] |= ( 1 << (index & 7) );
}

void Buddy::clr_bit(size_t index){
    size_t entry = index >> 3;
    fmap[entry] &= ~( 1 << (index & 7) );
}

int kmi(){
    /* start of reserved memory for buddy allocator */
    void* buddy_mem_start = (void*)( 
        (uint64)NoAlloc::getEndAddress() + sizeof(Buddy) ) ;

    size_t buddy_mem_size = ((uint64)HEAP_END_ADDR - (uint64)buddy_mem_start) >> 3;
    if(!buddy_mem_size) return 2;
    buddy_mem_size = ( (buddy_mem_size-1) >> log2(Buddy::BLOCK_SIZE) ) + 1;
    uchar level = log2(closest2pow(buddy_mem_size));
    
    int ret = Buddy::initalize(buddy_mem_start, level);
    if(!ret) SlabAllocator::getInstance();
    return ret;
}

void Buddy::print_be(size_t index){
    kprintString("blocks["); kprintInt( index, 10); kprintString("]: ");
    bool bit = get_bit_val(index);
    if(bit)
        kprintString("FREE");
    else
        kprintString("ALLOC");
}

void Buddy::status_print(bool f){
    if(!buddy){
        kprintString("BUDDY NOT INITALIZED!!!");
        return;
    }
    kprintString("------BUDDY STATUS PRINT------\n");
    KCHECKPRINT(buddy);
    KCHECKPRINT(start_address);
    KCHECKPRINT(max_level);

    kprintString("\t------MEMORY META------\n");
    for(uchar i = 0; i <= max_level; i++){
        kprintString("\t"); KPRINTARR(LEVEL, i, (lhp[i] != 0));
        kprintString("\t");
        for(mmeta_t* curr = lhp[i]; curr; curr = curr->next){
            kprintInt((uint64)curr, 16);
            if(curr->next)
                kprintString(" -> ");
        }
        kprintString("\n");
    }
    kprintString("\n");
    if(f){
        for(size_t i = 0; i < (1ULL << max_level); i++){
            if(get_bit_val(i)){
                kprintString("\t"); print_be(i); kprintString("\n");
            }
        }
    }
    kprintString("\t----END MEMORY META----\n");

    kprintString("-------END BUDDY STATUS-------\n");

}