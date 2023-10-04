#include <stdio.h>
// Compile Executable Code: $ gcc -fno-stack-protector -z execstack -no-pie -g -Wall -m32 intro-code.c -o intro-code

void *strcpy(char *src, char *dst)
{
  while (*src != '\0') {
    *dst = *src;
    src++;
    dst++;
  }

  *dst = '\0';
}

int main(int argc, char *argv[])
{
  char *src = "Copy this string :)";
  char dst[32];

  strcpy(src, dst);
  printf("%s\n", dst);

  return 0;
}

// Obtain Disassembled Code: $ objdump -M intel -D intro-code | less

/*
08048446 <strcpy>:
 8048446:       55                      push   ebp
 8048447:       89 e5                   mov    ebp,esp
 8048449:       e8 80 00 00 00          call   80484ce <__x86.get_pc_thunk.ax>
 804844e:       05 b2 1b 00 00          add    eax,0x1bb2
 8048453:       eb 13                   jmp    8048468 <strcpy+0x22>
 8048455:       8b 45 08                mov    eax,DWORD PTR [ebp+0x8]
 8048458:       0f b6 10                movzx  edx,BYTE PTR [eax]
 804845b:       8b 45 0c                mov    eax,DWORD PTR [ebp+0xc]
 804845e:       88 10                   mov    BYTE PTR [eax],dl
 8048460:       83 45 08 01             add    DWORD PTR [ebp+0x8],0x1
 8048464:       83 45 0c 01             add    DWORD PTR [ebp+0xc],0x1
 8048468:       8b 45 08                mov    eax,DWORD PTR [ebp+0x8]
 804846b:       0f b6 00                movzx  eax,BYTE PTR [eax]
 804846e:       84 c0                   test   al,al
 8048470:       75 e3                   jne    8048455 <strcpy+0xf>
 8048472:       8b 45 0c                mov    eax,DWORD PTR [ebp+0xc]
 8048475:       c6 00 00                mov    BYTE PTR [eax],0x0
 8048478:       90                      nop
 8048479:       5d                      pop    ebp
 804847a:       c3                      ret

0804847b <main>:
 804847b:       8d 4c 24 04             lea    ecx,[esp+0x4]
 804847f:       83 e4 f0                and    esp,0xfffffff0
 8048482:       ff 71 fc                push   DWORD PTR [ecx-0x4]
 8048485:       55                      push   ebp
 8048486:       89 e5                   mov    ebp,esp
 8048488:       53                      push   ebx
 8048489:       51                      push   ecx
 804848a:       83 ec 30                sub    esp,0x30
 804848d:       e8 ee fe ff ff          call   8048380 <__x86.get_pc_thunk.bx>
 8048492:       81 c3 6e 1b 00 00       add    ebx,0x1b6e
 8048498:       8d 83 60 e5 ff ff       lea    eax,[ebx-0x1aa0]
 804849e:       89 45 f4                mov    DWORD PTR [ebp-0xc],eax
 80484a1:       8d 45 d4                lea    eax,[ebp-0x2c]
 80484a4:       50                      push   eax
 80484a5:       ff 75 f4                push   DWORD PTR [ebp-0xc]
 80484a8:       e8 99 ff ff ff          call   8048446 <strcpy>
 80484ad:       83 c4 08                add    esp,0x8
 80484b0:       83 ec 0c                sub    esp,0xc
 80484b3:       8d 45 d4                lea    eax,[ebp-0x2c]
 80484b6:       50                      push   eax
 80484b7:       e8 44 fe ff ff          call   8048300 <puts@plt>
 80484bc:       83 c4 10                add    esp,0x10
 80484bf:       b8 00 00 00 00          mov    eax,0x0
 80484c4:       8d 65 f8                lea    esp,[ebp-0x8]
 80484c7:       59                      pop    ecx
 80484c8:       5b                      pop    ebx
 80484c9:       5d                      pop    ebp
 80484ca:       8d 61 fc                lea    esp,[ecx-0x4]
 80484cd:       c3                      ret
*/