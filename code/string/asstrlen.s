BITS 64

	global asstrlen:function
	section .text

asstrlen:
	; rdi, string addr

	; rax will be return
	mov rax, rdi

	; increase rax till at the null byte
	asstrlen_loop:
		inc rax
		cmp byte [rax], 0x0
		jne asstrlen_loop

	; remove adress to get length instead of addr
	sub rax, rdi

	ret
