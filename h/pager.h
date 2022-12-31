#ifndef PAGER_H
#define PAGER_H
#include"../h/pmt.h"
#include "noalloc_allocator.hpp"

class Pager{
    
    static Pager* p;
    PMT* pmt;
    Pager();

    __NOALLOC_OPERATORS__
public:
    static Pager& getInstance();
    int map(void* va, void* pa, PMTEntryBits);
    int map_kernel();
    int id_map(void* start, void* end, PMTEntryBits);
    int map_user();
    int start_paging();
    void print();
};


#endif