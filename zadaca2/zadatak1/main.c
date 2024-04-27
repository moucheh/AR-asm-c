#include <stdio.h>

short foo(short a, short b);

int main(int argc, char* argv[]) {
	int i, j;
	for (i = 2; i < 6; ++i) {
		for (j = 3; j < 7; ++j) {
			printf("foo(%d, %d) = %hd\n", i, j, foo(i, j));
		}
	}
	return 0;
}