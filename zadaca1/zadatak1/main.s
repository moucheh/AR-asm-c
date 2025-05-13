.section .rodata
.globl number
number:
	.long 16

.section .data 
.globl result
result:
	.byte 0

.section .text
.globl main
main:
	la $t0, number
	la $t1, result
	lw $t0, 0($t0)
	andi $t0, $t0, 1
	sb $t0, 0($t1)
	addiu $v0, $0, 0
	jr $ra
	nop