.section .text

.globl part_impl
part_impl:
	bne $a0, $a1, rec1
	jr $ra
	rec1:
		addiu $sp, $sp, -64
		sw $ra, 60($sp)
		sw $a0, 56($sp)
		sw $a1, 52($sp)
		sw $a2, 48($sp)

		lw $a0, ($a0)
		jalr $a2
		lw $a0, 56($sp)
		lw $a1, 52($sp)
		lw $a2, 48($sp)
		beq $v0, $0, else1
			lw $t0, ($a0) # *first
			lw $t1, ($a1) # *last
			sw $t0, ($a1)
			sw $t1, ($a0)
			addiu $a1, $a1, -4
			j rec2
		else1:
			addiu $a0, $a0, 4
		rec2:
		jal part_impl

		lw $ra, 60($sp)
		addiu $sp, $sp, 64
		jr $ra

.globl partition
partition:
	slti $t0, $a1, 2
	beq $t0, $t0, rec3
	jr $ra
	rec3:
		addiu $sp, $sp, -64
		sw $ra, 60($sp)
		sll $t0, $a1, 2
		addiu $t0, $t0, -4
		addu $a1, $a0, $t0
		jal part_impl
		lw $ra, 60($sp)
		addiu $sp, $sp, 64
		jr $ra
