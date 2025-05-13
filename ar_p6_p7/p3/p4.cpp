#include <iostream>

extern "C" double foo(int, double, float);

int main() {
  std::cout << foo(2, 0.1, 0.3) << std::endl;
  return 0;
}
