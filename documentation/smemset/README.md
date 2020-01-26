# smemset

## smemset syntax

There are 4 different smemset functions, for filling 1, 2, 4 or 8 bytes at a time.

```c
smemset(void* memstart, uint8_t filler, uint_64_t amount);

smemset2(void* memstart, uint16_t filler, uint_64_t amount);

smemset4(void* memstart, uint_32_t filler, uint_64_t amount);

smemset8(void* memstart, uint_64_t filler, uint_64_t amount);

```

## error hunting

If the amount value is not evenly divisible by the size of the filler (in bytes) the function will behave unexpectedly.
