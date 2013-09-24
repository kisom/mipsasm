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

	.text
	.globl	memcp
memcp:
	xor	$t0,	$t0,	$t0
	move	$t1,	$a0
	move	$t2,	$a1
_memcp:
	lw	$t3,	0($t2)
	addiu	$t2,	$t2,	4
	addiu	$t0,	$t0,	1
	sw	$t3,	0($t1)
	bne	$t0,	$a2,	_memcp
	addiu	$t1,	$t1,	4
	jr	$ra

