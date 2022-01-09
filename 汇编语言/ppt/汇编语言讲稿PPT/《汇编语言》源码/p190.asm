assume cs:codesg

stack segment
	db 16 dup (0)
stack ends

codesg segment
	mov ax,4c00h
	int 21h
start:	mov ax,stack
	mov ss,ax
	mov sp,16
	mov ax,0

	push ax

	mov bx,0
	ret
codesg ends

end start
