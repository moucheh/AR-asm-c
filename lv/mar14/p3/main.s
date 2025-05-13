#100 + 40000 + 0xFFFFFFF

.section .text
.globl main
main:
  lui $t0, 0x7FFF
  ori $t0, $t0, 0xFFF0
  addi $t0, $t0, 20
  addiu $v0, $0, 0
  jr $ra
