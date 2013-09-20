.data
filename:.asciiz	"tmp.out"
filedata:.asciiz	"hello\n"
.text
.globl	main

main:
	# open "tmp.out".
	li	$v0,	5
	dla	$a0,	filename
	li	$a1,	513		# O_WRONLY|O_CREAT
	li	$a2,	420		# 0420 -> 0644 (rw-r--r--)
	syscall

	# store file descriptor in $t8
	move	$t8,	$v0

	# write "hello\n" to tmp.out
	li	$v0,	4
	move	$a0,	$t8
	dla	$a1,	filedata
	li	$a2,	6		# strlen("hello\n") == 6
	syscall

	# close the file
	li	$v0,	6
	move	$a0,	$t8
	syscall

	# exit with the return value of close
	move	$a0,	$v0
	li	$v0,	1
	syscall


