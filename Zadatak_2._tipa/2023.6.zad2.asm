.386
.model flat, c
.stack 4096

.data
	MAT dd 1,3,2,8,
			5,6,7,8,
			9,10,11,12,
			13,14,15,16
	N dd 4

.code
fja proc
    push ebp
    mov ebp, esp
    pushf
    push ecx
    push esi
    push ebx
    push eax

    mov ecx, [ebp + 8]   ; Uzimamo broj elemenata niza N
    mov esi, [ebp + 12]  ; Uzimamo adresu niza

    dec ecx

    outer_loop:
        xor ebx,ebx

        inner_loop:
            mov eax, [esi + ebx]
            cmp eax, [esi + ebx+4]
            jle no_swap

            ; Izvrsavanje zamene 
            mov edx, [esi + ebx+4]
            mov [esi + ebx+4], eax
            mov [esi + ebx], edx

        no_swap:
            add ebx,4
            mov edi,ecx
            shl edi,2
            cmp ebx,edi
            jl inner_loop

        loop outer_loop

    ; Vracanje sacuvanog stanja
    pop eax
    pop ebx
    pop esi
    pop ecx
    popf
    pop ebp
    ret 8
fja endp

main proc
    ;posto NE MOZE da se dodeli prostor u mem NIZ dd 4 dup (?)
    ;mora ovako:
    ;prvo cemo sve elemente sporedne matrice zameniti sa elementima
    ;prve vrste. Na kraju tog posla imacemo sve elemente sporedne matrice u prvoj vrsti
    ;pozovemo fju i dobije sortiranu prvu glavnu dijagonalu smestenu u prvoj vrsti matrice
    ;Na kraju samo zamenimo ponovo elemente matrice prve vrste sa elementima iz s. dijagonale
    ;NISTA LAKSE?

    mov ecx,N ;ecx<-N

    ;definisiemo pomeraj za glavnu dijagonalu
    mov edx, ecx
    dec edx
    shl edx,2
    mov ebx,edx
    add edx,ebx
    push edx

    ;za pomeraj kroz vrstu koriticemo ecx vljd

    dec ecx
    push ecx

    petlja1:
        mov eax,[MAT+ecx*4-4]
        mov esi,[MAT+edx]
        mov [MAT+ecx*4-4],esi
        mov [MAT+edx],eax

        ;povecavamo pomeraj za glavnu dijagonalu
        add edx,ebx

        loop petlja1

	push offset MAT
    push N
	call fja


    pop ecx
    pop edx
    
    ;vratis dijagonalu na mesto
    petlja2:
        mov eax,[MAT+ecx*4-4]
        mov esi,[MAT+edx]
        mov [MAT+ecx*4-4],esi
        mov [MAT+edx],eax

        ;povecavamo pomeraj za glavnu dijagonalu
        add edx,ebx

        loop petlja2
	ret

main endp
end main