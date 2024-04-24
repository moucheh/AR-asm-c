.section .text
.globl isPalindrome
isPalindrome:
	slti $t0, $a1, 2
	beq $t0, $0, recursion
	addiu $v0, $0, 1
	jr $ra
	recursion:
		lb $t0, ($a0)
		addu $t1, $a0, $a1
		addiu $t1, $t1, -1
		lb $t1, ($t1)
		beq $t0, $t1, recursion2
		addiu $v0, $0, 0

		recursion2:
			addiu $sp, $sp, -64
			sw $ra, 60($sp)

			addiu $a0, $a0, 1
			addiu $a1, $a1, -2
			jal isPalindrome

		lw $ra, 60($sp)
		addiu $sp, $sp, 64
		jr $ra
