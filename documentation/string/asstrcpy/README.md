# asstrcpy

## purpose

Copies a string from a source to a destination.

## asstrcpy syntax

There are 4 different asstrcpy functions, they copy different amount of data at a time. 

```c
void asstrcpy(char* destination, char* source);

void asstrcpy2(char* destination, char* source);

void asstrcpy4(char* destination, char* source);

void asstrcpy8(char* destination, char* source);
```

Note that if you use asstrcpy2, 4 or 8 on a string which length (including the null byte) is not evenly divisible by said number the function will break. Therefore these functions should only be used when you are completely sure that that is the case.
