BITS 64

	global asputs:function
	section .data
newline: db 0x0a
	section .text

asputs:
	; rdi, string addr

	mov rdx, rdi	; rdx is string len
	mov rsi, rdi	; rsi is string addr

	; increase rdx till at the null byte
	asputs_loop:
		inc rdx
		cmp byte [rdx], 0x0
		jne asputs_loop

	; remove adress to get length instead of addr
	sub rdx, rdi

	mov rax, 1	; sys_write
	mov rdi, 1	; stdoutput
	;	rsi, string addr
	;	rdx, string len
	syscall	

	mov rax, 1	; sys_write
	mov rdi, 1	; stdoutput
	mov rsi, newline
	mov rdx, 1
	syscall

	ret
