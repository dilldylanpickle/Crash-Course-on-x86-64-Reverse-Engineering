// Write a C program to read two numbers from user (as strings) and add them using pointers.
// gcc -fno-stack-protector -z execstack -no-pie -g -Wall problem2.c -o problem2

#define BUF_SIZE 64

#include <stdio.h>
#include <stdlib.h>

int func_add(int *ptr1, int *ptr2)
{
    return *ptr1 + *ptr2;
}

int main(int argc, char *argv[])
{
    char input1[BUF_SIZE];
    char input2[BUF_SIZE];
    int num1, num2, total;
    int *ptr1, *ptr2;

    printf("Enter the first addend:  ");
    fgets(input1, sizeof(input1), stdin);
    printf("Enter the second addend:  ");
    fgets(input2, sizeof(input2), stdin);

    num1 = atoi(input1);
    num2 = atoi(input2);

    ptr1 = &num1;
    ptr2 = &num2;

    total = func_add(ptr1, ptr2);

    printf("%d + %d = %d\n", *ptr1, *ptr2, total);

    return 0;
}

/*
00000000004005b7 <func_add>:
  4005b7:       55                      push   rbp
  4005b8:       48 89 e5                mov    rbp,rsp
  4005bb:       48 89 7d f8             mov    QWORD PTR [rbp-0x8],rdi
  4005bf:       48 89 75 f0             mov    QWORD PTR [rbp-0x10],rsi
  4005c3:       48 8b 45 f8             mov    rax,QWORD PTR [rbp-0x8]
  4005c7:       8b 10                   mov    edx,DWORD PTR [rax]
  4005c9:       48 8b 45 f0             mov    rax,QWORD PTR [rbp-0x10]
  4005cd:       8b 00                   mov    eax,DWORD PTR [rax]
  4005cf:       01 d0                   add    eax,edx
  4005d1:       5d                      pop    rbp
  4005d2:       c3                      ret

00000000004005d3 <main>:
  4005d3:       55                      push   rbp
  4005d4:       48 89 e5                mov    rbp,rsp
  4005d7:       48 81 ec c0 00 00 00    sub    rsp,0xc0
  4005de:       89 bd 4c ff ff ff       mov    DWORD PTR [rbp-0xb4],edi
  4005e4:       48 89 b5 40 ff ff ff    mov    QWORD PTR [rbp-0xc0],rsi
  4005eb:       48 8d 3d 52 01 00 00    lea    rdi,[rip+0x152]                  # 400744 <_IO_stdin_used+0x4>
  4005f2:       b8 00 00 00 00          mov    eax,0x0
  4005f7:       e8 a4 fe ff ff          call   4004a0 <printf@plt>
  4005fc:       48 8b 15 3d 0a 20 00    mov    rdx,QWORD PTR [rip+0x200a3d]     # 601040 <stdin@@GLIBC_2.2.5>
  400603:       48 8d 45 a0             lea    rax,[rbp-0x60]
  400607:       be 40 00 00 00          mov    esi,0x40
  40060c:       48 89 c7                mov    rdi,rax
  40060f:       e8 9c fe ff ff          call   4004b0 <fgets@plt>
  400614:       48 8d 3d 43 01 00 00    lea    rdi,[rip+0x143]                  # 40075e <_IO_stdin_used+0x1e>
  40061b:       b8 00 00 00 00          mov    eax,0x0
  400620:       e8 7b fe ff ff          call   4004a0 <printf@plt>
  400625:       48 8b 15 14 0a 20 00    mov    rdx,QWORD PTR [rip+0x200a14]     # 601040 <stdin@@GLIBC_2.2.5>
  40062c:       48 8d 85 60 ff ff ff    lea    rax,[rbp-0xa0]
  400633:       be 40 00 00 00          mov    esi,0x40
  400638:       48 89 c7                mov    rdi,rax
  40063b:       e8 70 fe ff ff          call   4004b0 <fgets@plt>
  400640:       48 8d 45 a0             lea    rax,[rbp-0x60]
  400644:       48 89 c7                mov    rdi,rax
  400647:       e8 74 fe ff ff          call   4004c0 <atoi@plt>
  40064c:       89 85 5c ff ff ff       mov    DWORD PTR [rbp-0xa4],eax
  400652:       48 8d 85 60 ff ff ff    lea    rax,[rbp-0xa0]
  400659:       48 89 c7                mov    rdi,rax
  40065c:       e8 5f fe ff ff          call   4004c0 <atoi@plt>
  400661:       89 85 58 ff ff ff       mov    DWORD PTR [rbp-0xa8],eax
  400667:       48 8d 85 5c ff ff ff    lea    rax,[rbp-0xa4]
  40066e:       48 89 45 f8             mov    QWORD PTR [rbp-0x8],rax
  400672:       48 8d 85 58 ff ff ff    lea    rax,[rbp-0xa8]
  400679:       48 89 45 f0             mov    QWORD PTR [rbp-0x10],rax
  40067d:       48 8b 55 f0             mov    rdx,QWORD PTR [rbp-0x10]
  400681:       48 8b 45 f8             mov    rax,QWORD PTR [rbp-0x8]
  400685:       48 89 d6                mov    rsi,rdx
  400688:       48 89 c7                mov    rdi,rax
  40068b:       e8 27 ff ff ff          call   4005b7 <func_add>
  400690:       89 45 ec                mov    DWORD PTR [rbp-0x14],eax
  400693:       48 8b 45 f0             mov    rax,QWORD PTR [rbp-0x10]
  400697:       8b 10                   mov    edx,DWORD PTR [rax]
  400699:       48 8b 45 f8             mov    rax,QWORD PTR [rbp-0x8]
  40069d:       8b 00                   mov    eax,DWORD PTR [rax]
  40069f:       8b 4d ec                mov    ecx,DWORD PTR [rbp-0x14]
  4006a2:       89 c6                   mov    esi,eax
  4006a4:       48 8d 3d ce 00 00 00    lea    rdi,[rip+0xce]                   # 400779 <_IO_stdin_used+0x39>
  4006ab:       b8 00 00 00 00          mov    eax,0x0
  4006b0:       e8 eb fd ff ff          call   4004a0 <printf@plt>
  4006b5:       b8 00 00 00 00          mov    eax,0x0
  4006ba:       c9                      leave
  4006bb:       c3                      ret
  4006bc:       0f 1f 40 00             nop    DWORD PTR [rax+0x0]
*/