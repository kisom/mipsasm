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

#define	STDOUT	1

	.data
child:	.asciiz	"Child is exiting.\n"
parent:	.asciiz	"Parent is exiting.\n"
daemon:	.asciiz	"Daemon is exiting.\n"
sleep:	.word	0, 5, 0 ,0

	.text
	.globl main

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
	dla	$t0,	prompt
	addi	$t0,	$t0,	12
	j	$t0

_sleep:
	dla	$a0,	sleep
	li	$a1,	0
	li	$v0,	91
	syscall
	j	$ra

prompt:
	move	$a1,	$a0
	j	strlen
	move	$a2,	$v0
	li	$v0,	4
	li	$a0,	STDOUT
	syscall
	j	$ra

doublefork:
	jal	_sleep
	li	$v0,	2
	syscall
	beqz	$v0,	daemonised
	dla	$a0,	child
	jal	prompt
	j	exit	

daemonised:
	jal	_sleep
	dla	$a0,	daemon
	jal	prompt
	j	exit

errexit:
	li	$v0,	1
	li	$a0,	1
	syscall

main:
	li	$v0,	2
	syscall
	beqz	$v0,	doublefork
	dla	$a0,	parent
	jal	prompt

exit:
	li	$v0,	1
	li	$a0,	0
	syscall
