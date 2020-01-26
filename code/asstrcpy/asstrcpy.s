BITS 64

	global asstrcpy:function
	section .text

asstrcpy:
	; rdi, destination adress
	; rsi, source adress

	; add the adress to the amount and then count downwards
	asstrcpy_loop:
		mov al, byte [rsi]
		mov [rdi], al
		inc rdi
		inc rsi
		cmp byte [rsi], 0x0
		jne asstrcpy_loop

	mov al, byte [rsi]
	mov [rdi], al

	ret
