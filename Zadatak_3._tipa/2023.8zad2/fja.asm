.386
.model flat, c
public fja
.code

fja proc
	push ebp
	mov ebp,esp
	pushfd
	push eax
	push ebx
	push ecx
	push edx
	push esi
	push edi

	;eax <- adresa niza
	;ecx <- N

	mov eax,[ebp+12]
	mov ecx,[ebp+8]

	;esi je indekser a bl je blanko znak
	mov esi,-1
	mov bl, 32


	;prodjemo kroz pvu rec
	prvaRec:
		inc esi
		cmp [eax+esi],bl
		jne prvaRec

	;nalazimo ostale reci
	;ovo je znak za kraj niza
	mov bh,0
	ostaleReci:
		inc esi
		;pozicija PRVOG SLOVA
		mov edi, esi


		;dl <- poslenje slovo abecede u reci
		;dh <- svako slovo koje se poredi sa dl
		;bl <- blanko znak
		;bh <- kraj stringa


		;praznimo registar edx da bi koristili dl i dh
		xor edx,edx
		;dodeljujemo slovo najvece vrednosti
		mov dl,[eax+esi]

		nalazenjeNajvecegZnaka:
			inc esi
			mov dh, [eax+esi]
			cmp dh,dl
			jle preskoci
				mov dl,dh 
			preskoci:
			cmp dh,bh
			je kraj
			cmp dh,bl
			jne nalazenjeNajvecegZnaka

		kraj:
		;insert deo
		mov ecx,[ebp+8]
		;dodajemo prvo novi kraj recenice
		mov [eax+ecx+1],bh
		insert:
			mov dh, [eax+ecx-1]
			mov byte ptr [eax+ecx],dh
			dec ecx
			cmp ecx,edi
			jne insert
		inc esi
		mov ecx,[ebp+8]
		inc ecx
		mov [ebp+8],ecx
		mov byte ptr [eax+edi],dl
		cmp [eax+esi],bh
		jne ostaleReci





	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	pop eax
	popfd
	pop ebp
	ret 4

fja endp
end