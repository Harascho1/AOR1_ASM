#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern void fja(int a, int n);

int main() {
	char a[100];
	int n;
	gets(a, 100);
	n = strlen(a);
	fja(n, a);
	puts(a);
	
	return 0;
}