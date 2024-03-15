.386
.model flat, c
.stack 4096

.data
	x dw 38
	y dw 2
	z dw 3

.code
main proc
	xor eax,eax
	xor ebx,ebx
	xor ecx,ecx
	xor edx,edx
	xor esi,esi
	xor edi,edi

	mov ax,10
	sub ax,13

	mov cx, x	;cuvam u cx vrednost x 
	mov ax, y	;cuvam u ax vrednost y jer mislim da cu sa y najvise da mnozim i delim
	mov bx, z	;cuvam u bx vrednost z jer ne znam

	;loop radi na x tacnije na vrednost cx
	ut:
		;racun za novo x
		mov di,ax	;da ne izgubimo y
		sub ax,1	;izgubili smo pocetno y
		mul cx		;cx je idalje x
		add ax,10
		adc dx,0	;kraj gornjeg dela razlomka

		;donji deo
		mov si,bx	;cuvamo vrednost z
		add bx,di	;z+y
		sub bx,1	;z+y-1
		div bx		;jedno deljenje
		xor dx,dx
		div bx		;drugo deljenje zbog kvadrata

					;proveravamo da li je 0


		mov cx,ax	;novo x
		cmp cx,0
		je kraj

		mov ax,di	;vratio sam y
		shr ax,1
		add ax,1
		;y mi je vec upamceno

		cmp ax,1
		jb kraj

		jmp ut


		

	kraj:
		mov x,cx
		mov y,ax




main endp
end main