#include"../../h/kernel_lib.h"

const size_t PMT::VADDR_MASK[3] = { (size_t)( -(1LL<<30) ^ -(1LL<<39)),
(size_t)( -(1LL<<21) ^ -(1LL<<30)),(size_t)( -(1LL<<12) ^ -(1LL<<20)) };

void PMTEntry::set_flags(PMTEntryBits peb){ val |= (uint64) peb; }

void PMTEntry::clear_flags(PMTEntryBits peb){ val &= ~((uint64) peb); }

void* PMTEntry::get_pa(){
    uint64 mask = (~0ULL) << 10;
    return (void*)((val & mask) << 2);
}

int PMTEntry::set_pa(void* fa){
    uint64 mask = (~0ULL) << 12, uifa = (uint64) fa;
    
    if( (mask & uifa) != uifa )
        return -1; //exception
    
    mask = ~((~0ULL) << 10);
    val &= mask;
    val |= (uifa >> 2); 
    return 0;
}

bool PMTEntry::chk_flags(PMTEntryBits peb){
    uint64 t = val & peb;
    return t == peb;
}

PMTEntry* PMT::get_entry(uchar level, void *vaddr){
    if(level >= 3) return nullptr;
    if(INVALID_MASK & (size_t)vaddr) return nullptr;
    
    return entry + 
    ( ((uint64)(vaddr) & VADDR_MASK[level]) >> (12 + 9*level) );
}

