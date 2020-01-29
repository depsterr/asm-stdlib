BITS 64

	global asstrcpy:function
	global asstrcpy2:function
	global asstrcpy4:function
	global asstrcpy8:function
	section .text

asstrcpy:
	; rdi, destination adress
	; rsi, source adress

	; move byte from rsi to rdi till rsi is 0x0
	asstrcpy_loop:
		mov al, byte [rsi]
		mov [rdi], al
		inc rdi
		inc rsi
		cmp byte [rsi], 0x0
		jne asstrcpy_loop

	mov byte [rdi], 0x0 ; we hit 0x0 so we're gonna put that one in

	ret

asstrcpy2:

	asstrcpy2_loop:
		mov ax, word [rsi]
		mov [rdi], ax
		add rdi, 2
		add rsi, 2
		cmp byte [rsi], 0x0
		jne asstrcpy2_loop

	mov byte [rdi], 0x0

	ret

asstrcpy4:

	asstrcpy4_loop:
		mov eax, dword [rsi]
		mov [rdi], eax
		add rdi, 4
		add rsi, 4
		cmp byte [rsi], 0x0
		jne asstrcpy4_loop

	mov byte [rdi], 0x0

	ret

asstrcpy8:

	asstrcpy8_loop:
		mov rax, qword [rsi]
		mov [rdi], rax
		add rdi, 8
		add rsi, 8
		cmp byte [rsi], 0x0
		jne asstrcpy8_loop

	mov byte [rdi], 0x0

	ret
