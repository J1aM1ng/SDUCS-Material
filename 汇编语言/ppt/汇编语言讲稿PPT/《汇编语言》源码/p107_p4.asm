;p107 小节 5.3 在Debug中跟踪用loop指令实现的循环程序 的实验程序5.4代码
;
assume cs:code
code segment
	mov ax,0ffffh
	mov ds,ax
	mov bx,6              ;以上，设置ds:bx指向ffff:6

	mov al,[bx]
	mov ah,0              ;以上，设置(al)=((ds*16)+(bx)),(ah)=0。

	mov dx,0              ;累加寄存器清0
	
	mov cx,3              ;循环123次
s:	add dx,ax
	loop s                ;以上累加计算(ax)*123

	mov ax,4c00h          ;程序返回
	int 21h

code ends
end