#include <iostream>

struct Bar {
  char l;
  short s;
  int i;
};

std::ostream& operator<<(std::ostream& o, const Bar& b) {
  std::cout << "{"
    << b.l << ","
    << b.s << ","
    << b.i << "}" << std::endl;
  return o;
}

extern "C" Bar bar();

int main() {
  std::cout << bar() << std::endl;
  return 0;
}
