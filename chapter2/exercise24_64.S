# Exercise 2.4, 64-bit edition
# Needs to be updated with the proper syscalls.
# TODO: write atoi, itoa functions.
	.data
	.align 4
prompt0:.asciiz "s0: "
prompt1:.asciiz "s1: "
prompt2:.asciiz "s2: "
prompt3:.asciiz "t0: "

	.text
	.globl main

# prior to calling, load $a0 with the prompt.
# reads an integer in $v0.
prompt:
	li	$v0,	4
	syscall
	li	$v0,	5
	syscall
	j $ra

# prompt user for values of s[0-2], calculate t0, display
# the result to stdout and exit.
main:
	dla	$a0,	prompt0
	jal	prompt
	move	$s0,	$v0
	dla	$a0,	prompt1
	jal	prompt
	move	$s1,	$v0
	dla	$a0,	prompt2
	jal	prompt
	move	$s2,	$v0

	li	$t1,	8
	div	$t0,	$s0,	$t1
	add	$t2,	$s1,	$s1
	sub	$t0,	$t0,	$t2
	add	$t0,	$t0,	$s2       

	li	$v0,	4
	dla	$a0,	prompt3
	syscall
	li	$v0,	1
	move	$a0,	$t0
	syscall	

	li	$v0,	1
	syscall
