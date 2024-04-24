.section .text
.globl foo
foo:
	bne $a1, 0, dijeli
	addiu $v0, $0, -1
	jr $ra
	dijeli:
		div $a0, $a1
		mfhi $v0
		sll $v0, $v0, 16
		mflo $t0
		or $v0, $v0, $t0
		jr $ra