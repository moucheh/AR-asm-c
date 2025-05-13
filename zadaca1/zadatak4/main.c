#include <stdio.h>

int array[16] = {1, 19, 350, 740, 1522};

int main() {
	int i = 0;
	int len = 5;
	char isSorted = 1;
	while (i < len - 1) {
		if (!(array[i] < array[i + 1]))
			isSorted = 0;
		++i;
	}
	if (isSorted) {
		printf("Median je: %d\n",
			   (len & 1)
			   ? array[len / 2]
			   : (array[len / 2] + array[len / 2 - 1]) / 2
			  );
	}
	return 0;
}