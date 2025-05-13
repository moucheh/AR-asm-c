.section .data
.globl a
a: .byte 25

.globl b
b: .byte -2

.globl c
c: .byte -10

.globl d
d: .hword 40000

.globl e
e: .hword 40000

.globl x
x: .word 3400

.globl y
y: .word 2800

.section .bss
.globl f
f: .space 4

.globl g
g: .space 2

.globl h
h: .space 2

.globl i
i: .space 4

.globl j
j: .space 4
.globl z
z: .space 4

.section .text
.globl main
main:
  la $t0, a
  lbu $t0, 0($t0)
  addiu $t0, $t0, 190
  la $t1, f
  sw $t0, 0($t1)
  la $t0, b
  lb $t0, 0($t0)
  addiu $t0, $t0, -12
  la $t1, g
  sb $t0, 0($t1)
  la $t0, c
  lbu $t0, 0($t0)
  la $t1, h
  sh $t0, 0($t1)
  la $t0, d
  lhu $t0, 0($t0)
  lui $t3, 0xFFFF
  ori $t3, $0, 0x5038
  addu $t0, $t0, $t3
  la $t1, i
  sw $t0, 0($t1)
  la $t0, e
  lhu $t0,0($t0)
  la $t1, j
  sw $t0, 0($t1)
  la $t0, x
  la $t1, y
  lw $t0, 0($t0)
  lw $t1, 0($t1)
  addu $t0, $t0, $t1
  la $t1, z
  sw $t0, 0($t1)

  addiu $v0, $0, 0
  jr $ra
  nop
