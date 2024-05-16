.section .rodata
str: .string "%d\n"

.section .text
.globl main
main:
	#prologue
	addiu $sp, $sp, -128
	sw $ra, 124($sp)
	#########
	
	li.s $f12, 6.5
	cvt.d.s $12, $12
	li.s $f14, 200.45

	li.s $f4, 6.5

	swc1 $f4, 16($sp)

	jal foo

	la $a0, str
	addiu $a1, $v0, 0

	jal printf

	#epilogue
	lw $ra, 124($sp)
	addiu $sp, $sp, 128
	#########
	addiu $v0, $0, 0
	jr $ra

.globl foo
foo:
    lwc1 $f4, 16($sp)
    cvt.d.s $f4, $f4
    cvt.d.s $f14, $f14
    c.lt.d $f12, $f4
    bc1t dalje

    add.d $f4, $f14, $f4
    sub.d $f4, $f4, $f12

    li.s $f6, 3.0
    cvt.d.s $f6, $f6

    div.d $f4, $f4, $f6

    trunc.w.d $f4, $f4
    mfc1 $v0, $f4

    jr $ra

    dalje:
    	c.eq.d $f12, $f4
    	bc1f dalje2
    	c.eq.d $f12, $f14
    	bc1t dalje2
    	mtc1 $0, $f8
    	cvt.d.w $f8, $f8
    	c.eq.d $f12, $f8
    	bc1t dalje2
    	mul.d $f0, $f14, $f8
    	div.d $f0, $f0, $f12
    	trunc.w.d $f0, $f0
    	mfc1 $v0, $f0
    	jr $ra

    dalje2:
    	c.lt.d $f12, $f4
    	bc1f dalje3
    	c.eq.d $f12, $f14
    	bc1f dalje3
    	mtc1 $0, $f8
    	cvt.d.w $f8, $f8
    	c.eq.d $f14, $f8
    	bc1t dalje3
    	sub.d $f0, $f12, $f14
    	abs.d $f0, $f0
    	div.d $f0, $f0, $f14
    	trunc.w.d $f0, $f0
    	mfc1 $v0, $f0
    	jr $ra

    dalje3:
    	li.s $f6, 12.0
    	cvt.d.s $f6, $f6
    	mul.d $f0, $f14, $f4
    	mul.d $f8, $f6, $f12
    	sub.d $f0, $f0, $f8
    	trunc.w.d $f0, $f0
    	mfc1 $v0, $f0
    	jr $ra