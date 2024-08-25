.386
.model flat, c

.data
	A dd 30
	M dw 10
	k db 2
	SUMA dd 0

.code
main proc
	;Ovaj broj ce da bude p
	xor edi,edi
	


	movzx ecx,k

	petlja:
		;brojilac
		mov eax,A
		mov esi,edi
		shr esi,cl
		shl esi,cl
		shl esi,2
		add eax,esi

		;imenilac
		mov ebx,A
		mov esi,edi
		shl esi,2
		sub ebx,esi

		;deljenje
		xor edx,edx
		div ebx
		add SUMA,eax

		inc edi
		cmp di,M
		jle petlja



	ret
main endp
end main