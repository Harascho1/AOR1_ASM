#include <stdio.h>
#include <stdlib.h>

extern int okreniNiz(int* niz, int n);

int main() {
	int** mat;
	int n = 4;
	int m = 4;
	mat = (int**)malloc(n * sizeof(int*));
	for (int i = 0; i < n; i++) {
		mat[i] = (int*)malloc(m * sizeof(int));
		for (int j = 0; j < m; j++) {
			mat[i][j] = j+i;
			printf("%d ", mat[i][j]);
			
		}
		printf("\n");
		okreniNiz(mat[i], m);
	}
	printf("\n");
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			printf("%d ", mat[i][j]);
		}
		printf("\n");
	}
	free(mat);

	return 0;
}