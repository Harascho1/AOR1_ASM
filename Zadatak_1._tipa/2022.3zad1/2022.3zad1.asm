
;ZADATAK
;Za ulazne podatke x,y,z (svi 32b neoznaceni brojevi) izracunava nove vrednosti X i Y
;po obrascima
;X = floor(4X/Y+1)
;Y = Y/2 + Z/2
;Postupak racunanja novih vrednosti X i Y ponavljati dok je X>=y,
;ali ne vise od 100 puta. Postupak realizovati tako da daje tacna resenja za bilo koje
;pocetne vrednosti. Nacrtati dijagram toka algoritma i na njemu obeleziti sve labele
;koriscene u kodu. Dati primer ulaznih podataka i ocekivane vrednosti medjurezultata 
;i konacno rezultata

.386
.model flat,c

.data				;za ove primere ce da radi beskonacno tacnije do 100 ponavljanja
	x dd 3
	y dd 3
	z dd 4
.code
main proc
	;posto su vrednosti dd ne moramo nepotrebno da XORujemo
	mov ecx,100		;za onih 100 ako se dese
	mov eax,x
	mov ebx,y

	petlja:
		;ZA X
		xor edx,edx	;za svaki slucaj ako se desi nesto u deljenju
		shl eax,2	;ovo je isto kao da smo ga pomnozili sa 4
		inc ebx		;izgubili smo vrednost y sad je ona y+1
		idiv ebx	;ovde delim edx:eax sa ebx
					;posto su NEOZNACENI koristimo idiv
		dec ebx		;vracamo vrednost y
		cmp eax,ebx	;eax(x)=3 i ebx(y)=3
		jb kraj
		mov x,eax

		;ZA Y
		mov edx,z	;dodeljujemo dx vrednost z
		shr ebx,1	;delimo sa 2 y/2
		shr edx,1	;z/2
		add ebx,edx
		cmp eax,ebx	;eax(x)=3 i ebx(y)=3
		jb kraj
		mov y,ebx

	loop petlja

	kraj:
		xor eax,eax
main endp
end main