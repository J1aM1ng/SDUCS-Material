datarea segment 
    message1    db  'N=?',0ah,0dh,'$'
    message2    db  'What is the name of spindle X ?'
                db  0ah,0dh,'$'
    message3    db  'What is the name of spindle Y ?'
                db  0ah,0dh,'$'
    message4    db  'What is the name of spindle Z ?'
                db  0ah,0dh,'$'            
    flag        dw  0
    constant    dw  10000,1000,100,10,1
datarea ends
;*****************************************************
prognam  segment
;-----------------------------------------------------
main proc far 
        assume cs:prognam, ds:datarea
start:
        push    ds
        sub     ax,ax
        push    ax

        mov     ax,datarea
        mov     ds,ax

        lea     dx,message1
        mov     ah,09h
        int     21h
        call    decibin
        call    crlf

        cmp     bx,0
        jz      exit

        lea     dx,message2
        mov     ah,09h
        int     21h
        mov     ah,01h
        int     21h
        mov     ah,0
        mov     cx,ax
        call    crlf

        lea     dx,message3
        mov     ah,09h
        int     21h
        mov     ah,01h
        int     21h
        mov     ah,0
        mov     si,ax
        call    crlf

        lea     dx,message4
        mov     ah,09h
        int     21h
        mov     ah,01h
        int     21h
        mov     ah,0
        mov     di,ax
        call    crlf

        call    hanoi
exit:   ret
main    endp
;---------------------------------------------------
hanoi proc near
        cmp     bx,1
        je      basis
        call    save
        dec     bx
        xchg    si,di
        call    hanoi
        call    restor
        call    print
        dec     bx
        xchg    cx,si
        call    hanoi
        jmp     return
basis:  call    print
return: ret
hanoi   endp
;-------------------------------------------------------
print proc  near
        mov     dx,cx
        mov     ah,02h
        int     21h
        call    binidec
        mov     dx,di
        mov     ah,02h
        int     21h
        call    crlf
        ret
print   endp
;-----------------------------------------------------------
save  proc  near
        pop     bp
        push    bx
        push    cx
        push    si
        push    di
        push    bp
        ret
save    endp
;-----------------------------------------------------------
restor proc near
        pop     bp
        pop     di
        pop     si
        pop     cx
        pop     bx
        push    bp
        ret
restor  endp
;------------------------------------------------------------
decibin proc near       
        mov     bx,0
newchar:
        mov     ah,1
        int     21h
        sub     al,30h
        jl      exit1
        cmp     al,9d
        jg      exit1
        cbw

        xchg    ax,bx
        mov     cx,10d
        mul     cx
        xchg    ax,bx

        add     bx,ax
        jmp     newchar
exit1:  ret
decibin endp
;------------------------------------------------------------
binidec proc near
        push    bx
        push    cx
        push    si
        push    di
        mov     flag,0
        mov     cx,5
        lea     si,constant
dec_div:
        mov     ax,bx
        mov     dx,0
        div     word ptr[si]
        mov     bx,dx
        mov     dl,al

        cmp     flag,0
        jnz     print1
        cmp     dl,0
        je      skip
        mov     flag,1
print1: add     dl,30h
        mov     ah,02h
        int     21h
skip:   add     si,2
        loop    dec_div
        pop     di
        pop     si
        pop     cx
        pop     bx
        ret
binidec endp
;-------------------------------------------------------------
crlf proc near
        mov     dl,0ah
        mov     ah,02h
        int     21h

        mov     dl,0dh
        mov     ah,02h
        int     21h
        ret
crlf    endp
;-----------------------------------------------------------
prognam ends
;*************************************************************
end     start