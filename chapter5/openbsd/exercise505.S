/*
 * Slightly modified from original exercise reqirements;
 * the exercise dictates the use only of $v0, i.e. for
 * 32-bit results. The final input, 654321, requires
 * 64-bit results in order to avoid overflow. Accordingly,
 * $v1 is used to store the high 32-bits, and $v0 is used
 * to store the low 32-bits. Alternatively, one could check
 * for overflow and print an appropriate error message, but
 * implementing 64-bit results was more interesting.
 */

	.data
out:	.asciiz	"Sum(N) = %lu\n"

	.text
sum:
	ori	$v0,	$0,	0
	ori	$v1,	$0,	0
	move	$t0,	$a0
	addi	$t0,	$t0,	1
	multu	$a0,	$t0
	mflo	$v0
	mfhi	$v1
	srl	$v0,	$v0,	1

	move	$t0,	$v1
	andi	$t0,	$t0,	1
	sll	$t0,	$t0,	31
	srl	$v1,	$v1,	1
	add	$v0,	$v0,	$t0
	j	$ra

displaysum:
	addiu	$sp,	$sp,	-16
	sd	$ra,	8($sp)

	jal	sum
	sw	$v0,	4($sp)
	sw	$v1,	0($sp)
	dla	$a0,	out
	ld	$a1,	0($sp)
	jal	printf
	ld	$ra,	8($sp)
	addiu	$sp,	$sp,	16
	j	$ra

	.globl	main
main:
	ori	$a0,	$0,	9
	jal	displaysum

	ori	$a0,	$0,	10
	jal	displaysum

	ori	$a0,	$0,	32666
	jal	displaysum

	ori	$a0,	$0,	32777
	jal	displaysum

	# load 654321
	lui	$a0,	9
	ori	$a0,	$a0,	64497
	jal	displaysum

exit:
	ori	$a0,	$0,	0
	ori	$v0,	$0,	1
	syscall

