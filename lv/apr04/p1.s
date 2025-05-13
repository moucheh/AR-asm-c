.section .rodata
.globl niz
niz: .hword 12, 3,-9,1200,-2400,490,800,-23,5,22

.section .bss
.globl suma
  suma: .word 0

.globl najmanji
  najmanji: .hword 0

.section .text
.globl main
  main:
    la $t3, niz
    lh $t1, 0($t3) # najmanji
    addiu $t0, $0, 0 #i
    addiu $t2, $0, 0 #suma:
    L1:
      sltiu $t4, $t0, 10
      beq $t4, $0, L1_out
      lh $t5, 0($t3)
      addu $t2, $t2, $t5
      slt $t4, $t5, $t1
      beq $t4, $0, out_of_if
      sll $t6, $t0, 1
      addu $t6, $t3, $t6
      lh $t5, 0($t6)
      addu $t1, $0, $t5 
      out_of_if:
        addiu $t0, $t0, 1
        addiu $t3, $t3, 2
      j L1
        nop
    L1_out:
    la $t5, suma
    sw $t2, 0($t5)
    la $t5, najmanji
    sh $t1, 0($t5)
    addiu $v0, $0, 0
    jr $ra
    nop
