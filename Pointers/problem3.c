#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[])
{

    char str[] = "Reverse me!";
    char tmp[sizeof(str)];

    char *end = &str[strlen(str) - 1];
    char *start = tmp;

    while (end >= str) {
        *start++ = *end--;
    }

    *start = '\0';

    printf("%s\n", tmp);

    return 0;
}