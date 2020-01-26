# asm-stdlib
Recreating (some of) the C standard library rewritten in nasm assembler

## Installation

To install just run these commands

```
git clone https://github.com/depsterr/asm-stdlib.git
cd asm-stdlib
sudo sh install.sh
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

Look at the [documentation](./documentation/README.md)
