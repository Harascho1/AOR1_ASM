.386
.model flat,c
.stack 4096
.data
niz dw 1,5,6,7,8,9,12,32,11,0
sum dd ?

.code
saberi proc
    push ebp
    mov ebp, esp
    pushfd
  

    mov eax,sum
    mov eax, [ebp+12] ;edx i+1 
    add eax, [ebp+8]   ;ebx i-1
    
    
    popfd
    pop ebp
 
    ret 
saberi endp

main proc
    xor ebx, ebx
    xor esi, esi
    lea esi, niz
    mov eax, 1
    mov edi, 0
    mov bx, 3
    xor ebp, ebp
petlja:
mov ecx, [esi+edi]
    xor edx, edx
     mov bx, 3
    cmp ecx, 0
    jz kraj
    mov ebp,eax
    idiv bx
    cmp dx, 0
    je treci
    mov edx, ecx
    add di, 2
    mov eax, ebp
    inc ax
    jmp petlja
treci:
    mov eax, ebp
    shl eax, 1
    xor edx, edx
    mov edx, [esi+eax]

    dec ebp
    xor ebx, ebx
    mov bx, [esi+ebp]
    xor ebp, ebp
    push edx
    push ebx
    call saberi
    mov ebx,eax
    mov [esi+edi],ebx
    xor eax,eax
    xor ebx,ebx
    mov eax,edi
 

    jmp petlja
kraj:
    main endp
    end main