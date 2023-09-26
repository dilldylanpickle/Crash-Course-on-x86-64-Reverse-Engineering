# Cracking the Low Level Coding Interview

## Table of Contents
- [Whiteboard C Programming](#whiteboard-c-programming)
  - [Pointer Fundamental Concepts](#pointer-fundamental-concepts)
    - [Pointer Basics](#pointer-basics)
    - [The “&” address-of operator](#the--address-of-operator)
    - [The "*" dereference operator](#the--dereference-opeartor)
    - [Pointer Arithmetics](#pointer-arithmetics)

# Whiteboard C Programming
Are you considering job roles like software reverse engineer, embedded software developer, or vulnerability researcher? Well, chances are they'll expect you to be comfortable in C programming. Nobody wants extra variables in their codebase, so let's talk about pointers!

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
dilldylanpickle@archlinux:~/Cracking-the-Low-Level-Coding-Interview$ ./a.out
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
dilldylanpickle@archlinux:~/Cracking-the-Low-Level-Coding-Interview$ ./a.out
The value at address 0x7fff4e71a8cc is 69
```

---

### Pointer Arithmetics
A pointer in C can basically hold an address right? Since an address is a numeric value, you can perform arithmetic operations on a pointer.

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
dilldylanpickle@archlinux:~/Cracking-the-Low-Level-Coding-Interview$ ./a.out
70 lame tbh...
69 nice!
```

> Remember, `(*ptr)++` and `(*ptr)--` will actually dereference the pointer and increment/decrement the value. If you were to use `ptr++` and `ptr--`, that will increment/decrement the pointer itself (this will be useful later).

---

### Pointers and Functions
Remember how C allows us to manipulate the data in a computer's memory? That honestly something a nerd would say lol. Let me show you why pointers are crucial, especially when working with functions.

#### Pointers as function arguments (pass by reference)
When I say pass by reference, I'm basically saying  "Hey function! Please take the address of this value please?" 

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
dilldylanpickle@archlinux:~/Cracking-the-Low-Level-Coding-Interview$ ./a.out
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
dilldylanpickle@archlinux:~/Cracking-the-Low-Level-Coding-Interview$ ./a.out
Hello, World!
```

---