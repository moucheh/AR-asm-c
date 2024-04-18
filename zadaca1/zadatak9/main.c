#include <stdio.h>
#include <stdint.h>

char c1[12] = "Hello World";

void transform(char*, int32_t, char (*)(char));
char mytoupper(char);

int main() {
	transform(c1, 12, mytoupper);
	printf("C1: %s\n", c1);
	return 0;
}

char mytoupper(char c) {
	if (c > 96 && c < 127) return c - 32;
	return c;
}

void transform(char* buff, int32_t size, char (*predicate)(char c)) {
	for (int i = 0; i < size; ++i) {
		buff[i] = predicate(buff[i]);
	}
}
