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

	asmemset_loop:
		sub rdx, 8
		mov [rdx], rsi
		cmp rdx, rax			; if rdx is less than 8 away then continue
		jge asmemset_loop

	asmemset_finalize:
	cmp rdx, rdi
	je asmemset_ret

	asmemset_finalize_loop:
		dec rdx
		mov [rdx], sil
		cmp rdx, rdi
		jg asmemset_finalize_loop

	asmemset_ret:

	ret

asmemset2:
	; rdi, adress / startpoint
	; rsi, char / fill
	; rdx, amount / length / size

	mov rax, rdi
	add rax, 8		; rax is addr 8 after start of addr
	add rdx, rdi	; rdx is the end of mem
	cmp rdx, rax	; if rdx is less than 8 away then jump
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
		cmp rdx, rax			; if rdx is less than 8 away then continue
		jge asmemset2_loop

	asmemset2_finalize:
	cmp rdx, rdi
	je asmemset_ret

	asmemset2_finalize_loop:
		sub rdx, 2
		mov [rdx], si
		cmp rdx, rdi
		jg asmemset2_finalize_loop

	asmemset2_ret:

	ret

asmemset4:
	; rdi, adress / startpoint
	; rsi, char / fill
	; rdx, amount / length / size

	mov rax, rdi
	add rax, 8		; rax is addr 8 after start of addr
	add rdx, rdi	; rdx is the end of mem
	cmp rdx, rax	; if rdx is less than 8 away then jump
	jl asmemset4_finalize

	xor rcx, rcx
	or  ecx, esi
	sal rcx, 32
	or  rsi, rcx

	asmemset4_loop:
		sub rdx, 8
		mov [rdx], rsi
		cmp rdx, rax			; if rdx is less than 8 away then continue
		jge asmemset4_loop

	asmemset4_finalize:
	cmp rdx, rdi
	je asmemset_ret

	asmemset4_finalize_loop:
		sub rdx, 4
		mov [rdx], esi
		cmp rdx, rdi
		jg asmemset4_finalize_loop

	asmemset4_ret:

	ret

asmemset8:
	; rdi, adress / startpoint
	; rdx, amount / length / size
	; rsi, char / fill

	; add the adress to the amount and then count downwards
	add rdx, rdi
	asmemset8_loop:
		sub rdx, 8
		mov [rdx], rsi
		cmp rdx, rdi
		jg asmemset8_loop

	ret
