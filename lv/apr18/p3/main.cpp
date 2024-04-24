#include <iostream>

extern "C" {
	int factorial(int n);
}

int main() {
	std::cout << "5! = " << factorial(5) << std::endl;
	return 0;
}