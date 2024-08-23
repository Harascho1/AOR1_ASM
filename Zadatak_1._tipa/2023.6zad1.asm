.386
.model flat, c

.data
	N dw 5
	KOL dd ?
.code
main proc
	xor edi,edi
	xor ecx,ecx
	mov di, N
	mov cl, 1
	mov bp, 2
	petlja:
		
		mov bx, N
		sub bx,cx
		;(n-i)

		xor eax,eax
		mov ax,bx
		mul bp
		mov ebx,eax
		;(i+1)*(n-i)

		shr ebx,cl
		;(i+1)*(n-i)/2^i

		add edi,ebx
		;brojilac = brojilac + sadasnja racunica

		inc cl
		inc bp
		cmp cx,N
		jl petlja

	mov eax,edi
	mov bx,N
	div bx
	mov KOL,eax


	ret
main endp
end main