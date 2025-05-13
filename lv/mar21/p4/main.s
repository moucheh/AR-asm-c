.section .rodata
.globl str
str: .asciiz "Hello world"

#pokusati dofatit adresu iz rodaate i nesto upisat etam

.section .bss
.globl res
res: .space 40

.section .text
.globl main
main:
  la $t0, str
  la $t5, res
  while:
    lb $t1, 0($t0)
    beq $t1, $0, while_out
    sb $t1, 0($t5)
    sltiu $t3, $t1, 97
    bne $t3, $0, out_of_ifs
    sltiu $t3, $t1, 123
    beq $t3, $0, out_of_ifs
    addiu $t1, $t1, -32
    sb $t1, 0($t5)
  out_of_ifs:
    addiu $t0, $t0, 1
    addiu $t5, $t5, 1
  j while
  while_out:
    sb $0, 0($t5)


  addiu $v0, $0, 0
  jr $ra
