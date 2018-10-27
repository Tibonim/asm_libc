	;; déclaration des symboles
	global  memmove


	section .bss
tab:	resb	1230

	section .text

memmove:
	push    rbp
	mov     rbp, rsp
	push	rcx
	push	r8
	push	rsi
	push	rdi
	mov	rax, rdi
	xor	rcx, rcx
	mov	r8, tab

loop:
	cmp	rcx, rdx
	jz	end_loop
	mov	bl, BYTE [rsi]
	mov	BYTE [r8], bl
	inc     rsi
	inc     r8
	inc     rcx
	jmp     loop

end_loop:
	mov	BYTE [r8], 0
	mov	r8, tab

	xor	rcx, rcx
loop2:
	cmp	rcx, rdx
	jz	end_loop2
	mov	bl, BYTE [r8]
	test	bl, bl
	jz	end_loop_bis2
	mov	BYTE [rdi], bl
	inc     rdi
	inc     r8
	jmp     loop2

end_loop_bis2:
	mov	BYTE [rdi], 0

end_loop2:
	pop	rdi
	pop	rsi
	pop	r8
	pop	rcx
	pop     rbp
	ret
