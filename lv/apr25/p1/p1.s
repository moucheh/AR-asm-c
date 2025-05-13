.section .data
a: .word 5

.globl c
c: .float -2.5

.section .text
.globl foo
foo:
    lwc1 $f4, 0($a0) # *p = #f4
    la $t0, a
    lwc1 $f6, 0($t0) # a
    cvt.s.w $f6, $f6
    la $t0, c
    lwc1 $f8, 0($t0) # c
    add.s $f6, $f6, $f8
    add.s $f4, $f4, $f6
    swc1 $f4, 0($a0)
    jr $ra 