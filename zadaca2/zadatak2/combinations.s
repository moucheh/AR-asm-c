.section .data
d: .word 0

.section .text
.globl combinations
combinations:
	#prologue
    addiu $sp, $sp, -64
    sw $ra, 60($sp)
    #########

    sw $a0, 56($sp) # chars
    sw $a1, 52($sp) # size
    sw $a2, 48($sp) # r
    addu $a0, $0, $a2
    jal malloc
    la $t0, d
    sw $v0, 0($t0)

    lw $a0, 56($sp)
    lw $a1, 48($sp)
    lw $a2, 52($sp)
    lw $a3, 48($sp)

    jal combinations_impl

	#epilogue
    lw $ra, 60($sp)
    addiu $sp, $sp, 64
    #########
    jr $ra

.section .rodata
print_char: .asciiz "%c"

.section .text
.globl print_comb
print_comb:
	#prologue
	addiu $sp, $sp, -32
	sw $ra, 28($sp)
	#########

	sw $a0, 20($sp)
	sw $0, 24($sp)
	lw $t0, 24($sp)

	j for_cond
	for_body:
		la $a1, d
		lw $t0, 24($sp)
		addu $a1, $a1, $t0

		lb $a1, 0($a1)
		la $a0, print_char
		jal printf

		lw $t0, 24($sp)
		addiu $t0, $t0, 1
		sw $t0, 24($sp)
		lw $a0, 20($sp)
	for_cond:
		slt $t1, $t0, $a0
		bne $t1, $0, for_body

	addiu $a0, $0, 10
	jal putchar

	#epilogue
	lw $ra, 28($sp)
	addiu $sp, $sp, +32
	#########
    jr $ra


.globl combinations_impl
combinations_impl:
	#prologue
    addiu $sp, $sp, -32
    sw $ra, 28($sp)
	sw $a0, 24($sp)
	sw $a1, 20($sp)
	sw $a2, 16($sp)
	sw $a3, 12($sp)
	#########
    bne $a3, $0, recursion
    	addu $a0, $0, $a1
    	jal print_comb
    	lw $a0, 24($sp)
    	lw $a1, 20($sp)
    	lw $a2, 16($sp)
    	lw $a3, 12($sp)
    	lw $ra, 28($sp)
    	addiu $sp, $sp, 32
    	jr $ra
	recursion:
		sw $0, 8($sp)
		lw $t0, 8($sp)
		j for_rec_cond
		for_rec:
	    	lw $a0, 24($sp)
	    	lw $a1, 20($sp)
	    	lw $a2, 16($sp)
	    	lw $a3, 12($sp)
			lw $t0, 8($sp)
			addu $t2, $t0, $a0
			lb $t2, ($t2)
			la $t3, d
			addu $t3, $t3, $a1
			subu $t3, $t3, $a3
			sb $t2, ($t3)
			sw $a0, 24($sp)
			sw $a1, 20($sp)
			sw $a2, 16($sp)
			sw $a3, 12($sp)
			addiu $a3, $a3, -1
			jal combinations_impl
		for_rec_cond:
			slt $t1, $t0, $a2
			bne $t1, $0, for_rec
	#epilogue
    lw $ra, 28($sp)
    addiu $sp, $sp, 32
	#########
    jr $ra