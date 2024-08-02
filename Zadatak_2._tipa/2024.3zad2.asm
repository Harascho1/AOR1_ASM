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
	add eax,ebx
	ret
fja endp

main proc
	;ecx -> N, M
	;esi -> za prolaz kroz elemente
	;edi -> brojac

	;inicijalizacija
	mov ebp, M
	shl ebp, 2
	sub ebp, 4

	mov edi, M
	shl edi, 2
	add edi, 4


	mov ecx, M
	sub ecx, 2
	mov M, ecx
	mov ecx, N
	sub ecx, 2
	lea esi, MAT
	

	

	po_vrstama:
		mov N, ecx
		mov ecx, M

		po_kolonama:
			xor edx,edx
			;edi % (n*m - 4) == 0
			;then skoci na kraj
			mov eax, edi
			div ebp
			cmp edi, edx
			je kraj

			xor edx,edx
			mov eax,edi
			sub eax,4
			mov eax,[esi+eax]
			mov ebx,edi
			add ebx,4
			mov ebx,[esi+ebx]
			call fja
			mov edx,eax


			;ne treba da bude 16 vec 4 * m
			mov eax,edi
			sub eax,16
			mov eax,[esi+eax]
			mov ebx,edi
			add ebx,16
			mov ebx,[esi+ebx]
			call fja
			add edx,eax
			mov [MAT + edi], edx

			ne_zadovoljava:
			add edi, 8
			loop po_kolonama
		kraj:
		mov ecx, N
		loop po_vrstama

main endp
end main