#include "../lib/console.h"
#include"../lib/hw.h"

int main(){
    __putc('O');
    __putc('S');
    __putc('1');
    __putc('\n');
    __putc('\n');
    uint64 a = HEAP_END_ADDR - HEAP_START_ADDR;
    char buffer[64];
    int m = 0, t = a;
    while (t>0){
        t = t/10;
        m++;
    }
    if(m >= 64)
        return 0;

    for (int i = m-1; i >= 0; i--) {
        buffer[i] = a % 10;
        a /= 10;
    }
    for (int i = 0; i < m; i++)
        __putc(buffer[i]+'0');
    return 0;
}