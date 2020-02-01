#
# Name to use for library
#

LIBRARYNAME=asm-stdlib

#
# Programs to use
#

LINKER=ld
CC=c99
ASM=nasm

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

#
# Input and binary files
#

ASM_FILES=$(shell find code -type f -name '*.s')
O_FILES=$(shell find code -type f -name '*.s' | sed 's/\.s/\.o/g')
H_FILES=code/*.h

#
# Make targets for the user
#

default: $(OUTFILE) 

install: $(OUTFILE)
	cp $(H_FILES) $(INCLUDEDIR) -f && cp $(OUTFILE) $(LIBDIR) -f

test: $(OUTFILE) $(TESTOUT)
	LD_LIBRARY_PATH=$(shell realpath $(OUTDIR)) $(TESTOUT)

clean:
	rm $(O_FILES) $(TESTOUT)

#
# Make targets for make
#

%.o: %.s
	$(ASM) -f elf64 $< -o $@

$(OUTFILE): $(O_FILES)
	$(LINKER) -shared $^ -o $@ 

$(TESTOUT): $(TESTFILE)
	$(CC) $< -o $@ -L$(OUTDIR) -l$(LIBRARYNAME) 
