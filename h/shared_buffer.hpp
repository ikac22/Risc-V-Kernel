#ifndef __shared_buffer__hpp
#define __shared_buffer__hpp

#include"../h/ksemaphore.hpp"

template<typename T>
class SharedBuffer{
public:
    static const int BUFFER_SIZE = 1024;
private:
    T buffer[BUFFER_SIZE];
    KSemaphore mutex, itemAvailable, spaceAvailable; 
    int head, tail;

public: 
    int tmpLen;
    #include"../h/kernel_operators.hpp"
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

#endif