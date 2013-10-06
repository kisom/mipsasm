/*
	int main()
	{
		int K, Y;
		int Z[50];
		Y = 56;
		K = 20;
		Z[K] = Y - 16 * (K/4 + 210);
	}
 */

	.data
K:	.word	20
Y:	.word	56
Z:	.word	0:50
out:	.asciiz	"Z[%d] = %d\n"

	.text
	.globl main
main:
	# $t0: K
	# $t1: Y
	# $t2: Z
	dla	$a0,	out
	lw	$t0,	K
	lw	$t1,	Y
	move	$a1,	$t0
	dla	$t2,	Z
	srl	$t3,	$t0,	2
	addi	$t3,	$t3,	210
	sll	$t3,	4
	daddiu	$t2,	$t2,	80
	sub	$t1,	$t1,	$t3
	move	$a2,	$t1
	sw	$t1,	0($t2)
	jal	printf

	ori	$a0,	$0,	0
	ori	$v0,	$0,	1
	syscall
