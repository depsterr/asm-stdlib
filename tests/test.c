#include <stdint.h>
#include "../code/asm-stdlib.h"

#define MEMSETN 64

char smemsettest(){
	puts("testing smemtest");
	char testc0[MEMSETN];
	char testc1[MEMSETN];
	char testc2[MEMSETN];
	smemset(&testc0, 'c', MEMSETN);
	smemset(&testc2, 'c', MEMSETN);
	smemset(&testc1, 's', MEMSETN);
	for(char n = 0; n < (MEMSETN / 2); n++){
		if(testc1[n] != 's'){
			puts("smemset not working, doesn't fill");
			testc1[MEMSETN - 1] = 0x0;
			puts(testc1);
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc0[n] == 's'){
			puts("smemset not working, underflows");
			testc0[MEMSETN - 1] = 0x0;
			puts(testc0);
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc2[n] == 's'){
			puts("smemset not working, overflows");
			testc2[MEMSETN - 1] = 0x0;
			puts(testc2);
			return 0;
		}
	}
	return 1;
}

void main(){
	if(smemsettest())
		puts("smemtest working");
}
