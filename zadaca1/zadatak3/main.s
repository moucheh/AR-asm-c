# 31 27 14 0  
#0111 0111 1111 1111 1011 1111 1111 1110
#0x77FFBFFE
.section .text
.globl main
main:
	li $t1, 0x77FFBFFE
	and $t0, $t0, $t1
	addiu $v0, $t0, 0
	jr $ra
	nop