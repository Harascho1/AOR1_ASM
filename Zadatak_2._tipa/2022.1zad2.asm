;ZADATAK:
;Napisati proceduru na asemblerskom jeziku koja oderedjuje
;maksimalni element niza oznacenih brojeva 32b elemenata 
;zadatag broja elemenata. Ulazne i izlazni parametar prenosi
;preo steka. Napisati program na asemblerskom jeziku koji,
;koriscenjem napisane procedure, odredjuje maksimalne
;elemente svake vrste marice ismesta ih u niz. Matrica je
;kvadratna, reda N(32b podatak), smestena u memoriji po 
;vrstama. Dati primer ulaznih podataka i ocekivanu vrednost
;rezultata

.386
.model flat,c
;MEMORIJA
.data
	niz dd ?
	mat dd 1, 2, 3, 10
		dd 4, 5, 6, 11
		dd 7, 8, 9, 12
		dd 13, 14, 15, 16

	n dd 4

.stack 4096				;posto koristimo STEK

.code
;FUNKCIJA
max proc
	push ebp			
	mov ebp,esp			;pusujemo njega da bih ga koristili kroz stek
	pushfd				;pusuje sve flegove
	pushad				;pusuje sve registre
	mov ecx,[ebp+12]	;n vrednost
	dec ecx				;zato sto cemo odmah na pocetku LOOPa da poredimo brojeve
	mov edi,[ebp+8]		;pointer na prvi element
	mov eax,[edi]		;prvi element
	add edi,4			;ovde skace na drugi da bih ga odmah poredio
						;+4 jer je tip bb(32bitni)
	gore:
		mov ebx,[edi]
		cmp ebx,eax
		jg petlja		;ako je novi broj veci od maxa
		jmp dole		;ako nije samo nek skoci i poveca brojac
		petlja:
			mov eax,ebx	;menja vrednost posto je nasao novi max
		dole:
			add edi,4
	loop gore
	mov [ebp+12],eax
	popad
	popfd
	pop ebp
	ret 4				;VEVATNO da bi ispraznio i onaj deo steka 
						;gde je samo pocetak niza
max endp
;MAIN
main proc
	;posto su vrednosti 32 bita ne moramo da XORujemo

	mov ebx,0			;ovaj registar koristimo za matricu
	mov edi,0			;ovaj registar koristimo za niz
	mov ecx,n			;dodeljujemo n ecx registru posto cemo da koristimo loop
	mov edx,n
	shl edx,2
	gore:
		push n
		lea eax,mat[ebx]
		push eax
		call max
		pop niz[edi]
		add ebx,edx
		add edi,type niz
	loop gore
	ret
main endp
end main

