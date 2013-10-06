	.data
orig:	.asciiz "%d, %d, %d -> "
result:	.asciiz	"%d, %d, %d\n"

	.text
sort:
	addiu	$sp,	$sp,	-8
	sd	$ra,	0($sp)

	jal	_sort
	jal	_sort

	ld	$ra,	0($sp)
	addiu	$sp,	$sp,	8
	jr	$ra
	
_sort:
	ble	$a0,	$a1,	_sort1
	xor	$a0,	$a0,	$a1	
	xor	$a1,	$a1,	$a0
	xor	$a0,	$a0,	$a1
_sort1:
	ble	$a1,	$a2,	_sort2
	xor	$a1,	$a1,	$a2
	xor	$a2,	$a2,	$a1
	xor	$a1,	$a1,	$a2
_sort2:
	jr	$ra


	.globl	main
main:
	dla	$a0,	orig
	ori	$a1,	$0,	3
	ori	$a2,	$0,	2
	ori	$a3,	$0,	1
	jal	printf

	ori	$a0,	$0,	3
	ori	$a1,	$0,	2
	ori	$a2,	$0,	1
	jal	sort

	move	$a3,	$a2
	move	$a2,	$a1
	move	$a1,	$a0
	dla	$a0,	result
	jal	printf

	ori	$a0,	$0,	0
	ori	$v0,	$0,	1
	syscall

