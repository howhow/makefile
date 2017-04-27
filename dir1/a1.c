#include <stdio.h>
#include "a1.h"
#include "common.h"

unsigned int foo(unsigned int a, unsigned int b);

int main(void)
{
    printf("hello makefile\n");
    foo(5,6);
    return 0;
}

unsigned int foo(unsigned int a, unsigned int b)
{
    return (a==b?a:b);
}
