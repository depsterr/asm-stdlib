LIBRARYNAME=asm-stdlib

OUTFILE=lib$(LIBRARYNAME).so
TESTIN=test/test.c
TESTOUT=test/test.out

LINKER=ld
CC=c99

ASM_FILES=$(shell find code/ -type f -name '*.s')
O_FILES=$(shell find code/ -type f -name '*.s' | sed 's/\.s/\.o/g')

default: $(O_FILES)
	$(LINKER) -shared $(O_FILES) -o $(OUTFILE)

%.o: %.s
	nasm -f elf64 $< -o $@

install:
	make default
	cp code/*.h /usr/include && cp *.so /usr/lib

clean:
	rm $(O_FILES)

.PHONY: test
test:
	make default
	$(CC) $(TESTIN) -o $(TESTOUT) -L. -l$(LIBRARYNAME) 
	LD_LIBRARY_PATH=$(shell pwd) ./test/test.out
