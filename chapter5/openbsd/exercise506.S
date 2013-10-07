/*
 * At this point in the book, dynamic memory allocation is not covered.
 * Accordingly, this exercise uses a fixed-size array to store results.
 * However, printf modifies many of the registers, which requires
 * storing them on the stack. Despite this not being part of the
 * chapter, it is required for proper operation on OpenBSD.
 */

	.data
results:.word	0:7
output:	.asciiz	"Fib(%d): %d\n"

	.text
printres:
	ori	$t0,	$0,	0	# t0 -> counter
	dla	$t1,	results		# t1 -> results
	ori	$t2,	$0,	7
	addiu	$sp,	$sp,	-24
	sd	$ra,	0($sp)
_printres1:
	sd	$t1,	8($sp)
	sw	$t0,	16($sp)
	sw	$t2,	20($sp)
	dla	$a0,	output
	move	$a1,	$t0
	lw	$a2,	0($t1)
	jal	printf
	ld	$t1,	8($sp)
	lw	$t0,	16($sp)
	lw	$t2,	20($sp)
	addiu	$t1,	$t1,	4
	addi	$t0,	$t0,	1
	blt	$t0,	$t2,	_printres1
	ld	$ra,	0($sp)
	addiu	$sp,	$sp,	24
	jr	$ra

fib:	ori	$t1,	$0,	1
	dla	$t0,	0($a1)
	ori	$t2,	$0,	1
	ori	$t3,	$0,	1
	ori	$t8,	$0,	0
	addiu	$t0,	$t0,	4
	sw	$t2,	0($a1)
_fib:	ble	$a0,	$t1,	_fibex
	add	$t2,	$t3,	$t8
	sw	$t2,	0($t0)
	or	$t8,	$0,	$t3
	or	$t3,	$0,	$t2
	addi	$t1,	$t1,	1
	addiu	$t0,	$t0,	4
	j	_fib
_fibex:	jr	$ra

	.globl	main
main:
	dla	$a1,	results
	ori	$a0,	$0,	7
	jal	fib
	jal	printres

	ori	$a0,	$0,	0
	ori	$v0,	$0,	1
	syscall
