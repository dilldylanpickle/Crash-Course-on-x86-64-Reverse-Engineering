// gcc -fno-stack-protector -z execstack -no-pie -g -Wall problem7.c -o problem7

#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[])
{
    char str[256];
    char *str1 = "Concatenate ";
    char *str2 = "this string!";

    char *ptr = str + strlen(str);

    while (*str1 != '\0') {
        *ptr = *str1;
        ptr++;
        str1++;
    }

    while (*str2 != '\0') {
        *ptr = *str2;
        ptr++;
        str2++;
    }

    *ptr = '\0';

    printf("%s\n", str);

    return 0;
}