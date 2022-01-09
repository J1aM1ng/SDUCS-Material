assume cs:code
code segment
start:mov ax,cs
	mov ds,ax
	mov si,offset do0
	mov ax,0
	mov es,ax
	mov di,200h
	mov cx,offset do0end - offset do0
	cld
	rep movsb

	mov ax,0
	mov es,ax
	mov word ptr es:[0*4],200h
	mov word ptr es:[0*4+2],0

	mov ax,4c00h
	int 21h

  do0:  jmp short do0start
	db "divide error!",0
do0start:
	push cx
	mov ax,cs
	mov ds,ax
	mov si,202h

	mov ax,0b800h
	mov es,ax
	mov di,12*160+36*2

	
 show:  mov cl,[si]
	mov ch,0
	jcxz return
	mov es:[di],cl
	mov ch,2
	mov es:[di+1],ch
	inc si
	add di,2
	jmp show

return: pop cx
	mov ax,4c00h
	int 21h
do0end:nop
code ends
end start
