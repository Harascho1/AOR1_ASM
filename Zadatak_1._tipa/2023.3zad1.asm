.386
.model flat, c

.data
	X dw 4
	Y dw 16
	S dd 10

.code
main proc
	;za maksimalan broj ponavljanja
	mov ecx, 20


	petlja:
		;prva racunica
		movzx ebx,Y
		shr bx,3
		add X,bx

		;druga racunica
		movzx eax,Y
		mov dx,3
		mul dx
		div X ;(dx:ax)/(16b) -> ax
		movzx edx,X
		add edx,5
		sub edx,eax
		mov Y,dx

		;treca racunica
		movzx eax, Y
		movzx ebx, X
		add eax,ebx
		add S,eax


		loop petlja


	ret
main endp
end main