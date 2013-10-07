/*
 * calculate the determinant of a 2x2 matrix. For the provided matrix,
 * the determinant is 10.
 */

	.data
detout:	.asciiz	"Determinant = %d\n"
matrix2:.word	1, 2
	.word	3, 4

	.text
det2:	ori	$v0,	$0,	0
	lw	$t0,	0($a0)		# load value of 0,0
	lw	$t1,	12($a0)
	mult	$t0,	$t1
	lw	$t2,	4($a0)
	lw	$t3,	8($a0)
	mflo	$t0
	add	$v0,	$v0,	$t0
	mult	$t2,	$t3
	mflo	$t0
	add	$v0,	$v0,	$t0
	jr	$ra

	.globl	main
main:	dla	$a0,	matrix2
	jal	det2

	dla	$a0,	detout
	move	$a1,	$v0
	jal	printf

	ori	$a0,	$0,	0
	ori	$v0,	$0,	1
	syscall
