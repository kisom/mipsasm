/*
 * calculate the sum of the main diagonal of an NxN matrix, and
 * determine the performance of the algorithm where N=4.
 */

	.data
result:	.asciiz	"Sum of main diagonal: %d\n"
matrix3:.word	1, 2, 3
	.word	4, 5, 6
	.word	7, 8, 9
matrix4:.word	1, 2, 3, 4
	.word	5, 6, 7, 8
	.word	9, 10, 11, 12
	.word	13, 14, 15, 16

	.text
sumdg:	ori	$v0,	$0,	0	# initialise sum
	ori	$t0,	$0,	0	# initialise index
	dla	$t2,	0($a1)
_sumdg:	multu	$t0,	$a0
	mflo	$t3
	addu	$t3,	$t3,	$t0
	sll	$t3,	$t3,	2
	addu	$t3,	$t2,	$t3
	lw	$t3,	0($t3)
	add	$v0,	$v0,	$t3
	addi	$t0,	$t0,	1
	bne	$t0,	$a0,	_sumdg
	jr	$ra

	.globl	main
main:	dla	$a1,	matrix4
	ori	$a0,	$0,	4
	jal	sumdg

	dla	$a0,	result
	move	$a1,	$v0
	jal	printf

	ori	$a0,	$0,	0
	ori	$v0,	$0,	1
	syscall

/*
 * performance evaluation:
 * 	worst case:
 *	3 + (35 + 8) * 4 + 1 = 288 cycles
 *	best case:
 *	3 + (20 + 8) * 4 + 1 = 116 cycles
 * See exercise 5.11 for the reference for multiplication clock cycles
 * on the R10000 CPU. Of course, the performance will likely vary on the
 * O2.
 */
