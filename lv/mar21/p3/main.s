.section .data
.globl a
a: .byte 5

.globl b
b: .byte 7

.section .bss
.globl c
c: .space 1

.section .text
.globl main
main:
  la $t1, a
  la $t2, b
  lbu $t1, 0($t1)
  lbu $t2, 0($t2)

  beq $t0, $t1, true
    addu $t0, $t2, $t0
    j exit
  true:
    addu $t0, $t1, $0
  exit:
    la $t3, c
    addu $t1, $t1, $t2
    sll $t1, $t1, 1
  sb $t1, 0($t3)
  addiu $v0, $0, 0
  jr $ra
