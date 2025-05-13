static double d = 10.25;

double foo(int a, double b) {
	if (b < a) {
		return a + b - d;
	} else if (b == a) {
		return a + b;
	}
	return a + b + d;
}