# asmemset

## purpose

Fills a section of memory with a value

## asmemset syntax

There are 4 different asmemset functions, they fill different amounts of data. 

```c
void asmemset(void* memstart, uint8_t filler, uint_64_t amount);

void asmemset2(void* memstart, uint16_t filler, uint_64_t amount);

void asmemset4(void* memstart, uint_32_t filler, uint_64_t amount);

void asmemset8(void* memstart, uint_64_t filler, uint_64_t amount);

```

Note that the amount is in bytes, so if you want to fill 32 bytes with 8 byte data you'd write

```c
asmemset8(&mydata, 0xffffffffffffffff, 32);
```

Also note that if the amount is not divisible by the size of the filler (in bytes) the function will break.
