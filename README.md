# Cracking the Low Level Coding Interview

## Table of Contents
- [Whiteboard C Programming](#whiteboard-c-programming)
  - [Pointer Fundamental Concepts](#pointer-fundamental-concepts)
    - [Pointer Basics](#pointer-basics)
    - [The “&” address-of operator](#the--address-of-operator)
    - [The "*" dereference operator](#the--dereference-opeartor)

# Whiteboard C Programming
Are you considering job roles like software reverse engineer, embedded software developer, or vulnerability researcher? Well, chances are they'll expect you to be comfortable in C programming. Nobody wants extra variables in their codebase, so let's talk about pointers.

![Alt Text](https://github.com/dilldylanpickle/dilldylanpickle.github.io/raw/main/GIFs/who-knew-this-guy.gif)


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
int x = 69;
printf("The address of the value is stored at %p\n", &x);
```

***Terminal:***
```bash
dilldylanpickle@archlinux:~/Cracking-the-Low-Level-Coding-Interview$ ./a.out
The address of the value is stored at 69
```

#### The "*" dereference operator
The `*` dereference operator is used to access the value at the address stored in the pointer variable.

Here is how you can retrieve a value using the `*` operator:
```c
int x = 69;
int *ptr = &x;
printf("The value at address %p is %d", &x, *ptr);
```

***Terminal:***
```bash
dilldylanpickle@archlinux:~/Cracking-the-Low-Level-Coding-Interview$ ./a.out
The value at address 0x7fff4e71a8cc is 69
```