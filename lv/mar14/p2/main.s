.section .data
num:
  .word 10
.section .text
.globl main
main:
  addiu $t1, $zero, 100
  addiu $t2, $zero, 20
  addiu $t3, $zero, 5
  la $t5, num
  subu $t0, $t1, $t2
  or   $t4, $t0, $t3
  jr   $ra

