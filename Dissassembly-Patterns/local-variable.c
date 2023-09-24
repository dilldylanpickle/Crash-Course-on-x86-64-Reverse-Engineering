// gcc -fno-stack-protector -z execstack -no-pie -g -Wall local-variable.c -o local-variable

#include <stdio.h>

int main(int argc, char *argv[])
{
    char character[] = "\x41";

    printf("%s\n", character);

    return 0;
}

/*
00000000004004e7 <main>:
  4004e7:       55                      push   rbp
  4004e8:       48 89 e5                mov    rbp,rsp
  4004eb:       48 83 ec 20             sub    rsp,0x20
  4004ef:       89 7d ec                mov    DWORD PTR [rbp-0x14],edi
  4004f2:       48 89 75 e0             mov    QWORD PTR [rbp-0x20],rsi
  4004f6:       66 c7 45 fe 41 00       mov    WORD PTR [rbp-0x2],0x41
  4004fc:       48 8d 45 fe             lea    rax,[rbp-0x2]
  400500:       48 89 c7                mov    rdi,rax
  400503:       e8 e8 fe ff ff          call   4003f0 <puts@plt>
  400508:       b8 00 00 00 00          mov    eax,0x0
  40050d:       c9                      leave
  40050e:       c3                      ret
  40050f:       90                      nop
*/
