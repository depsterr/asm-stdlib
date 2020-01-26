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
		sub rdx, 2
		mov [rdx], si
		cmp rdx, rdi
		jg smemset2_loop

	ret

smemset4:
	; rdi, adress / startpoint
	; rdx, amount / length / size
	; rsi, char / fill

	; add the adress to the amount and then count downwards
	add rdx, rdi
	smemset4_loop:
		sub rdx, 4
		mov [rdx], esi
		cmp rdx, rdi
		jg smemset4_loop

	ret

smemset8:
	; rdi, adress / startpoint
	; rdx, amount / length / size
	; rsi, char / fill

	; add the adress to the amount and then count downwards
	add rdx, rdi
	smemset8_loop:
		sub rdx, 8
		mov [rdx], rsi
		cmp rdx, rdi
		jg smemset8_loop

	ret
