/* 
*   THE ALLOCATION FOR THE KERNEL CLASSES 
*   it is easier to keep this lines in the file and just include
*   them in kernel structures
*/

void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
void* operator new[](size_t sz){ return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1); }
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
void operator delete[](void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}

