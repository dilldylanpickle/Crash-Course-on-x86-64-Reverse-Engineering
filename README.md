# Cracking the Low Level Coding Interview

Let me guess? You received an email scheduling an interview? Been there too! Don't remember those calling conventions on Windows because your last job had you reversing on Linux? Me too! I started learning C programming and x86-64 assembly in 2021. Two years is not that long but its a long time to forget something you've read in a manpage. In this repository, I'm going to review some low-level concepts and help refresh your memory.

![Alt Text](https://github.com/dilldylanpickle/dilldylanpickle.github.io/raw/main/GIFs/we-have-technology.gif)

> P.S. don't memorize things but try to understand things :)

## Table of Contents
- [Whiteboard C Programming](#whiteboard-c-programming)
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
- [x86-64 Assembly: Technical Phone Screening Edition](#x86-64-assembly-technical-phone-screening-edition)

# Whiteboard C Programming
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
dilldylanpickle@archlinux:~/Cracking-the-Low-Level-Coding-Interview$ ./a.out
70 lame tbh...
69 nice!
```

> Remember, `(*ptr)++` and `(*ptr)--` will actually dereference the pointer and increment/decrement the value. If you were to use `ptr++` and `ptr--`, that will increment/decrement the pointer itself (this will be useful later).

---

### Pointers and Functions
Remember how C allows us to manipulate the data in a computer's memory? Let me show you why pointers are crucial, especially when working with functions.

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
dilldylanpickle@archlinux:~/Cracking-the-Low-Level-Coding-Interview$ ./a.out
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
dilldylanpickle@archlinux:~/Cracking-the-Low-Level-Coding-Interview$ ./a.out
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
dilldylanpickle@archlinux:~/Cracking-the-Low-Level-Coding-Interview$ ./a.out
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
dilldylanpickle@archlinux:~/Cracking-the-Low-Level-Coding-Interview$ ./a.out
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
dilldylanpickle@archlinux:~/Cracking-the-Low-Level-Coding-Interview$ ./a.out
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
dilldylanpickle@archlinux:~/Cracking-the-Low-Level-Coding-Interview$ ./a.out
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
dilldylanpickle@archlinux:~/Cracking-the-Low-Level-Coding-Interview$ ./a.out
Concatenate this string!
```

##### Reverse strings using pointers
I have been asked this interview question multiple times lol. While I was working as a intern, I had to reverse engineer a lot of string library functions. This question is usually a freebie but I still like answering it!

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
dilldylanpickle@archlinux:~/Cracking-the-Low-Level-Coding-Interview$ ./a.out
!gnirts siht esreveR
```

---

### Pointers and Structures

I think it's an L that arrays in C can only contain similar data elements. I think struct data structures are pushin P because they can hold different data types.

Here is an example of my inner conscious telling you I'm hungry:
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
dilldylanpickle@archlinux:~/Cracking-the-Low-Level-Coding-Interview$ ./a.out
The size of the struct is 16 bytes
```

##### Using pointers to access struct members
We know that each member in an array data structure holds an address right? You can use the `->` operator to access a member of a structure through a pointer!

Here is how we can dereference struct members using pointers:
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
dilldylanpickle@archlinux:~/Cracking-the-Low-Level-Coding-Interview$ ./a.out
Name of Whataburger burger: Patty melt
Number of beef patties: 2
Number of cheese slices: 2
```

---

# x86-64 Assembly: Technical Phone Screening Edition
You wanna know what could be worse than a technical coding interview? A technical phone screen interview! In my experience, they gotta make sure you ain't capping on your resume. If you put "x86-64 assembly" or "C/C++" on your resume, be prepared to talk the talk before you walk the walk!

![Alt Text](https://github.com/dilldylanpickle/dilldylanpickle.github.io/raw/main/GIFs/phone-interview.gif)

> Things get real if the company uses a zoom link and your phone camera turns on LMAO