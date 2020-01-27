#include "../code/asm-stdlib.h"
#include <stdio.h>

#define ERRORCLR "\x1b[31m"
#define WORKINGCLR "\x1b[32m"
#define RESETCLR "\033[0m"

char asmemsettest(){
	puts("testing asmemset");
	int MEMSETN = 90;
	char testc0[MEMSETN];
	char testc1[MEMSETN];
	char testc2[MEMSETN];
	asmemset(&testc0, 0x00, MEMSETN);
	asmemset(&testc2, 0x00, MEMSETN);
	asmemset(&testc1, 0x11, MEMSETN);
	for(char n = 0; n < MEMSETN; n++){
		if(testc1[n] != 0x11){
			puts(ERRORCLR "\tasmemset not working, doesn't fill" RESETCLR);
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc0[n] == 0x11){
			puts(ERRORCLR "\tasmemset not working, underflows" RESETCLR);
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc2[n] == 0x11){
			puts(ERRORCLR "\tasmemset not working, overflows" RESETCLR);
			return 0;
		}
	}
	return 1;
}

char asmemsettest2(){
	puts("testing asmemset2");
	int MEMSETN = 90;
	char testc0[MEMSETN];
	char testc1[MEMSETN];
	char testc2[MEMSETN];
	asmemset2(&testc0, 0x0000, MEMSETN);
	asmemset2(&testc2, 0x0000, MEMSETN);
	asmemset2(&testc1, 0x1111, MEMSETN);
	for(char n = 0; n < MEMSETN; n++){
		if(testc1[n] != 0x11){
			puts(ERRORCLR "\tasmemset2 not working, doesn't fill" RESETCLR);
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc0[n] == 0x11){
			puts(ERRORCLR "\tasmemset2 not working, underflows" RESETCLR);
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc2[n] == 0x11){
			puts(ERRORCLR "\tasmemset2 not working, overflows" RESETCLR);
			return 0;
		}
	}
	return 1;
}

char asmemsettest4(){
	puts("testing asmemset4");
	int MEMSETN = 100;
	char testc0[MEMSETN];
	char testc1[MEMSETN];
	char testc2[MEMSETN];
	asmemset4(&testc0, 0x00000000, MEMSETN);
	asmemset4(&testc2, 0x00000000, MEMSETN);
	asmemset4(&testc1, 0x11111111, MEMSETN);
	for(char n = 0; n < MEMSETN; n++){
		if(testc1[n] != 0x11){
			puts(ERRORCLR "\tasmemset4 not working, doesn't fill" RESETCLR);
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc0[n] == 0x11){
			puts(ERRORCLR "\tasmemset4 not working, underflows" RESETCLR);
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc2[n] == 0x11){
			puts(ERRORCLR "\tasmemset4 not working, overflows" RESETCLR);
			return 0;
		}
	}
	return 1;
}

char asmemsettest8(){
	puts("testing asmemeset8");
	int MEMSETN = 80;
	char testc0[MEMSETN];
	char testc1[MEMSETN];
	char testc2[MEMSETN];
	asmemset8(&testc0, 0x0000000000000000, MEMSETN);
	asmemset8(&testc2, 0x0000000000000000, MEMSETN);
	asmemset8(&testc1, 0x1111111111111111, MEMSETN);
	for(char n = 0; n < MEMSETN; n++){
		if(testc1[n] != 0x11){
			puts(ERRORCLR "\tasmemset8 not working, doesn't fill" RESETCLR);
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc0[n] == 0x11){
			puts(ERRORCLR "\tasmemset8 not working, underflows" RESETCLR);
			return 0;
		}
	}
	for(char n = 0; n < MEMSETN; n++){
		if(testc2[n] == 0x11){
			puts(ERRORCLR "\tasmemset8 not working, overflows" RESETCLR);
			return 0;
		}
	}
	return 1;
}

char asstrcpytest(){
	puts("testing asstrcpy");
	char teststr1[40] = "thisisalongteststringthatwillbecopeid:)";
	char teststr2[40];
	char overflow = 0x0;
	asstrcpy(&teststr2, &teststr1);
	for(int n = 0; n < 4; n++){
		if(teststr1[n] != teststr2[n]){
			puts(ERRORCLR "\tstrcpy not copying" RESETCLR);
			return 0;
		}
	}
	if(overflow != 0x0){
		puts(ERRORCLR "\tstrcpy overflowing" RESETCLR);
		return 0;
	}

	return 1;
}

char asstrcpytest2(){
	puts("testing asstrcpy2");
	char teststr1[40] = "thisisalongteststringthatwillbecopeid:)";
	char teststr2[40];
	char overflow = 0x0;
	asstrcpy2(&teststr2, &teststr1);
	for(int n = 0; n < 4; n++){
		if(teststr1[n] != teststr2[n]){
			puts(ERRORCLR "\tstrcpy2 not copying" RESETCLR);
			return 0;
		}
	}
	if(overflow != 0x0){
		puts(ERRORCLR "\tstrcpy2 overflowing" RESETCLR);
		return 0;
	}

	return 1;
}

char asstrcpytest4(){
	puts("testing asstrcpy4");
	char teststr1[40] = "thisisalongteststringthatwillbecopeid:)";
	char teststr2[40];
	char overflow = 0x0;
	asstrcpy4(&teststr2, &teststr1);
	for(int n = 0; n < 4; n++){
		if(teststr1[n] != teststr2[n]){
			puts(ERRORCLR "\tstrcpy4 not copying" RESETCLR);
			return 0;
		}
	}
	if(overflow != 0x0){
		puts(ERRORCLR "\tstrcpy4 overflowing" RESETCLR);
		return 0;
	}

	return 1;
}

char asstrcpytest8(){
	puts("testing asstrcpy8");
	char teststr1[40] = "thisisalongteststringthatwillbecopeid:)";
	char teststr2[40];
	char overflow = 0x0;
	asstrcpy2(&teststr2, &teststr1);
	for(int n = 0; n < 4; n++){
		if(teststr1[n] != teststr2[n]){
			puts(ERRORCLR "\tstrcpy8 not copying" RESETCLR);
			return 0;
		}
	}
	if(overflow != 0x0){
		puts(ERRORCLR "\tstrcpy8 overflowing" RESETCLR);
		return 0;
	}

	return 1;
}

void main(){
	if(asmemsettest())
		puts(WORKINGCLR "\tasmemset working" RESETCLR);
	if(asmemsettest2())
		puts(WORKINGCLR "\tasmemset2 working" RESETCLR);
	if(asmemsettest4())
		puts(WORKINGCLR "\tasmemset4 working" RESETCLR);
	if(asmemsettest8())
		puts(WORKINGCLR "\tasmemset8 working" RESETCLR);
	if(asstrcpytest())
		puts(WORKINGCLR "\tasstrcpy working" RESETCLR);
	if(asstrcpytest2())
		puts(WORKINGCLR "\tasstrcpy2 working" RESETCLR);
	if(asstrcpytest4())
		puts(WORKINGCLR "\tasstrcpy4 working" RESETCLR);
	if(asstrcpytest8())
		puts(WORKINGCLR "\tasstrcpy8 working" RESETCLR);
}
