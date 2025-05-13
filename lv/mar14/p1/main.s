.section .text
.globl main
main:
  addiu $t0, $0, -1
  addiu $t1, $0, 0xFFFF
  addiu $v0, $0, 0
  jr $ra
