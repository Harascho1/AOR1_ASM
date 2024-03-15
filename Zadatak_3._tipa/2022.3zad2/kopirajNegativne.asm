.386
.model flat,c
public kopirajNegativne
.code
kopirajNegativne proc
	push ebp
	mov ebp, esp
	pushfd
	push esi
	push edi
	push ecx
	push edx

	mov esi, [ebp + 12]
	mov edi, [ebp + 8]
	xor eax,eax
	mov ecx, [ebp +16]
	petlja:
		movsx edx,word ptr[esi]
		cmp edx,0
		jnl dalje
		mov [edi],edx
		inc eax
		add edi,2
		dalje:
			add esi,2
	loop petlja
	pop edx
	pop ecx
	pop edi
	pop esi
	popfd
	pop ebp
	ret
kopirajNegativne endp
end