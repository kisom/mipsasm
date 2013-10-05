	.data
	.align 2
penum:	.word	0		# should be 10
nonum:	.word	0		# should be -6
X:	.word -5, 1, -2, 3, 4, 0, 6, -1
peout:	.asciiz	"Sum of positive, even numbers: %d\n"
noout:	.asciiz	"Sum of negative, odd numbers: %d\n"

	.text
	.globl main
peno:
	addiu	$sp,	$sp,	-4
	ori	$t0,	$0,	0
	sw	$t0,	0($sp)
penotop:
	lw	$t1,	0($a0)
	bltz	$t1,	nofound

	andi	$t0,	$t1,	1
	bne	$t0,	$0,	penoloop
	lw	$t0,	penum
	add	$t0,	$t0,	$t1
	sw	$t0,	penum
	j	penoloop
nofound:
	andi	$t0,	$t1,	1
	beq	$t0,	$0,	penoloop
	lw	$t0,	nonum
	add	$t0,	$t0,	$t1
	sw	$t0,	nonum
penoloop:
	lw	$t0,	0($sp)
	addiu	$a0,	4
	addi	$t0,	$t0,	1
	sw	$t0,	0($sp)
	bne	$t0,	$a1,	penotop
	addiu	$sp,	$sp,	4
	jr	$ra

main:
	dla	$a0,	X
	ori	$a1,	$0,	8
	jal	peno

	dla	$a0,	peout
	lw	$a1,	penum
	jal	printf

	dla	$a0,	noout
	lw	$a1,	nonum
	jal	printf

	ori	$a0,	$0,	0
	ori	$v0,	$0,	1
	syscall
