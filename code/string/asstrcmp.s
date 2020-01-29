BITS 64

	global asstrcmp:function
	global asstrcmp2:function
	global asstrcmp4:function
	global asstrcmp8:function
	section .text

asstrcmp:
	; rdi, first adress
	; rsi, second adress

	; run till end of string or till they are not similair
	asstrcmp_loop:
		mov al, byte [rsi]	; move the byte from rsi into al
		sub	al, byte [rdi]	; use sub instead of cmp since we want to store this as the return value 
		jne	asstrcmp_ret	; if not equal we return the difference
		cmp	byte [rdi], 0x0	; if we hit the end of one of the string we return, if they were the same al will still be 0, otherwise it will be the difference
		je	asstrcmp_ret
		inc rdi
		inc rsi
		jmp asstrcmp_loop

	asstrcmp_ret:

	ret

asstrcmp2:

	asstrcmp2_loop:
		mov ax, word [rsi]
		sub	ax, word [rdi]
		jne	asstrcmp2_ret
		cmp	byte [rdi + 1], 0x0
		je	asstrcmp2_ret
		add rdi, 2
		add rsi, 2
		jmp asstrcmp2_loop

	asstrcmp2_ret:

	ret

asstrcmp4:

	asstrcmp4_loop:
		mov eax, dword [rsi]
		sub	eax, dword [rdi]
		jne	asstrcmp4_ret
		cmp	byte [rdi + 3], 0x0
		je	asstrcmp4_ret
		add rdi, 4
		add rsi, 4
		jmp asstrcmp4_loop

	asstrcmp4_ret:

	ret

asstrcmp8:

	asstrcmp8_loop:
		mov rax, qword [rsi]
		sub	rax, qword [rdi]
		jne	asstrcmp8_ret
		cmp	byte [rdi + 7], 0x0
		je	asstrcmp8_ret
		add rdi, 8
		add rsi, 8
		jmp asstrcmp8_loop

	asstrcmp8_ret:

	ret
