
assume cs:code,es:data

data segment
 db "Beginner's All-purpose Symbolic Instruction Code.",0
data ends

code segment
start :      	   
	mov ax,data
	mov ds,ax
	mov si,0
	
	mov dh,8
      	mov dl,3
      	mov cl,2;green	
	call showstr
	
	call letterc
	
	mov dh,10
      	mov dl,3
      	mov cl,6;yellow
	call showstr
	
	mov ax,4c00h
	int 21h

letterc:push cx
	push si
check:	mov cx,0
	mov cl,[si]
	jcxz lret
	cmp cl,'a'
	jb next
	cmp cl,'z'
	ja next
	sub cl,20h
	mov [si],cl
next:	inc si
	jmp check	
lret:
	pop si
	pop cx
	ret

showstr:
	push ax
	push bx
	push cx
	push dx
	push si

	push cx
      	mov al,160
      	mul dh
      	mov bx,ax
      	mov ax,2
      	mul dl
      	add bx,ax
      	mov ax,0b800h
      	mov es,ax
    s:mov al,ds:[si]
      	mov cl,al
      	mov ch,0
      	jcxz ok
      	mov es:[bx],cl
      	inc bx
      	pop  cx
      	mov ch,0
      	mov ax,cx
      	mov es:[bx],al
      	push cx
      	inc bx
      	inc si    
      	jmp short s

   ok:	pop cx
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
      	ret

      	  
code ends
end start
