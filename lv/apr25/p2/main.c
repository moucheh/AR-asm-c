#include <stdio.h>

void foo(double*, double);

int main() {
	double p = 10.15;
	double d = 15.10;
	foo(&p, d);
	printf("p = %f\n", p);
	return 0;
}