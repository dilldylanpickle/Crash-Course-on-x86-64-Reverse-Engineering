// gcc -fno-stack-protector -z execstack -no-pie -g -Wall single-branch-condition.c -o single-branch-condition

#include <stdio.h>

int main(int argc, char *argv[])
{
    int i = 69;
    
    if (i == 69) {
        printf("The integer is %d!\n", i);
    }

    return 0;
}