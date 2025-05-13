addiu $t0, $0, 5
addiu $t1, $0, 0xA
or $t2, $t0, $t1
sll $t3, $t2, 3
sw $t3, 0($0)
lw $t4, 0($0)

