#ifndef ___kernel_funs___
#define ___kernel_funs___

#include"../lib/hw.h"

/* interrupt vector function that handles interruptions */
extern "C" void interruptvec(); 

/* user process that starts after initalizing kernel */
extern void userMain(); 

/* kernel wrapper function for starting userMain */
void userMainWrapper(void*); 

/* idle function in user mode that loops when scheduler is empty */
void idleFunction(void*); 

/* kernel memory alloc */
void* kmalloc(size_t size); 

/* kernel print string (UNFORMATED) (PRINTING WITHOUT NEWLINE) */
void kprintString(const char*); 
 
/* kernel print integer (base is number base, exapmle: base = 16 <=> hex) */
void kprintInt(uint64 num, int base = 10, bool sig=false); 

/* function to initalize whole kernel (it prints necessary information) - v1 (OS1)*/
int kernelInit(); 

/* function to initalize whole kernel (it prints necessary information) - v2 (OS2)*/
int newKernelInit();

/* closest greater number = n*4096 */
uint64 align4kb(uint64);

/* closest greater number that is 2^n */
uint64 closest2pow(uint64);

/* first set bit position */
char log2(uint64);

/* one or less set bits */
bool osb(uint64);

/* classic swap */
template<typename T>
void swap(T& a, T& b){
    T x = a;
    a = b;
    b = x;
}
#endif