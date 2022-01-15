;查找匹配字符串search
datarea segment
	mess1 db 'Enter keyword:','$'
	mess2 db 'Enter Sentence:','$'
	mess3 db 'Match at location:','$' 
	mess4 db 'No match!',13,10,'$ '
	mess5 db 'match.',13,10,'$ '
	mess6 db 'H of the sentence.',13,10,'$ '
;
stoknin1 label byte
	max1 db 10
	act1 db ?
	stokn1 db 10 dup(?)
;
stoknin2 label byte
	max2 db 50
	act2 db ?
	stokn2 db 50 dup(?)
datarea ends
;
prognam segment
main proc far
	assume cs:prognam ,ds:datarea,es:datarea
start:
	push ds 
	sub ax,ax
	sub bx,bx
	push ax		
	mov ax,datarea
	mov ds,ax
	mov es,ax
;MAIN PART
	lea dx,mess1			;输入关键字
	mov ah,09
	int 21h
	lea dx,stoknin1
	mov ah,0ah
	int 21h			
	cmp act1,0
	je exit	        			
a10:					;输入句子 处理一些一定不能匹配的情况
	call crlf
	lea dx,mess2
	mov ah,09
	int 21h
	lea dx,stoknin2
	mov ah,0ah
	int 21h
	cmp act2,0
	je nmatch	
	mov al,act1
	cbw
	mov cx,ax
	push cx				
	mov al,act2 
	sub al,act1
	js nmatch			
	mov di,0
	mov si,0
	lea bx,stokn2;
	inc al				
a20:
	mov ah,[bx+di]			;开始比较
	cmp ah,stokn1[si]               ;不等则转到bx+1
	jne a30                         ;bx+1        
	inc si
	inc di
	;inc bx
	dec cx
	cmp cx,0
	je match
	jmp a20			
a30:                        
	inc bx                          ;比较一次，字符串的长度减少1
	dec al
	cmp al,0
	je nmatch
	mov si,0
	mov di,0
	pop cx
	push cx
	jmp a20	                        ;之后还是回到a20
exit:   
	call crlf	
	ret 
nmatch:				;no match则输出No match
	call crlf	
	lea dx,mess4
	mov ah,09
	int 21h
	jmp a10
match:				;match则输出位置信息
	call crlf				
	lea dx,mess3
	mov ah,09
	int 21h				
	sub bx,offset stokn2
	inc bx					
	call trans 			
	lea dx,mess6
	mov ah,09
	int 21h                         
	jmp a10
crlf proc near 			 ;回车，换行
	mov dl,0dh
	mov ah,2
	int 21h
	mov dl,0ah
	mov ah,2
	int 21h
	ret
crlf   endp
trans proc near			 ;转换为16进制，参考书上例6.3
	mov ch,4 		 ;number of digits
rotate: mov cl,4  	         ;set count to 4bits
	rol bx,cl		 ;left digit to right
	mov al,bl		 ;mov to al
	and al,0fh		 ;mask off left digit
	add al,30h		 ;convert hex to ASCII
	cmp al,3ah		 ;is it>9?
	jl printit		 ;jump if digit=0 to 9
	add al,7h		 ;digit is A to F
printit:
	mov dl,al 		 ;put ASCII char in DL
	mov ah,2		 ;Display Output funct
	int 21h			 ;call DOS
	dec ch			 ;done 4 digits?
	jnz rotate		 ;not yet
	ret			 ;return from trans
trans endp			;
main endp
;
prognam ends
;
	end start		