#include <stdio.h>

int toBinary(char*, int);

int main() {
	char buffer[20];
	printf("Unesite neki broj: \n");
	int number;
	scanf("%d", &number);
	int len = toBinary(buffer, number);
	printf("Broj zauzima %d bita, "
		   "i ima binarnu reprezentaciju: %s\n",
		   len, buffer);
	return 0;
}

// int toBinary(char* buffer, int number) {
// 	int len = 1;
// 	int temp = number;
// 	while (temp /= 2) ++len;
// 	for (int i = len - 1; i >= 0; --i) {
// 		buffer[i] = number % 2 + '0';
// 		number /= 2;
// 	}
// 	buffer[len] = 0;
// 	return len;
// }
