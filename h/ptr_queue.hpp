#ifndef _queue_h
#define _queue_h

#include"../h/tcb.hpp"
//#include"../h/testing.hpp"

class TcbQueue{
       
   TCB *head, *tail;

    void brisi(){
        while(!isEmpty())
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    TcbQueue():head(nullptr), tail(nullptr){}
    
    bool exists(TCB* info) const;

    TcbQueue& insert(TCB* info);
   
    TCB* remove();

    TCB* top();

    bool isEmpty() { return !head; }

    void printQueue();
    
    void insertSorted(TCB* info, int(*cmp)(TCB*, TCB*));

    void insertFront(TCB* info);

    /*~TcbQueue(){
        brisi();
    }*/
};



#endif