.386
.model flat, c

.data
	NIZ dw 1,2,3,4,5,6,7,8,9,0

.stack 4096

.code
fja proc
	add ax,bx
	mov [NIZ + edx], ax
	ret
fja endp

main proc
	lea esi, [NIZ]
	mov di,1
	xor edx,edx


	petlja:
		mov ax,[esi+edx]
		cmp ax,0
		je kraj
		cmp di, 3
		jne nije_3

		mov eax, [esi+edx-2]
		mov ebx, [esi+edx+2]
		cmp ebx,0
		je kraj
		call fja
		xor di,di

		nije_3:
		add di,1
		add edx,2
		jmp petlja

	kraj:
	ret
main endp
end main