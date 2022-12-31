#ifndef buddy_h
#define buddy_h

#include"../h/noalloc_allocator.hpp"
#define BUDDY_LEVEL(num) \
(log2( (( (uint64) num - 1 ) >> log2(Buddy::BLOCK_SIZE)) + 1))

struct mmeta_t{
    mmeta_t* next,*prev;
    uchar level;
};

class Buddy{
private:
    static uchar BLOCK_SIZE_BIT_LEN;
    /* singleton */
    static Buddy* buddy; 
    /* level is order of two */
    void* start_address; 
    size_t max_level; 
    mmeta_t** lhp;
    uchar* fmap; 

    __NOALLOC_OPERATORS__
    
    Buddy(void* saddr, uchar level);
    
    /* remove copy operator and constructor */
    Buddy(const Buddy&) = delete;
    void operator=(const Buddy&) = delete;

    /* working with lists */
    mmeta_t* get_from_list(uchar level);
    int add_to_list(uchar level, mmeta_t* chunk);
    int remove_from_list(uchar level, mmeta_t*);
    
    /* working with blocks */
    mmeta_t* split(mmeta_t*);
    mmeta_t* merge_ip(mmeta_t*);
 
    /* working with free map */
    bool get_bit_val(size_t index);
    void set_bit(size_t index);
    void clr_bit(size_t index);

    /* utility */
    void* get_buddy_addr(uchar level, void*);
    static uint64 blockAlign(uint64 input){
        return (input + BLOCK_SIZE - 1) & ( (~0ULL) << BLOCK_SIZE_BIT_LEN);
    }

    /* testing */
    void print_be(size_t);
    
public:
    
    /* init and geting singleton instance */
    static const size_t BLOCK_SIZE = 4096;
    static int initalize(void*, uchar);
    static Buddy& getInstance();

    /* testing */
    void status_print(bool f = true);

    /* interface */
    void* mem_alloc(uchar level);
    int mem_free(void*, uchar level);
};
/* kernel memory init */
int kmi();

#endif