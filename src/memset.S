	;; déclaration des symboles
	global  memset

	section .text

memset:
	push    rbp
	mov     rbp, rsp
	push	rdi
	push	rcx
	xor     rcx, rcx
	mov	rax, rdi

loop:
	cmp	rcx, rdx
	je      end_loop
	mov	BYTE [rdi], sil
	inc     rdi
	inc	rcx
	jmp     loop

end_loop:
	pop	rcx
	pop	rdi
	pop     rbp
	ret
