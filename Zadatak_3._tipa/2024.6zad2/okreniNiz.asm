.386
.model flat, c
public okreniNiz
.code

okreniNiz proc
	push ebp
	mov ebp,esp
	pushfd
	push eax
	push ebx
	push ecx
	push edx
	push esi
	push edi

	;ecx -> m
	;eax -> i
	;ebx -> m-i
	;esi -> niz

	mov ebx,[ebp+12]
	mov ecx,ebx
	dec ebx
	shl ebx,2
	shr ecx,1
	mov esi,[ebp+8]
	xor eax,eax
	petlja:
		mov edx, [esi+eax]
		mov edi, [esi+ebx]
		mov [esi+eax],edi
		mov [esi+ebx],edx
		add eax,4
		sub ebx,4
	loop petlja

	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	pop eax
	popfd
	pop ebp
	ret

okreniNiz endp
end