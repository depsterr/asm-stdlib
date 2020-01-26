#include "../code/asm-stdlib.h"
#include <stdio.h>

#define MEMSETN 64

#define ERRORCLR "\x1b[31m"
#define WORKINGCLR "\x1b[32m"
#define RESETCLR "\033[0m"

char smemsettest(){
	puts("testing smemtest");
	char testc0[MEMSETN];
	char testc1[MEMSETN];
	char testc2[MEMSETN];
	smemset(&testc0, 0x00, MEMSETN);
	smemset(&testc1, 0x11, MEMSETN);
	smemset(&testc2, 0x00, MEMSETN);
	for(char n = 0; n < MEMSETN; n++){
		if(testc1[n] != 0x11){
			puts(ERRORCLR "\tsmemset not working, doesn't fill" RESETCLR);
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc0[n] == 0x11){
			puts(ERRORCLR "\tsmemset not working, underflows" RESETCLR);
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc2[n] == 0x11){
			puts(ERRORCLR "\tsmemset not working, overflows" RESETCLR);
			return 0;
		}
	}
	return 1;
}

char smemsettest2(){
	puts("testing smemtest2");
	char testc0[MEMSETN];
	char testc1[MEMSETN];
	char testc2[MEMSETN];
	smemset2(&testc0, 0x0000, MEMSETN);
	smemset2(&testc1, 0x1111, MEMSETN);
	smemset2(&testc2, 0x0000, MEMSETN);
	for(char n = 0; n < MEMSETN; n++){
		if(testc1[n] != 0x11){
			puts(ERRORCLR "\tsmemset2 not working, doesn't fill" RESETCLR);
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc0[n] == 0x11){
			puts(ERRORCLR "\tsmemset2 not working, underflows" RESETCLR);
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc2[n] == 0x11){
			puts(ERRORCLR "\tsmemset2 not working, overflows" RESETCLR);
			return 0;
		}
	}
	return 1;
}

char smemsettest4(){
	puts("testing smemtest4");
	char testc0[MEMSETN];
	char testc1[MEMSETN];
	char testc2[MEMSETN];
	smemset4(&testc0, 0x00000000, MEMSETN);
	smemset4(&testc1, 0x11111111, MEMSETN);
	smemset4(&testc2, 0x00000000, MEMSETN);
	for(char n = 0; n < MEMSETN; n++){
		if(testc1[n] != 0x11){
			puts(ERRORCLR "\tsmemset4 not working, doesn't fill" RESETCLR);
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc0[n] == 0x11){
			puts(ERRORCLR "\tsmemset4 not working, underflows" RESETCLR);
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc2[n] == 0x11){
			puts(ERRORCLR "\tsmemset4 not working, overflows" RESETCLR);
			return 0;
		}
	}
	return 1;
}

char smemsettest8(){
	puts("testing smemtest8");
	char testc0[MEMSETN];
	char testc1[MEMSETN];
	char testc2[MEMSETN];
	smemset8(&testc0, 0x0000000000000000, MEMSETN);
	smemset8(&testc1, 0x1111111111111111, MEMSETN);
	smemset8(&testc2, 0x0000000000000000, MEMSETN);
	for(char n = 0; n < MEMSETN; n++){
		if(testc1[n] != 0x11){
			puts(ERRORCLR "\tsmemset8 not working, doesn't fill" RESETCLR);
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc0[n] == 0x11){
			puts(ERRORCLR "\tsmemset8 not working, underflows" RESETCLR);
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc2[n] == 0x11){
			puts(ERRORCLR "\tsmemset8 not working, overflows" RESETCLR);
			return 0;
		}
	}
	return 1;
}

void main(){
	if(smemsettest())
		puts(WORKINGCLR "\tmemtest working" RESETCLR);
	if(smemsettest2())
		puts(WORKINGCLR "\tsmemtest2 working" RESETCLR);
	if(smemsettest4())
		puts(WORKINGCLR "\tsmemtest4 working" RESETCLR);
	if(smemsettest8())
		puts(WORKINGCLR "\tsmemtest8 working" RESETCLR);
}
