#include <iostream>
#include <string>
#include <stdbool.h>

extern "C" {
	int isPalindrome(const char*, int);
}

int main() {
	std::string word;
	std::cout << "Unesite rijec: ";
	std::cin >> word;
	if (isPalindrome(word.c_str(), word.size())) {
		std::cout << "Rijec je palindrom" << std::endl;
	} else {
		std::cout << "Rijec nije palindrom" << std::endl;
	}
	return 0;
}

// int isPalindrome(const char* s, int len) {
// 	if (len < 2) return 1;
// 	return s[0] == s[len - 1] && isPalindrome(s + 1, len - 2);
// }
