#include <stdio.h>

void foo(float* p);

int main() {
	float p = 10.2f;
	foo(&p);
	printf("p = %f\n", p);
	return 0;
}