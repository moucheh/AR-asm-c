.section .data
.globl buffer
buffer: .space 20

.globl number
number: .word 69 

.section .text
#.globl main
#main:
#	#prologue
#	addiu $sp, $sp, -64
#	lw $ra, 60($sp)
#	#########
#	la $a0, buffer
#	la $a1, number
#	lw $a1, 0($a1)
#
#	jal toBinary
#	#epilogue
#	return:
#	nop
#	addiu $sp, $sp, 64
#	lw $ra, 60($sp)
#	#########
#	addiu $v0, $0, 0
#	jr $ra
#	nop


.globl toBinary
toBinary:
	addiu $v0, $0, 0  # len = 0 -> v0
	addu $t0, $0, $a1

	j count_condition
	count_body:
		srl $t0, $t0, 1
		addiu $v0, $v0, 1 
	count_condition:
		bne $t0, $0, count_body

	# len -> v0

	addiu $t1, $v0, -1; # len - 1 -> t1 # i
	addu $t2, $t1, $a0 # buffer + len - 1 -> t2

	j convert_condition
	convert_body:
		andi $t4, $a1, 1 # extract last bit
		addiu $t4, $t4, 48 # add 48 to (ascii 48 = '0')
		sb $t4, 0($t2) # store bit to buffer
		addiu $t2, $t2, -1 # decrement ptr

		srl $a1, $a1, 1 # shift right to remove last bit
	convert_condition:
		slt $t3, $t2, $a0
		beq $t3, $0, convert_body
	addu $t0, $v0, $a0
	sb $0, ($t0)

	jr $ra


#include <stdio.h>

#int toBinary(char*, int);

#int main() {
#	char buffer[20];
#	printf("Unesite neki broj: ");
#	int number;
#	scanf("%d", &number);
#	int len = toBinary(buffer, number);
#	printf("Broj zauzima %d bita, "
#		   "i ima binarnu reprezentaciju: %s\n",
#		   len, buffer);
#	return 0;
#}

#int toBinary(char* buffer, int number) {
#	int len = 1;
#	int temp = number;
#	while (temp /= 2) ++len;
#	for (int i = len - 1; i >= 0; --i) {
#		buffer[i] = number % 2 + '0';
#		number /= 2;
#	}
#	buffer[len] = 0;
#	return len;
#}
