.386
.model flat, c

.data
	MAT dd 0, 1, 2, 3,
		4, 5, 6, 7,
		8, 9, 10, 11,
		12, 13, 14, 15
	N dd 4
	M dd 4

.stack 4096	

.code

fja proc
	add ecx,edx
	mov [MAT+eax],ecx
	ret
fja endp

main proc
	;esi -> j
	;edi -> i
	;ebp -> pomeraj u matrici

	;smanjivanje N sa 2
	;zato sto necu da radim sa prvim i poslednjim redom
	dec N

	;velicina svake vrste
	;cuva se u ebp
	

	;incijalizacija
	mov edi,1

	poVrstama:
		

		mov esi,0
		poKolonama:
			cmp esi,0
			je krajKolone
			test esi,1
			jz krajKolone
			mov eax,esi
			inc eax
			cmp eax,M
			je krajKolone

			;priprema VRSTE
			mov ebp, M
			shl ebp, 2
			;priprema Kolone
			mov ebx, esi
			shl ebx, 2
			
			mov eax, edi
			dec eax
			mul ebp
			add eax,ebx
			mov ecx,[MAT + eax]
			mov eax, edi
			inc eax
			mul ebp
			add eax,ebx
			mov edx,[MAT + eax]
			sub eax,ebp
			call fja

			mov edx,[MAT + eax - 4]
			call fja

			mov edx,[MAT + eax + 4]
			call fja

			krajKolone:
			inc esi
			cmp esi,M
			jl poKolonama

		inc edi
		cmp edi,N
		jl poVrstama

	ret
main endp
end main