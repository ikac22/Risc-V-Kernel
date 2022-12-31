#ifndef PMT_H
#define PMT_H
#include"../lib/hw.h"

/*  ---------------NOTES--------------- 
*
*   - For kerenel to access user pages it 
*   is needed to set SUM bit in sstatus! 
*
*   - Frame address = frame_number[55..12] + page_offset[11..0]; 
*
*/


enum PMTEntryBits: uint64{
    clear = 0,
    valid = 1 << 0,
    read = 1 << 1,
    write = 1 << 2,
    execute = 1 << 3,
    user = 1 << 4,
    global = 1 << 5,
    accessed = 1 << 6,
    dirty = 1 << 7
/*  
*   reserved[9..8] 
*   frame_number[53..10] 
*   reserved[63..54] 
*/
    
}; 

class PMTEntry{
    uint64 val;
public:
    void clear();
    bool chk_flags(PMTEntryBits); 
    void set_flags(PMTEntryBits);
    void clear_flags(PMTEntryBits); 
    void* get_pa(); /* get phisical address */
    int set_pa(void*); /* set phisical address */
    void print();
};

class PMT{
public:
    static const size_t PMT_LEVEL_SIZE = 1 << 9,
    PAGE_SIZE = 1 << 12, VADDR_MASK[3], INVALID_MASK = -(1LL<<39);
    PMTEntry* get_entry(uchar level, void* vaddr);
    PMTEntry* get_entry(uint64 index);
    void clear();
    void print();
    static PMT* allocate_pmt();
    
private:
    PMTEntry entry [PMT_LEVEL_SIZE]; /* one level table of entries */
};


#endif