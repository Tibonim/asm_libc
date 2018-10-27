	;; déclaration des symboles
	global  strstr

	section .text



strlen:
	push    rbp
	mov     rbp, rsp
	push    rdi
	xor     rcx, rcx

lp:
	mov     al, BYTE [rdi]
	test    al, al
	jz      end_lp
	inc     rdi
	inc     rcx
	jmp     lp

end_lp:
	mov     rax, rcx
	pop     rdi
	pop     rbp
	ret

strncmp:
	push    rbp
	mov     rbp, rsp
	push    r8
	push    rcx
	push    rbx
	push    rdi
	push    rsi
	xor     rax, rax
	xor     rbx, rbx
	xor     rcx, rcx
	xor     r8, r8

lp1:
	cmp     r8, rdx
	jz      end_lp1
	mov     cl, BYTE [rdi]
	mov     bl, BYTE [rsi]
	mov     al, cl
	sub     rax, rbx
	test    al, al
	jnz     end_lp1
	test    cl, cl
	jz      end_lp1
	test    bl, bl
	jz      end_lp1
	inc     rdi
	inc     rsi
	inc     r8
	jmp     lp1

end_lp1:
	pop     rsi
	pop     rdi
	pop     rbx
	pop     rcx
	pop     r8
	pop     rbp
	ret


strstr:
	push    rbp
	mov     rbp, rsp
	push	rdi
	push	rsi
	push	rdx

	push	rdi
	mov	rdi, rsi
	call	strlen
	mov	rdx, rax
	pop	rdi

loop:
	mov	bl, BYTE[rdi]
	test	bl, bl
	jz	end_loop
	call	strncmp
	test	rax, rax
	jz	find
	inc	rdi
	xor	rax, rax
	jmp	loop

find:
	mov	rax, rdi

end_loop:
	pop	rdx
	pop	rsi
	pop	rdi
	pop     rbp
	ret

