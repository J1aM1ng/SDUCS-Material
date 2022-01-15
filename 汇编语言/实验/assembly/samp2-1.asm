;program title goes here -- tabsrch
;table search
;
datasg segment para 'data'
mess1 db 'stock nember?',13,10,'$'
;
stoknin label byte
  max db 3
  act db ?
  stokn db 3 dup(?)
;
stoktab db '05','  Excavators'
        db '08','  Lifters   '
        db '09','  Presses   '
        db '12','  Valves    '
        db '23','  Processors'
        db '27','  Pumps     '
;
descrn  db 14 dup(20h),13,10,'$'
mess    db 'Not in table!','$'
datasg ends
;
codesg segment para 'code'
       assume cs:codesg,ds:datasg,es:datasg
;
main proc far
     push ds ;save old data segment
     sub  ax,ax ;put zero in AX
     push ax ;save it on stack
     mov ax,datasg ;data sement addr
     mov ds,ax ;into DS register
     mov es,ax ;into ES register
; main part of program goes here
start:
      lea dx,mess1 ;prompt for stock number
      mov ah,09
      int 21h
      lea dx,stoknin
      mov ah,0ah
      int 21h
      cmp act,0
      je exit
      mov al,stokn ;git stock#
      mov ah,stokn+1
      mov cx,06 ;no. of entries
      lea si,stoktab ;init table address
a20:
      cmp ax,word ptr[si] ;stock# : table
      je  a30 ;equal - exit
      add si,14 ;not equal - increment
      loop a20
      lea dx,mess ;not in table
      mov ah,09
      int 21h
      jmp exit
a30:
      mov cx,07 ;length of descr'n
      lea di,descrn ;addr of descr'n
      rep movsw
;
      lea dx,descrn
      mov ah,09
      int 21h
      jmp start
exit:
      ret ;return to DOS
main  endp
;
codesg ends ;end of code segment
;
       end main ;end assembly