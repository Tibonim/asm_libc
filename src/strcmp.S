	;; déclaration des symboles
	global  strcmp

	section .text

strcmp:
	push    rbp
	mov     rbp, rsp
	push	rcx
	push	rbx
	push	rdi
	push	rsi
	xor	rax, rax
	xor	rbx, rbx
	xor	rcx, rcx

loop:
	mov	cl, BYTE [rdi]
	mov	bl, BYTE [rsi]
	mov	al, cl
	sub	rax, rbx
	cmp	al, 0
	jnz     end_loop
	test	cl, cl
	jz	end_loop
	test	bl, bl
	jz	end_loop
	inc     rdi
	inc     rsi
	jmp     loop

end_loop:
	pop	rsi
	pop	rdi
	pop	rbx
	pop	rcx
	pop     rbp
	ret

