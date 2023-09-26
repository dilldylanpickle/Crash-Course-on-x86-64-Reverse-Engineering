#include <stdio.h>

int main()
{
    int x = 69;
    int *ptr = &x;
    printf("The value at address %p is %d\n", &x, *ptr);

    return 0;

}