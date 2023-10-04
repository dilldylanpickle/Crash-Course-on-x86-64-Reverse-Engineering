# Crash Course on x86-64 Reverse Engineering

Learning reverse engineering is pretty hard in 2023 if you don't know where to start. I started learning C programming and x86-64 assembly in 2021. Over the years, I learned that going through a textbook isn't always the best way to learn things. A hands-on technical approach is the best way to learn reverse engineering. You will learn more compiling C code and disassembling it yourself.

Instead of watching YouTube videos on x86-64 architecture and C programming, try recreating an existing C standard library function like strcpy():

```c
void *strcpy(char *src, char *dst)
{
  while (*str != '\0') {
    *dst = *str;
    str++;
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
```

Then, disassemble the executable and get a feel for the assembly code:
```asm
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
```

Hopefully, you can get an idea of what you might be doing. If you currently doing exactly what Patrick Star is doing (GIF below), don't worry because these concepts will be learned overtime! Don't feel like you need to be able to write compilers before you are allowed to use tools like IDA or Ghidra. You will find yourself rotating between C and Assembly in terms of self learning! Feel free to jump around this repository if you already feel comfortable with C programming for example. It may help or you may end up buying a new computer :)

![Alt Text](https://github.com/dilldylanpickle/dilldylanpickle.github.io/raw/main/GIFs/we-have-tecnology.gif)

> P.S. don't memorize things but try to understand things :)

## Table of Contents
- [C-ing is Believing: Pointers Edition](#c-ing-is-believing-pointers-edition)
  - [Pointer Fundamental Concepts](#pointer-fundamental-concepts)
    - [Pointer Basics](#pointer-basics)
    - [The “&” address-of operator](#the--address-of-operator)
    - [The "*" dereference operator](#the--dereference-opeartor)
  - [Pointer Arithmetics](#pointer-arithmetics)
    - [Using pointers to increment/decrement](#using-pointers-to-incrementdecrement)
  - [Pointers and Functions](#pointers-and-functions)
    - [Pointers as function arguments (pass by reference)](#pointers-as-function-arguments-pass-by-reference)
    - [Function Pointers](#function-pointers)
  - [Pointers and Arrays](#pointers-and-arrays)
    - [Using pointers to access array elements](#using-pointers-to-access-array-elements)
  - [Pointers and Strings](#pointers-and-strings)
    - [Accessing characters using pointers](#accessing-characters-using-pointers)
      - [Coding in a world where #include <string.h> doesn't exist](#coding-in-a-world-where-include-stringh-doesnt-exist)
        - [Calculate the string length using pointers](#calculate-the-string-length-using-pointers)
        - [Copy a string using pointers](#copy-a-string-using-pointers)
        - [Compare two strings using pointers](#compare-two-strings-using-pointers)
        - [Combine two strings using pointers](#combine-two-strings-using-pointers)
        - [Reverse strings using pointers](#reverse-strings-using-pointers)
  - [Pointers and Structures](#pointers-and-structures)
    - [Using pointers to access struct members](#using-pointers-to-access-struct-members)
- [A Byte to Eat: The Delightful Data Dinner](#a-byte-to-eat-the-delightful-data)
  - [Data Representation](#data-representation)
    - [Bits, bytes, words, double words, and quad words](#bits-bytes-words-double-words-and-quad-words)
    - [Signed values, two's complement, and endianness](#signed-values-twos-complement-and-endianness)
  - [Number Systems](#number-systems)
    - [Decimal (Base 10)](#decimal-base-10)
    - [Binary (Base 2)](#binary-base-2)
    - [Hexadecimal (Base 16)](#hexadecimal-base-16)
  - [Representing ASCII characters](#representing-ascii-characters)
- [A Trip Down Memory Lane: Remembering the Memories](#a-trip-down-memory-lane-remembering-the-memories)
  - [The Stack](#the-stack)
    - [Push Instruction](#push-instruction)
    - [Pop Instruction](#pop-instruction)
    - [Stack Frames](#stack-frames)
      - [Function Prologue](#function-prologue)
        - [Stack Pointer (RSP)](#stack-pointer-rsp)
        - [Base Pointer (RBP)](#base-pointer-ebp)
        - [Allocating a Stack Frame](#allocating-a-stack-frame)
      - [Function Epilogue](#function-epilogue)
        - [Releasing a Stack Frame](#releasing-a-stack-frame)
        - [Popping Off The Stack](#popping-off-the-stack)

# C-ing is Believing: Pointers Edition
Are you considering job roles like software reverse engineer, embedded software developer, or vulnerability researcher? Well, chances are they'll expect you to be comfortable in C programming. Nobody wants to use extra memory, so let's talk about pointers!

![Alt Text](https://github.com/dilldylanpickle/dilldylanpickle.github.io/raw/main/GIFs/who-knew-this-guy.gif)

> I think this meme is a pretty good "reference" to pointers if I say so myself :)

---

### Pointer Fundamental Concepts
A `pointer` is a variable that holds the address of another variable. Pointers are significant they allow programmers to manipulate the data in the computer's memory.

Here is how you declare a pointer in C:
```c
int *ptr;
```

#### The “&” address-of operator
The `&` address-of operator is used to obtain the address of a variable.

Here is how you can return the memory address using the `&` operator:
```c
int number = 69; // nice :)
printf("The address of the value is stored at %p\n", &x);
```

***Terminal:***
```bash
dilldylanpickle@archlinux:~/Crash-Course-on-x86-64-Reverse-Engineering$ ./a.out
The address of the value is stored at 69
```

#### The "*" dereference operator
The `*` dereference operator is used to access the value at the address stored in the pointer variable.

Here is how you can retrieve a value using the `*` operator:
```c
int number = 69;
int *ptr = &number;  // Pointer to an integer
printf("The value at address %p is %d", &x, *ptr);
```

***Terminal:***
```bash
dilldylanpickle@archlinux:~/Crash-Course-on-x86-64-Reverse-Engineering$ ./a.out
The value at address 0x7fff4e71a8cc is 69
```

---

### Pointer Arithmetics
A pointer in C can basically hold an address right? Since an address is a numeric value, you can perform arithmetic operations on a pointer.

##### Using pointers to increment/decrement
One of the most common things you will see in programming is that annoying `i++` or `i--`. There is nothing like forgetting those at the end of a while loop lol.

Here is how you can increment/decrement values using pointers:
```c
int number = 69;
int *ptr = &number;

(*ptr)++;   // increment the value at the address the pointer is storing
printf("%d lame tbh...\n", number);

(*ptr)--;   // decrement the value at the address the pointer is storing
printf("%d nice!\n", number);
```

***Terminal:***
```bash
dilldylanpickle@archlinux:~/Crash-Course-on-x86-64-Reverse-Engineering$ ./a.out
70 lame tbh...
69 nice!
```

> Remember, `(*ptr)++` and `(*ptr)--` will actually dereference the pointer and increment/decrement the value. If you were to use `ptr++` and `ptr--`, that will increment/decrement the pointer itself (this will be useful later).

---

### Pointers and Functions
Remember how C allows us to manipulate the data in a computer's memory? Let me show you why pointers are crucial, especially when working with functions.

#### Pointers as function arguments (pass by reference)
When I say pass by reference, I'm basically saying  "Hey function! Please take the address of this value please?"

> The reason we use pointers is because it is far more efficient to pass a memory address to a function rather than making a complete copy of a buffer and moving it.

Here is an example of passing the address of a variable rather than a variable itself:
```c
int func_add(int *ptr1, int *ptr2)
{
    return *ptr1 + *ptr2;
}

int main(int argc, char *argv[])
{
    int num1 = 69, num2 = 420, sum;
    
    sum = func_add(&num1, &num2);   // we pass the address of num1 and num2

    printf("%d + %d = %d uh nice?\n", num1, num2, sum);

    return 0;
}
```

***Terminal:***
```bash
dilldylanpickle@archlinux:~/Crash-Course-on-x86-64-Reverse-Engineering$ ./a.out
69 + 420 = 489 uh nice?
```

#### Function Pointers
Wanna know something pretty cool? We can use pointers to execute functions!

Here is a pretty simple example:
```c
void helloworld()
{
    printf("Hello, World!\n");
}

int main(int argc, char *argv[])
{
    void (*printhello)() = helloworld;
    printhello();

    return 0;
}
```

***Terminal:***
```bash
dilldylanpickle@archlinux:~/Crash-Course-on-x86-64-Reverse-Engineering$ ./a.out
Hello, World!
```

---

#### Pointers and Arrays
You wanna know what's cooler than an array of integers? What about an array of pointers to integers!

Here is some based syntax of an array pointer:
```c
int *array[3];
```

You can even assign values to a pointer array!:
```c
int *array[2];
int number1 = 69, number2 = 420;

array[0] = &number1;
array[1] = &number2;

printf("Value at address %p is now %d\n", array[0], *(array[0]));
printf("Value at address %p is now %d\n", array[1], *(array[1]));
```

***Terminal:***
```bash
dilldylanpickle@archlinux:~/Crash-Course-on-x86-64-Reverse-Engineering$ ./a.out
Value at address 0x7ffdecc22e88 is now 69
Value at address 0x7ffdecc22e8c is now 420
```

##### Using pointers to access array elements
We know that each element in an array data structure holds an address right? Well, that means we can point to those addresses with pointers!

Here is how we can dereference array elements using pointers:
```c
int array[5] = {69, 420, 9, 10, 21};
int *ptr;

for (int i = 0; i < sizeof(array) / 4; i++) {
  printf("%d ", *(array + i));
}

printf("\n");
```

***Terminal:***
```bash
dilldylanpickle@archlinux:~/Crash-Course-on-x86-64-Reverse-Engineering$ ./a.out
69 420 9 10 21
```

---

### Pointers and Strings
In C programming, a string is represented as an array of characters terminated by a null character `\0`. Since these characters are stored at an address, you can use pointers to manipulate and access strings.

Here is how you can declare a string and initialize it using a pointer:
```c
char *str = "Hello, World!";
```

#### Accessing characters using pointers
You can access individual characters in a string using pointer arithmetics. Once you get the hang of arrays in C, you can transfer this knowledge to strings.

Here is how you can use a pointer to access characters in a string:
```c
char *str = "Hello, World!";
char *ptr = str;

while (*ptr != '\0') {
  printf("%c", *ptr);
  ptr++;
}

printf("\n");
```

***Terminal:***
```bash
dilldylanpickle@archlinux:~/Crash-Course-on-x86-64-Reverse-Engineering$ ./a.out
Hello, World!
```

#### Coding in a world where #include <string.h> doesn't exist
Let's pretend the `#include string.h` library does not exist. I bet we can use pointers to recreate string operations!

In this section, don't be doing this lol:
```c
#include <string.h>
...

int main(int argc, char *argv[])
{
  ...
```

##### Calculate the string length using pointers
Honestly, I think `strlen();` is overrated af. We can still calculate the length of a string using pointers :)

Here is how you can calculate the length of a string using pointers:
```c
char *str = "Find the length of this character array and I promise it will benice";
char *ptr = str;
int length = 0;
while (*ptr != '\0') {
    length++;
    ptr++;
}

printf("The length of the string is %d characters nice!", length);
```

***Terminal:***
```bash
dilldylanpickle@archlinux:~/Crash-Course-on-x86-64-Reverse-Engineering$ ./a.out
The length of the string is 69 characters nice!
```

##### Copy a string using pointers
Let's keep the `#include <string.h>` slander going on! Imagine using `strcpy;` in 2023, couldn't be me lol.

Here is how you can copy a string using pointers:
```c
char src[] = "Copy this string!";
char dest[sizeof(src)];

char *srcPtr = src;
char *destPtr = dest;

while (*srcPtr != '\0') {
  *destPtr = *srcPtr;
  srcPtr++;
  destPtr++;
}

printf("%s\n", dest);
```

***Terminal:***
```bash
dilldylanpickle@archlinux:~/Crash-Course-on-x86-64-Reverse-Engineering$ ./a.out
Copy this string!
```

##### Compare two strings using pointers
I've seen a lot of those `strcmp();` functions in those reverse engineering CTF challenges. I hardly use that evil function but let's recreate it.

Here is how you can compare two strings using pointers:
```c
char str1[] = "This is a string!";
char str2[] = "This is still a string!";

char *ptr1 = str1;
char *ptr2 = str2;

while (*ptr1 != '\0' && *ptr2 != '\0') {
    if (*ptr1 != *ptr2) {
        printf("These strings are not the same!\n");
        return 1;
    }
    ptr1++;
    ptr2++;
}
```

***Terminal:***
```bash
dilldylanpickle@archlinux:~/Crash-Course-on-x86-64-Reverse-Engineering$ ./a.out
These strings are not the same!
```

##### Combine two strings using pointers
Now, let's replace one of my least favorite functions called `strcat();`. I really hate this function so let's do string concatenation manually. Let's go ahead and use a custom function for calculating the length of the string!

Here is how you can combine two strings using pointers:
```c
int strlen(char *str)
{
    int length = 0;

    while (*str != '\0') {
        length++;
        str++;
    }

    return length;
}

int main(int argc, char *argv[])
{
    char str[256];
    char *str1 = "Concatenate ";
    char *str2 = "this string!";

    // We need to have our pointer point to the end of our string buffer!
    char *ptr = str + strlen(str);

    while (*str1 != '\0') {
        *ptr = *str1;
        ptr++;
        str1++;
    }

    while (*str2 != '\0') {
        *ptr = *str2;
        ptr++;
        str2++;
    }

    *ptr = '\0';

    printf("%s\n", str);

    return 0;
}
```

***Terminal:***
```bash
dilldylanpickle@archlinux:~/Crash-Course-on-x86-64-Reverse-Engineering$ ./a.out
Concatenate this string!
```

##### Reverse strings using pointers
Usually you would throw a string into a string reversing function right? Well, `string.h` doesn't exist so let's write our own reversing function!

Here is how you reverse a string using pointers:
```c
int strlen(char *str)
{
    int length = 0;

    while (*str != '\0') {
        length++;
        str++;
    }

    return length;
}

int main(int argc, char *argv[])
{
  char *str = "Reverse this string!";
  char rev[256];

  char *end = str + strlen(str) - 1;
  char *start = rev;

  while (end >= str) {
    *start = *end;
    end--;
    start++;
  }

  printf("%s\n", rev);

  return 0;
}
```

***Terminal:***
```bash
dilldylanpickle@archlinux:~/Crash-Course-on-x86-64-Reverse-Engineering$ ./a.out
!gnirts siht esreveR
```

---

### Pointers and Structures

I think it's an L that arrays in C can only contain similar data elements. I think struct data structures are pushin P because they can hold different data types.

Here is an example of pointing to a struct:
```c
struct cheeseburger
{
    char *name;
    int patties;
    int cheese;
};

int main() {

    struct cheeseburger burger;
    struct cheeseburger *ptr = &burger;
    
    printf("The size of the struct is %zu bytes\n", sizeof(burger));

    return 0;
}
```

***Terminal:***
```bash
dilldylanpickle@archlinux:~/Crash-Course-on-x86-64-Reverse-Engineering$ ./a.out
The size of the struct is 16 bytes
```

##### Using pointers to access struct members
We know that each member in an array data structure holds an address right? You can use the `->` operator to access a member of a structure through a pointer!

Here is an example of my inner conscious telling you I'm hungry::
```c
struct cheeseburger
{
    char *name;
    int patties;
    int cheese;
};

int main() {

    struct cheeseburger burger;
    struct cheeseburger *ptr = &burger;
    
    ptr->name = "Patty melt";
    ptr->patties = 2;
    ptr->cheese = 2;

    printf("Name of Whataburger burger: %s\n", ptr->name);
    printf("Number of beef patties: %d\n", ptr->patties);
    printf("Number of cheese slices: %d\n", ptr->cheese);

    return 0;
}
```

***Terminal:***
```bash
dilldylanpickle@archlinux:~/Crash-Course-on-x86-64-Reverse-Engineering$ ./a.out
Name of Whataburger burger: Patty melt
Number of beef patties: 2
Number of cheese slices: 2
```

---

# A Byte to Eat: The Delightful Data Dinner

Bytes are fun!

## Data Representation

Knowing how a computer can process data is very important in learning reverse engineering. Let's talk about some ways computers represent data!

### Bits, bytes, words, double words, and quad words 

One of the smallest ways a computer can process data is by using bits. A binary digit, also known as bit, can represent either a one or zero.

Bits:
```
0 or 1
```

Notice how we can only represent two unique values: 0 and 1.

If we have 2 bits, we can represent 4 unique values:
```
00 01 10 11
```

In total, you can represent 4 numbers in total: 0, 1, 2, and 3.
```
00 is the same as 0
01 is the same as 1
10 is the same as 2
11 is the same as 3
```

If we have 3 bits, we can represent 8 unique values:
```
000 001 010 011 100 101 110 111
```

In total, you can represent 8 numbers in total: 0, 1, 2, 3, 4, 5, 6, and 7.
```
000 is the same as 0
001 is the same as 1
010 is the same as 2
011 is the same as 3
100 is the same as 4
101 is the same as 5
110 is the same as 6
111 is the same as 7
```

Do you see a pattern here? We can calculate all the possible values by calculating powers of 2!

For example:
```
With 1 bit (2^1), you can represent 2 values: 0 and 1.
With 2 bits (2^2), you can represent 4 values: 00, 01, 10, and 11.
With 3 bits (2^3), you can represent 8 values: 000, 001, 010, 011, 100, 101, 110, and 111.
```

There is a much easier way of identifying a decimal representation just from looking at bits. You can represent each bit as a power of 2.

For example, let's say we have 6 bits:
```
6th bit   5th bit   4th bit   3rd bit   2nd bit   1st bit
      1         0         0         0         0         0
```

Another way you can examine this is by looking at each bit as a power of 2:
```
2^6   2^5   2^4   2^3   2^2   2^1
  1     0     0     0     0     0
```

Since we can see the 2^6 bit is 1, we know 100000 is the same thing as 64

Here is another example:
```
2^6   2^5   2^4   2^3   2^2   2^1
  1     0     0     1     0     0
```

We already know 2^6 is 64 so we just need to add the 2^3 value:
```
2^6   2^3
64  +   8 = 72
```

It's pretty cool when we group together multiple bits, we can represent more values! Is there a computer unit larger than a bit? Well, a byte is eight bits put together. This means we can represent over 256 different values! You can also think of 2^8.

Bytes:
```
  0    1    2    3    4    5    6    7
  8    9   10   11   12   13   14   15
                                   ...
240  241  242  243  244  245  246  247
248  249  250  251  252  253  254  255
```

The next memory measure unit is a word, which is two bytes put together! You can also think of 2^16.

Words:
```
0 to 65535
```

Two words put together gives us a double word! You can also think of 2^32.

Double Words:
```
0 to 4294967295
```

Since the x86-64 architecture is a 64-bit CPU, we can represent 2^64 unique values:
```
0 to 18,446,744,073,709,551,616
```

> This means a 64-bit system can represent over 18.4 quintillion unique values!

---

#### Signed values, two's complement, and endianness

We just covered how we can represent numbers using bits. The only problem is we didn't talk about one important thing. You're probably wondering how can we represent signed numbers, also known as negative numbers. To represent negative numbers, two's complement is used. Two's complement will mean the most significant bit, the leftmost bit, will be 1. 

Imagine a computer with 8-bit binary numbers, where each digit is a 'bit' (0 or 1). We know how to represent a positive number like 3.

```
0000 0011
```

We can represent negative 3 by doing the following calculations:

First, invert all the bits:
```
0000 0011  ->  1111 1100
```

Then, add 1:
```
1111 1100  +  0000 0001  =  1111 1101
```

So, -3 is represented as follows:
```
1111 1101
```

Two's complement makes it easier for computers to perform arithmetic operations,as subtraction becomes the same as addition. It's a clever way to represent both positive and negative numbers using only 0s and 1s.

---

### Number Systems

There are differen't ways to represent numbers in the context of computers. Let's talk about different ways we can represent unique values.

---

#### Decimal (Base 10):

Computer systems use various numbers systems to represent data. The one you are most familiar with is probably decimal. Base 10, also know as decimal numbers, means it uses ten digits to represent all numbers.

Decimal (Base 10):
```
0    5
1    6
2    7
3    8
4    9
```

---

#### Binary (Base 2):

The most unfamiliar number system would be binary. Base 2, also known as binary numbers, means it uses 2 digits to represent all numbers.

Binary (Base 2):
```
0 1
```

---

#### Hexadecimal (Base 16):

A more human-friendly representation of binary data would be pretty helpful right? Base 10, also known as hexadecimal numbers, means it uses 16 different symbols to represent all numbers.

Hexadecimal (Base 16):
```
0x0   0x8
0x1   0x9
0x2   0xA
0x3   0xB
0x4   0xC
0x5   0xD
0x6   0xE
0x7   0xF
```

> The `0x` prefix is used to indicate hexadecimal representation 

---

### Representing ASCII characters

---

# Assemblers Assemble: From the Function Prologue to the Epilogue

As programmers, we write code in high-level and mid-level languages such as C or C++. However, central processing units (CPUs) understand machine code.

Here is a very simplified representation on how source code becomes machine code:
```
  Source Code     Compilation                       Machine Code
  +---------+   +--------------+                  +--------------+
  |         |   |              |                  |              |
  |  High-  |   |   Compiler   |                  |   Machine    |
  |  Level  | → |   (C, C++,   | → Translation →  |    Code      |
  |  Code   |   |   etc.)      |                  |              |
  |         |   |              |                  |              |
  +---------+   +--------------+                  +--------------+
```

> For simplicity, steps like preprocessing and linking were not included but will be mentioned in the future :)

![Alt Text](https://github.com/dilldylanpickle/dilldylanpickle.github.io/raw/main/GIFs/team-spongebob.gif)

> The most powerful superhero team in all of fiction!

---

## Assembly Essentials

Assembly language is a low-level programming language that is more human-readable than machine code. This makes it so humans don't have to count 1s and 0s.

```
          Assembly Code                    Machine Code
  +-------------------------+       +------------------------+
  |                         |       |                        |
  |   MOV AX, 42            |       |   1011 1100 00101010   |
  |   ADD BX, AX            |  <->  |   0000 0000 00001000   |
  |   JMP 0x1000            |       |   1110 1010 00000001   |
  |                         |       |                        |
  +-------------------------+       +------------------------+

```

## Registers

## Instructions

---

# A Trip Down Memory Lane: Remembering the Memories
You wanna know what could be worse than a technical coding interview? A technical phone screen interview! In my experience, they gotta make sure you ain't capping on your resume. If you put "x86-64 assembly" or "C/C++" on your resume, be prepared to talk the talk before you walk the walk!

![Alt Text](https://github.com/dilldylanpickle/dilldylanpickle.github.io/raw/main/GIFs/phone-interview.gif)

> Things get real if the company uses a zoom link and your phone camera turns on LMAO

---

### The Stack

The stack is simply an area in RAM that stores function arguments, local variables, etc. The stack is a “Last in First Out” data structure. The stack grows down to the lower memory address.

---

#### Stack Frames

The stack is typically structured as a linear sequence of memory allocations known as stack frames. Each time a function is called, the stack will automatically allocate a new stack frame.

As the function executes, it will use the given stack frame to store and operate upon its local variables. Once the function returns, this memory will automatically get released back to the stack.

---

##### Function Prologue

The first few assembly instructions found at the start of any function are known as the function prologue.

```asm
push  rbp
mov   rbp, rsp
```

The function prologue is inserted by the compiler to 'allocate' a stack frame for the function body to use. When necessary, the prologue will also save any volatile caller state to the stack.

---

###### Stack Pointer (RSP)

The first instruction of the function prologue is a push. This is a special instruction used to save data to the top of the stack.

```asm
push  rbp
```

You can interpret the push instruction as two separation operations (push is an alias):

```asm
sub   rsp, 0x8           ; 1. allocate 8 bytes
mov   qword [rsp], rbp   ; 2. store rbp to stack
```

---

###### Base Pointer (EBP)

The x86 register rbp is dedicated to holding the base pointer of the current stack frame. The base pointer is simply a bookend used in assembly to tell where the current stack frame ends.

Since the function prologue is used to create a new stack frame, it first must save the old base pointer held by rbp. The quickest way to do this is by pushing the value onto the stack.

```asm
push  rbp		; save old base pointer
```

By saving the value in rbp onto the stack, the prologue is now free to overwrite the register with a new base pointer.

```asm
mov   rbp, rsp		; set a new base pointer
```

---

###### Allocating a Stack Frame

Allocating memory on the stack is incredibly fast because it can be done in a single instruction. To allocate a new stack frame, the program simply subtracts from the stack pointer.

```asm
sub    rsp, 0x30	; 1. allocate 30 bytes on the stack
```

This is possible because the memory directly above the stack pointer (lower in memory) is guaranteed to be unallocated.

As the last instruction of the main() function prologue, stepping over this sub instruction will complete the allocation of its designated stack frame allocation process.

---

#### Function Epilogue

At the end of every function, the compiler will insert a few instructions which make up the function epilogue.

As an example, this is the epilogue from the main() function:
```asm
leave
ret
```

Opposite to the function prologue, the role of the epilogue is to release the current stack frame and return execution to the caller.

---

##### Releasing a Stack Frame

The leave instruction is used almost exclusively by function epilogues to release the current stack frame.

```asm
leave
```

This instruction is an alias for the following sequence:
```asm
mov   rsp, rbp
push  rbp
```

Remember, rbp points at the “bottom” of the current stack frame. By setting the stack pointer to the current base pointer, the first step will effectively collapse the stack frame into nothing.

---

##### Popping Off The Stack

Where the push instruction is normally used to add an element to the top of the stack, the pop instruction will remove the top most element, placing it into the given operand.

```asm
pop   rbp
```

This instruction is an alias for the following sequence:
```asm
mov   rbp, qword [rsp]
add   rsp, 0x8
```

In this case, the function epilogue is restoring the base pointer to its previous value as saved by the function prologue.

---

##### Return Instruction

At this point, the main() function has completed cleaning up its stack frame. The last step is to return program execution to the calling function using the ret instruction.

```asm
ret
```

This instruction is an alisas for the following sequence:
```asm
pop rip
```