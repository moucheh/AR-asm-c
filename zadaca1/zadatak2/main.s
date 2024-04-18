.section .data
.globl number
number: .long 69

.globl result1 # number * 22
result1: .long 0

.globl result2 # number * 7
result2: .long 0

.globl result3 # number % 8
result3: .long 0

.globl result4 # number % 32
result4: .long 0


.section .text
.globl main
main:
	la $t0, number
	lw $t0, 0($t0)
	
	addiu $t1, $0, 22
	mult $t0, $t1
	la $t2, result1
	mflo $t1
	sw $t1, 0($t2)

	addiu $t1, $0, 7
	mult $t0, $t1
	la $t2, result2
	mflo $t1
	sw $t1, 0($t2)

	addiu $t1, $0, 8
	div $t0, $t1
	la $t2, result3
	mfhi $t1
	sw $t1, 0($t2)

	la $t0, number
	lw $t0, 0($t0)

	addiu $t1, $0, 32
	div $t0, $t1
	la $t2, result4
	mfhi $t1
	sw $t1, 0($t2)

	out:
	addiu $v0, $0, 0
	jr $ra
	nop