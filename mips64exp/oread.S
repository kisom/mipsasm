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
	.align 1
buffer:	.byte	10

	.text
	.globl	main

main:
	/* open the file */
	li	$v0,	5
	la	$a0,	filename
	li	$a1,	0		/* O_RDONLY == 0 */
	li	$a2,	0
	syscall
	bgtz	$v0,	exit

	/* store file descriptor */
	move	$t8,	$v0

	/* read the file */
	li	$v0,	3
	move	$a0,	$t8		/* file descriptor */
	la	$a1,	buffer
	li	$a2,	10		/* read up to 10 bytes */
	syscall
	bltz	$v0,	exit

	la	$t7,	buffer
	add	$t7,	$t7,	$v0
	addi	$t7,	$t7,	1
	sb	$zero,	$t7

exit:
	move	$a0,	$v0
	li	$v0,	1
	syscall
