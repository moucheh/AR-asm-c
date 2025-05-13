.section .data
d: .double 10.25

.section .text
.globl foo
foo:
    mtc1 $a0, $f4
    cvt.d.w $f4, $f4
    mtc1 $a2, $f6
    mtc1 $a3, $f7
    c.lt.d $f6, $f4
    bc1f else_if
    add.d $f0, $f4, $f6
    la $t0, d
    l.d $f8, ($t0)
    sub.d $f0, $f0, $f8
    jr $ra
    else_if:
	    c.eq.d $f6, $f4
	    bc1f else
	    add.d $f0, $f4, $f6
	    jr $ra
    else:
    	la $t0, d
    	l.d $f8, 0($t0)
	    add.d $f0, $f4, $f6
	    add.d $f0, $f0, $f8
	    jr $ra