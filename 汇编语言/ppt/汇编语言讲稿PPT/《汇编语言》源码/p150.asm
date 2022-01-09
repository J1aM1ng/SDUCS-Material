assume cs:code
code segment
start:
mov ax,2000h;准备工作
mov ds,ax
mov bx,1000h
mov ax,00BEh
mov [bx],ax
mov ax,0006h
mov [bx+2],ax
mov ax,226ah
mov [bx+4],ax

mov ax,2000h;书中实验的代码
mov ds,ax
mov bx,1000h
mov si,0
mov ax,[bx+2+si]
inc si
mov cx,[bx+2+si]
inc si
mov di,si
mov bx,[bx+2+di]

mov ax,4c00h
int 21h
code ends
end start