.386
.model flat, c
.stack 4096

.data
    mat dd 1,2, 3, 4
        dd 10, 3, 8, 15
        dd -5, -3, -1, 10
        dd -4, -10, 7, 0
    n dd 4
.code
procedura proc
    push ebp
    mov ebp, esp
    push ebx
    pushf

    mov ebx, [ebp+8];mat[i+1]
    mov eax, [ebp+12];mat[i]
    cmp eax, ebx
    je jednaki
    cmp eax, ebx
    jl manji
    veci:
        mov eax,2
        jmp kraj
    manji:
        mov eax,1
        jmp kraj
    jednaki:
        mov eax, 0
    kraj:
        popf
        pop ebx
        pop ebp
        ret 8

procedura endp
main proc
    xor eax, eax
    mov ecx, n; u ecx je N
    lea esi, mat; adresa pocetka matrice je u esi
    mov eax, n;
    mov ebx, 4;
    mul ebx; mnozi pomeraj sa max el niza 
    mov edx, eax; u edx ide n
    dec ecx; smanjimo ga za 1 jer spoljna petlja ide do n-1
    spoljni:
        mov ebx, ecx
        mov ecx, n
        unutrasnji:
            mov eax, [esi]
            mov edi, [esi+edx]; onaj ispod njega
            push eax;gornji
            push edi;donji
            call procedura
            cmp eax, 1 ;proverava da li je manji
            jne kraj
            mov eax, [esi] ;smesti vrednost koju treba da menja nazad u eax
            mov [esi], edi ;menjaju vrednosti
            kraj:
                add esi, 4
                loop unutrasnji
        mov ecx, ebx
        loop spoljni


main endp
end main