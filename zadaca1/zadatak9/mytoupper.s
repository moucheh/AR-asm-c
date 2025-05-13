.section .text
.globl mytoupper

mytoupper:
	slti $t0, $a0, 96
	bne $t0, $0, out_of_if
	slti $t1, $a0, 127
	beq $t1, $0, out_of_if
	addiu $v0, $a0, -32
	jr $ra
	out_of_if:
		addiu $v0, $a0, 0
		jr $ra
