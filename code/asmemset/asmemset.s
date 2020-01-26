BITS 64

	global asmemset:function
	global asmemset2:function
	global asmemset4:function
	global asmemset8:function
	section .text

asmemset:
	; rdi, adress / startpoint
	; rsi, char / fill
	; rdx, amount / length / size

	; add the adress to the amount and then count downwards
	add rdx, rdi
	asmemset_loop:
		dec rdx
		mov [rdx], sil
		cmp rdx, rdi
		jg asmemset_loop

	ret

asmemset2:
	; rdi, adress / startpoint
	; rdx, amount / length / size
	; rsi, char / fill

	; add the adress to the amount and then count downwards
	add rdx, rdi
	asmemset2_loop:
		sub rdx, 2
		mov [rdx], si
		cmp rdx, rdi
		jg asmemset2_loop

	ret

asmemset4:
	; rdi, adress / startpoint
	; rdx, amount / length / size
	; rsi, char / fill

	; add the adress to the amount and then count downwards
	add rdx, rdi
	asmemset4_loop:
		sub rdx, 4
		mov [rdx], esi
		cmp rdx, rdi
		jg asmemset4_loop

	ret

asmemset8:
	; rdi, adress / startpoint
	; rdx, amount / length / size
	; rsi, char / fill

	; add the adress to the amount and then count downwards
	add rdx, rdi
	asmemset8_loop:
		sub rdx, 8
		mov [rdx], rsi
		cmp rdx, rdi
		jg asmemset8_loop

	ret
