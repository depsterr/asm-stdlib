BITS 64

	global asstrcat:function
	section .text

asstrcat:
	; rdi, destination adress
	; rsi, source adress

	; move rdi to the end of the destination string
	asstrcat_loop:
		inc rdi
		cmp byte [rdi], 0x0
		jne asstrcat_loop

	; strcpy from source to destination
	asstrcat_cp_loop:
		mov al, byte [rsi]
		mov [rdi], al
		inc rdi
		inc rsi
		cmp byte [rsi], 0x0
		jne asstrcat_cp_loop

	mov al, byte [rsi]
	mov [rdi], al

	ret
