	;; déclaration des symboles
	global  strpbrk

	section .text

strone:
	push    rbp
	push	rsi
	mov     rbp, rsp
	mov	rdx, rsi
	xor	rax, rax
lp:
	mov	sil, BYTE[rdx]
	test	sil, sil
	jz	end_lp
	cmp	cl, sil
	jz	find
	inc	rdx
	jmp	lp

find:
	mov     rax, rdi
end_lp:
	pop	rsi
	pop     rbp
	ret


strpbrk:
	push    rbp
	mov     rbp, rsp
	xor	rax, rax
loop:
	mov	cl, BYTE[rdi]
	test	cl, cl
	jz	end_loop
	call	strone
	test	rax, rax
	jnz	end_loop
	inc	rdi
	jmp	loop
end_loop:
	pop     rbp
	ret

