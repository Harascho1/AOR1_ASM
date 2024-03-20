.386
.model flat,c

.data
n dw 5
rez dd ?

.code
;od (2*(2*2+1)(3*2+1))/(2+1)) do (n(2*n+1)*(3*n+1)/(n+1))   za n>4
main proc
	xor eax, eax
	xor ecx,ecx
	mov cx,n
	mov esp,rez ;esp cuva rez
	mov ebp,1 ; prva iteracija
mov eax,2 ;pocetna vrednost
petlja:


	mov edi,eax
	mov ebx,eax
	
	mov esi,eax
	
	imul ebx,2 ; (2*n)
	inc ebx; (2*n+1)
	imul ebx ;(n*(2*n+1))
	imul edi,3 ;(3*n)
	inc edi;(3*n+1)
	imul edi ;(n*(2*n+1))*(3*n+1)
	inc esi ; ovo je ovo dole n+1
	idiv esi ;  ceo izraz
	xor edx,edx ; ne me briga za ostatak
	test ebp,1 ;proveravamo da li neparna iteracija ako jeste dodajemo ako nije plus
	jnz nepar
	
	sub esp,eax

	nepar:
	add esp,eax

xor eax,eax
	
	mov eax,esi ; novi n ce da bude zapravo n+1 s kojim smo delili gore
	inc ebp ; povecamo iteraciju
	mov rez,esp 
	loop petlja




main endp
end main