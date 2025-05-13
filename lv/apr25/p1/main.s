.section .rodata
printf_str: .asciiz "p = %f\n"

.section .text
.globl main
main:
	#prologue
	addiu $sp, $sp, -128
	sw $ra, 124($sp)
	#########
	
	li $t0, 0x41233333
	sw $t0, 120($sp)
	addiu $a0, $sp, 120
	jal foo
	la $a0, printf_str

	lwc1 $f4, 120($sp)
	cvt.d.s $f4, $f4
	mfc1 $a2, $f4
	mfc1 $a3, $f5

	jal printf

	#epilogued
	lw $ra, 124($sp)
	addiu $sp, $sp, 128
	#########
	addiu $v0, $0, 0
	jr $ra
	nop