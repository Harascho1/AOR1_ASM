.386
.model flat, c

.data
	n dw 7
	SUMA dd ?
.code
main proc
	;esi <- suma
	;eax <- svaka zasebna suma
	;cx <- suma

	xor eax,eax
	movzx ebx,n
	mov ecx,1

	mov SUMA,ebx

	petlja:
		movzx eax,n
		sub ax,cx
		inc cx
		mul cx
		;e sad ovde imamo problem sa siftovanje
		;jer mozes da siftujes samo sa cl registrom
		;cx uzima vrednost n koji je 16b, a cl je 8b
		;ali nama je dovoljno da siftujemo za vrednost cl = 32
		;da izbrisem celu vrednost eax registra
		cmp cx,32
		jl racunaj
			xor eax,eax
		racunaj:
			shr eax,cl

		test cx,1
		jnz bezMinusa
			minus:
			neg eax
		bezMinusa:
		add SUMA,eax

		cmp cx,bx
		jl petlja

	ret
main endp
end main