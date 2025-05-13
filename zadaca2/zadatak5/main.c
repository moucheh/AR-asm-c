int foo(double d1, float f1, float f2) {
	if (d1 > f2) {
		return (f1 + f2 - d1) / 3.;
	}
	if (d1 == f2 && d1 != f1 && d1 != 0.) {
		return (f1 * 3.) / d1;
	}
	if (d1 < f2 && d1 == f1 && f1 != 0.) {
		return abs(d1 - f2) / f1;
	}
	return f1 * f2 - 12. * d1;
}