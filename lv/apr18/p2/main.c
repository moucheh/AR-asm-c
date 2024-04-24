// Napisati funkciju foo koja uzima dva shorta i vraca nazad uint32_t
// Funkcija treba da provjeri da li je drugi argument jednak nuli
// Te ukoliko jeste da nazad vrati sve jedinice
// U suprotnom u najjacih 16 bita povratne vrijednosti treba da bude rezultat dijeljenja dva argumenta
// a u najslabijih 16 bita rezultat ostatka dijeljenja

#include <stdio.h>
#include <stdint.h>

uint32_t foo(short a, short b);

int main() {
	uint32_t res = foo(10, 3);
	printf("Result: 0x%08x\n", res);
	return 0;
}