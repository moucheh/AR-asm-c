.section .text
.globl bar 
bar: 
  li $t0, 122 #  ASCII 122 -> 'z'
  sb $t0, 0($a0)
  li $t0, -46
  sh $t0, 2($a0)
  li $t0, 100000
  sw $t0, 4($a0)
  jr   $ra
