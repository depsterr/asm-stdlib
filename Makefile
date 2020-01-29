#
# Name to use for library
#

LIBRARYNAME=asm-stdlib

#
# Programs to use
#

LINKER=ld
CC=c99

#
# Folders 
#

# Make
OUTDIR=.
OUTFILE=$(OUTDIR)/lib$(LIBRARYNAME).so

# Install
INCLUDEDIR=/usr/include
LIBDIR=/usr/lib

#
# Testfiles
#

TESTFILE=test/test.c
TESTOUT=test/test.out

# Things you should only change if changing the rest of the makefile
ASM_FILES=$(shell find code/ -type f -name '*.s')
O_FILES=$(shell find code/ -type f -name '*.s' | sed 's/\.s/\.o/g')

default: $(OUTFILE) clean

noclean: $(OUTFILE)

%.o: %.s
	nasm -f elf64 $< -o $@

$(OUTFILE): $(O_FILES)
	$(LINKER) -shared $< -o $@

$(TESTOUT): $(TESTFILE)
	$(CC) $< -o $@ -L$(OUTDIR) -l$(LIBRARYNAME) 

install:
	make default
	cp code/*.h $(INCLUDEDIR) && cp $(OUTFILE) $(LIBDIR)

clean:
	rm $(O_FILES)

test: $(OUTFILE) $(TESTOUT)
	LD_LIBRARY_PATH=$(shell realpath $(OUTDIR)) $(TESTOUT)
