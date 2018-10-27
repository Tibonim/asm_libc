	;; déclaration des symboles
	global  strncmp

	section .text

strncmp:
	push    rbp
	mov     rbp, rsp
	push	r8
	push	rcx
	push	rbx
	push	rdi
	push	rsi
	xor     rax, rax
	xor     rbx, rbx
	xor     rcx, rcx
	xor     r8, r8

loop:
	cmp	r8, rdx
	jz	end_loop
	mov	cl, BYTE [rdi]
	mov	bl, BYTE [rsi]
	mov	al, cl
	sub	rax, rbx
	test	al, al
	jnz	end_loop
	test	cl, cl
	jz	end_loop
	test	bl, bl
	jz	end_loop
	inc     rdi
	inc     rsi
	inc	r8
	jmp     loop

end_loop:
	pop     rsi
	pop     rdi
	pop     rbx
	pop     rcx
	pop	r8
	pop     rbp
	ret
