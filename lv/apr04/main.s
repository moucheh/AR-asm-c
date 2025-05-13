.section .rodata
print_str: .asciiz "s=%d\ta=%d\n"

.section .text
.globl main
main:
  addiu $sp, $sp, -64
  addiu $a1, $0, -5
  sw $ra, 60($sp)
  sw $0, 56($sp)
  addiu $a0, $sp, 56
  jal myabs
  la $a0, print_str
  lw $a1, 56($sp)
  addiu $a2, $0, -5
  jal printf
  lw $ra, 60($sp)
  addiu $sp, $sp, 64
  addiu $v0, $0, 0
  jr $ra
