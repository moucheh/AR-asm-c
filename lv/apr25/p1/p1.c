static int a = 5;
float c = -2.5f;

void foo(float* p) {
	*p = a + c + *p;
}