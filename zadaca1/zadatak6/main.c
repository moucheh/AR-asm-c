#include <stdio.h>
#include <stdint.h>

int16_t a = 69;
int16_t b = 420;
int16_t exchange(int16_t* a, int16_t b);

int main() {
	b = exchange(&a, b);
	printf("%d %d\n", a, b);
	return 0;
}

int16_t exchange(int16_t* a, int16_t b) {
	int16_t temp = *a;
	*a = b;
	return temp;
}
