# asstrlen

## purpose

Get the length in characters of a null terminated string

## asstrcpy syntax

Note that even if the maximum return size is `uint64_t` you'll be able to cast it to anything smaller if the string doesn't need a 64bit integer for it's size.

```c
uint64_t asstrcpy(char* destination, char* source);
```
