// Write a C program that uses pointer arithmetic to access array elements
// gcc -fno-stack-protector -z execstack -no-pie -g -Wall problem5.c -o problem5

#include <stdio.h>

int main(int argc, char *argv[])
{
    int array[] = {420, 69, 999, 21, 18};
    int *ptr = &array[0];

    for (int i = 0; i < sizeof(array) / 4; i++) {
        printf("%d ", *(ptr++));
    }

    printf("\n");

    return 0;
}

/*
0000000000400537 <main>:
  400537:       55                      push   rbp
  400538:       48 89 e5                mov    rbp,rsp
  40053b:       48 83 ec 30             sub    rsp,0x30
  40053f:       89 7d dc                mov    DWORD PTR [rbp-0x24],edi
  400542:       48 89 75 d0             mov    QWORD PTR [rbp-0x30],rsi
  400546:       c7 45 e0 a4 01 00 00    mov    DWORD PTR [rbp-0x20],0x1a4
  40054d:       c7 45 e4 45 00 00 00    mov    DWORD PTR [rbp-0x1c],0x45
  400554:       c7 45 e8 e7 03 00 00    mov    DWORD PTR [rbp-0x18],0x3e7
  40055b:       c7 45 ec 15 00 00 00    mov    DWORD PTR [rbp-0x14],0x15
  400562:       c7 45 f0 12 00 00 00    mov    DWORD PTR [rbp-0x10],0x12
  400569:       48 8d 45 e0             lea    rax,[rbp-0x20]
  40056d:       48 89 45 f8             mov    QWORD PTR [rbp-0x8],rax
  400571:       c7 45 f4 00 00 00 00    mov    DWORD PTR [rbp-0xc],0x0
  400578:       eb 25                   jmp    40059f <main+0x68>
  40057a:       48 8b 45 f8             mov    rax,QWORD PTR [rbp-0x8]
  40057e:       48 8d 50 04             lea    rdx,[rax+0x4]
  400582:       48 89 55 f8             mov    QWORD PTR [rbp-0x8],rdx
  400586:       8b 00                   mov    eax,DWORD PTR [rax]
  400588:       89 c6                   mov    esi,eax
  40058a:       48 8d 3d b3 00 00 00    lea    rdi,[rip+0xb3]        # 400644 <_IO_stdin_used+0x4>
  400591:       b8 00 00 00 00          mov    eax,0x0
  400596:       e8 a5 fe ff ff          call   400440 <printf@plt>
  40059b:       83 45 f4 01             add    DWORD PTR [rbp-0xc],0x1
  40059f:       8b 45 f4                mov    eax,DWORD PTR [rbp-0xc]
  4005a2:       83 f8 04                cmp    eax,0x4
  4005a5:       76 d3                   jbe    40057a <main+0x43>
  4005a7:       bf 0a 00 00 00          mov    edi,0xa
  4005ac:       e8 7f fe ff ff          call   400430 <putchar@plt>
  4005b1:       b8 00 00 00 00          mov    eax,0x0
  4005b6:       c9                      leave
  4005b7:       c3                      ret
  4005b8:       0f 1f 84 00 00 00 00    nop    DWORD PTR [rax+rax*1+0x0]
  4005bf:       00
*/