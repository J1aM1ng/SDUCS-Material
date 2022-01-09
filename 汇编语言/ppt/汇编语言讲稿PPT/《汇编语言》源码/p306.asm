;最基本的字符串输入程序，需要具备下面的功能：
;（1） 在输入的同时需要显示这个字符串；
;（2）一般在输入回车符后，字符串输入结束；
;（3）能够删除已经输入的字符。

;编写一个接收字符串的输入子程序，实现上面三个基本功能。
;因为在输入的过程中需要显示，子程序的参数如下：
;	(dh)、(dl)=字符串在屏幕上显示的行、列位置；
;	ds:si 指向字符串的存储空间，字符串以O 为结尾符。

;功能子程序实现

charstack:jmp short charstart
   table dw charpush,charpop,charshow
   top dw 0   			;栈顶
charstart:
	push bx
	push dx
	push di
	push es

	cmp ah,2
	ja sret
	mov bl,ah
	mov bh,0
	add bx,bx
	jmp word ptr table[bx]

charpush:mov bx,top
	mov [si][bx],al
	inc top
	jmp sret

charpop:cmp top,0
	je sret
	dec top
	mov bx,top
	mov al,[si][bx]	
	jmp sret

charshow:mov bx,0b800h
	mov es,bx
	mov al,160
	mov ah,0	
	mul dh
	mov di,ax
	add dl,dl
	mov dh,0
	add di,dx

	mov bx,0

charshows:cmp bx,top
	jne noempty
	mov byte ptr es:[di],' '	
	jmp sret

noempty:mov al,[si][bx]
	mov es:[di],al
	mov byte ptr es:[di+2],' '
	inc bx
	add di,2
	jmp charshows

sret:	pop es
	pop di
	pop dx
	pop bx
	ret