;编程：在屏幕的5行12列显示字符串“welcome to masm!”。

assume cs:code
data segment 
 db 'Welcome to masm!','$'
data ends

code segment
start:	mov ah,2 	;置光标
	mov bh,0	;第0页
	mov dh,5	;dh中放行号
	mov dl,12	;dl中放列号
	int 10h
	
	mov ax,data
	mov ds,ax
	mov dx,0	;ds:dx指向字符串的首地址data:0
	mov ah,9
	int 21h

	mov ax,4c00h
	int 21h 

code ends
end start
