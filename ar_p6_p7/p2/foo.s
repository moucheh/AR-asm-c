.section .text
.globl foo
foo: 
  andi $v0, $a0, 0xff
  jr   $ra
