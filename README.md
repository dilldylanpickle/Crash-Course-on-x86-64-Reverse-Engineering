# Cracking the Low Level Coding Interview

## Table of Contents
- [Whiteboard C Programming](#whiteboard-c-programming)
  - [Pointer Fundamental Concepts](#pointer-fundamental-concepts)
    - [Pointer Basics](#pointer-basics)
    - [The “&” address-of operator](#the--address-of-operator)
    - [The "*" dereference opeartor](#the--dereference-opeartor)

# Whiteboard C Programming
Coding in C is fun!

### Pointer Fundamental Concepts
A `pointer` is a varaible that holds the address of another varaiable. Pointers are significant they allow programmers to manipulate the data in the computer's memory.

Here is how you declare a pointer in C:
```c
int *ptr;
```

#### The "*" dereference opeartor
The `*` dereference operator is used to access the value at the addres stored in the pointer variable.

Here is how you can retrieve a value using the `*` opeartor:
```c
int x = 69;
int *ptr = &x;
printf("The value at address %p is %d", &x, *ptr);
```

```bash
$dilldylanpickle@archlinux:~/Cracking-the-Low-Level-Coding-Interview$ ./a.out
The value at address 0x7fff4e71a8cc is 69
```
#### The “&” address-of operator