assume cs:codesg
codesg segment
start:
	sub al,al
	mov al,1
	push ax
	pop bx
	add al,bl
	add al,10
	mul al
	mov ax,4c00h
	int 21h
codesg ends
end start
