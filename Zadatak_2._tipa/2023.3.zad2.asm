.386
.model flat,c

.data
	MAT dw 1,5,9,13,
			2,6,10,14,
			3,7,11,15,
			4,8,12,16
	N dw 4

.stack 4096

.code
fja proc
	push ebp
	mov ebp,esp
	pushf
	push eax
	push ebx
	push ecx
	push edx
	push esi

	mov esi,[ebp+8]
	mov cx,word ptr [ebp+12]
	movzx ecx,cx


	xor eax,eax
	xor ebx,ebx
	mov edx,ecx

	petljaPROC:
		add ax, word ptr [esi + ebx]
		add bx,2
		loop petljaPROC
	
	mov cx,dx
	mov edx,eax
	shr edx,16
	div cx
	mov [ebp+12],ax


	pop esi
	pop edx
	pop ecx
	pop ebx
	pop eax
	popf
	pop ebp
	ret 4
fja endp


main proc
	;uzmi kolonu ebx
	movzx ebx,N
	shl ebx,1

	;proveri za 3. elem matrice
	mov edi,4

	;prvobirtna inicijalizacija
	xor eax,eax
	movzx ecx,N

	petlja:
		
		lea esi,[MAT + eax]
		push N
		push esi
		
		call fja
		pop si
		cmp [MAT+edi],si
		jle no_swap
			mov [MAT+edi],si
		no_swap:
		add eax,ebx
		add edi,eax
		loop petlja


	ret
main endp
end main