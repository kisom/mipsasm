# find the sum of the first 100 words in the memory location chico,
# storing the result in the first word after chico.
#
# performance indexes:
# 	size of text segment: 19 words (76 bytes)
#	clock cycles: 910 cycles

	.data
	.align 2
chico:	.word	1:100
result:	.word	0

	.text
addword:
	lw	$t0,	0($a0)
	lw	$t1,	result
	add	$t1,	$t0,	$t1
	sw	$t1,	result
	jr	$ra

	.globl	main
main:
	la	$a0,	chico
	xor	$t2,	$t2,	$t2
	ori	$t3,	$0,	100
for:	jal	addword
	addiu	$a0,	$a0,	4
	addiu	$t2,	$t2,	1
	bne	$t2,	$t3,	for
	nop
	lw	$a0,	result
	ori	$v0,	$0,	1
	syscall
	ori	$a0,	$0,	0
	ori	$v0,	$0,	10
	syscall

