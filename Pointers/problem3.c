// Write a C program that reverses a string using pointers and without using library functions
// gcc -fno-stack-protector -z execstack -no-pie -g -Wall problem3.c -o problem3

#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[])
{
    char *str = "Reverse this string!";
    int length = strlen(str);
    char rev[length + 1];

    char *end = str + length - 1;
    char *start = rev;

    while  (end >= str) {
        *start = *end;
        end--;
        start++;
    }

    *start = '\0';

    printf("%s\n", rev);

    return 0;
}

/*
0000000000400537 <main>:
  400537:       55                      push   rbp
  400538:       48 89 e5                mov    rbp,rsp
  40053b:       48 83 ec 60             sub    rsp,0x60
  40053f:       89 7d ac                mov    DWORD PTR [rbp-0x54],edi
  400542:       48 89 75 a0             mov    QWORD PTR [rbp-0x60],rsi
  400546:       48 b8 52 65 76 65 72    movabs rax,0x2065737265766552
  40054d:       73 65 20
  400550:       48 ba 74 68 69 73 20    movabs rdx,0x7274732073696874
  400557:       73 74 72
  40055a:       48 89 45 d0             mov    QWORD PTR [rbp-0x30],rax
  40055e:       48 89 55 d8             mov    QWORD PTR [rbp-0x28],rdx
  400562:       c7 45 e0 69 6e 67 21    mov    DWORD PTR [rbp-0x20],0x21676e69
  400569:       c6 45 e4 00             mov    BYTE PTR [rbp-0x1c],0x0
  40056d:       48 8d 45 d0             lea    rax,[rbp-0x30]
  400571:       48 89 c7                mov    rdi,rax
  400574:       e8 c7 fe ff ff          call   400440 <strlen@plt>
  400579:       48 8d 50 ff             lea    rdx,[rax-0x1]
  40057d:       48 8d 45 d0             lea    rax,[rbp-0x30]
  400581:       48 01 d0                add    rax,rdx
  400584:       48 89 45 f8             mov    QWORD PTR [rbp-0x8],rax
  400588:       48 8d 45 b0             lea    rax,[rbp-0x50]
  40058c:       48 89 45 f0             mov    QWORD PTR [rbp-0x10],rax
  400590:       eb 17                   jmp    4005a9 <main+0x72>
  400592:       48 8b 45 f8             mov    rax,QWORD PTR [rbp-0x8]
  400596:       0f b6 10                movzx  edx,BYTE PTR [rax]
  400599:       48 8b 45 f0             mov    rax,QWORD PTR [rbp-0x10]
  40059d:       88 10                   mov    BYTE PTR [rax],dl
  40059f:       48 83 6d f8 01          sub    QWORD PTR [rbp-0x8],0x1
  4005a4:       48 83 45 f0 01          add    QWORD PTR [rbp-0x10],0x1
  4005a9:       48 8d 45 d0             lea    rax,[rbp-0x30]
  4005ad:       48 39 45 f8             cmp    QWORD PTR [rbp-0x8],rax
  4005b1:       73 df                   jae    400592 <main+0x5b>
  4005b3:       48 8b 45 f0             mov    rax,QWORD PTR [rbp-0x10]
  4005b7:       c6 00 00                mov    BYTE PTR [rax],0x0
  4005ba:       48 8d 45 b0             lea    rax,[rbp-0x50]
  4005be:       48 89 c7                mov    rdi,rax
  4005c1:       e8 6a fe ff ff          call   400430 <puts@plt>
  4005c6:       b8 00 00 00 00          mov    eax,0x0
  4005cb:       c9                      leave
  4005cc:       c3                      ret
  4005cd:       0f 1f 00                nop    DWORD PTR [rax]
*/
