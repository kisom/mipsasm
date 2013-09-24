	.text
	.globl	main
main:
	ori	$a0,	$0,	10
	jal	mabs

	ori	$a0,	$0,	10
	sub	$a0,	$0,	$a0
	jal	mabs

	ori	$v0,	$0,	1
	ori	$a0,	$0,	0
	syscall
