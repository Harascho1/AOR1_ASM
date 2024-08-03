.386
.model flat, c

.data
	A dw 8
	D dd 4
	E dd 4

.code
main proc
	;NEOZNACENI
	;ponavljati max 16 puta
	mov ecx,16

	petlja:
		;prva racunica
		xor eax,eax
		mov ax, A
		shl eax, 2
		;trebalo bi da ide sve u registar eax
		;ne kao kod mnozenja dx:ax
		add ax, A
		adc eax, 0
		mov E,eax

		;druga racunica
		xor eax,eax
		mov ax, A
		shr ax, 2
		mov ebx, E
		shr ebx, 3
		sub eax,ebx
		sub D, eax

		;treca racunica
		inc E

		;cetvrta racunica
		xor edx,edx
		mov eax, E
		mov ebx, 3
		div ebx
		add eax, 2


		;moguce ispadanje
		xor eax, D
		cmp eax, E
		ja kraj

		loop petlja
	kraj:

	ret
main endp
end main