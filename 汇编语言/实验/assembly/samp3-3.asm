read_c equ 0h
key_rom equ 16h 
up equ 48h 
down equ 50h 
right equ 4dh 
left equ 4bh 
block equ 0dbh 
esc equ 1bh
;
video segment at 0b800h 
wd_buff label word 
v_buff db 25 * 80 * 2 dup(?)
video ends 
;
pro_nam segment
;
main proc far 
assume cs:pro_nam, es:video 
;
start: push ds
       sub ax,ax
       push ax
       ;
       mov ax,video 
       mov es,ax
       ;
       mov cx,80 * 25 
       mov bx,0 
clear: mov es:[wd_buff+bx],0700h 
       inc bx 
       inc bx 
       loop clear 
       ;
       mov ch,12d 
       mov cl,40d 
get_char:
       mov ah,read_c 
       int key_rom 
       cmp al,esc 
       jz exit 
       mov al,ah 
       cmp al,up 
       jnz not_up 
       dec ch 
not_up:
       cmp al,down 
       jnz not_down 
       inc ch 
not_down:
       cmp al,right 
       jnz not_right 
       inc cl 
not_right:
       cmp al,left 
       jnz lite_it 
       dec cl 
lite_it:
       mov al,160d 
       mul ch 
       mov bl,cl 
       rol bl,1 
       mov bh,0 
       add bx,ax 
       ;
       mov al,block 
       mov es:[v_buff+bx],al 
       jmp get_char 
exit:  ret 
main   endp 
;
pro_nam ends
;
      end start