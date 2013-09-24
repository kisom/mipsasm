	.text
	.globl	mabs
	.set noreorder
mabs:	bgez	$a0,	_mabsex
	nop
	sub	$a0,	$0,	$a0
_mabsex:jr	$ra
	nop
	.set reorder
