#include <stdio.h>
int power(int* num, int s);

int main() {
	int val = 5;
	printf("5^3=%d\n", power(&val, 3));
	return 0;
}

// int power(int* num, int s) {
// 	int res = 1;
// 	for (int i = 0; i < s; ++i)
// 		res = res * *num;
// 	return res;
// }