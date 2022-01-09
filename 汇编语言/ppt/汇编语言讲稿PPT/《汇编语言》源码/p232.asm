;编程：用串传送指令，将data段中的地一个字符串复制到它后面的空间中
assume cs:code,es:data

data segment
 db 'Welcome to masm!'
 db 16 dup(0)
data ends

code segment
start :         
	mov ax,data
	mov ds,ax
	mov si,0
	mov es,ax
	mov di,16
	mov cx,16
	cld
	rep movsb

	mov ax,4c00h
	int 21h
        
code ends
end start
