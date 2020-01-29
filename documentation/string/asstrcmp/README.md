# asstrcmp

## purpose

Compare null terminated strings by returning the difference of the last comparison

## asstrcmp syntax

There are 4 different asstrcmp functions, they compare different amount of data at a time. 

```c
uint8_t asstrcmp(char* firstaddr, void* secondaddr);

uint16_t asstrcmp2(char* firstaddr, char* secondaddr);

uint32_t asstrcmp4(char* firstaddr, char* secondaddr);

uint64_t asstrcmp8(char* firstaddr, char* secondaddr);
```

Note that if you use asstrcmp2, 4 or 8 on a string which length (including null the byte) is not evenly divisible by said number the function will break. Therefore these functions should only be used when you are completely sure that that is the case.

