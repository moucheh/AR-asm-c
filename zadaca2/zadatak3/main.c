#include <stdio.h>
#include <math.h>

float Q_rsqrt(float number);

int main() {
	printf("Sqrt of 5 = %f\n"
		   "Quake inverse sqrt of 5 = %f\n",
		   1. / sqrt(5), Q_rsqrt(5)
		  );
	return 0;
}