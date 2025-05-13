# size i array u data
# ukoliko niz nije sortiran upisati 0xDEADFA11 u result
# upisati median u result
# ukoliko je broj elemmata neparan srednji elemat je median n/2
# ukoliko je broj elemata paran aritmeticka sredina srednja dva n/2 i n/2 - 1

.section .data
.globl array
array: .hword 1, 19, 350, 740, 1522, 2020

.globl size
size: .word 6

.globl result
result: .word 0

.section .text
.globl main
main:
	addiu $t0, $0, 0 # i         -> $t0
	addiu $t4, $0, 1 # i + 1     -> $t4
	la $t1, size
	lw $t1, 0($t1)   # len
	andi $t2, $t1, 1 # isOdd     -> $t2
	addiu $t1, $t1, -1 # len - 1 -> $t1
	addiu $t9, $0, 1 # isSorted

	la $a0, array
	j condition
	body:
		sll $t5, $t0, 1 # i * 2
		sll $t6, $t4, 1 # (i+1) * 2
		addu $a1, $a0, $t5 # array + i * 2  
		addu $a2, $a0, $t6 # array + (i + 1) * 2

		lhu $a1, 0($a1) # a[i]
		lhu $a2, 0($a2) # a[i+1]

		sltu $t7, $a1, $a2 # a[i] < a[i+1]
		bne $t7, $0, skip
		addiu $t9, $0, 0
		j notSorted
		nop
		skip:
		addiu $t0, $t0, 1 # ++i
		addiu $t4, $t4, 1 # ++(i + 1)
	condition:
		sltu $t3, $t0, $t1 # i < len - 1
		bne $t3, $0, body
	bne $t9, $0, sorted
	notSorted:
		li $t0, 0xDEADFA11
		la $t1, result
		sw $t0, 0($t1)
		j return
		nop
	sorted:
	beq $t2, $0, even
		la $t0, size 
		lw $t0, 0($t0) # len / 2 * 2
		srl $t0, $t0, 1
		sll $t0, $t0, 1
		addu $t0, $a0, $t0 # array + len / 2 * 2
		lhu $t0, 0($t0) # array[len / 2 * 2]

		la $t1, result
		sw $t0, 0($t1)
		j return
		nop
	even:
		la $t0, size 
		lw $t0, 0($t0) # len / 2 * 2
		srl $t0, $t0, 1 # len / 2 * 2
		sll $t0, $t0, 1 
		addiu $t2, $t0, -2 # len / 2 * 2 - 2 

		addu $t0, $a0, $t0 # array + len / 2 * 2
		lhu $t0, 0($t0) # array[len / 2 * 2]
		addu $t2, $a0, $t2 # array + len / 2 * 2 - 2
		lhu $t2, 0($t2) # array[len / 2 * 2 - 2]

		addu $t0, $t0, $t2 # array[len / 2 * 2 - 2] + array[len / 2 * 2]
		srl $t0, $t0, 1 # (array[len / 2 * 2 - 2] + array[len / 2 * 2]) / 2

		la $t1, result
		sw $t0, 0($t1)
	return:
	addiu $v0, $0, 0
	jr $ra
	nop

# #include <stdio.h>
# 
# int array[16] = {1, 19, 350, 740, 1522};
# 
# int main() {
# 	int i = 0;
# 	int len = 5;
# 	char isSorted = 1;
# 	while (i < len - 1) {
# 		if (!(array[i] < array[i + 1]))
# 			isSorted = 0;
# 		++i;
# 	}
# 	if (isSorted) {
# 		printf("Median je: %d\n",
# 			   (len & 1)
# 			   ? array[len / 2]
# 			   : (array[len / 2] + array[len / 2 - 1]) / 2
# 			  );
# 	}
# 	return 0;
# }