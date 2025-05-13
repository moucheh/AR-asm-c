.section .data
a: .word 5

.globl foo
foo:
    l.d $f4, 0($a0) # *p
    la $t0, a
    lwc1 $f6, 0($t0)
    cvt.d.w $f6, $f6 # a
    add.d $f4, $f4, $f4
    add.d $f4, $f4, $f6
    mtc1 $a2, $f8
    mtc1 $a3, $f9
    add.d $f4, $f4, $f8
    s.d $f4, 0($a0)
    jr $ra

