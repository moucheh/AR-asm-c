.section .text
.globl factorial
factorial:
	bne $a0, $0, recursion
	addiu $v0, $0, 1
	jr $ra
	recursion:
		addiu $sp, $sp, -64
		sw $ra, 60($sp)
		sw $a0, 56($sp)
		addiu $a0, $a0, -1
		jal factorial
		lw $ra, 60($sp)
		lw $a0, 56($sp)
		mult $a0, $v0
		mflo $v0
		addiu $sp, $sp, 64
		jr $ra
