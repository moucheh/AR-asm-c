.section .text
.globl main
main:
	#prologue
	addiu $sp, $sp, -128
	sw $ra, 124($sp)
	#########
	
	addiu $t0, $0, 97
	sb $t0, 120($sp)
	addiu $t0, $0, 98
	sb $t0, 121($sp)

	addiu $a0, $sp, 120
	addiu $a1, $0, 2
	addiu $a2, $0, 2
	jal combinations

	#epilogued
	lw $ra, 124($sp)
	addiu $sp, $sp, 128
	#########
	addiu $v0, $0, 0
	jr $ra