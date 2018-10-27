	;; déclaration des symboles
	global  strcasecmp

	section .text


update_value:
	push    rbp
	mov     rbp, rsp

	cmp	dil, 'a'
	jl	end_if
	cmp	dil, 'z'
	jg	end_if
	sub	dil, 32
end_if:
	pop     rbp
	ret


strcasecmp:
	push    rbp
	mov     rbp, rsp
	push	rbx
	push	rcx
	push	rdi
	push	rsi
	xor	rax, rax
	xor	rbx, rbx

loop:
	mov	al, BYTE [rdi]
	test	al, al
	jz	end_loop
	mov	bl, BYTE [rsi]
	test	bl, bl
	jz	end_loop

	push	rdi
	push	rsi
	mov	rdi, rax
	call	update_value
	mov	rax, rdi
	mov	rdi, rbx
	call	update_value
	mov	rbx, rdi
	pop	rdi
	pop	rsi

	sub	rax, rbx
	cmp	al, 0
	jnz     end_loop
	inc     rdi
	inc     rsi
	jmp     loop

end_loop:
	pop	rsi
	pop	rdi
	pop	rcx
	pop	rbx
	pop     rbp
	ret

