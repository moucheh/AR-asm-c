#include <iostream>

struct Foo {
  char c;
  double d;
  short s;
};

int main() {
  std::cout << sizeof(Foo) << std::endl;
  return 0;
}
