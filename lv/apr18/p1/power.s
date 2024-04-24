.section .text

.globl power
power:
	addiu $v0, $0, 1
	addiu $t0, $0, 0
	lw $t1, 0($a0)
	L1:
		slt $t3, $t0, $a1
		beq $t3, $0, L1_out
		mult $v0, $t1
		mflo $v0
		addiu $t0, $t0, 1
		j L1
		nop
	L1_out:
		jr $ra
		nop
