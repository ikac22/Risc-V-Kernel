#include"../../../h/kernel_lib.h"

const size_t PMT::VADDR_MASK[3] = { (size_t)( -(1LL<<12) ^ -(1LL<<21)), (size_t)( -(1LL<<21) ^ -(1LL<<30)), (size_t)( -(1LL<<30) ^ -(1LL<<39)) };

PMT* PMT::allocate_pmt(){
    PMT* ret = (PMT*)(Buddy::getInstance().mem_alloc(BUDDY_LEVEL(sizeof(PMT))));
    ret->clear();
    return ret;
}

void PMTEntry::print(){
    KVALCHECKPRINT(PA, (val >> 10) << 12);
    kprintString("bits: "); kprintInt((val & 511ULL), 2); kprintString("\n");
}

void PMTEntry::set_flags(PMTEntryBits peb){ val |= (uint64) peb; }

void PMTEntry::clear_flags(PMTEntryBits peb){ val &= ~((uint64) peb); }

void PMTEntry::clear(){ val = PMTEntryBits::clear; }

void* PMTEntry::get_pa(){
    uint64 mask = (~0ULL) << 10;
    return (void*)((val & mask) << 2);
}

int PMTEntry::set_pa(void* pa){
    uint64 mask = (~0ULL) << 12, 
    uipa = (uint64) pa; //uint phisical address
    
    if( (mask & uipa) != uipa )
        return -1; //exception
    
    mask = ~((~0ULL) << 10);
    val &= mask;
    val |= (uipa >> 2); 
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

PMTEntry* PMT::get_entry(uint64 index){
    return entry + index;

}


void PMT::clear(){
    for(uint64 i = 0; i < PMT_LEVEL_SIZE; i++)
        entry[i].clear();
}

void PMT::print(){
    for(uint64 i = 0; i < PMT_LEVEL_SIZE; i++){
        if(entry[i].chk_flags(PMTEntryBits::valid)){
            KPRINTARR(entry, i, entry[i].chk_flags(PMTEntryBits::valid));
            entry[i].print();
        }
    }
}