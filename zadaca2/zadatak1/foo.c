short foo(short a, short b) {
	if (a < 2) {
		return 0;
	} else if (b < 3) {
		return 1;
	}
	if (a < b) {
		return a + foo(a - 1, b - 3);
	} else {
		return a - b + foo(a - 2, b - 1);
	}
}