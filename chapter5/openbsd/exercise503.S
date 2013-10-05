	.data
absval:	.asciiz	"ABS(%d) = %d\n"

	.text
	.globl	main
main:
	ori	$a0,	$0,	10
	jal	mabs

	move	$a2,	$a0
	dla	$a0,	absval
	ori	$a1,	$0,	10
	jal	printf


	li	$a0,	-10
	sub	$a0,	$0,	$a0
	jal	mabs

	move	$a2,	$a0
	dla	$a0,	absval
	li	$a1,	-10
	jal	printf

	ori	$v0,	$0,	1
	ori	$a0,	$0,	0
	syscall
