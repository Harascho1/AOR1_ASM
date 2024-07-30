.386
.model flat, c
.stack 4096

.data
	N db 4


.code

main proc
	;cl -> N
	;esi -> S
	;ebx -> C
	;edi -> SUMA
	;eax ->vrednost sa kojom radim u jednoj iteracija


	;izracunavamo C
	xor eax,eax
	mov al, N
	mul eax
	mul eax
	mov ebx, eax

	;izacuv=navamo S
	xor edx,edx
	mov dl, N
	shr dl, 1
	mov esi, edx
	

	;inicijalizacija
	mov ecx, 1
	
	petlja:
		xor eax,eax
		xor edx,edx
		add eax, ecx
		add eax, esi
		div ebx
		add edi, eax
		inc cl
		cmp cl, N
		jle petlja

	ret


main endp
end main