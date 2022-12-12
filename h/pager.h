#ifndef PAGER_H
#define PAGER_H
#include"../h/pmt.h"

class Pager{
    
    static Pager p;
    PMT* pmt;

public:
    int map(void* va, void* pa, PMTEntryBits);
    int map_kernel();
    int map_user();
};


#endif