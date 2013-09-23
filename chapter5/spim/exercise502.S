# write a program to copy the 100 words starting at SRC to DST.

	.data
	.align 2
SRC:	.word 1:100
	.space 46
DST:	.word 0:100

	.text
memcpy:	ori	$t0,	$0,	0
	move	$t1,	$a0
	move	$t2,	$a1
_memcpy:lw	$t3,	0($t2)
	addiu	$t2,	$t2,	4
	addiu	$t1,	$t1,	4
	sw	$t3,	-4($t1)
	addiu	$t0,	$t0,	1
	bne	$t0,	$a2,	_memcpy
	jr	$ra

	.globl	main
main:
	la	$a0,	DST
	la	$a1,	SRC
	ori	$a2,	$0,	0x64
	jal	memcpy

	ori	$v0,	$0,	10
	syscall

