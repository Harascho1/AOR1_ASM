.386
.model flat, c

.stack 4096

.data
	n dw 7
	kol dd ?
	ost dd ?
	sum1 dd ?
	sum2 dd ?
.code
main proc
	xor ecx, ecx;
	xor eax,eax;
	xor edx, edx;
	xor esi, esi
	xor esp,esp;


	mov ebx, 1; i = 1
	mov ax, n ; prvo ponavljanje
	mov cx, ax; cx = n
	dec ecx;	cx - n - i
	
	petlja:
		mov esi, eax; cuvam vrednost eax da bih mogao da koristim akumulator za mnozenje
		mov eax, 2; eax = 2

		mul cx;	2*(n-i)
		mul bx; 2*(n-i)*i

		add eax, esi; dodajemo novu vrednost u sumu
		adc edx,0; dodajemo 1 ako ima prenos


		inc bx ;i++

		
	loop petlja ; n--
	mov sum1, eax
	mov sum2, edx
	;cuvam sumu
	mov si,255;maska za 0000 0000 1111 1111
	mov ax, n
	mul n ;n*n
	mul n :n*n*n
	and eax, esi; koristimo masku
	mov ecx,eax
	mov edx, sum2
	mov eax, sum1
	div ecx ;delimo sumu sa deliocem
	mov kol, eax
	mov ost, edx
	xor eax,eax

main endp
end main