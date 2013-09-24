	.data
	.align 2
prompt:	.asciiz	"Enter a number (0 to exit): "
absval:	.asciiz	"Absolute value is "
newln:	.asciiz	"\n"

	.text
	.globl	main

mabs:	bgez	$a0,	_mabs
	nop
	sub	$a0,	$0,	$a0
_mabs:	jr	$ra
	nop

main:
	ori	$v0,	$0,	4
	la	$a0,	prompt
	syscall

	ori	$v0,	$0,	5
	syscall
	move	$a0,	$v0

	jal	mabs
	move	$t0,	$a0

	ori	$v0,	$0,	4
	la	$a0,	absval
	syscall

	ori	$v0,	$0,	1
	move	$a0,	$t0
	syscall

	ori	$v0,	$0,	4
	la	$a0,	newln
	syscall

	bne	$0,	$t0,	main
	nop

	ori	$v0,	$0,	10
	syscall


