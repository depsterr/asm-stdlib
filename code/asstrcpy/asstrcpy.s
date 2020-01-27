BITS 64

	global asstrcpy:function
	global asstrcpy2:function
	global asstrcpy4:function
	global asstrcpy8:function
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

asstrcpy2:
	; rdi, destination adress
	; rsi, source adress

	; add the adress to the amount and then count downwards
	asstrcpy2_loop:
		mov ax, word [rsi]
		mov [rdi], ax
		add rdi, 2
		add rsi, 2
		cmp byte [rsi], 0x0
		jne asstrcpy2_loop

	mov al, byte [rsi]
	mov [rdi], al

	ret

asstrcpy4:
	; rdi, destination adress
	; rsi, source adress

	; add the adress to the amount and then count downwards
	asstrcpy4_loop:
		mov eax, dword [rsi]
		mov [rdi], eax
		add rdi, 4
		add rsi, 4
		cmp byte [rsi], 0x0
		jne asstrcpy4_loop

	mov al, byte [rsi]
	mov [rdi], al

	ret

asstrcpy8:
	; rdi, destination adress
	; rsi, source adress

	; add the adress to the amount and then count downwards
	asstrcpy8_loop:
		mov rax, qword [rsi]
		mov [rdi], rax
		add rdi, 8
		add rsi, 8
		cmp byte [rsi], 0x0
		jne asstrcpy8_loop

	mov al, byte [rsi]
	mov [rdi], al

	ret
