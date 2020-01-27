BITS 64

	global asstrcat:function
	global asstrcat2:function
	global asstrcat4:function
	global asstrcat8:function
	section .text

asstrcat:
	; rdi, destination adress
	; rsi, source adress

	; add the adress to the amount and then count downwards
	asstrcat_loop:
		mov al, byte [rsi]
		mov [rdi], al
		inc rdi
		inc rsi
		cmp byte [rsi], 0x0
		jne asstrcat_loop

	mov al, byte [rsi]
	mov [rdi], al

	ret

asstrcat2:
	; rdi, destination adress
	; rsi, source adress

	; add the adress to the amount and then count downwards
	asstrcat2_loop:
		mov ax, word [rsi]
		mov [rdi], ax
		add rdi, 2
		add rsi, 2
		cmp byte [rsi], 0x0
		jne asstrcat2_loop

	mov al, byte [rsi]
	mov [rdi], al

	ret

asstrcat4:
	; rdi, destination adress
	; rsi, source adress

	; add the adress to the amount and then count downwards
	asstrcat4_loop:
		mov eax, dword [rsi]
		mov [rdi], eax
		add rdi, 4
		add rsi, 4
		cmp byte [rsi], 0x0
		jne asstrcat4_loop

	mov al, byte [rsi]
	mov [rdi], al

	ret

asstrcat8:
	; rdi, destination adress
	; rsi, source adress

	; add the adress to the amount and then count downwards
	asstrcat8_loop:
		mov rax, qword [rsi]
		mov [rdi], rax
		add rdi, 8
		add rsi, 8
		cmp byte [rsi], 0x0
		jne asstrcat8_loop

	mov al, byte [rsi]
	mov [rdi], al

	ret
