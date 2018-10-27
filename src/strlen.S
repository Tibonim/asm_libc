	;;déclaration des symboles
	global	strlen

	;;  code
	section	.text	;;  déclaration d'une section pour contenir le code

strlen:	;;déclaration d'un label
	push    rbp
	mov     rbp, rsp
	push	rdi
	xor	rcx, rcx

loop:
	mov	al, BYTE [rdi]
	test	al, al
	jz	end_loop
	inc	rdi
	inc	rcx
	jmp	loop

end_loop:
	mov	rax, rcx
	pop	rdi
	pop     rbp
	ret
