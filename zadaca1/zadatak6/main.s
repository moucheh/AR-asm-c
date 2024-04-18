.section .rodata
format: .asciiz "%d %d\n"

.section .data
.globl a
.globl b
a: .hword 69
b: .hword 420

.section .data
.globl main
.globl exchange

main:
	#prologue
	addiu $sp, $sp, -64
	sw $ra, 60($sp)
	#########

	la $a0, a
	la $a1, b
	lh $a1, 0($a1)
	jal exchange
	
	la $t0, b
	sh $v0, 0($t0)
	
	la $a0, format
	la $a1, a
	lh $a1, 0($a1)
	la $a2, b
	lh $a2, 0($a2)

	jal printf
	#epilogue
	lw $ra, 60($sp)
	addiu $sp, $sp, 64
	#########
	addiu $v0, $0, 0
	jr $ra
	nop

exchange:
	lh $v0, 0($a0)
	sh $a1, 0($a0)
	jr $ra
	nop
