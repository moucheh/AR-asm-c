.section .text
.globl foo
foo:
    slti $t0, $a0, 2 # a < 2
    beq $t0, $0, else_if
    addiu $v0, $0, 0
    jr $ra

    else_if:
    	slti $t0, $a1, 3 # b < 3
    	beq $t0, $0, recursion
    	addiu $v0, $0, 1
    	jr $ra

    recursion:
        addiu $sp, $sp, -64 # store ra, and a for later use
        sw $ra, 60($sp)
        sw $a0, 56($sp)
        slt $t0, $a0, $a1 # a < b
        beq $t0, $0, else1
            addiu $a0, $a0, -1 
            addiu $a1, $a1, -3
            jal foo # foo(a - 1, b - 3)
            lw $t0, 56($sp)
            addu $v0, $v0, $t0 # a + foo(a - 1, b - 3) 
        j end # skip else
        else1:
            sw $a1, 52($sp) # store b
            addiu $a0, $a0, -2
            addiu $a1, $a1, -1
            jal foo # foo(a - 2, b - 1)
            lw $t0, 56($sp)
            lw $t1, 52($sp)
            addu $v0, $v0, $t0 # foo(a - 2, b - 1) + a
            subu $v0, $v0, $t1 # foo(a - 2, b - 1) + a - b
        end:
            lw $ra, 60($sp) # load correct return address
            addiu $sp, $sp, 64 # return stack
            jr $ra

    	