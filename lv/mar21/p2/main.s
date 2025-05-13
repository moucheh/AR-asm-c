.section .text
.globl main
main:
  lui $t0, 0xF467
  ori $t0, $t0, 0x2B13
  lui $t1, 0xAAAA
  ori $t1, $t1, 0xAAAA
  and $t0, $t0, $t1
  addiu $v0, $0, 0
  jr $ra
  nop
