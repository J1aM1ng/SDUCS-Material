assume cs:code,ds:data
data segment          
        a db 1,2,3,4,5,6,7,8
        b dw 0
data ends
code segment
start:  mov ax,data
        mov ds,ax
        mov si,0
        mov cx,8
s:      mov al,a[si]
        mov ah,0
        add b,ax
        inc si
        loop s

        mov ax,4c00h
        int 21h
code ends
end start
