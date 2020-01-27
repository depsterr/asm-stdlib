BITS 64

	global asstrcmp:function
	global asstrcmp2:function
	global asstrcmp4:function
	global asstrcmp8:function
	section .text

asstrcmp:
	; rdi, first adress
	; rsi, second adress

	xor eax, eax

	; run till end of string or till they are not similair
	asstrcmp_loop:
		mov al, byte [rsi]
		cmp	byte [rdi], al
		jne	asstrcmp_ret
		cmp	byte [rdi], 0x0
		je	asstrcmp_ret
		inc rdi
		inc rsi
		jmp asstrcmp_loop

	; will make the return value 0 if they are equal
	asstrcmp_ret:
	xor al, byte [rdi]

	ret

asstrcmp2:
	; rdi, first adress
	; rsi, second adress

	xor eax, eax

	; run till end of string or till they are not similair
	asstrcmp2_loop:
		mov ax, word [rsi]
		cmp	word [rdi], ax
		jne	asstrcmp2_ret
		cmp	byte [rdi + 1], 0x0
		je	asstrcmp2_ret
		add rdi, 2
		add rsi, 2
		jmp asstrcmp2_loop

	; will make the return value 0 if they are equal
	asstrcmp2_ret:
	xor ax, word [rdi]

	ret

asstrcmp4:
	; rdi, first adress
	; rsi, second adress

	; run till end of string or till they are not similair
	asstrcmp4_loop:
		mov eax, dword [rsi]
		cmp	dword [rdi], eax
		cmp	byte [rdi + 3], 0x0
		je	asstrcmp4_ret
		add rdi, 4
		add rsi, 4
		jmp asstrcmp4_loop

	; will make the return value 0 if they are equal
	asstrcmp4_ret:
	xor eax, dword [rdi]

	ret

asstrcmp8:
	; rdi, first adress
	; rsi, second adress

	; run till end of string or till they are not similair
	asstrcmp8_loop:
		mov rax, qword [rsi]
		cmp	qword [rdi], rax
		jne	asstrcmp8_ret
		cmp	byte [rdi + 7], 0x0
		je	asstrcmp8_ret
		add rdi, 8
		add rsi, 8
		jmp asstrcmp8_loop

	; will make the return value 0 if they are equal
	asstrcmp8_ret:
	xor rax, qword [rdi]

	ret
