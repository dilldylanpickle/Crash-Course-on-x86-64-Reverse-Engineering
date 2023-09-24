// gcc -fno-stack-protector -z execstack -no-pie -g -Wall initalize-ptr.c -o initalize-ptr

#include <stdio.h>

int main(int argc, char *argv[])
{

    int i = 69;
    int *ptr;
    ptr = &i;

    printf("The data at the location %p is %d\n", ptr, *ptr);

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
  400505:       48 8b 45 f8             mov    rax,QWORD PTR [rbp-0x8]
  400509:       8b 10                   mov    edx,DWORD PTR [rax]
  40050b:       48 8b 45 f8             mov    rax,QWORD PTR [rbp-0x8]
  40050f:       48 89 c6                mov    rsi,rax
  400512:       48 8d 3d 9f 00 00 00    lea    rdi,[rip+0x9f]        # 4005b8 <_IO_stdin_used+0x8>
  400519:       b8 00 00 00 00          mov    eax,0x0
  40051e:       e8 cd fe ff ff          call   4003f0 <printf@plt>
  400523:       b8 00 00 00 00          mov    eax,0x0
  400528:       c9                      leave
  400529:       c3                      ret
  40052a:       66 0f 1f 44 00 00       nop    WORD PTR [rax+rax*1+0x0]
  */
 