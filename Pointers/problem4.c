// Write a C program to swap two integers using pointers
// gcc -fno-stack-protector -z execstack -no-pie -g -Wall problem4.c -o problem4

#include <stdio.h>

void func_swap(int *ptr1, int *ptr2)
{
    int tmp = *ptr1;
    *ptr1 = *ptr2;
    *ptr2 = tmp;
}

int main(int argc, char *argv[])
{

    int x = 69, y = 420;

    printf("Before calling func_swap(); int x = %d and int y = %d\n", x, y);
    func_swap(&x, &y);
    printf("After calling func_swap(); int x = %d, and int y = %d\n", x, y);

    return 0;
}

/*
00000000004004e7 <func_swap>:
  4004e7:       55                      push   rbp
  4004e8:       48 89 e5                mov    rbp,rsp
  4004eb:       48 89 7d e8             mov    QWORD PTR [rbp-0x18],rdi
  4004ef:       48 89 75 e0             mov    QWORD PTR [rbp-0x20],rsi
  4004f3:       48 8b 45 e8             mov    rax,QWORD PTR [rbp-0x18]
  4004f7:       8b 00                   mov    eax,DWORD PTR [rax]
  4004f9:       89 45 fc                mov    DWORD PTR [rbp-0x4],eax
  4004fc:       48 8b 45 e0             mov    rax,QWORD PTR [rbp-0x20]
  400500:       8b 10                   mov    edx,DWORD PTR [rax]
  400502:       48 8b 45 e8             mov    rax,QWORD PTR [rbp-0x18]
  400506:       89 10                   mov    DWORD PTR [rax],edx
  400508:       48 8b 45 e0             mov    rax,QWORD PTR [rbp-0x20]
  40050c:       8b 55 fc                mov    edx,DWORD PTR [rbp-0x4]
  40050f:       89 10                   mov    DWORD PTR [rax],edx
  400511:       90                      nop
  400512:       5d                      pop    rbp
  400513:       c3                      ret

0000000000400514 <main>:
  400514:       55                      push   rbp
  400515:       48 89 e5                mov    rbp,rsp
  400518:       48 83 ec 20             sub    rsp,0x20
  40051c:       89 7d ec                mov    DWORD PTR [rbp-0x14],edi
  40051f:       48 89 75 e0             mov    QWORD PTR [rbp-0x20],rsi
  400523:       c7 45 fc 45 00 00 00    mov    DWORD PTR [rbp-0x4],0x45
  40052a:       c7 45 f8 a4 01 00 00    mov    DWORD PTR [rbp-0x8],0x1a4
  400531:       8b 55 f8                mov    edx,DWORD PTR [rbp-0x8]
  400534:       8b 45 fc                mov    eax,DWORD PTR [rbp-0x4]
  400537:       89 c6                   mov    esi,eax
  400539:       48 8d 3d c8 00 00 00    lea    rdi,[rip+0xc8]        # 400608 <_IO_stdin_used+0x8>
  400540:       b8 00 00 00 00          mov    eax,0x0
  400545:       e8 a6 fe ff ff          call   4003f0 <printf@plt>
  40054a:       48 8d 55 f8             lea    rdx,[rbp-0x8]
  40054e:       48 8d 45 fc             lea    rax,[rbp-0x4]
  400552:       48 89 d6                mov    rsi,rdx
  400555:       48 89 c7                mov    rdi,rax
  400558:       e8 8a ff ff ff          call   4004e7 <func_swap>
  40055d:       8b 55 f8                mov    edx,DWORD PTR [rbp-0x8]
  400560:       8b 45 fc                mov    eax,DWORD PTR [rbp-0x4]
  400563:       89 c6                   mov    esi,eax
  400565:       48 8d 3d d4 00 00 00    lea    rdi,[rip+0xd4]        # 400640 <_IO_stdin_used+0x40>
  40056c:       b8 00 00 00 00          mov    eax,0x0
  400571:       e8 7a fe ff ff          call   4003f0 <printf@plt>
  400576:       b8 00 00 00 00          mov    eax,0x0
  40057b:       c9                      leave
  40057c:       c3                      ret
  40057d:       0f 1f 00                nop    DWORD PTR [rax]
*/
