.section .text
.globl foo
foo: 
  mtc1     $a0, $f6
  cvt.d.w  $f6, $f6
  mtc1     $a2, $f12
  mtc1     $a3, $f13
  add.d    $f12, $f12, $f6
  lwc1     $f0, 16($sp)
  cvt.d.s  $f0, $f0
  add.d    $f0, $f0, $f12
  jr       $ra
