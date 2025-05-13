#.section .data
#.globl n1
#n1: .word 1, 3, 5, 7, 9, -9, -7, -5, -3, -1

#.globl n2
#n2: .word 0, 2, 4, 6, 8, -8, -6, -4, -2, 0

.section .text
.globl swap
# .globl main
# main:
# 	#prologue
# 	addiu $sp, $sp, -64
# 	sw $ra, 60($sp)
# 	#########
# 	la $a0, n1 # load op1 ptr into a0
# 	la $a1, n2 # load op2 ptr into a1
# 	addiu $a2, $0, 40
# 		jal swap
# 		nop
# 	#epilogue
# 	lw $ra, 60($sp)
# 	addiu $sp, $sp, 64
# 	#########
# 	return:
# 	addiu $v0, $0, 0
# 	jr $ra
# 	nop

swap:
	addiu $t0, $0, 0 # t0 -> i

	j condition
	body:
		lbu $t2, ($a0) # load op1[i]
		lbu $t3, ($a1) # load op2[i]

		sb $t2, ($a1) # store op2[i] where op1[i] used to be
		sb $t3, ($a0) # store op1[i] where op2[i] used to be 

		addiu $a0, $a0, 1
		addiu $a1, $a1, 1
		addiu $t0, $t0, 1 # increment i
	condition:
		sltu $t1, $t0, $a2
		bne $t1, $0, body
	jr $ra
	nop

# c code

# #include <stdio.h>
# #include <stdint.h>

# void swap(void*, void*, int32_t);

# int main() {
# 	int32_t n1[10] = {1, 3, 5, 7, 9, -9, -7, -5, -3, -1};
# 	int32_t n2[10] = {0, 2, 4, 6, 8, -8, -6, -4, -2, 0};
# 	for (int i = 0; i < 10; ++i)
# 		printf("%d\t", n1[i]);
# 	putchar('\n');
# 	for (int i = 0; i < 10; ++i)
# 		printf("%d\t", n2[i]);
# 	putchar('\n');
# 	swap(n1, n2, 10);
# 	printf("After adjustment:\n");
# 	for (int i = 0; i < 10; ++i)
# 		printf("%d\t", n1[i]);
# 	putchar('\n');
# 	for (int i = 0; i < 10; ++i)
# 		printf("%d\t", n2[i]);
# 	putchar('\n');
# 	return 0;
# }

# void swap(void* op1, void* op2, int32_t size) {
# 	char* a = op1, *b = op2;
# 	for (int i = 0; i < size; ++i) {
# 		*a = *a ^ *b;
# 		*b = *a ^ *b;
# 		*a = *a ^ *b;
# 	}
# }