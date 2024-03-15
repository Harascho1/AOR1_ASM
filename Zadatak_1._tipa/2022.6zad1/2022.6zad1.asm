;ZADATAK
;Napisati program na asemblerskom jeziku koji izracunava vrednost izraza:
;SUMA(k=1..N)floor(X+k(dole)/X-k(gore))
;Znacenje "dole" oznacava da se u podatku zadrzava nizih p bitova, a ostali se anuliraju
;"gore" oznacava da se u patku zadrazava visih p bitova, a ostali se anuliraju. X i N su
;32b a p 8b, svi neoznaceni brojevi zadati u memoriji. Smatrati da je X > N. Potupak 
;realizovati tako da daje tacna renja za bilo koje pocetne vrednosti. Dati primer
;ulaznih podataka i ocekivane vrednosti medjurezultata i konacnog rezultata.

.386
.model flat,c

.data
	n dd 15
	x dd 0ff12h
	p db 3
	k dd 1
	rez dd ?
.code
main proc
	;pravimo dole
	mov esi,1		;esi = 1
	mov cl,p		;cl = 3
	shl esi,cl		;esi = 8
	dec esi			;esi = 7, sto mu dodje 0000 0...0 0111

	;pravimo gore
	mov cl,32		;cl = 32
	sub cl,p		;cl = 29
	mov edi,esi		;edi= 7
	shl edi,cl		;edi=E000 0000, sto mu dodje 1110 0...0 0000
	;GG maske napravljene

	mov ecx,n		;N se nalazi u ECX
	
	petlja:
		;gornji deo razlomka
		mov eax,x		;X se nalazi u EAX
		mov edx,k
		and edx,esi		;koristimo masku
		add eax,edx		;X+k(dole)
		;donji deo razlomka
		mov edx,k	
		mov ebx,x
		and edx,edi
		sub ebx,edx		;X-k(gore)
		;deljenje
		idiv ebx		;posto su neoznaceni
		;ax je resenje
		inc k			;uvecamo k
		add rez,eax		;Dodajemo novo resenje u rez 
	loop petlja
	xor eax,eax
main endp
end main