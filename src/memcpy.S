	;; déclaration des symboles
	global  memcpy

	section .text

memcpy:
	push    rbp
	mov     rbp, rsp
	push	rcx
	push	rdi
	push	rsi
	mov     rcx, 0
	mov	rax, rdi

loop:
	cmp	rcx, rdx
	jz      end_loop
	mov	bl, BYTE [rsi]
	mov	BYTE [rdi], bl
	inc     rdi
	inc     rsi
	inc	rcx
	jmp     loop

end_loop:
	pop	rsi
	pop	rdi
	pop	rcx
	pop     rbp
	ret

