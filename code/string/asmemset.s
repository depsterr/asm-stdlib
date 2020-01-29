BITS 64

	global asmemset:function
	global asmemset2:function
	global asmemset4:function
	global asmemset8:function
section .text

asmemset:
	; rdi, adress / startpoint
	; rsi, char / fill
	; rdx, amount / length / size

	mov rax, rdi
	add rax, 8		; rax is addr 8 after start of addr
	add rdx, rdi	; rdx is the end of mem
	cmp rdx, rax	; if rdx is less than 8 away then jump
	jl asmemset_finalize

	; fill entierty of rcx with repititions of sil
	xor rcx, rcx
	or  cl, sil
	sal rcx, 8
	or  rsi, rcx
	or  cx, si
	sal rcx, 16
	or  rsi, rcx
	or  ecx, esi
	sal rcx, 32
	or  rsi, rcx

	; count downwards 8 bytes at a time
	asmemset_loop:
		sub rdx, 8
		mov [rdx], rsi
		cmp rdx, rax			; if rdx isn't less than 8 away then continue
		jge asmemset_loop

	asmemset_finalize:
	cmp rdx, rdi				; we might be done here, if so, just return
	jne asmemset_finalize_loop

	ret

	asmemset_finalize_loop:
		dec rdx
		mov [rdx], sil
		cmp rdx, rdi
		jg asmemset_finalize_loop

	ret

asmemset2:

	mov rax, rdi
	add rax, 8
	add rdx, rdi
	cmp rdx, rax
	jl asmemset2_finalize

	xor rcx, rcx
	or  cx, si
	sal rcx, 16
	or  rsi, rcx
	or  ecx, esi
	sal rcx, 32
	or  rsi, rcx

	asmemset2_loop:
		sub rdx, 8
		mov [rdx], rsi
		cmp rdx, rax
		jge asmemset2_loop

	asmemset2_finalize:
	cmp rdx, rdi
	jne asmemset2_finalize_loop

	ret

	asmemset2_finalize_loop:
		sub rdx, 2
		mov [rdx], si
		cmp rdx, rdi
		jg asmemset2_finalize_loop

	ret

asmemset4:

	mov rax, rdi
	add rax, 8
	add rdx, rdi
	cmp rdx, rax
	jl asmemset4_finalize

	xor rcx, rcx
	or  ecx, esi
	sal rcx, 32
	or  rsi, rcx

	asmemset4_loop:
		sub rdx, 8
		mov [rdx], rsi
		cmp rdx, rax
		jge asmemset4_loop

	asmemset4_finalize:
	cmp rdx, rdi
	jne asmemset4_finalize_loop

	ret

	asmemset4_finalize_loop:
		sub rdx, 4
		mov [rdx], esi
		cmp rdx, rdi
		jg asmemset4_finalize_loop

	ret

asmemset8:

	add rdx, rdi
	asmemset8_loop:
		sub rdx, 8
		mov [rdx], rsi
		cmp rdx, rdi
		jg asmemset8_loop

	ret
