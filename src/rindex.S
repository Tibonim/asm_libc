	;; déclaration des symboles
	global  rindex


	section .text

find:
	mov	rax, rdi
	jmp	suite
rindex:
	push    rbp
	mov     rbp, rsp
	push	rdi
	xor	rax, rax

loop:
	mov     bl, BYTE [rdi]
	test    bl, bl
	jz      end_loop
	cmp	bl, sil
	jz      find
suite:	inc     rdi
	jmp     loop

end_loop:
	pop	rdi
	pop     rbp
	ret

