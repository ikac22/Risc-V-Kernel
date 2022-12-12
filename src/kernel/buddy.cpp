#include"../../h/kernel_lib.h"

Buddy* Buddy::buddy = nullptr;
uchar Buddy::BLOCK_SIZE_BIT_LEN = 0;
int Buddy::initalize(void* saddr, size_t sz){
    
    /* set block bit len */
    BLOCK_SIZE_BIT_LEN = log2(BLOCK_SIZE);
    
    /* last allocated address */
    uint64 laa = (uint64)NoAlloc::getEndAddress();
    /* ckeck if start address is lower than it can be */
    if((uint64)saddr < laa + sizeof(Buddy))
        return 1;
    /* aligned address to 4096 bytes */
    saddr = (void*) blockAlign((uint64)saddr);
    
    /* align size to 2^n*/
    sz = closest2pow(sz);

    /* allocate buddy */
    buddy = new Buddy(saddr, sz);
    
    if(!buddy)  return 1;


    return 0;
}

int kmi(){
    /* start of reserved memory for buddy allocator */
    void* buddy_mem_start = (void*)( 
        (uint64)NoAlloc::getEndAddress() + sizeof(Buddy) ) ;

    /* size of memory for buddy allocator */
    size_t buddy_mem_size = ((uint64)HEAP_END_ADDR - (uint64)buddy_mem_start) >> 3; 
    if(buddy_mem_size == 0){ return 1; }
    /* size of memory for buddy allocator in blocks*/
    buddy_mem_size = (buddy_mem_size - 1)/Buddy::BLOCK_SIZE + 1;

    return Buddy::initalize(buddy_mem_start, buddy_mem_size);
}

Buddy& Buddy::getInstance(){
    if(!buddy) {  /* TODO: panic */ }

    return (*buddy);
}

void Buddy::print_be(size_t entry){
    kprintString("blocks["); kprintInt( entry, 10); kprintString("]: ");
    switch(blocks[entry]){
        case bstatus::FREE:
            kprintString("FREE");
            break;
        case bstatus::SUB_ALLOC:
            kprintString("SUB_ALLOC");
            break;
        default:
            if((short)blocks[entry] < 0)
                kprintString("INVALID");
            else{
                kprintString("ALLOC: 2^");
                kprintInt(blocks[entry]);
            }
            break;
    }
}

int Buddy::add_to_list(uchar level, mmeta_t* chunk){
    /* chk if level is valid */
    if(level >= lhp_size) return -4;
    /* chk if address is valid */
    if( !chunk || ((uint64)chunk & (BLOCK_SIZE - 1)) ) return -1;
    /* chk if starting block of chunk is set to free */ 
    size_t bn = get_block_num(chunk);
    if(blocks[bn] != FREE) return -2;
    
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
    if(level >= lhp_size) return nullptr;
    mmeta_t* ret = lhp[level];
    if(ret){
        if(ret->next) ret->next->prev = 0;
        lhp[level] = ret->next;    
    }
    ret->next = 0;
    return ret;
}

size_t Buddy::get_block_num(mmeta_t* chunk){
    if((uint64)chunk & (BLOCK_SIZE - 1)) return -1;
    return ((uint64)chunk - (uint64)start_address) >> BLOCK_SIZE_BIT_LEN;
}

int Buddy::remove_from_list(uchar level, mmeta_t* chunk){
    /* chk if level is valid */
    if(level >= lhp_size) return -4;
    /* chk if address is valid */
    if( !chunk || ((uint64)chunk & (BLOCK_SIZE - 1)) ) return -1;
    /* chk if starting block of chunk is set to free */ 
    size_t bn = get_block_num(chunk);
    if(blocks[bn] != FREE) return -2;
    /* chk if level of block is equal to given */
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

/* sz - size is size in blocks */
Buddy::Buddy(void* saddr, size_t sz){
    start_address = saddr;
    size = sz;
    /* --------MEMORY RESERVING-------- */
    /* last allocated address */
    uint64 x = (uint64)NoAlloc::getEndAddress();
    /* last buddy address */
    uint64 y = (uint64)saddr + (sz << BLOCK_SIZE_BIT_LEN);
    
    
    /* 
    *   Allocate diff between 
    *   last allocated address 
    *   and last buddy address 
    */
    void* ind = NoAlloc::mem_alloc(y - x);

    if(ind == nullptr) { /* TODO: panic */ }

    /* ------MEMORY META ALLOC------ */
    /* allocate list head pointers */
    /* allocate is_free boolean array */
    blocks = (bstatus*)NoAlloc::mem_alloc(size*sizeof(bstatus));
    if(!blocks) { kprintString("is_free null panic!\n");}
    /* set all is_free to 0 except first block */
    for(size_t i = 0; i < size; i++)
        blocks[i] = SUB_ALLOC;

    lhp_size = log2(size)+1;
    lhp = (mmeta_t**)NoAlloc::mem_alloc(lhp_size*sizeof(mmeta_t*));
    if(!lhp) { kprintString("lhp null panic!\n");}
    /* set all list head pointers to null */
    for(uchar i = 0; i < lhp_size; i++ )
        lhp[i] = nullptr;
    /* add just biggest element (whole memory) to last list */
    
    blocks[0] = FREE;
    int code = add_to_list(lhp_size-1, (mmeta_t*)start_address);
    if ( code < 0) {
        kprintString("addtolist panic: ");
        kprintInt(code, 16);
        kprintString("\n");
    }
    
    
    
}

mmeta_t* Buddy::split(mmeta_t* chunk){
    /* chk if address is valid */
    if( ((uint64)chunk & (BLOCK_SIZE - 1)) || chunk < start_address ) return nullptr;
    return (mmeta_t*)( (uint64)chunk + (BLOCK_SIZE << (chunk->level - 1)) ) ;
}

void Buddy::status_print(bool f){
    if(!buddy){
        kprintString("BUDDY NOT INITALIZED!!!");
        return;
    }
    kprintString("------BUDDY STATUS PRINT------\n");
    KCHECKPRINT(buddy);
    KCHECKPRINT(start_address);
    KCHECKPRINT(size);

    kprintString("\t------MEMORY META------\n");
    for(uchar i = 0; i < lhp_size; i++){
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
        for(size_t i = 0; i < size; i++){
            if(blocks[i] != bstatus::SUB_ALLOC){
                kprintString("\t"); print_be(i); kprintString("\n");
            }
        }
    }
    kprintString("\t----END MEMORY META----\n");

    kprintString("-------END BUDDY STATUS-------\n");

}

void* Buddy::mem_alloc(size_t sz){
    /* check if sz is pow of 2 */
    if(!osb(sz)) return nullptr;
    if(sz > size) return nullptr;
    /* get level of the size */
    uchar level = log2(sz);
    uchar i = level;
    mmeta_t* chunk;
    /* iterate through levels until we find not-empty list */
    for(; i < lhp_size; i++)
        if(lhp[i]) break;
    
    if(i == lhp_size) return nullptr;
    /* get chunk from list */
    chunk = get_from_list(i);
    /* split chunk until we get to given level */
    for(;i > level; i--){
        mmeta_t* t = split(chunk);
        /* set is_free of the second half */
        blocks[get_block_num(t)] = FREE;
        add_to_list(i-1, t);
        chunk->level--;
    }
    /* set allocate curr chunk */
    blocks[get_block_num(chunk)] = (bstatus)level;
    return chunk;
}


int Buddy::mem_free(void* addr){
    /* check validity of address given */
    if(( (uint64)addr & (BLOCK_SIZE - 1) )
    || addr < start_address) return -1;
    /* check if block is free */
    size_t bn = get_block_num((mmeta_t*)addr);
    /* check bn */
    if(bn >= size) return -3;
    /* status of block must be ALLOC */
    if(blocks[bn] < 0) return -2;
    /*let the merging begin */ 
    mmeta_t* chunk = (mmeta_t*)addr;
    chunk->level = blocks[bn];
    chunk->prev = chunk->next = nullptr;
    blocks[bn] = bstatus::FREE;
    while(chunk->level <= lhp_size){
        mmeta_t* maddr = merge_ip(chunk);
        if(maddr)
            chunk = maddr;
        else
            break;
    }
    add_to_list(chunk->level, chunk);
    return 0;
}

mmeta_t* Buddy::merge_ip(mmeta_t* chunk){
    size_t bn = get_block_num(chunk);
    size_t budd_bn;
    /* get buddy number */
    budd_bn = bn ^ (1ULL << chunk->level);

    if(blocks[budd_bn]!=FREE) return nullptr;
    /* get buddy address */
    mmeta_t* budd_addr = (mmeta_t*)((budd_bn << BLOCK_SIZE_BIT_LEN) + (size_t)start_address);
    if(budd_addr->level != chunk->level) return nullptr;
   
    /* remove buddy from list */
    int code = remove_from_list(budd_addr->level, budd_addr);
    
    if(code < 0) return nullptr;

    if(budd_bn < bn){
        swap(bn, budd_bn);
        swap(chunk, budd_addr);
    }
    blocks[budd_bn] = SUB_ALLOC;
    blocks[bn] = FREE;
    chunk->level = chunk->level + 1;

    return chunk;
}