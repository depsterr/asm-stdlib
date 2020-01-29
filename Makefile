LIBRARYNAME=asm-stdlib

OUTFILE=lib$(LIBRARYNAME).so

TESTFILE=test/test.c
TESTOUT=test/test.out

LINKER=ld
CC=c99

ASM_FILES=$(shell find code/ -type f -name '*.s')
O_FILES=$(shell find code/ -type f -name '*.s' | sed 's/\.s/\.o/g')

default: $(OUTFILE)
	make clean

noclean: $(OUTFILE)

%.o: %.s
	nasm -f elf64 $< -o $@

$(OUTFILE): $(O_FILES)
	$(LINKER) -shared $(O_FILES) -o $(OUTFILE)

$(TESTFILE):
	$(CC) $(TESTFILE) -o $(TESTOUT) -L. -l$(LIBRARYNAME) 

install:
	make default
	cp code/*.h /usr/include && cp *.so /usr/lib

clean:
	rm $(O_FILES)

test: $(OUTFILE) $(TESTFILE)
	LD_LIBRARY_PATH=$(shell pwd) ./test/test.out
