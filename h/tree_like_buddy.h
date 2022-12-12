#ifndef TREE_LIKE_BUDDY_H
#define TREE_LIKE_BUDDY_H
#include"../h/buddy.h"

class TreeLikeBuddy{
    enum class alloc_t: uchar{
        ALLOC,
        FREE
    };
    /* bit len of block sizee */
    static uchar BLOCK_SIZE_BIT_LEN;
    /* singleton */
    static TreeLikeBuddy* buddy; 
    /* starting address memory buddy allocator operates */
    void* start_address; 
    /* size of memory in blocks*/
    size_t size; 
    /* linked buffer */

    __NOALLOC_OPERATORS__

    /* memory meta tree-like buffer of free segments */
    alloc_t** mmeta;
    uint64* mmeta_s;
    uchar  mmeta_num;

    TreeLikeBuddy(void* saddr, size_t sz);

    /* align input to size of blocks */
    static uint64 blockAlign(uint64 input){
        return (input + BLOCK_SIZE - 1) & ( (~0ULL) << BLOCK_SIZE_BIT_LEN);
    }

    static void printAlloc(alloc_t a);
    
public:
    /* block is minimal allocation unit - must be pow 2*/
    static const size_t BLOCK_SIZE = 4096;
    /* 
    *   Initalization of Buddy Allocator: 
    *   Address and Size will be aligned to 4096
    */
    static int initalize(void*, size_t);
    static TreeLikeBuddy& getInstance();

    /* print status */
    void status_print();

    /* sz must be 2^n it represents the number of blocks */
    void* mem_alloc(size_t sz);
};

#endif