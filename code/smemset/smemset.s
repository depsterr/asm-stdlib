BITS 64

	global smemset:function
	global smemset2:function
	global smemset4:function
	global smemset8:function
	section .text

smemset:
	; rdi, adress / startpoint
	; rsi, char / fill
	; rdx, amount / length / size

	; add the adress to the amount and then count downwards
	add rdx, rdi
	smemset_loop:
		dec rdx
		mov [rdx], sil
		cmp rdx, rdi
		jg smemset_loop

	ret

smemset2:
	; rdi, adress / startpoint
	; rdx, amount / length / size
	; rsi, char / fill

	; add the adress to the amount and then count downwards
	add rdx, rdi
	smemset2_loop:
		mov [rdx], si
		sub rdx, 2
		cmp rdx, rdi
		jge smemset2_loop

	ret

smemset4:
	; rdi, adress / startpoint
	; rdx, amount / length / size
	; rsi, char / fill

	; add the adress to the amount and then count downwards
	add rdx, rdi
	smemset4_loop:
		mov [rdx], esi
		sub rdx, 4
		cmp rdx, rdi
		jge smemset4_loop

	ret

smemset8:
	; rdi, adress / startpoint
	; rdx, amount / length / size
	; rsi, char / fill

	; add the adress to the amount and then count downwards
	add rdx, rdi
	smemset8_loop:
		mov [rdx], rsi
		sub rdx, 8
		cmp rdx, rdi
		jge smemset8_loop

	ret

