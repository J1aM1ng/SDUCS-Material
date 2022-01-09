;编程：实现一个子程序setscreen，为显示输出提供如下功能：
;(1) 清屏。
;(2) 设置前景色。
;(3) 设置背景色。
;(4) 向上滚动一行。
;
;入口参数说明：
;(1) 用 ah 寄存器传递功能号：0 表示清屏，1表示设置前景色，2 表示设置背景色，3 表示向上滚动一行；
;(2) 对于2、3号功能，用 al 传送颜色值，(al) ∈{0,1,2,3,4,5,6,7}

setscreen: jmp short set

    table  dw sub1,sub2,sub3,sub4

set:	push bx
	
	cmp ah,3		;判断传递的是否大于 3
	ja sret
	mov bl,ah
	mov bh,0
	add bx,bx		;根据ah中的功能号计算对应子程序的地址在table表中的偏移
	
	call word ptr table[bx]	;调用对应的功能子程序

sret:	pop bx	
	iret

;功能子程序1：清屏
sub1:   push bx
	push cx
        push es
        mov bx,0b800h
        mov es,bx
        mov bx,0
        mov cx,2000
sub1s:  mov byte ptr es:[bx],' '
        add bx,2
        loop sub1s
        pop es
        pop cx
        pop bx
	ret ;sub1 ends

;功能子程序2：设置前景色
sub2:	push bx
	push cx
	push es
	mov bx,0b800h
	mov es,bx
	mov bx,1
	mov cx,2000
sub2s:	and byte ptr es:[bx],11111000b	
	or es:[bx],al 
	add bx,2
	loop sub2s

	pop es
	pop cx
	pop bx
	ret ;sub2 ends

;功能子程序3：设置背景色
sub3:	push bx
	push cx
	push es
	mov cl,4
	shl al,cl
	mov bx,0b800h
	mov es,bx
	mov bx,1
	mov cx,2000
sub3s:	and byte ptr es:[bx],10001111b
	or es:[bx],al 
	add bx,2
	loop sub2s

	pop es
	pop cx
	pop bx
	ret ; sub3 ends

;功能子程序4：向上滚动一行
sub4:	push cx
	push si
	push di
	push es
	push ds

	mov si,0b800h
	mov es,si
	mov ds,si
	mov si,160			;ds:si指向第n+1行
	mov di,0			;es:di指向第n行
	cld
	mov cx,24;共复制24行

sub4s:	push cx
	mov cx,160
	rep movsb 			;复制
  	pop cx
	loop sub4s

	mov cx,80	
	mov si,0
sub4s1: mov byte ptr es:[160*24+si],' '		;最后一行清空
	add si,2
	loop sub4s1

	pop ds
	pop es
	pop di
	pop si
	pop cx
	ret ;sub4 ends