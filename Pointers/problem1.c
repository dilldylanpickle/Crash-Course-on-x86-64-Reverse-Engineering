// Write a C program to create, initialize and demonstrate the use of pointers.
// gcc -fno-stack-protector -z execstack -no-pie -g -Wall problem1.c -o problem1

#include <stdio.h>

int main(int argc, char *argv[])
{
    int i = 69;
    int *ptr = &i;

    printf("The value of the integer is %d\n", i);
    printf("The address of the integer is %p\n", &i);
    printf("The value of the pointer is %p\n", ptr);
    printf("The dereference of the pointer is %d\n", *ptr);

    return 0;
}
