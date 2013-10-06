	.data
array:	.word	2, 1, 7, 13, 6, -1, 37, 18, 38
out:	.asciiz	"Min: %d\nMax: %d\n"

	.text

maxmin:
	move	$t1,	$a0
	lw	$v0,	0($a0)
	ori	$v1,	$0,	0
	ori	$t2,	$0,	1

_maxmin:
	lw	$t0,	0($t1)
	bgt	$t0,	$v0,	_maxmin1
	move	$v0,	$t0
	j	_maxmin2

_maxmin1:
	blt	$t0,	$v1,	_maxmin2
	move	$v1,	$t0
_maxmin2:
	addi	$t2,	$t2,	1
	addi	$t1,	$t1,	4
	ble	$t2,	$a1,	_maxmin
	jr	$ra

	.globl	main
main:
	dla	$a0,	array
	ori	$a1,	$0,	9
	jal	maxmin

	dla	$a0,	out
	move	$a1,	$v0
	move	$a2,	$v1
	jal	printf

	ori	$a0,	$0,	0
	ori	$v0,	$0,	1
	syscall
