	;; déclaration des symboles
	global  strchr

	section .text

strchr:
	push    rbp
	mov     rbp, rsp
	push	rdi
	push	rbx
	xor	rax, rax

loop:
	mov     bl, BYTE [rdi]
	cmp	bl, sil
	jz      find
	test    bl, bl
	jz      end_loop
	inc     rdi
	jmp     loop

find:
	mov	rax, rdi
end_loop:
	pop	rbx
	pop	rdi
	pop     rbp
	ret

