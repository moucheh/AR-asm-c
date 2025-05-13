#include <iostream>
#include <vector>

extern "C" {
	void partition(int* arr, int size, int (*predicate)(int));
}

int main() {
	std::vector<int> arr{4, 5, 1, 6, 9, 2, 3, 8, 0};
	partition(arr.data(), arr.size(), [](int a) -> int {
		return a & 1;
	});
	for (const auto& el : arr)
		std::cout << el << ' ';
	std::cout << std::endl;
	return 0;
}

// static void part_impl(int* first, int* last, int (*predicate)(int)) {
// 	if (first == last) return;
// 	if (predicate(*first)) {
// 		*first = *first ^ *last;
// 		*last = *first ^ *last;
// 		*first = *first ^ *last;
// 		--last;
// 	} else {
// 		++first;
// 	}
// 	part_impl(first, last, predicate);
// }

// void partition(int* arr, int size, int (*predicate)(int)) {
// 	if (size < 2) return;
// 	part_impl(arr, arr + size - 1, predicate);
// }
