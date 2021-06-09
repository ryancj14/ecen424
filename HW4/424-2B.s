	.file	"424-2B.c"
	.text
	.globl	big_array
	.type	big_array, @function
big_array:
.LFB11:
	.cfi_startproc
	movl	$0, %eax
	cvtsi2sd	%eax, %xmm0
	addsd	.LC0(%rip), %xmm0
	addsd	.LC1(%rip), %xmm0
	ret
	.cfi_endproc
.LFE11:
	.size	big_array, .-big_array
	.globl	max_recursion
	.type	max_recursion, @function
max_recursion:
.LFB12:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ebx
	movsd	.LC1(%rip), %xmm0
	cmpl	$1, %edi
	jle	.L3
	leal	-1(%rdi), %edi
	call	max_recursion
	cvtsi2sd	%ebx, %xmm1
	addsd	%xmm1, %xmm0
.L3:
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE12:
	.size	max_recursion, .-max_recursion
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Result returned by big_array() is %e\n"
	.align 8
.LC3:
	.string	"Result returned by max_recursion() is %e\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB13:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	big_array
	movl	$.LC2, %edi
	movl	$1, %eax
	call	printf
	movl	$2, %edi
	call	max_recursion
	movl	$.LC3, %edi
	movl	$1, %eax
	call	printf
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE13:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	0
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
