/*
 * example of using memcpy
 */

	.data
SRC:	.word	1:100
DST:	.word	0:100

	.text
	.globl	main
main:	.ent	main
	dla	$a0,	DST
	dla	$a1,	SRC
	dla	$a2,	0x64
	jal	memcp

	ori	$v0,	$0,	1
	ori	$a0,	$0,	0
	syscall
	.end	main
