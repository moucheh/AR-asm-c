.section .text

.globl Q_rsqrt
Q_rsqrt:
	ori $t0, $0, 0x3fc0 
	sll $t0, $t0, 16 # three halves
	ori $t1, $0, 0x3f00
	sll $t1, $t1, 16 # half
	mtc1 $t0, $f4 # $f4 1.5f
	mtc1 $t1, $f5 # $f5 0.5f
	mul.s $f6, $f12, $f5 # x / 2
	mov.s $f0, $f12 # y = number
	mfc1 $t2, $f0 # #t2 *(long*) &y

	ori $t3, $0, 0x5f37 
	sll $t3, $t3, 16
	ori $t3, $t3, 0x59df # $t3 0x5f3759df

	sra $t4, $t3, 1 # $ i >> 1

	subu $t5, $t3, $t4 # 0x5f3759df - i >> 1

	mtc1 $t5, $f0 # y = * (float* ) &i

	mul.s $f8, $f6, $f0 # x / 2 * y
	mul.s $f8, $f8, $f0 # x / 2 * y * y

	sub.s $f7, $f4, $f8 # 1.5f - x / 2 * y * y
	mul.s $f0, $f0, $f7 # y = y * (1.5f - x / 2 * y * y)

	mul.s $f8, $f6, $f0 # x / 2 * y
	mul.s $f8, $f8, $f0 # x / 2 * y * y

	sub.s $f7, $f4, $f8 # 1.5f - x / 2 * y * y
	mul.s $f0, $f0, $f7 # y = y * (1.5f - x / 2 * y * y)

	jr $ra