.section .text

.globl bar
bar:
    c.lt.s $f12, $f14
    bc1f next

    li.s $f4, 2
    cvt.d.s $f4, $f4

    ceil.w.s $f12, $f12
    cvt.d.w $f12, $f12
    round.w.s $f14, $f14
    cvt.d.w $f14, $f14
    mtc1 $a2, $f6
    mtc1 $a3, $f7 
    trunc.w.d $f6, $f6
    cvt.d.w $f6, $f6

    mul.d $f0, $f4, $f12
    sub.d $f0, $f0, $f14
    add.d $f0, $f0, $f6

    cvt.s.d $f0, $f0
    jr $ra

    next:
    	c.eq.s $f12, $f14
    	bc1f return
    	mtc1 $a2, $f4
   		mtc1 $a3, $f5 
    	trunc.w.d $f4, $f4
    	cvt.d.w $f4, $f4

        ceil.w.s $f12, $f12
    	cvt.d.w $f12, $f12
        floor.w.s $f14, $f14
    	cvt.d.w $f14, $f14

    	mov.d $f0, $f12
    	sub.d $f0, $f0, $f14
    	add.d $f0, $f0, $f4

    	cvt.s.d $f0, $f0
    	jr $ra

    return:
    	mtc1 $a2, $f0
    	mtc1 $a3, $f1
    	cvt.d.s $f0, $f0
    	jr $ra

