.386
.model flat, c
.stack 4096

.data
	N dd 3
	M dd 4
	MAT dd 1,2,-3,4,
		5,6,-7,8,
		9,-10,-11,12
	NIZ dd ?

.code

fja proc
	push ebp
	mov ebp, esp
	pushfd

	;pushujemo potrebne registre
	push ebx
	push ecx
	push edi

	;inicijalizacija vrednosti
	mov ebx, [ebp + 16]
	mov ecx, [ebp + 12]
	mov edi, [ebp + 8]

	petlja:
		mov eax, [edi]
		cmp eax, 0
		jl NIJE
		;ako je broj veci 0 ili veci
		mov niz[ebx], eax
		add ebx, 4
		NIJE:
		add edi, 4
		loop petlja

	;cuvamo brojac za niz u steku
	mov [ebp + 16], ebx

	;praznimo stek
	pop edi
	pop ecx
	pop ebx
	popfd
	pop ebp
	ret 8
fja endp

main proc
	;ebx -> brojac za matricu
	;edx -> novi red za matricu
	;edi -> brojac za NIZ
	;ecx -> n i koristimo ga za loop

	;inicijalizacija vrednosti
	xor ebx,ebx
	xor edi,edi
	mov ecx, N
	mov edx, M
	shl edx, 2
	push edi

	loop_start:
		push M
		lea eax, MAT[ebx]
		push eax
		call fja
		add ebx,edx
		loop loop_start

	;Dodajemo na kraju -1 na kraj niza
	pop edi
	mov NIZ[edi], -1
	ret
main endp
end main