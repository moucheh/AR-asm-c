#include <iostream>

struct Foo {
  char l;
  short s;
  int i;
};

extern "C" char foo(struct Foo);

int main() {
  std::cout << foo({'z',-46,100000}) << std::endl;
  return 0;
}
