//
// Created by os on 5/18/22.
//

#include "printing.hpp"

uint64 lockPrint = 0;

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    LOCK();
    while (*string != '\0')
    {
        putc(*string);
        string++;
    }
    UNLOCK();
}

char* getString(char *buf, int max) {
    LOCK();
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
        cc = getc();
        if(cc < 1)
            break;
        c = cc;
        buf[i++] = c;
        if(c == '\n' || c == '\r')
            break;
    }
    buf[i] = '\0';

    UNLOCK();
    return buf;
}

int stringToInt(const char *s) {
    int n;

    n = 0;
    while ('0' <= *s && *s <= '9')
        n = n * 10 + *s++ - '0';
    return n;
}

char digits[] = "0123456789ABCDEF";

void printInt(uint64 xx, int base)
{
    LOCK();
    char buf[16];
    int i;

    i = 0;
    do{
        buf[i++] = digits[xx % base];
    }while((xx /= base) != 0);

    while(--i >= 0)
        putc(buf[i]);

    UNLOCK();
}