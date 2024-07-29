.386
.model flat, c
.stack 4096

.data
	N db 4
	A dd 0
	B dd 0

.code
main proc
	;Bi = eax
	;Ai = ebx
	;C = ecx
	;S = edi

	;C = N^4
	xor eax, eax
	mov al, N
	mul eax
	mul eax
	mov ecx, eax

	;S = N/2
	xor edx,edx
	mov dl, N
	shr dl,1
	mov edi, edx
	;

	loop_start:
		;inicijalizacija Ai i Bi
		mov eax, A
		mov ebx, B
		;

		;Bi = Bi-1 + 1
		inc ebx
		mov B, ebx
		;

		;(Bi + S) / C
		mov eax, ebx
		add eax, edi
		xor edx,edx
		div ecx
		xor edx,edx
		mov A, eax
		;

		;poredim
		mov eax, A
		mov ebx, B
		div ebx ;A/B
		xor eax,eax
		mov al,N
		cmp edx, eax
		je kraj
		;

		jmp loop_start

	kraj:
	ret
main endp
end main