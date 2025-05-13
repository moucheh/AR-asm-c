.section .text
.globl myabs
myabs:
  slti $t0, $a1, 0
  beq $t0, $0, out_of_if
  sub $a1, $0, $a1
  out_of_if:
  sw $a1, 0($a0)
  jr $ra
