assume cs:code
data segment
  db 'conversation'
data ends

code segment
start:	mov ax,data
      	mov ds,ax
      	mov si,0		;ds:si指向字符串（批量数据）所在空间的首地址
      
      	mov cx,12		;cx存放字符串的长度
	call capital

      	mov ax,4c00h
      	int 21h
capital:and byte ptr [si],11011111b
	inc si
	loop capital
      	ret
code ends
end start
