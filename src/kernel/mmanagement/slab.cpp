#include"../../../h/kernel_lib.h"

// void kmem_init(void *space, int block_num);

kmem_cache_t *kmem_cache_create(const char *name, size_t size,
    void (*ctor)(void *),
    void (*dtor)(void *)){ // Allocate cache
    
    return new ObjectCache(name, size, ctor, dtor);

}
int kmem_cache_shrink(kmem_cache_t *cachep){ // Shrink cache
    return cachep->shrink();
}
void *kmem_cache_alloc(kmem_cache_t *cachep){// Allocate one object from cache
    return cachep->alloc_obj();
}
void kmem_cache_free(kmem_cache_t *cachep, void *objp){ // Deallocate one object from cache
    cachep->free_obj(objp);
}
void *kmalloc(size_t size){ // Alloacate one small memry buffer
    return SlabAllocator::getInstance().kmalloc(size);
}
void kfree(void *objp){ // Deallocate one small memory buffer
    SlabAllocator::getInstance().kfree(objp);
}
void kmem_cache_destroy(kmem_cache_t *cachep){// Deallocate cache
    delete cachep;
}
void kmem_cache_info(kmem_cache_t *cachep){ // Print cache info
    cachep->printInfo();
}
int kmem_cache_error(kmem_cache_t *cachep){ // Print error message
    return cachep->printError();
}
