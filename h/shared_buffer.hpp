#ifndef __shared_buffer__hpp
#define __shared_buffer__hpp

#include"../h/ksemaphore.hpp"
#include "object_cache.h"
#include "slab_allocator.h"

template<typename T>
class SharedBuffer{
public:
    static const int BUFFER_SIZE = 1024;
private:
    T buffer[BUFFER_SIZE];
    KSemaphore mutex, itemAvailable, spaceAvailable; 
    int head, tail;
    static ObjectCache* cache;
public: 
    int tmpLen;
    //#include"../h/kernel_operators.hpp"
    
    __SLAB_ALLOCATION__(SharedBuffer, nullptr, nullptr);
    
    SharedBuffer():mutex(1), itemAvailable(0), 
    spaceAvailable(BUFFER_SIZE), head(0), tail(0), tmpLen(0){}

    void put(T c){
        spaceAvailable.wait();
        mutex.wait();

        tmpLen++;
        buffer[tail]=c;
        tail=(tail+1)%BUFFER_SIZE;
    
        itemAvailable.signal();
        mutex.signal();
    }

    T get(){
        itemAvailable.wait();
        mutex.wait();

        tmpLen--;
        T r = buffer[head];
        head = (head+1)%BUFFER_SIZE;

        spaceAvailable.signal();
        mutex.signal();
        return r;
    }

    
};
template<typename T>
ObjectCache* SharedBuffer<T>::cache = nullptr;

#endif