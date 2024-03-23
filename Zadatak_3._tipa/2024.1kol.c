// cfajlsasamkodom.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <stdio.h>
#include <stdlib.h>

int fja(int* niz, int i) {
    __asm {
        mov esi, niz;
        mov ebx, i;
        shl ebx, 2;
        xor eax, eax;
        mov eax, [esi + ebx];

    }
}

int main()
{
    
    int n;
    int** mat;
    int m;
    m = scanf("%d", &n);
    mat = (int**)malloc(n *sizeof(int*));
    for (int i = 0; i < n; i++)
    {
        mat[i] = (int*)malloc(n * sizeof(int));
        for (int j = 0; j < n; j++)
        {
            m = scanf("%d", &mat[i][j]);
        }
    }
    for (int i = 0; i < n-1; i++)
    {
        mat[n - 1][i] = fja(mat[i], i);
    }
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            printf("%d ", mat[i][j]);
        }
        printf("\n");
    }
    return 0;
}

