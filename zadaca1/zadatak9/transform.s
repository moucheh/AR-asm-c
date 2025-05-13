#.section .data
#c1: .asciiz "Hello World"
#printf_str: .asciiz "C1: %s\n"

.section .text
#.globl main
#main:
#	#prologue
#	addiu $sp, $sp, -64
#	sw $ra, 60($sp)
#	#########
#	la $a0, c1
#	addiu $a1, $0, 12
#	la $a2, mytoupper
#	jal transform
#	la $a0, printf_str
#	la $a1, c1
#	jal printf
#	#epilogue
#	lw $ra, 60($sp)
#	addiu $sp, $sp, 64
#	#########
#	return:
#	addiu $v0, $0, 0
#	jr $ra

.globl transform
transform:
	sw $0, 52($sp) # store counter on stack
	addiu $sp, $sp, -64
	sw $ra, 60($sp) # store return address

	j for_condition
	for_body:
		lw $t0, 52($sp) # load counter from stack
		sw $a0, 56($sp) # store buffer ptr on stack
		lb $a0, ($a0) # load char from buffer to a0, preparing predicate call
		
		jalr $a2 # call predicate function

		lw $a0, 56($sp) # load counter from stack
		sb $v0, ($a0) # store transformed char
		
		lw $t0, 52($sp) # load counter from stack
		lw $a0, 56($sp) # load buffer ptr from stack

		addiu $a0, $a0, 1 # increment buffer ptr 
		addiu $t0, $t0, 1 # increment counter
		
		sw $a0, 56($sp) # store buffer ptr on stack
		sw $t0, 52($sp) # store counter on stack
	for_condition:
		slt $t1, $t0, $a1 # if counter < size enter for_body
		bne $t1, $0, for_body  

	lw $ra, 60($sp) # load return address from main
	addiu $sp, $sp, 64 # deallocate stack
	jr $ra # return