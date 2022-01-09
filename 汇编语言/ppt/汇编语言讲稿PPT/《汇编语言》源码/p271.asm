;该程序 实现了动态显示时间的功能，按 'q' 键退出。

assume cs:code
code segment

        s1: db 9,8,7,4,2,0
        s2: dw 0,0,0,0,0,0
        s3: db '/','/',' ',':',':',' '

start:
        mov ax,cs
        mov ds,ax
        mov bx,offset s1
        mov si,offset s2

        mov cx,6
reads:  push cx
        mov al,[bx]
        out 70h,al
        in al,71h
        mov ah,al
        mov cl,4
        shr ah,cl
        and al,00001111b

        add ah,30h
        add al,30h
        mov [si],ah
        mov [si+1],al
        inc bx
        add si,2
        pop cx
        loop reads

        mov ax,0b800h
        mov es,ax
        mov bx,160*12+40*2
        mov si,offset s2
        mov di,offset s3

        mov ah,2
        mov cx,6
show:   mov al,[si]
        mov es:[bx],al 
        mov es:[bx+1],ah
        add bx,2
        mov al,[si+1]
        mov es:[bx],al 
        mov es:[bx+1],ah
        add bx,2
        mov al,[di]
        mov es:[bx],al 
        mov es:[bx+1],ah

        add bx,2
        add si,2
        inc di
        loop show

        in al,60h   ;read port 60h (keyborad input)
        cmp al,10h  ;check data
        jne start   ;dynamic show

        mov ax,4c00h
        int 21h

code ends
end start
