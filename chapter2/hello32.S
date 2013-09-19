# 32-bit version of hello world
	.data
	.align 4
hello:	.asciiz	"Hello, world.\n"

	.text
	.globl main
main:
	li	$v0,	4
	la	$a0,	hello
	syscall

