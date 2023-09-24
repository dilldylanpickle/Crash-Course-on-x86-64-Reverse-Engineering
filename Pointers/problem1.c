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

/*
00000000004004e7 <main>:
  4004e7:       55                      push   rbp
  4004e8:       48 89 e5                mov    rbp,rsp
  4004eb:       48 83 ec 20             sub    rsp,0x20
  4004ef:       89 7d ec                mov    DWORD PTR [rbp-0x14],edi
  4004f2:       48 89 75 e0             mov    QWORD PTR [rbp-0x20],rsi
  4004f6:       c7 45 f4 45 00 00 00    mov    DWORD PTR [rbp-0xc],0x45
  4004fd:       48 8d 45 f4             lea    rax,[rbp-0xc]
  400501:       48 89 45 f8             mov    QWORD PTR [rbp-0x8],rax
  400505:       8b 45 f4                mov    eax,DWORD PTR [rbp-0xc]
  400508:       89 c6                   mov    esi,eax
  40050a:       48 8d 3d e7 00 00 00    lea    rdi,[rip+0xe7]             # 4005f8 <_IO_stdin_used+0x8>
  400511:       b8 00 00 00 00          mov    eax,0x0
  400516:       e8 d5 fe ff ff          call   4003f0 <printf@plt>
  40051b:       48 8d 45 f4             lea    rax,[rbp-0xc]
  40051f:       48 89 c6                mov    rsi,rax
  400522:       48 8d 3d ef 00 00 00    lea    rdi,[rip+0xef]             # 400618 <_IO_stdin_used+0x28>
  400529:       b8 00 00 00 00          mov    eax,0x0
  40052e:       e8 bd fe ff ff          call   4003f0 <printf@plt>
  400533:       48 8b 45 f8             mov    rax,QWORD PTR [rbp-0x8]
  400537:       48 89 c6                mov    rsi,rax
  40053a:       48 8d 3d ff 00 00 00    lea    rdi,[rip+0xff]             # 400640 <_IO_stdin_used+0x50>
  400541:       b8 00 00 00 00          mov    eax,0x0
  400546:       e8 a5 fe ff ff          call   4003f0 <printf@plt>
  40054b:       48 8b 45 f8             mov    rax,QWORD PTR [rbp-0x8]
  40054f:       8b 00                   mov    eax,DWORD PTR [rax]
  400551:       89 c6                   mov    esi,eax
  400553:       48 8d 3d 06 01 00 00    lea    rdi,[rip+0x106]            # 400660 <_IO_stdin_used+0x70>
  40055a:       b8 00 00 00 00          mov    eax,0x0
  40055f:       e8 8c fe ff ff          call   4003f0 <printf@plt>
  400564:       b8 00 00 00 00          mov    eax,0x0
  400569:       c9                      leave
  40056a:       c3                      ret
  40056b:       0f 1f 44 00 00          nop    DWORD PTR [rax+rax*1+0x0]
*/