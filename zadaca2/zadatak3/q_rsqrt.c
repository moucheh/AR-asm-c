float Q_rsqrt(float number) {
	long i;
	float x2, y;
	const float threehalfs = 1.5F;
	x2 = number * 0.5F;
	y = number;
	i = * ( long* ) &y;
	i = 0x5f3759df - ( i >> 1 );
	y = * ( float* ) &i;
	y = y * ( threehalfs - ( x2 * y * y ) );
	y = y * ( threehalfs - ( x2 * y * y ) );
	return y;
}

//0011 1111 1100 0000 0000 0000 0000 0000 = 0x3FC00000 = 1.5f
//0011 1111 0000 0000 0000 0000 0000 0000 = 0x3F000000 = 0.5f