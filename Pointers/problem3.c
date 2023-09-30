// Write a C program that reverses a string using pointers and without using library functions
// gcc -fno-stack-protector -z execstack -no-pie -g -Wall problem3.c -o problem3

#include <stdio.h>

int strlen(char *str)
{
    int length = 0;

    while (*str != '\0') {
        length++;
        str++;
    }

    return length;
}

int main(int argc, char *argv[])
{
  char *str = "Reverse this string!";
  char rev[256];

  char *end = str + strlen(str) - 1;
  char *start = rev;

  while (end >= str) {
    *start = *end;
    end--;
    start++;
  }

  printf("%s\n", rev);

  return 0;
}