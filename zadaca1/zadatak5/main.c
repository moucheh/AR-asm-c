// Provjeriti da li je string palindrom

#include <stdio.h>

int main() {
	const char str[] = "anavolimiovana";
	const char* ptr = str;
	int len = 0;
	while (*ptr++)
		++len;
	const char* begin = str;
	const char* end = str + len - 1;
	int isPalindrome = 1;
	while (begin < end) {
		if (*begin != *end) {
			isPalindrome = 0;
			break;
		}
		++begin;
		--end;
	}
	printf("\nRijec %s\n", (isPalindrome) ? "je palindrom" : "nije palindrom");
	return 0;
}