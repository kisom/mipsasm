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

