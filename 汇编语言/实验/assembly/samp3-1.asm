prognam segment
;
main proc far
     assume cs: prognam
     org 100h
start:
    mov cx,50d 
new_shot:
    push cx
    call shoot
    mov cx,4000h
silent:
    loop silent
    pop cx
    loop new_shot
    mov al,48h
    out 61h,al 
    int 20h
main endp
;
shoot proc near 
    mov ax,140h 
    mov bx,20h 
    in al,61h 
    and al,11111100b 
sound:
    xor al,2 
    out 61h,al 
    add dx,9248h 
    mov cl,3
    ror dx,cl 
    mov cx,dx 
    and cx,1ffh 
    or cx,10 
wait:
    loop wait 
    ;
    dec bx 
    jnz sound 

    and al,11111100b 
    out 61h,al 
    ret 
shoot endp 
;
prognam ends 
;
    end start 