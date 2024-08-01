.386
.model flat, c
.stack 4096

.data
	A dd 4
	B dw 4
	X dw 1	;NE MOZE C jer ga kompajler ne gleda kao ime mem prostora
.code

main proc
	;nizi polubajtovi se zadrazvaju
	;visi se komplemetiraju

	;si -> brojac = m
	;ax -> truntni obradjeni broj
	;rezultat sume


	;inicijalizacija
	mov esi, 2
	xor edi,edi

	;mnozilac
	mov bx, 0f0f0h

	petlja:
		;maska
		movzx eax,si
		xor ax,bx

		;brojilac
		xor edx,edx
		mov dl, 3
		mul edx

		sub eax,A

		;imenilac
		movzx ecx,si
		shr cx,2
		add ecx, A

		;deljenje
		div ecx
		xor edx,edx

		add edi,eax
		inc si
		cmp si, B
		jle petlja

	;ostatak racunice
	xor ecx,ecx
	mov cx, B
	add cx,X
	adc ecx,0
	mov eax,edi
	div ecx

	ret

main endp
end main