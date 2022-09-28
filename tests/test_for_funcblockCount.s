	.text
	.file	"test_for_funcblockCount.c"
	.globl	foo                             # -- Begin function foo
	.p2align	4, 0x90
	.type	foo,@function
foo:                                    # @foo
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -20(%rbp)
	movl	%esi, -16(%rbp)
	movl	$0, -12(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -8(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	cmpl	$0, -8(%rbp)
	jle	.LBB0_8
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-16(%rbp), %eax
	movl	%eax, -4(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, -4(%rbp)
	jle	.LBB0_6
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-8(%rbp), %eax
	movl	-4(%rbp), %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	cmpl	%ecx, %eax
	cmovgl	%esi, %edx
	addl	-12(%rbp), %edx
	movl	%edx, -12(%rbp)
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-4(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB0_3
.LBB0_6:                                #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_7
.LBB0_7:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB0_1
.LBB0_8:
	movl	-12(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	foo, .Lfunc_end0-foo
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -8(%rbp)
	movl	$5, %edi
	movl	$6, %esi
	callq	foo
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"foo(5, 6)'s result is : %d \n"
	.size	.L.str, 29

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1"
	.section	".note.GNU-stack","",@progbits
