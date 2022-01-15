datasg segment para 'data'
	targetStr label byte
		max db 80
		act db ?
		buf db 80 dup(?) ;标准输入对应的缓冲区

    X1 db 0 ;小写字母
    X2 db 0 ;大写字母
    X3 db 0 ;数字
    X4 db 0 ;其他字符

    mess1 db '[INFO] Please input the string.',13,10,'$'
	  mess2 db '[INFO] Successfully got the string.',13,10,'$'

datasg ends

codesg segment para 'code'
	assume cs:codesg,ds:datasg,es:datasg

main	proc	far
	push ds
	sub ax,ax
	push ax
;把当前数据段的起始地址放入ds和es寄存器中
	mov ax,datasg
	mov ds,ax
	mov es,ax

start:
	lea dx,mess1
	mov ah,09
	int 21h
	
	lea dx,targetStr
	mov ah,0ah
	int 21h
	cmp act,0
	je toExit ;相等则跳转
    
	lea dx,mess2
	mov ah,09
	int 21h
  jmp work

work:
	lea bx,buf ;定位首个字符
	mov cx,X1-buf ;计算字符个数,以将循环计数器存入cx中

lop:
	mov al,[bx]
	cmp al,'a'
	jb next1
	cmp al,'z'
	ja next1
	inc X1 ;小于a大于z说明是小写字母则跳到下一项，否则X1+1
	jmp exit

next1:
	cmp al,'A'
	jb next2
	cmp al,'Z'
	ja next2
	inc X2 ;小于A大于Z说明是大写字母则跳到下一项，否则X2+1
	jmp exit

next2:
	cmp al,'0'
	jb next3
	cmp al,'9'
	ja next3
	inc X3 ;小于0大于9说明是数字则跳到下一项，否则X3+1
	jmp exit

next3:
	inc X4 ;剩下就是其它字符了，X4+1
	
exit:
	inc bx
	loop lop ;循环
	jmp toExit

toExit:
	mov ax,4c00h
	int 21h

main endp
codesg ends
end main