.section .rodata
str: .asciiz "anavolimlovana"

.section .data
.globl len
len: .word 14

.globl result
result: .word 0

.section .text
.globl main
main:
	la $t0, str # begin
	la $t1, str 

	la $t2, len # &len
	lw $t2, 0($t2) # len
	addiu $t2, $t2, -1 # len - 1

	addu $t1, $t1, $t2 # end

	addiu $t5, $0, 1 # isPalindrome

	j condition
	body:
		lbu $a0, 0($t0) # *begin
		lbu $a1, 0($t1) # *end

		addiu $t0, $t0, 1 # ++begin
 		addiu $t1, $t1, -1 # --end

		beq $a0, $a1, condition # if equal continue
		addiu $t5, $0, 0 # check failed, str is not a palindrome
		j out
	condition:
		sltu $t2, $t0, $t1 
		bne $t2, $0, body
	out:
	la $t0, result
	sw $t5, 0($t0)
	addiu $v0, $0, 0
	jr $ra
	nop