# asm-stdlib
Recreating (some of) the C standard library rewritten in nasm assembler

## Installation

To install just run these commands

```
git clone https://github.com/depsterr/asm-stdlib.git
cd asm-stdlib
sudo make install
```

## Usage

Include the header

```c
#include <asm-stdlib.h>
```

Link the library
```sh
gcc foo.c -o foo -lasm-stdlib
```

## Documentation

Look at the [documentation](documentation/README.md)

## What is this?

This is a fun little project I started because I was bored, while I do intend on making it into a fully functional libc, it's not a overly serious project or anything. 
