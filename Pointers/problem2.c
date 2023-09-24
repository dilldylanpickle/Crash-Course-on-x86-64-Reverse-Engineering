// Write a C program to read two numbers from user (as strings) and add them using pointers.
// gcc -fno-stack-protector -z execstack -no-pie -g -Wall problem2.c -o problem2

#define BUF_SIZE 64

#include <stdio.h>
#include <stdlib.h>

int func_add(int *ptr1, int *ptr2)
{
    return *ptr1 + *ptr2;
}

int main(int argc, char *argv[])
{
    char input1[BUF_SIZE];
    char input2[BUF_SIZE];
    int num1, num2, total;
    int *ptr1, *ptr2;

    printf("Enter the first addend:  ");
    fgets(input1, sizeof(input1), stdin);
    printf("Enter the second addend:  ");
    fgets(input2, sizeof(input2), stdin);

    num1 = atoi(input1);
    num2 = atoi(input2);

    ptr1 = &num1;
    ptr2 = &num2;

    total = func_add(ptr1, ptr2);

    printf("%d + %d = %d\n", *ptr1, *ptr2, total);

    return 0;
}