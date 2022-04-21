#include"../h/Testing.h"

int print(ull unum, char end){
    char buffer[25];
    int i = 0;
    while(unum > 0){
        buffer[i++] = '0' + unum%10;
        unum/=10;
    }
    for(int j = i-1; j >= 0; j--)
        __putc(buffer[j]);
    __putc(end);
    return 0;
}

int print(const char* str, char end){
    for(int i = 0; str[i]; i++)
        __putc(str[i]);
    __putc(end);
    return 0;
}

void test1(){
    ull megabytes = ((ull)HEAP_END_ADDR - (ull)HEAP_START_ADDR)/MEM_BLOCK_SIZE;
    ull t;
    print(megabytes);
    print((ull)HEAP_START_ADDR);
    print((ull)HEAP_END_ADDR);
    print(0ULL);
    asm volatile("mv %0, sp" : "=r" (t));
    print(t);
}

void* allocTest(MemoryAllocator& allocator, size_t size){
    print("\nAlokacija", ' ');
    print((ull)size, ' ');
    print("blokova");
    char* newblc = (char*)allocator.mem_alloc(size);
    allocator.print_list();  
    return newblc;
}

void freeTest(MemoryAllocator& allocator, void* adr){
    print("\nDealogkacija");
    if(allocator.mem_free(adr) < 0)
        allocator.print_list();
    else
        print("Greska Pri Dealokaciji");
}

void memTest(){
    print("sizeof(FreeSegment): ", ' ');
    print((ull)sizeof(FreeSegment));
    MemoryAllocator& allocator = MemoryAllocator::getInstance();
    print("\nInicijalizacija alokatora");
    allocator.print_list();
    
    char* newblc = (char*)allocTest(allocator, 2);
    
    char* bytes[5];
    for(int i = 0; i < 5; i++)
        bytes[i] = (char*)allocTest(allocator, 1);

    freeTest(allocator, bytes[3]);

    freeTest(allocator, newblc);
    
    allocTest(allocator, 1);

    allocTest(allocator, 1);
}