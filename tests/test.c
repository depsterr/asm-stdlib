#include <stdint.h>
#include "../code/asm-stdlib.h"

#define MEMSETN 64

char smemsettest(){
	puts("testing smemtest");
	char testc0[MEMSETN];
	char testc1[MEMSETN];
	char testc2[MEMSETN];
	smemset(&testc0, 0x0, MEMSETN);
	smemset(&testc2, 0x0, MEMSETN);
	smemset(&testc1, 'f', MEMSETN);
	for(char n = 0; n < (MEMSETN / 2); n++){
		if(testc1[n] != 'f'){
			puts("smemset not working, doesn't fill");
			puts(testc1);
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc0[n] == 'f'){
			puts("smemset not working, underflows");
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc2[n] == 'f'){
			puts("smemset not working, overflows");
			puts(testc2);
			return 0;
		}
	}
	return 1;
}

char smemset2test(){
	puts("testing smemtest2");
	char testc0[MEMSETN];
	char testc1[MEMSETN];
	char testc2[MEMSETN];
	smemset2(&testc0, 0x0, MEMSETN);
	smemset2(&testc2, 0x0, MEMSETN);
	smemset2(&testc1, 'f', MEMSETN);
	for(char n = 0; n < (MEMSETN / 2); n++){
		if(*(uint16_t*)&testc1[n] != 'f'){
			puts("smemset2 not working, doesn't fill");
			return 0;
		}
	}
	for(char n = 0; n < (MEMSETN / 2); n++){
		if(*(uint16_t*)&testc0[n] == 'f'){
			puts("smemset2 not working, underflows");
			return 0;
		}
	}
	for(char n = 0; n < (MEMSETN / 2); n++){
		if(*(uint16_t*)&testc2[n] == 'f'){
			puts("smemset2 not working, overflows");
			return 0;
		}
	}
	return 1;
}

char smemset4test(){
	puts("testing smemtest4");
	char testc0[MEMSETN];
	char testc1[MEMSETN];
	char testc2[MEMSETN];
	smemset4(&testc0, 0x0, MEMSETN);
	smemset4(&testc2, 0x0, MEMSETN);
	smemset4(&testc1, 'f', MEMSETN);
	for(char n = 0; n < (MEMSETN / 4); n++){
		if(testc1[n] != 'f'){
			puts("smemset4 not working, doesn't fill");
			return 0;
		}
	}
	for(char n = 0; n < (MEMSETN / 4); n++){
		if(testc0[n] == 'f'){
			puts("smemset4 not working, underflows");
			return 0;
		}
	}
	for(char n = 0; n < (MEMSETN / 4); n++){
		if(testc2[n] == 'f'){
			puts("smemset4 not working, overflows");
			return 0;
		}
	}
	return 1;
}

char smemset8test(){
	puts("testing smemtest8");
	char testc0[MEMSETN];
	char testc1[MEMSETN];
	char testc2[MEMSETN];
	smemset8(&testc0, 0x0, MEMSETN);
	smemset8(&testc2, 0x0, MEMSETN);
	smemset8(&testc1, 'f', MEMSETN);
	for(char n = 0; n < (MEMSETN / 8); n++){
		if(*(uint16_t*)&testc1[n] != 'f'){
			puts("smemset8 not working, doesn't fill");
			return 0;
		}
	}
	for(char n = 0; n < (MEMSETN / 8); n++){
		if(*(uint16_t*)&testc0[n] == 'f'){
			puts("smemset8 not working, underflows");
			return 0;
		}
	}
	for(char n = 0; n < (MEMSETN / 8); n++){
		if(*(uint16_t*)&testc2[n] == 'f'){
			puts("smemset8 not working, overflows");
			return 0;
		}
	}
	return 1;
}

void main(){
	if(smemsettest())
		puts("smemtest working");
	if(smemset2test())
		puts("smemtest2 working");
	if(smemset4test())
		puts("smemtest4 working");
	if(smemset8test())
		puts("smemtest8 working");
}
