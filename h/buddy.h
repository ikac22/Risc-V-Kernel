#ifndef buddy_h
#define buddy_h

#include"../h/noalloc_allocator.hpp"

struct mmeta_t{
    mmeta_t* next,*prev;
    uchar level;
};

class Buddy{
protected:
    /* block status */
    enum bstatus: short{
        FREE = -1,
        SUB_ALLOC = -2
    };
    /* bit len of block sizee */
    static uchar BLOCK_SIZE_BIT_LEN;
    /* singleton */
    static Buddy* buddy; 
    /* starting address memory buddy allocator operates */
    void* start_address; 
    /* size of memory in blocks*/
    size_t size; 
    /* array of list head pointers to 2^n chunk */
    mmeta_t** lhp;
    uchar lhp_size;
    /* is_free[i] <=> is chunk starting with block i free */
    bstatus* blocks;

    __NOALLOC_OPERATORS__

    /* buddy allocator constructor */
    Buddy(void* saddr, size_t sz);

    /* align input to size of blocks */
    static uint64 blockAlign(uint64 input){
        return (input + BLOCK_SIZE - 1) & ( (~0ULL) << BLOCK_SIZE_BIT_LEN);
    }
    /* add chunk to list of given level */
    int add_to_list(uchar level, mmeta_t* chunk);
    /* remove chunk from list of given level */
    int remove_from_list(uchar level, mmeta_t*);
    /* get block number */
    size_t get_block_num(mmeta_t*);
    /* get front elem of list */
    mmeta_t* get_from_list(uchar level);
    /* get second half address of given chunk */
    mmeta_t* split(mmeta_t*);
    /* print blocks entry */
    void print_be(size_t entry);
    /* 
    *   merge if possible if not return nullptr;
    *   assuming that the given chunk is not in list;
    */
    mmeta_t* merge_ip(mmeta_t*);
public:
    /* block is minimal allocation unit - must be pow 2*/
    static const size_t BLOCK_SIZE = 4096;
    /* 
    *   Initalization of Buddy Allocator: 
    *   Address and Size will be aligned to 4096
    */
    static int initalize(void*, size_t);
    static Buddy& getInstance();

    /* print status */
    void status_print(bool f = true);

    /* sz must be 2^n it represents the number of blocks */
    void* mem_alloc(size_t sz);
    int mem_free(void*);
};

/*
*   kmi - kernel memory initalize
* 
*   Initalize buddy allocator  
*   for the 12,5% of heap memory
*/
int kmi();

#endif