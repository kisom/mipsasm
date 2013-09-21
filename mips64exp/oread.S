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
filename:.asciiz "tmp.out"
buffer:	.byte	10

	.text
	.globl	main

main:
	/* open the file */
	li	$v0,	5
	dla	$a0,	filename
	li	$a1,	0		/* O_RDONLY == 0 */
	li	$a2,	0
	syscall
	li	$t8,	3		/* on error, we get 2 */
	bnez	$a3,	errexit

	/* store file descriptor */
	move	$t8,	$v0

	/* read the file */
	li	$v0,	3
	move	$a0,	$t8		/* file descriptor */
	dla	$a1,	buffer
	li	$a2,	10		/* read up to 10 bytes */
	syscall
	bnez	$a3,	errexit

	/* store a NULL byte at end of buffer */
	dla	$t9,	buffer
	add	$t9,	$t9,	$v0
	addi	$t9,	$t9,	1
	sb	$zero,	0($t9)
	move	$t9,	$v0
	addi	$t9,	$t9,	1

	/* close file */
	li	$v0,	6
	move	$a0,	$t8
	syscall

	/* print file to screen */
	li	$v0,	4
	li	$a0,	1		/* filedes = stdin */
	dla	$a1,	buffer
	move	$a2,	$t9
	syscall

	beq	$v0,	$zero,	errexit
	move	$v0,	$zero
	j	exit

errexit:
	li	$v0,	1
exit:
	move	$a0,	$v0
	li	$v0,	1
	syscall
