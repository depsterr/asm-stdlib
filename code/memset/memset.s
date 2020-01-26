BITS 64

	global smemset:function
	section .text

smemset:
	; rdi, adress
	; edx, amount
	; esi, char

	mov ebx, esi
	add rdx, rdi
	smemset_loop:
		mov [rdx], bl
		dec rdx
		cmp rdi, rdx
		jle smemset_loop

	ret
