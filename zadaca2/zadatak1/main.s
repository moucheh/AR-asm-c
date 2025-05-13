.section .rodata
printf_str: .asciiz "foo(%d, %d) = %hd\n"

.section .text

.globl main
main:
	#prologue
	addiu $sp, $sp, -128 # allocate stack
	sw $ra, 124($sp) # store return address
	#########

	addiu $t0, $0, 2 # set i to 2
	sw $t0, 120($sp) # store i for later use

	j outer_cond
	outer_body:
		addiu $t1, $0, 3 # set j to 3 for each outer iteratrion
		sw $t1, 116($sp) # store j for later use
		j inner_cond
		inner_body:
			lw $t0, 120($sp) # load i and j to make sure they are correct
			lw $t1, 116($sp) # for each foo call

			addu $a0, $0, $t0 # prepare i for foo call
			addu $a1, $0, $t1 # prepare j for foo call
			jal foo # call foo

			lw $t0, 120($sp) # restore i in case foo changed it
			lw $t1, 116($sp) # restore i in case foo changed it

			la $a0, printf_str # load printf_str const char pointer 
			addu $a1, $0, $t0 # prepare i for printf call
			addu $a2, $0, $t1 # prepare j for printf call
			addu $a3, $0, $v0 # prepare foo return value for printf call
			jal printf # call printf

			lw $t1, 116($sp) # load j to change it
			addiu $t1, $t1, 1 # increment j
			sw $t1, 116($sp) # store j for next iteration

		inner_cond:
			slti $t3, $t1, 7 # j < 7
			bne $t3, $0, inner_body
			
			lw $t0, 120($sp) # load i to change it
			addiu $t0, $t0, 1 # increment i
			sw $t0, 120($sp) # store i for next iteration
	outer_cond:
		slti $t2, $t0, 6 # i < 6
		bne $t2, $0, outer_body

	#epilogue
	lw $ra, 124($sp) # load return address
	addiu $sp, $sp, 128 # deallocate stack
	#########
	addiu $v0, $0, 0
	jr $ra