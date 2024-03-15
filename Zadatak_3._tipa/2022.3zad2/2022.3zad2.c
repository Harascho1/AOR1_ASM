//ZADATAK
//Napisati program u pogramskom jeziku C koji formia niz od svih negativnih elemenata
//matrice.Korisnik zadaje dimenzije i elemente matrice, a rezultujuci niz se prikazuje
//na izlazu.Napisati i koristiti proceduru na asemblerskom jeziku koja kopira negativne
//elemente jednog niza u drugi niz.Nizovi su oznacenih 16 - bitnih elemenata, broj
//elemenata prvog niza je zadat ulaznim parametrom a broj elemenata rezultujuceg niza je
//povratni parametar.Dati primer ulaznih podataka i ocekivanu vrednost rezultata.

#include <stdio.h>
#include <stdlib.h>

extern int kopirajNegativne(short* niz1, short* redmat, int n);

int main() {
	int n, m;
	short** mat;
	short* niz;
	scanf("%d %d", &n, &m);
	mat = (short**)malloc(n * sizeof(short*));
	niz = (short*)malloc((n*m) * sizeof(short));

	for (int i = 0; i < n; i++)
	{
		mat[i] = (short*)malloc(m * sizeof(short));
		for (int j = 0; j < m; j++)
		{
			scanf("%hd", &mat[i][j]);
		}
	}
	int x = 0;
	for (int i = 0; i < n; i++)
	{
		x += kopirajNegativne((niz + x), mat[i], m);
	}
	for (int i = 0; i < x; i++)
	{
		printf("%d ", niz[i]);
	}
	free(mat);
	free(niz);
	return 0;
}