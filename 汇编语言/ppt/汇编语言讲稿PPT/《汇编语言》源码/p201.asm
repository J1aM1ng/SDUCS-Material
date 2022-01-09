assume cs:code
data segment
dw 1,2,3,4,5,6,7,8
dd 0,0,0,0,0,0,0,0
data ends

code segment

start:mov ax,data
      mov ds,ax
      mov si,0		;ds:si指向第一组word单元
      mov di,16		;ds:di指向第二组dword单元

      mov cx,8
    s:mov bx,[si]
      call cube
      mov [di],ax
      mov [di].2,dx
      add si,2		;ds:si指向下一个word单元
      add di,4		;ds:di指向下一个dword单元
      loop s

      mov ax,4c00h
      int 21h
 cube:mov ax,bx
      mul bx
      mul bx
      ret
code ends
end start
