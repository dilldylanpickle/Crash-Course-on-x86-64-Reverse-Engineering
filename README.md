# Crash Course on x86-64 Reverse Engineering

Learning reverse engineering is pretty hard in 2023 if you don't know where to start. When I first attended college, I wanted to produce music for a living. Two years in my college career, I started learning C programming and x86-64 assembly in 2021. These concepts looked like egyptian hieroglyphs at first lol.  Over the years, I learned that going through a textbook isn't always the best way to learn things. A hands-on technical approach is the best way to learn reverse engineering. You will learn more compiling C code and disassembling it yourself.

Instead of watching YouTube videos on x86-64 architecture and C programming, try recreating an existing C standard library function like strcpy():

```c
#include <stdio.h>

void *my_strcpy(char *src, char *dst)
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

  my_strcpy(src, dst);
  printf("%s\n", dst);

  return 0;
}
```

Then, disassemble the executable and get a feel for the assembly code:
```asm
my_strcpy:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        jmp     .L2
.L3:
        mov     rax, QWORD PTR [rbp-8]
        movzx   edx, BYTE PTR [rax]
        mov     rax, QWORD PTR [rbp-16]
        mov     BYTE PTR [rax], dl
        add     QWORD PTR [rbp-8], 1
        add     QWORD PTR [rbp-16], 1
.L2:
        mov     rax, QWORD PTR [rbp-8]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        jne     .L3
        mov     rax, QWORD PTR [rbp-16]
        mov     BYTE PTR [rax], 0
        nop
        pop     rbp
        ret
.LC0:
        .string "Copy this string :)"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     DWORD PTR [rbp-52], edi
        mov     QWORD PTR [rbp-64], rsi
        mov     QWORD PTR [rbp-8], OFFSET FLAT:.LC0
        lea     rdx, [rbp-48]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    my_strcpy
        lea     rax, [rbp-48]
        mov     rdi, rax
        call    puts
        mov     eax, 0
        leave
        ret
```

> Disassembled using [godbolt.org](https://godbolt.org/) for better readability :)

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
  - [Pointers and linked list](#pointers-and-linked-list)
    - [Creating and traversing a linked list using pointers](#creating-and-traversing-a-linked-list-using-pointers)
    - [Inserting an element using pointers](#inserting-an-element-using-pointers)
    - [Deleting an element using pointers](#deleting-an-element-using-pointers)
  - [Pointers and Dynamic Memory Allocation]
    - [malloc()]
    - [free()]
- [A Byte to Eat: The Delightful Data Dinner](#a-byte-to-eat-the-delightful-data)
  - [Data Representation](#data-representation)
    - [Bits, bytes, words, double words, and quad words](#bits-bytes-words-double-words-and-quad-words)
    - [Signed values, two's complement, and endianness](#signed-values-twos-complement-and-endianness)
  - [Number Systems](#number-systems)
    - [Decimal (Base 10)](#decimal-base-10)
    - [Binary (Base 2)](#binary-base-2)
    - [Hexadecimal (Base 16)](#hexadecimal-base-16)
  - [Representing ASCII characters](#representing-ascii-characters)
- [Assemblers Assemble: From the Function Prologue to the Epilogue](#assemblers-assemble-from-the-function-prologue-to-the-epilogue)
  - [Assembly Essentials](#assembly-essentials)
    - [Registers](#registers)
        - [General purpose registers](#general-purpose-registers)
    - [Instructions](#instructions)
      - [Data movement](#data-movement)
        - [mov instruction](#mov-instruction)
        - [lea instruction](#lea-instruction)
        - [xchg instruction](#xchg-instruction)
      - [Arithmetic operations](#arithmetic-operations)
        - [add instruction](#add-instruction)
        - [sub instruction](#sub-instruction)
        - [mul and imul instruction](#mul-and-imul-instruction)
        - [div and idiv instruction](#div-and-idiv-instruction)
        - [inc and dec instruction](#inc-and-dec-instruction)
      - [Bitwise operations](#bitwise-operations)
        - [and instruction](#and-instruction)
        - [or instruction](#or-instruction)
        - [xor instruction](#xor-instruction)
        - [not instruction](#not-instruction)
      -  [Control flow and branching](#control-flow-and-branching)
          - [cmp instruction](#cmp-instruction)
        - [Unconditional jumps](#unconditional-jumps)
          - [jmp instruction](#jmp-instruction)
        - [Conditional jumps](#conditional-jumps)
          - [je instruction](#je-instruction)
          - [jne instruction](#jne-instruction)
          - [jl instruction](#jl-instruction)
          - [jg instruction](#jg-instruction)
          - [jno instruction](#jno-instruction)
      - [Loops]
        - [loop instruction]
        - [rep instruction]
  - [The Stack](#the-stack)
    - [Push instruction](#push-instruction)
    - [Pop instruction](#pop-instruction)
    - [Stack frames](#stack-frames)
      - [Function prologue](#function-prologue)
        - [Stack pointer (RSP)](#stack-pointer-rsp)
        - [Base pointer (RBP)](#base-pointer-ebp)
        - [Allocating a stack frame](#allocating-a-stack-frame)
      - [Function epilogue](#function-epilogue)
        - [Releasing a stack frame](#releasing-a-stack-frame)
        - [Popping off the stack](#popping-off-the-stack)
        - [Return Instruction](#return-instruction)
  - [Calling Conventions]
    - [Understanding caller vs. callee]
      - [Caller responsibilities]
      - [Callee responsibilities]
    - [Parameter passing]
      - [Stack-based parameter passing]
      - [Register-based parameter passing]
    - [Return values]
      - [Using registers for return values]
      - [Memory location returns]
    - [Preserved registers (caller-saved vs. callee-saved)]
      - [Caller-saved registers]
      - [Callee-saved registers]
    - [Common calling conventions]
      - [Linux system V application binary interface]
      - [Microsoft x64 calling conventions]
      - [Stdcall, cdecl, and fastcalls (32-bit conventions)]
    - [Stack cleanup]
      - [Caller clears the stack]
      - [Callee clears the stack]
- [A Simple Introduction to Reversing: CTRL+Z won't work in the real world](#a-simple-introduction-to-reversing-ctrlz-wont-work-in-the-real-world)
  - [C to x86-64 Assembly](#c-to-x86-64-assembly)
    - [Main Function](#main-function)
      - [int argc, char *argv[]](#int-argc-char-argv)
    - [Integers, arithmetic operations, and bitwise operations](#integers-arithmetic-operations-and-bitwise-operations)
      - [Addition, subtraction, multiplication, division](#addition-subtraction-multiplication-division-and-modulus)
      - [And, or, xor, not, bit shifts](#and-instruction)
    - [Pointers](#pointers)
      - [Pointer addressing and dereferencing](#pointer-addressing-and-dereferencing)
    - [Strings](#strings)
      - [String initialization](#string-initialization)
      - [Character pointers and string literals](#character-pointers-and-string-literals)
    - [Control flow](#control-flow)
      - [Single and two-way branching](#single-and-two-way-branching)
        - [If statements](#if-statements)
        - [If-else statements](#if-else-statements)
      - [Loops](#loops)
        - [While](#while)
        - [For](#for)
        - [Do-while](#do-while)
      - [Function calls](#function-calls)
        - [Recursion Patterns](#recursion-patterns)
    - [Data Structures](#data-structures)
      - [Arrays](#arrays)
        - [Array initialization, indexing, and iterations](#array-initialization-indexing-and-iterations)
      - [Structs]
        - [Memory layout, access patterns, nested structs]
      - [Union]
        - [Memory overlap and access patterns]
    - [Memory Management]
      - [Stack operations]
        - [Local Variables, allocations, and deallocations]
      - [Heap operations]
        - [Dynamic memory allocation with malloc/free]
- [Trust the Process: Drop the Virtual Addy]
  - [Process Memory]
    - [Virtual Addresses]
  - [Address Space Layout of Process]
  - [Memory Layout of a C Program]
    - [info proc mappings]

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

### Pointers and linked list

If arrays are the humble apartments of data storage, linked lists are the luxury condos!

Imagine you're in a train. Each compartment of the train is a `node`. Every compartment has two main parts: a seat where a passenger sits (`data`) and a door that leads to the next compartment (`next`).

In a linked list:

* Seat/Data: This is where the passenger (or value) resides.
* Door/Next: This is your way to move to the next compartment or node. If there's no door, it means you're at the end of the train (NULL).

A linked list contains a node which is basically a struct:
```c
struct Node {
    int data;
    struct Node* next;
};
```

---

#### Creating and traversing a linked list using pointers

To traverse a linked list, you'd typically use a pointer and walk from one node to the next until you hit a NULL:

```c
void traverseList(struct Node* node) {
    while (node != NULL) {
        printf("%d -> ", node->data);
        node = node->next;
    }
    printf("NULL\n");
}
```

---

#### Inserting an element using pointers

Want to insert a new element? No need to shift like in arrays! Just play with the pointers!

```c
void insertAtBeginning(struct Node** head, int newData) {
    struct Node* newNode = (struct Node*) malloc(sizeof(struct Node));
    
    newNode->data = newData;
    newNode->next = *head;
    
    *head = newNode;
}
```

---

#### Deleting an element using pointers

Deleting an element is all about redirecting the pointers!

```c
void deleteNode(struct Node** head, int key) {
    struct Node* temp = *head, *prev;

    if (temp != NULL && temp->data == key) {
        *head = temp->next;
        free(temp);
        return;
    }

    while (temp != NULL && temp->data != key) {
        prev = temp;
        temp = temp->next;
    }

    if (temp == NULL) return;

    prev->next = temp->next;
    free(temp);
}
```

> Remember, linked lists are dynamic, so it's important to free up memory when you remove an element! We will talk about dynamic memory allocation in a second!

---

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
Assembly is made up of many, individually simple statements called instructions. 

Here is an example of an instruction:
```asm
mov   rax, 0x69
```

This means the value `0x69` gets stored into the register `rax`. We will talk more about registers in a "bit".

> No pun intended :)

We can split this instruction into component parts:
```asm
Opcode:       mov
Destination:  rax
Source:       0x69
```

We read this instruction from left to right because the source operand always comes first. This crash course will follow the intel syntax because AT&T syntax is very ugly and shouldn't exist.

---

## Registers

A register is a small storage area within the processor that is able to store data. In the context of assembly language, they often serve a similar purpose as variables in the C language.

Registers in the x86-64 architecture are 64 bits “wide”, but can be accessed in several different sizes with various aliases. 

```asm
$rax - References full 64 bit register or 8 bytes
$eax - References lower 32 bits of $rax or 4 bytes
$ax - References lower 16 bits of $rax or 2 bytes
$ah - References higher 8 bits of $ax or 1 byte
$al - References lower 8 bits of $ax or 1 byte
```

---

### General purpose registers

A general purpose register is used to store temporary data within the processor.

General purpose registers in x86_64 are addressed as follows, using `rax` as an example:

```asm
$rax
0xdeadbeefdeadbeef

$eax
0xdeadbeef

$ax
0xdead

$ah
0xde

$al
0xad

```

> You can reference the higher 8-bit register with ah, bh, ch, etc. Also, you can reference the 8-bit registers with r8, r9, r13, etc.

---

## Instructions

An instruction represents a single operation for the CPU to perform. The main types of instructions we will cover are data movement, arithmetic, and control flow instructions.

---

### Data Movement

In the x86-64 assembly language, data movement instructions are used to transfer data between registers and memory.

Some of the common instructions for data movement include the following:
```asm
mov
lea
xchg
```

---

#### mov instruction

The `mov` instruction copies the value of its second argument into the first argument.

Here the operation mov is moving the “immediate” 0xdeadbeef into the register rax:
```asm
mov rax, 0xdeadbeef
```

> What does immediate value mean? The instant value so no dereference required :)

Here the operation mov is moving the data at the address of [0xdeadbeef + rbx*4] into the register rax:
```asm
mov rax, [0xdeadbeef + rbx*4]
```

> When brackets are used, you can think of it as the dereference operator in C.

---

### lea instruction

The `lea`  instruction, also know as load effective address, is used to put the address of a source operand into the destination operand.

For example, the following lea instruction takes the address and places it in the `rdi` register:
```asm
lea rdi, [edi*2]
```

> It's important to understand the `lea` instruction doesn't actually access the memory location. It just calculates the effective address and places it in the destination register :)

---

### xchg instruction

The `xchg` instruction, also know as the exchange instruction, swaps the values of two operands.

For example, the following xchg instruction swaps the values of `rax and `rbx`:
```asm
xchg  rax, rbx
```

> Think of the xchg instruction as a handshake between two registers. They simply swap values with each other :)

---

### Arithmetic operations

Arithmetic operations in assembly language are used to perform mathematical calculations on data in registers and memory.


Here are some arithmetic instructions you will probably see:
```asm
add
sub
mul
imul
div
idiv
inc
dec
```

---

#### add instruction

The `add` instruction adds the second operand to the first operand and stores the result in the first operand.

Here is an example of adding values using `rax` and `rbx`:
```asm
mov rax, 0x69
add rbx, rax
```

> The value of rbx is 0x69 nice!

---

#### sub instruction

The `sub` instruction subtracts the second operand from the first operand and stores the result in the first operand.

Here is an example of subtracting values using `rax`:
```asm
mov rax, 0x100
sub rax, 0x097
```

> The value of rax is 0x69 nice!

---

#### mul and imul instruction

The `mul` instruction multiplies the `rax` register by the operand, and the result is stored in `rdx:rax`

Here is an example of multiplying an unsigned value in `rax`:
```asm
mov rax, 0x09
mov rbx, 0x09
mul rbx
```

> The value of rax is 0x69 nice!

The difference is the `imul` instruction allows you to multiply signed values.

Here is an example of multiplying a signed value in `rax`:
```asm
mov   rax, 0xF
mov   rbx, -0x7
imul  rbx
```
> The value of rax is -0x69 nice!

---

#### div and idiv instruction

The `div` instruction divides the unsigned value in the `rdx:rax` pair by the operand, storing the quotient in `rax` and the remainder in `rdx`.

Here is an example of dividing an unsigned value in `rbx`:
```asm
mov rax, 0x69
mov rbx, 0x1
div rbx
```

> The value of rax is 0x69 nice!

The `idiv` instruction divides the signed value in the `rdx:rax` pair by the operand, storing the quotient in `rax` and the remainder in `rdx`

Here is an example of dividing an signed value in `rbx`:
```asm
mov   rax, -0x69D1
mov   rbx, -0x3E9
idiv  rbx
```

> The value of rax is 0x69 nice!

---

#### inc and dec instruction

The `inc` instruction increments the operand by 1. This would be a similar concept to using `i++` in a C program.

Here is an example of incrementing the `rax` register:
```asm
mov rax, 0x69
inc rax
```

> The value of rax is 0x69 nice!

The `dec` instruction decrements the operand by 1. This would be a similar concept to using `i--` in a C program.

Here is an example of decrementing the `rax` register:
```asm
mov rax, 0x6A
dec rax
```

> The value of rax is 0x69 nice!

---

### Bitwise operations

Bitwise operations in assembly language are used to perform operations on individual bits of registers and memory locations. These operations are particularly useful when dealing with flag registers, masks, or when manipulating specific bits in a byte or word.

---

#### and instruction

The `and`` instruction performs a bitwise AND between the two operands and stores the result in the first operand.

Here is an example using `rax` and `rbx`:
```asm
mov rax, 0xFFFF
mov rbx, 0x69
and rax, rbx
```

> The value of rax is 0x69 nice!

---

#### or instruction

The `or` instruction performs a bitwise OR between the two operands and stores the result in the first operand.

Here is an example using `rax` and `rbx`:
```asm
mov rax, 0x00
mov rbx, 0x69
or rax, rbx
```

> The value of rax is 0x69 nice!

---

#### xor instruction

The xor instruction performs a bitwise XOR (exclusive OR) between the two operands and stores the result in the first operand.

Here is an example using `rax` and `rbx`:
```asm
mov rax, 0xFF
xor rbx, 0x96
xor rax, rbx
```

> The value of rax is 0x69 nice!

---

#### not instruction

The `not` instruction performs a bitwise NOT (negate) on the operand, flipping every bit.

Here is an example using `rax`:
```asm
mov rax, 0x0000000000000096
not rax
```

> The value of rax is 0x69 nice!

---

### Control flow and branching

Almost all programming languages have the ability to change the order in which statements are evaluated, and assembly is no exception. Control flow instructions provide a way for the program to make decisions and loop through instructions.

---

#### cmp instruction

The `cmp`` instruction compares two operands by subtracting them (without saving the result) and setting the flags accordingly.

Here is an example using `rax` and `rbx`:
```asm
mov rax, 0x6900
mov rbx, 0x6891
cmp rax, rbx
```

> If rax is equal to rbx, the zero flag will be set. If rax is greater than rbx, the carry flag will be clear.

---

#### flag registers

Flags are a set of 1-bit registers that store the results of operations. For example, if the result of an operation is zero, the zero flag (ZF) will be set.

Common flags include:

* Zero Flag (ZF)
* Carry Flag (CF)
* Overflow Flag (OF)
* Sign Flag (SF)

When you perform a `cmp` operation, it'll set or clear these flags based on the outcome of the subtraction.

---

### Unconditional jumps

An unconditional jump instruction will transfer the program sequence to the described memory address

---

#### jmp instruction

The `jmp` instruction provides a way to unconditionally jump to another location in your code.

For example, to `jmp` to a label called `destination:

---

### Conditional jumps

Conditional jumps are based on the results of the flags set by the `cmp instruction or arithmetic operations.

---

#### je instruction

The `je` (jump if equal) instruction jumps to the given label if the zero flag is set.

Example:
```asm
cmp rax, 0x69
je is_equal
```

> If rax is equal to 0x69, the code will jump to the is_equal label.

---

#### jne instruction

The `jne` (jump if not equal) instruction jumps to the given label if the zero flag is cleared.

Example:
```asm
cmp rax, 0x69
jne not_equal
```

> If rax is not equal to 0x69, the code will jump to the not_equal label.

---

#### jl instruction

The `jl` (jump if less) instruction jumps to the given label if the result is negative (SF ≠ OF).

Example:
```asm
cmp rax, 0x69
jl is_less
```

> If rax is less than 0x69, the code will jump to the is_less label.

---

#### jg instruction

The jg (jump if greater) instruction jumps to the given label if the result is positive and not zero (ZF = 0 and SF = OF).

Example:
```asm
cmp rax, 0x69
jg is_greater
```

> If rax is greater than 0x69, the code will jump to the is_greater label.

---

#### jno instruction

The jno (jump if not overflow) instruction jumps to the label if the Overflow Flag (OF) is clear.

Example:
```asm
add rax, 0x69
jno no_overflow

```

> If adding 0x69 to rax doesn't cause an overflow, the code will jump to the no_overflow label.

---

### The Stack

The stack is simply an area in RAM that stores function arguments, local variables, etc. The stack is a “Last in First Out” data structure. The stack grows down to the lower memory address.

---

#### Push instruction

The `push` instruction pushes a value to the stack and decrements the stack pointer to point to the new top.

Here is a what you would see in assembly:
```asm
push rax
```

---

#### Pop instruction

The `pop` instruction pops a value or memory address from teh stack and increments the stack pointer to point to the new top.

Here is a what you would see in assembly:
```asm
pop rax
```

> Remember, the stack grows towards the lower memory address. This means the stack will go higher in memory as it shrinks :)

---

#### Stack frames

The stack is typically structured as a linear sequence of memory allocations known as stack frames. Each time a function is called, the stack will automatically allocate a new stack frame.

As the function executes, it will use the given stack frame to store and operate upon its local variables. Once the function returns, this memory will automatically get released back to the stack.

---

##### Function prologue

The first few assembly instructions found at the start of any function are known as the function prologue.

```asm
push  rbp
mov   rbp, rsp
```

The function prologue is inserted by the compiler to 'allocate' a stack frame for the function body to use. When necessary, the prologue will also save any volatile caller state to the stack.

---

###### Stack pointer (RSP)

The first instruction of the function prologue is a push. This is a special instruction used to save data to the top of the stack.

```asm
push  rbp
```

You can interpret the push instruction as two separation operations (push is an alias):

```asm
sub   rsp, 0x8           ; 1. allocate 8 bytes
mov   qword [rsp], rbp   ; 2. store rbp to stack
```

This form exposes the use of rsp, a special register known as the stack pointer. Whatever memory address is held within rsp is interpreted by the CPU as the top of the stack.

---

###### Base pointer (EBP)

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

###### Allocating a stack frame

Allocating memory on the stack is incredibly fast because it can be done in a single instruction. To allocate a new stack frame, the program simply subtracts from the stack pointer.

```asm
sub    rsp, 0x30	; 1. allocate 30 bytes on the stack
```

This is possible because the memory directly above the stack pointer (lower in memory) is guaranteed to be unallocated.

As the last instruction of the main() function prologue, stepping over this sub instruction will complete the allocation of its designated stack frame allocation process.

---

#### Function epilogue

At the end of every function, the compiler will insert a few instructions which make up the function epilogue.

As an example, this is the epilogue from the main() function:
```asm
leave
ret
```

Opposite to the function prologue, the role of the epilogue is to release the current stack frame and return execution to the caller.

---

##### Releasing a stack frame

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

##### Popping off the stack

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

##### Return instruction

At this point, the main() function has completed cleaning up its stack frame. The last step is to return program execution to the calling function using the ret instruction.

```asm
ret
```

This instruction is an alisas for the following sequence:
```asm
pop rip
```

---

### Calling Conventions

A calling convention defines how functions get their arguments from the caller, how they return their results, and how the stack is maintained. Different calling conventions exist for various operating systems and architectures.

---

#### Understanding caller vs. callee

One important thing is understanding the difference between the function caller and callee.

* The caller is the code that calls a function
* The callee is the function that is being called

---

##### Caller responsibilities

Before the caller can make a function call, there are a few things it needs to do first:

> 1. Setting up parameters: The caller must pass the parameters via registers or the stack. 
> 2. Call instruction: The caller may use the `call` instruction to invoke the callee.
> 3. Stack cleanup (possible): Depending on the calling convention, the caller may be responsible for cleaning up the stack after the callee returns a value.

---

##### Callee responsibilities

---

#### Parameter passing

---

##### Stack-based parameter passing

---

##### Register-based parameter passing

---

#### Return values

---

##### Using registers for return values

---

##### Memory location returns

---

#### Preserved registers (caller-saved vs. callee-saved)

---

##### Caller-saved registers

After a call, the caller may add to the stack pointer to clean up the arguments:
```asm
call function_name
add esp, 0x8        ; cleans up 2 arguments
```

---

##### Callee-saved registers

---

#### Common calling conventions

---

##### Linux system V application binary interface

---

##### Microsoft x64 calling conventions

---

##### Stdcall, cdecl, and fastcalls (32-bit conventions)

---

#### Stack cleanup

---

##### Caller clears the stack

---

##### Callee clears the stack

---

# A Simple Introduction to Reversing: CTRL+Z won't work in the real world
If you are reading this part of the crash course, you are most ready to start reversing! Let me show you how I first started learning reverse engineering! However, every reverse engineer has their own reason to reverse!

Here is a list of reasons people reverse engineer from least sketchy to most sketchy:
> 1. Educational purposes:

Some people who start reversing may want to get better at their debugging skills. They may decide to start experimenting with code they've written in their free time.
> 2. Software porting & Abandoned projects:

Sometimes, reverse engineering is useful to ensure compatibility between different operating systems and architectures. Not all developers are willing to release their source code. This usually forces people to reverse their protocols in order to keep a community alive!
> 3. Game modding & hacking:

The gaming community will reverse engineer software in order to develop more features, maps, etc. Some reverse engineers will need to statically and dynamically analyze video games in order to bypass its anti-cheat software.
> 4. Vulnerability & security research:

Cyber security experts may need to reverse software to identify vulnerabilities and weaknesses, which can be reported to software vendors for patching!
> 5. Piracy & broke ass college students:

This is where the ethical line becomes very blurry. Some individuals who are studying music production in college cannot afford $1,000 VST3 plugins. It is cheaper to reverse the plugins and write keygens rather than to purchase the music software.
> 6. Malware development & criminal activities:

Reverse engineering can be employed for illegal activities like engaging in cyber attacks. Distribution of malware will require a reverse engineer to understand how to bypass security mechanisms on operating systems like Windows or Linux.

## C to x86-64 Assembly

Now that you are familiar with C code, you can start cross referencing C and assembly code. One way you can do this on Linux is by using `objdump -D <binary file> | less`. You can also use more advanced tools like IDA and Ghidra.

For simplicity purposes, I will be using https://godbolt.org/ to disassemble our C code to x86-64 assembly.

---

### Main Function

```c
#include <stdio.h>

int main()
{
    return 0;
}
```

```asm
main:
        push    rbp
        mov     rbp, rsp
        mov     eax, 0
        pop     rbp
        ret
```
---

#### int argc, char *argv[]

```c
#include <stdio.h>

int main(int argc, char *argv[])
{
    return 0;
}
```

```asm
main:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], edi
        mov     QWORD PTR [rbp-16], rsi
        mov     eax, 0
        pop     rbp
        ret
```
---

### Integers, arithmetic operations, and bitwise operations

```c
#include <stdio.h>

int main()
{
    int i;
    i = 69;

    return 0;
}
```

```asm
main:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], 69
        mov     eax, 0
        pop     rbp
        ret
```

---

#### Addition, subtraction, multiplication, division, and modulus

```c
#include <stdio.h>

int main()
{
    int i, j, k, sum;

    i = 23;
    j = 23;
    k = 23;

    sum = i + j + k;

    return 0;
}
```

```asm
main:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], 23
        mov     DWORD PTR [rbp-8], 23
        mov     DWORD PTR [rbp-12], 23
        mov     edx, DWORD PTR [rbp-4]
        mov     eax, DWORD PTR [rbp-8]
        add     edx, eax
        mov     eax, DWORD PTR [rbp-12]
        add     eax, edx
        mov     DWORD PTR [rbp-16], eax
        mov     eax, 0
        pop     rbp
        ret
```

```c
#include <stdio.h>

int main()
{
    int i, j, difference;

    i = 70;
    j = 1;

    difference = i - j;

    return 0;
}
```

```asm
main:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], 70
        mov     DWORD PTR [rbp-8], 1
        mov     eax, DWORD PTR [rbp-4]
        sub     eax, DWORD PTR [rbp-8]
        mov     DWORD PTR [rbp-12], eax
        mov     eax, 0
        pop     rbp
        ret
```

```c
#include <stdio.h>

int main()
{
    int i, j, product;

    i = 23;
    j = 3;

    product = i * j;

    return 0;
}
```

```asm
main:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], 23
        mov     DWORD PTR [rbp-8], 3
        mov     eax, DWORD PTR [rbp-4]
        imul    eax, DWORD PTR [rbp-8]
        mov     DWORD PTR [rbp-12], eax
        mov     eax, 0
        pop     rbp
        ret
```

```c
#include <stdio.h>

int main()
{
    int i, j, quotient;

    i = 138;
    j = 2;

    quotient = i / j;

    return 0;
}
```

```asm
main:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], 138
        mov     DWORD PTR [rbp-8], 2
        mov     eax, DWORD PTR [rbp-4]
        cdq
        idiv    DWORD PTR [rbp-8]
        mov     DWORD PTR [rbp-12], eax
        mov     eax, 0
        pop     rbp
        ret
```

```c
#include <stdio.h>

int main()
{
    int i, j, modulus ;

    i = 483;
    j = 7;

    modulus  = i % j;

    return 0;
}
```

```asm
main:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], 483
        mov     DWORD PTR [rbp-8], 7
        mov     eax, DWORD PTR [rbp-4]
        cdq
        idiv    DWORD PTR [rbp-8]
        mov     DWORD PTR [rbp-12], edx
        mov     eax, 0
        pop     rbp
        ret
```

---

#### And, or, xor, not, bit shifts

---

### Pointers

---

#### Pointer addressing and dereferencing

```c
#include <stdio.h>

int main()
{
    int i;
    i = 69;
    
    int *ptr;
    ptr= &i;

    return 0;
}
```

```asm
main:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-12], 69
        lea     rax, [rbp-12]
        mov     QWORD PTR [rbp-8], rax
        mov     eax, 0
        pop     rbp
        ret
```

```c
#include <stdio.h>

int main()
{
    int i, j;
    i = 69;

    int *ptr;
    ptr= &i;

    j = *ptr;

    return 0;
}
```

```asm
main:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-16], 69
        lea     rax, [rbp-16]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        mov     DWORD PTR [rbp-12], eax
        mov     eax, 0
        pop     rbp
        ret
```

---

### Strings

```c
#include <stdio.h>

int main()
{
    char str;

    return 0;
}
```

```asm
main:
        push    rbp
        mov     rbp, rsp
        mov     eax, 0
        pop     rbp
        ret
```

---

#### String initialization

```c
#include <stdio.h>

int main()
{
    char str[] = "69 nice!";

    return 0;
}
```

```asm
main:
        push    rbp
        mov     rbp, rsp
        movabs  rax, 2406438880369719606
        mov     QWORD PTR [rbp-9], rax
        mov     BYTE PTR [rbp-1], 0
        mov     eax, 0
        pop     rbp
        ret
```

---

#### Character pointers and string literals

```c
#include <stdio.h>

int main()
{
    char *str = "69 nice!";

    return 0;
}
```

```asm
.LC0:
        .string "69 nice!"
main:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], OFFSET FLAT:.LC0
        mov     eax, 0
        pop     rbp
        ret
```

```c
#include <stdio.h>

int main()
{
    char str = 'E';

    return 0;
}
```

```asm
main:
        push    rbp
        mov     rbp, rsp
        mov     BYTE PTR [rbp-1], 69
        mov     eax, 0
        pop     rbp
        ret
```

---

### Control flow

---

#### Single and two-way branching

---

##### If statements

```c
#include <stdio.h>

int main()
{
    int i;
    i = 69;

    if (i == 69) {
        puts("nice!");
    }

    return 0;
}
```

```asm
.LC0:
        .string "nice!"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     DWORD PTR [rbp-4], 69
        cmp     DWORD PTR [rbp-4], 69
        jne     .L2
        mov     edi, OFFSET FLAT:.LC0
        call    puts
.L2:
        mov     eax, 0
        leave
        ret
```

---

##### If-else statements

```c
#include <stdio.h>

int main()
{
    int i;
    i = 69;

    if (i == 69) {
        puts("nice!");
    } else {
        puts("not nice :(");
    }

    return 0;
}
```

```asm
.LC0:
        .string "nice!"
.LC1:
        .string "not nice :("
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     DWORD PTR [rbp-4], 69
        cmp     DWORD PTR [rbp-4], 69
        jne     .L2
        mov     edi, OFFSET FLAT:.LC0
        call    puts
        jmp     .L3
.L2:
        mov     edi, OFFSET FLAT:.LC1
        call    puts
.L3:
        mov     eax, 0
        leave
        ret
```

---

#### Loops

---

##### While

```c
#include <stdio.h>

int main()
{
    int i;
    i = 0;

    while (i != 69) {
        i++;
    }
}
```

```asm
main:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], 0
        jmp     .L2
.L3:
        add     DWORD PTR [rbp-4], 1
.L2:
        cmp     DWORD PTR [rbp-4], 69
        jne     .L3
        mov     eax, 0
        pop     rbp
        ret
```

---

##### For

```c
#include <stdio.h>

int main()
{
    int i;

    for(i = 0; i < 69; i++) {
    }
}
```

```asm
main:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], 0
        jmp     .L2
.L3:
        add     DWORD PTR [rbp-4], 1
.L2:
        cmp     DWORD PTR [rbp-4], 68
        jle     .L3
        mov     eax, 0
        pop     rbp
        ret
```

---

##### Do-while

```c
#include <stdio.h>

int main()
{
    int i;
    i = 0;

    do {
        i += 23;
    } while (i < 69);
}
```

```asm
main:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], 0
.L2:
        add     DWORD PTR [rbp-4], 23
        cmp     DWORD PTR [rbp-4], 68
        jle     .L2
        mov     eax, 0
        pop     rbp
        ret
```

---

#### Function calls

```c
#include <stdio.h>

int func_add(int a, int b)
{
    int sum;

    sum = a + b;

    return sum;
}

int main()
{
    int a, b, sum;
    a = 23;
    b = 46;

    sum = func_add(a, b);
}
```

```asm
func_add:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-20], edi
        mov     DWORD PTR [rbp-24], esi
        mov     edx, DWORD PTR [rbp-20]
        mov     eax, DWORD PTR [rbp-24]
        add     eax, edx
        mov     DWORD PTR [rbp-4], eax
        mov     eax, DWORD PTR [rbp-4]
        pop     rbp
        ret
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     DWORD PTR [rbp-4], 23
        mov     DWORD PTR [rbp-8], 46
        mov     edx, DWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rbp-4]
        mov     esi, edx
        mov     edi, eax
        call    func_add
        mov     DWORD PTR [rbp-12], eax
        mov     eax, 0
        leave
        ret
```

---

##### Recursion Patterns

```c
#include <stdio.h>

int func_factorial(int i)
{
    if (i > 1) {
        return i * func_factorial(i - 1);
    } else { 
        return 1;
    }
}

int  main()
{
    int i, product;
    i = 5;

    product = func_factorial(i);

    return 0;
}
```

```asm
func_factorial:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     DWORD PTR [rbp-4], edi
        cmp     DWORD PTR [rbp-4], 1
        jle     .L2
        mov     eax, DWORD PTR [rbp-4]
        sub     eax, 1
        mov     edi, eax
        call    func_factorial
        imul    eax, DWORD PTR [rbp-4]
        jmp     .L3
.L2:
        mov     eax, 1
.L3:
        leave
        ret
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     DWORD PTR [rbp-4], 5
        mov     eax, DWORD PTR [rbp-4]
        mov     edi, eax
        call    func_factorial
        mov     DWORD PTR [rbp-8], eax
        mov     eax, 0
        leave
        ret
```

---

### Data Structures

---

#### Arrays

---

##### Array initialization, indexing, and iterations

```c
#include <stdio.h>

int  main()
{
    int array[] = {69, 420, 9, 10, 21};
    return 0;
}
```

```asm
main:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-32], 69
        mov     DWORD PTR [rbp-28], 420
        mov     DWORD PTR [rbp-24], 9
        mov     DWORD PTR [rbp-20], 10
        mov     DWORD PTR [rbp-16], 21
        mov     eax, 0
        pop     rbp
        ret
```

```c
#include <stdio.h>

int  main()
{
    int i;
    int array[] = {69, 420, 9, 10, 21};

    int *ptr = &array[0];

    return 0;
}
```

```asm
main:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-32], 69
        mov     DWORD PTR [rbp-28], 420
        mov     DWORD PTR [rbp-24], 9
        mov     DWORD PTR [rbp-20], 10
        mov     DWORD PTR [rbp-16], 21
        lea     rax, [rbp-32]
        mov     QWORD PTR [rbp-8], rax
        mov     eax, 0
        pop     rbp
        ret
```

```c
#include <stdio.h>

int  main()
{
    int i;
    int array[] = {69, 420, 9, 10, 21};

    for (i = 0; i < sizeof(array) / sizeof(int); i++) {
        printf("%d", array[i]);
    }
    return 0;
}
```

```asm
.LC0:
        .string "%d"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     DWORD PTR [rbp-32], 69
        mov     DWORD PTR [rbp-28], 420
        mov     DWORD PTR [rbp-24], 9
        mov     DWORD PTR [rbp-20], 10
        mov     DWORD PTR [rbp-16], 21
        mov     DWORD PTR [rbp-4], 0
        jmp     .L2
.L3:
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        mov     eax, DWORD PTR [rbp-32+rax*4]
        mov     esi, eax
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 0
        call    printf
        add     DWORD PTR [rbp-4], 1
.L2:
        mov     eax, DWORD PTR [rbp-4]
        cmp     eax, 4
        jbe     .L3
        mov     eax, 0
        leave
        ret
```
---

#### Structs

---

##### Memory layout, access patterns, nested structs

---

#### Union

---

##### Memory overlap and access patterns

---

### Memory Management

---

#### Stack operations

---

##### Local Variables, allocations, and deallocations

---

#### Heap operations

---

##### Dynamic memory allocation with malloc/free

---

# Trust the Process: Drop the Virtual Addy

Processes are a little weird to understand especially when learning about virtual memory. For example, two processes can use the same virtual memory address because it gets backed up by different physical memory. Processes see themselves as loners and do not battle each other.

---

## Process Memory

---

### Virtual Address

---

## Address Space Layout of a Process in Memory

```bash
dilldylanpickle@linux:~$ cat /proc/319/maps
555555400000-555555401000 r-xp 00000000 08:10 62968                      /home/dilldylanpickle/GitHub-Projects/Crash-Course-on-x86-64-Reverse-Engineering/memory-layout
555555600000-555555601000 r--p 00000000 08:10 62968                      /home/dilldylanpickle/GitHub-Projects/Crash-Course-on-x86-64-Reverse-Engineering/memory-layout
555555601000-555555602000 rw-p 00001000 08:10 62968                      /home/dilldylanpickle/GitHub-Projects/Crash-Course-on-x86-64-Reverse-Engineering/memory-layout
555555602000-555555623000 rw-p 00000000 00:00 0                          [heap]
7ffff79e2000-7ffff7bc9000 r-xp 00000000 08:10 2471                       /lib/x86_64-linux-gnu/libc-2.27.so
7ffff7bc9000-7ffff7dc9000 ---p 001e7000 08:10 2471                       /lib/x86_64-linux-gnu/libc-2.27.so
7ffff7dc9000-7ffff7dcd000 r--p 001e7000 08:10 2471                       /lib/x86_64-linux-gnu/libc-2.27.so
7ffff7dcd000-7ffff7dcf000 rw-p 001eb000 08:10 2471                       /lib/x86_64-linux-gnu/libc-2.27.so
7ffff7dcf000-7ffff7dd3000 rw-p 00000000 00:00 0
7ffff7dd3000-7ffff7dfc000 r-xp 00000000 08:10 2447                       /lib/x86_64-linux-gnu/ld-2.27.so
7ffff7fe8000-7ffff7fea000 rw-p 00000000 00:00 0
7ffff7ff7000-7ffff7ffb000 r--p 00000000 00:00 0                          [vvar]
7ffff7ffb000-7ffff7ffc000 r-xp 00000000 00:00 0                          [vdso]
7ffff7ffc000-7ffff7ffd000 r--p 00029000 08:10 2447                       /lib/x86_64-linux-gnu/ld-2.27.so
7ffff7ffd000-7ffff7ffe000 rw-p 0002a000 08:10 2447                       /lib/x86_64-linux-gnu/ld-2.27.so
7ffff7ffe000-7ffff7fff000 rw-p 00000000 00:00 0
7ffffffde000-7ffffffff000 rw-p 00000000 00:00 0                          [stack]
```

* 555555400000-555555401000: The executable code of a program.
* 555555600000-555555601000: A read-only section of the program.
* 555555601000-555555602000: A writable section of the program.
* 555555602000-555555623000: The heap, used for dynamic memory allocation.
* 7ffff79e2000-7ffff7bc9000: The executable code of the C library (libc).
* 7ffff7bc9000-7ffff7dc9000: The data section of libc.
* 7ffff7dc9000-7ffff7dcd000: Read-only libc code and data.
* 7ffff7dcd000-7ffff7dcf000: A writable section of libc, typically used for dynamic data storage.
* 7ffff7dcf000-7ffff7dd3000: An empty memory range.
* 7ffff7dd3000-7ffff7dfc000: The executable code of the dynamic linker (ld).
* 7ffff7fe8000-7ffff7fea000: An empty memory range.
* 7ffff7ff7000-7ffff7ffb000: The vvar region, related to the process's virtual memory and used by the kernel.
* 7ffff7ffb000-7ffff7ffc000: The vdso (virtual dynamic shared object) is a memory region that provides an interface between the user-space application and the kernel.
* 7ffff7ffc000-7ffff7ffd000: This section is a read-only part of the dynamic linker (ld) containing code and data.
* 7ffff7ffd000-7ffff7ffe000: A writable section of the dynamic linker (ld), typically used for dynamic data storage.
* 7ffff7ffe000-7ffff7fff000: An empty memory range.
* 7ffffffde000-7ffffffff000: The stack memory region and where the program's runtime data is stored.
---

## Memory Layout of a C Program

![Alt Text](https://github.com/dilldylanpickle/dilldylanpickle.github.io/raw/main/GIFs/C-memory-layout.png)

---

### info proc mappings
