#include <stdio.h>

void *strcpy(char *str, char *dst)
{
  while (*str != '\0') {
    *dst = *str;
    str++;
    dst++;
  }

  *dst = '\0';
}

int main(int argc, char *argv[])
{
  char *str = "Copy this string :)";
  char dst[32];

  strcpy(str, dst);
  printf("%s", dst);

  return 0;
}
