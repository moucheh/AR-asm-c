#include <stdio.h>
#include <stdint.h>

void swap(void*, void*, int32_t);

int main() {
	int32_t n1[10] = {1, 3, 5, 7, 9, -9, -7, -5, -3, -1};
	int32_t n2[10] = {0, 2, 4, 6, 8, -8, -6, -4, -2, 0};
	for (int i = 0; i < 10; ++i)
		printf("%d\t", n1[i]);
	putchar('\n');
	for (int i = 0; i < 10; ++i)
		printf("%d\t", n2[i]);
	putchar('\n');
	swap(n1, n2, 10);
	printf("After adjustment:\n");
	for (int i = 0; i < 10; ++i)
		printf("%d\t", n1[i]);
	putchar('\n');
	for (int i = 0; i < 10; ++i)
		printf("%d\t", n2[i]);
	putchar('\n');
	return 0;
}

void swap(void* op1, void* op2, int32_t size) {
	char* a = op1, *b = op2;
	for (int i = 0; i < size; ++i) {
		*a = *a ^ *b;
		*b = *a ^ *b;
		*a = *a ^ *b;
	}
}