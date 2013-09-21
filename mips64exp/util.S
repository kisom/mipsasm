/*
 * Copyright (c) 2013 Kyle Isom <kyle@tyrfingr.is>
 * 
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above 
 * copyright notice and this permission notice appear in all copies.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

	.data
_timespec:	.dword	2

	.text
	.globl	strlen
	.globl	print
	.globl	sleep

strlen:
	li	$v0,	0
	dla	$t0,	0($a0)
		
_strlen_while:
	lb	$t1,	0($t0)
	beqz	$t1,	_strlen_exit
	addi	$v0,	1
	addi	$t0,	1
	j	_strlen_while
_strlen_exit:
	j	$ra

sleep:
	dla	$t0,	_timespec
	sd	$a0,	0($t0)
	sw	$a1,	8($t0)
	dla	$a0,	_timespec
	li	$a1,	0
	li	$v0,	91
	syscall
	j	$ra

print:
	move	$a1,	$a0
	move	$s0,	$ra
	jal	strlen
	move	$ra,	$s0
	move	$a2,	$v0
	li	$v0,	4
	li	$a0,	1
	syscall
	j	$ra

/*
 * in progress -- needs rethinking
atoi:
	move	$s0,	$ra
	jal	strlen
	move	$ra,	$s0

	li	$t0,	0
	li	$t1,	0
	dla	$t3,	$a0
_atoifor:
	sub	$t2,	$v0,	$t1
	lb	$t8,	0($t3)
	sub	$t8,	$t8,	48
 */
