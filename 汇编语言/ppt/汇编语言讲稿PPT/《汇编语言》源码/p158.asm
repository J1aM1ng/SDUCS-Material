assume cs:codesg,ds:datasg,ss:stacksg
datasg segment
	db 'ibm             '
	db 'dec             '
	db 'dos             '
	db 'vax             '
datasg ends

stacksg segment			;定义一个段，用来作栈段，容量为16个字节
	dw 0,0,0,0,0,0,0,0
stacksg ends

codesg segment
start: mov ax,stacksg
	mov ss,ax
	mov sp,16
	mov ax,datasg
	mov ds,ax

	mov bx,0

	mov cx,4
   s0:  push cx			;将外层循环的cx值压栈
	mov si,0
	mov cx,3		;cx设置为内层循环的次数
    s:  mov al,[bx+si]
	and al,11011111b
	mov [bx+si],al
	inc si
	loop s

	add bx,16
	pop cx			;从栈顶弹出原cx的值，恢复cx
	loop s0			;外层循环的loop指令将cx中的计数值减 1 

	mov ax,4c00h
	int 21h
codesg ends
end start

