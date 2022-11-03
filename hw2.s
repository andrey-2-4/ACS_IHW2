	.intel_syntax noprefix
	.text
	.globl	str
	.bss
	.align 32
	.type	str, @object
	.size	str, 1002
str:
	.zero	1002
	.globl	substr
	.align 32
	.type	substr, @object
	.size	substr, 1002
substr:
	.zero	1002
	.globl	indexes
	.align 32
	.type	indexes, @object
	.size	indexes, 4008
indexes:
	.zero	4008
	.text
	.globl	finder
	.type	finder, @function
finder:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	lea	rax, str[rip]
	mov	rdi, rax
	call	strlen@PLT
	mov	DWORD PTR -16[rbp], eax
	lea	rax, substr[rip]
	mov	rdi, rax
	call	strlen@PLT
	mov	DWORD PTR -20[rbp], eax
	mov	DWORD PTR -8[rbp], 0
	jmp	.L2
.L8:
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, indexes[rip]
	mov	DWORD PTR [rdx+rax], -1
	mov	BYTE PTR -1[rbp], 116
	mov	DWORD PTR -12[rbp], 0
	jmp	.L3
.L6:
	mov	edx, DWORD PTR -8[rbp]
	mov	eax, DWORD PTR -12[rbp]
	add	eax, edx
	cdqe
	lea	rdx, str[rip]
	movzx	edx, BYTE PTR [rax+rdx]
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	lea	rcx, substr[rip]
	movzx	eax, BYTE PTR [rax+rcx]
	cmp	dl, al
	je	.L4
	mov	BYTE PTR -1[rbp], 102
	jmp	.L5
.L4:
	add	DWORD PTR -12[rbp], 1
.L3:
	mov	eax, DWORD PTR -20[rbp]
	sub	eax, 1
	cmp	DWORD PTR -12[rbp], eax
	jl	.L6
.L5:
	cmp	BYTE PTR -1[rbp], 116
	jne	.L7
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rcx, 0[0+rax*4]
	lea	rdx, indexes[rip]
	mov	eax, DWORD PTR -8[rbp]
	mov	DWORD PTR [rcx+rdx], eax
.L7:
	add	DWORD PTR -8[rbp], 1
.L2:
	mov	eax, DWORD PTR -16[rbp]
	sub	eax, DWORD PTR -20[rbp]
	cmp	DWORD PTR -8[rbp], eax
	jle	.L8
	nop
	nop
	leave
	ret
	.size	finder, .-finder
	.section	.rodata
.LC0:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \321\201\321\202\321\200\320\276\320\272\321\203: "
	.align 8
.LC1:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \320\277\320\276\320\264\321\201\321\202\321\200\320\276\320\272\321\203: "
.LC2:
	.string	"\320\230\320\275\320\264\320\265\320\272\321\201\321\213: "
.LC3:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR stdin[rip]
	mov	rdx, rax
	mov	esi, 1002
	lea	rax, str[rip]
	mov	rdi, rax
	call	fgets@PLT
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR stdin[rip]
	mov	rdx, rax
	mov	esi, 1002
	lea	rax, substr[rip]
	mov	rdi, rax
	call	fgets@PLT
	lea	rax, str[rip]
	mov	rdi, rax
	call	strlen@PLT
	mov	DWORD PTR -8[rbp], eax
	lea	rax, substr[rip]
	mov	rdi, rax
	call	strlen@PLT
	mov	DWORD PTR -12[rbp], eax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	jle	.L10
	mov	edi, 10
	call	putchar@PLT
	mov	eax, 0
	jmp	.L11
.L10:
	mov	eax, 0
	call	finder
	mov	DWORD PTR -4[rbp], 0
	jmp	.L12
.L14:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, indexes[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cmp	eax, -1
	je	.L13
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, indexes[rip]
	mov	eax, DWORD PTR [rdx+rax]
	mov	esi, eax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edi, 32
	call	putchar@PLT
.L13:
	add	DWORD PTR -4[rbp], 1
.L12:
	mov	eax, DWORD PTR -8[rbp]
	sub	eax, DWORD PTR -12[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jle	.L14
	mov	edi, 10
	call	putchar@PLT
	mov	eax, 0
.L11:
	leave
	ret
