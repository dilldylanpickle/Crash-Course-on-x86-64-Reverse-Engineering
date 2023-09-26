// Write a C program that uses a struct pointer
// gcc -fno-stack-protector -z execstack -no-pie -g -Wall problem6.c -o problem6

#include <stdio.h>

struct cheeseburger
{
    int cheese;
    int patties;
};

int main(int argc, char *argv[])
{
    struct cheeseburger burger;
    burger.cheese = 69;
    burger.patties = 420;

    struct cheeseburger *ptr = &burger;

    printf("Number of cheese slices: %d\n", ptr->cheese);
    printf("Number of beef patties: %d\n", ptr->patties);

    return 0;
}

/*
00000000004004e7 <main>:
  4004e7:       55                      push   rbp
  4004e8:       48 89 e5                mov    rbp,rsp
  4004eb:       48 83 ec 20             sub    rsp,0x20
  4004ef:       89 7d ec                mov    DWORD PTR [rbp-0x14],edi
  4004f2:       48 89 75 e0             mov    QWORD PTR [rbp-0x20],rsi
  4004f6:       c7 45 f0 45 00 00 00    mov    DWORD PTR [rbp-0x10],0x45
  4004fd:       c7 45 f4 a4 01 00 00    mov    DWORD PTR [rbp-0xc],0x1a4
  400504:       48 8d 45 f0             lea    rax,[rbp-0x10]
  400508:       48 89 45 f8             mov    QWORD PTR [rbp-0x8],rax
  40050c:       48 8b 45 f8             mov    rax,QWORD PTR [rbp-0x8]
  400510:       8b 00                   mov    eax,DWORD PTR [rax]
  400512:       89 c6                   mov    esi,eax
  400514:       48 8d 3d b9 00 00 00    lea    rdi,[rip+0xb9]        # 4005d4 <_IO_stdin_used+0x4>
  40051b:       b8 00 00 00 00          mov    eax,0x0
  400520:       e8 cb fe ff ff          call   4003f0 <printf@plt>
  400525:       48 8b 45 f8             mov    rax,QWORD PTR [rbp-0x8]
  400529:       8b 40 04                mov    eax,DWORD PTR [rax+0x4]
  40052c:       89 c6                   mov    esi,eax
  40052e:       48 8d 3d bc 00 00 00    lea    rdi,[rip+0xbc]        # 4005f1 <_IO_stdin_used+0x21>
  400535:       b8 00 00 00 00          mov    eax,0x0
  40053a:       e8 b1 fe ff ff          call   4003f0 <printf@plt>
  40053f:       b8 00 00 00 00          mov    eax,0x0
  400544:       c9                      leave
  400545:       c3                      ret
  400546:       66 2e 0f 1f 84 00 00    nop    WORD PTR cs:[rax+rax*1+0x0]
  40054d:       00 00 00
  */
 