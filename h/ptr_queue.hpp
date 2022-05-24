#ifndef _queue_h
#define _queue_h

#include"../h/memory_allocator.hpp"
#include "testing.hpp"
//#include"../h/testing.hpp"
template<typename T>
class PtrQueue{
       
    struct Node{
        #include"../h/kernel_operators.hpp"
        Node* next;
        T* info;
        Node(T* info = nullptr, Node* next = nullptr):next(next), info(info){}
    } *head, *tail;

    void brisi(){
        while(!isEmpty())
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    //PtrQueue():head(nullptr), tail(nullptr){}
    
    PtrQueue& insert(T* info){
        Node* node = new Node(info);
        tail = tail==nullptr?(head = node):(tail->next = node);
        return *this;
    }
   
    T* remove(){
        if(head!=nullptr){
            T* ret = head->info;
            Node* old = head;
            head = head==tail?(tail = nullptr):head->next;
            delete old;
            return ret;            
        }
        return nullptr;
    }

    bool isEmpty() {return !head;}

    void printQueue(){
        Node* t = head;
        while(t){
            print("->",' ');
            print((uint64)t->info, ' ', 0);
            t = t->next;            
        }
        print("");
    }
    
    ~PtrQueue(){
        brisi();
    }
};



#endif