#include <stdint.h>
void combinations(char* chars, uint32_t size, uint32_t r);

int main(int argc, char const* argv[]) {
	char set[] = {'a', 'b'};
	combinations(set, 2, 2);
	return 0;
}