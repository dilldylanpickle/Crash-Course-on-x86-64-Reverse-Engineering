# Low-Level-Interview-Practice
A repo where I write completely random C code to practice

Example [https://github.com/dilldylanpickle/Low-Level-Interview-Practice/blob/main/Dissassembly-Patterns/two-way-condition.c](two-way-condition.c):
// gcc -fno-stack-protector -z execstack -no-pie -g -Wall two-way-condition.c -o two-way-condition

```c
#include <stdio.h>

int main(int argc, char *argv[])
{
    int i = 69;
    
    if (i != 69) {
        printf("The integer value is not %d!\n", i);
    } else {
        printf("The integer value is %d!\n", i);
    }

    return 0;
}

/*
00000000004004e7 <main>:

  ***** FUNCTION PROLOGUE:
  4004e7:       55                      push   rbp
  4004e8:       48 89 e5                mov    rbp,rsp

  ***** ALLOCATE 0x20 BYTES ON THE STACK:
  4004eb:       48 83 ec 20             sub    rsp,0x20

  ***** STORE FUNCTION PARAMETERS ON THE STACK
  4004ef:       89 7d ec                mov    DWORD PTR [rbp-0x14],edi
  4004f2:       48 89 75 e0             mov    QWORD PTR [rbp-0x20],rsi

  ***** SET LOCAL VARIABLE "i" TO "69":
  4004f6:       c7 45 fc 45 00 00 00    mov    DWORD PTR [rbp-0x4],0x45

  ***** CONDITIONAL TO SEE IF "i" IS NOT EQUAL TO "69":
  4004fd:       83 7d fc 45             cmp    DWORD PTR [rbp-0x4],0x45
  400501:       74 18                   je     40051b <main+0x34>

  ***** CONDITION TRUE (i != 69):
  400503:       8b 45 fc                mov    eax,DWORD PTR [rbp-0x4]
  400506:       89 c6                   mov    esi,eax
  400508:       48 8d 3d b5 00 00 00    lea    rdi,[rip+0xb5]        # 4005c4 <_IO_stdin_used+0x4>
  40050f:       b8 00 00 00 00          mov    eax,0x0

  ***** CALL PRINTF();
  400514:       e8 d7 fe ff ff          call   4003f0 <printf@plt>
  400519:       eb 16                   jmp    400531 <main+0x4a>

  *****  CONDITION FALSE (i == 69):
  40051b:       8b 45 fc                mov    eax,DWORD PTR [rbp-0x4]
  40051e:       89 c6                   mov    esi,eax
  400520:       48 8d 3d bb 00 00 00    lea    rdi,[rip+0xbb]        # 4005e2 <_IO_stdin_used+0x22>
  400527:       b8 00 00 00 00          mov    eax,0x0

  ***** CALL PRINTF();
  40052c:       e8 bf fe ff ff          call   4003f0 <printf@plt>

  ***** RETURN 0; FOR MAIN FUNCTION:
  400531:       b8 00 00 00 00          mov    eax,0x0

  ***** FUNCTION EPILOGUE:
  400536:       c9                      leave
  400537:       c3                      ret

  ***** NO-OPERATION (probably for alignment):
  400538:       0f 1f 84 00 00 00 00    nop    DWORD PTR [rax+rax*1+0x0]
  40053f:       00
  */
```
