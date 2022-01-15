;PROGRAM TITLE GOES HERE--PHONE
datarea segment
message1 db 'Input name:','$'
message2 db 'Input a telephone number:','$'
message3 db 'Do you want a telephone number?(Y/N)','$'
message4 db 'name?',0ah,0dh,'$' 
message5 db 'name',19 dup(0),'tel.',0ah,0dh,'$'
message6 db 'Not find!',0ah,0dh,'$'
num dw 0;用来标识电话表中数据个数
phonein label byte
    pmax db 8
    pact db ?
    phone db 8 dup(?)
namein label byte
    nmax db 20
    nact db ?
    nam db 20 dup(?)
temp_nam db 20 dup(?);临时单元
temp_tab db 20 dup(?),4 dup(?),8 dup(?),13,10,'$'
;排序用，临时储存tel_tab中一项
tel_tab db 50 dup(20 dup(?),4 dup(?),8 dup(?),13,10,'$')
;每一项35（20+8+4+3）字节
datarea ends
;*************************************************
prognam segment
;------------------------------------------------
main proc far
    assume cs:prognam,ds:datarea,es:datarea     
start:
    push ds
    sub ax,ax
    push ax
    mov ax,datarea
    mov ds,ax
    mov es,ax
begin:
    lea dx,message1;输入名字
    mov ah,09h
    int 21h
    call clear;清空临时单元temp_nam和tel_tab中的内容；
    call input_name
    cmp nact,0
    je search;如果没有输入名字，表明输入结束，开始排序、查询
    call stor_name
    lea dx,message2;输入电话号码
    mov ah,09h
    int 21h
    call inphone
    call name_sort
    jmp begin;循环输入
search:
    mov ah,09
    lea dx,message3;提示是否进行查询
    int 21h
    mov ah,01h;键盘输入并回显
    int 21h
    cmp al,'N'

    call crlf
    mov ah,09
    lea dx,message4;提示输入名字进行查询
    int 21h
    call input_name
    cmp nact,0
    je exit
    call name_search
    call printline
    jmp search
exit:
    ret

main endp
;------------------------------------------------
input_name proc near;接收从键盘的输入名字，存储到存储单元namein
    lea dx,namein
    mov ah,0ah
    int 21h
    call crlf
    ret
input_name endp
;-----------------------------------------------
stor_name proc near;从存储单元name的姓名存储到临时表项temp_tab
    cmp nact,0
    je exit1
    lea si,nam
    lea di,temp_tab
    sub ch,ch
    mov cl,nact
    cld
    rep movsb
exit1:
    ret
stor_name endp
;--------------------------------------------------
;接收键盘输入的电话号码，并存储到phonein，然后在存储到临时表项temp_tab
inphone proc near;存储N,X,Y,Z
    lea dx,phonein
    mov ah,0ah
    int 21h
    cmp pact,0
    je exit2
    call crlf
    lea si,phone
    lea di,temp_tab
    add di,23;phone
    sub ch,ch
    mov cl,pact
    cld;自动增量
    rep movsb
exit2:
    ret
inphone endp
;---------------------------------------------
;根据名字进行排序，首先找到插入位置，然后从最后一个表项开始前面的一个表项复制到
;后面的表项，到达插入位置后，将临时表项(temp_tab)中的内容复制到对应位置
name_sort proc near;恢复N,X,Y,Z
    cmp num,0
    jnz sort
    lea si,temp_tab;如果表项中没有内容，直接插入
    lea di,tel_tab
    mov cx,35;要传送的数据段长度
    cld
    repz movsb
    jmp exit3
sort:
    mov cx,num
    lea si,temp_tab
    lea di,tel_tab
loopsort:
    push di
    push cx
    mov cx,20
    repz cmpsb
    ja move;如果si>di,则使di指向下一个表项，继续循环
    pop cx
    pop di
    call insert
    jmp exit3
move:
    pop cx
    pop di
    add di,35
    lea si,temp_tab
    loop loopsort
    mov cx,35;正常退出循环，说明需要插入在最后
    rep movsb
exit3:
    inc num;表项个数加1
    ret
name_sort endp;此处，没有正确返回，因为push进去没有pop出来
;--------------------------------------------------
;进入此子程序后，cx存储着需要移动的表项个数，从后往前进行复制（移动）
insert proc near
    mov ax,num;num-cx+1是位置，cx是需要移动的表项个数
loopinsert:
    push ax
    mov bx,35
    mul bx;字节总数35*num
    lea di,tel_tab
    add di,ax
    mov si,di;di目前指向num*35
    sub si,35;si目前指向num*(35-1)
    push cx
    mov cx,35
    rep movsb
    pop cx
    pop ax
    dec ax
    loop loopinsert

    lea si,temp_tab;插入待插入位置
    lea di,tel_tab
    mov bx,35
    mul bx
    add di,ax
    mov cx,35
    rep movsb
    ret
insert endp
;------------------------------------------------------------
name_search proc near
    call clear
    mov ch,0
    mov cl,nact
    lea si,nam
    lea di,temp_nam;name-->temp_nam
    rep movsb
    mov cx,num;搜寻名字循环次数
    lea di,tel_tab
    lea si,temp_nam
loopfind:
    push di
    push cx
    mov ch,0
    mov cl,20
    repz cmpsb;为0时重复串操作
    je found;找到，则num-cx为位置
    pop cx
    pop di
    add di,35;没找到就di+35
    lea si,temp_nam
    loop loopfind
    mov cx,0;没找到
    jmp exit4
found:
    pop cx
    pop di
exit4:
    ret
name_search endp
;-------------------------------------------------------------------
printline proc near
    cmp cx,0
    jnz next
    mov ah,09
    lea dx,message6;未找到
    int 21h
    jmp exit5
next:
    lea dx,message5
    mov ah,09
    int 21h
    mov ax,num
    sub ax,cx
    mov bx,35
    mul bx;(num-cx)*35
    lea dx,tel_tab
    add dx,ax
    mov ah,09
    int 21h
exit5:
    ret
printline endp
;--------------------------------------------------------------
crlf proc near
    mov dl,0ah
    mov ah,02h
    int 21h
    mov dl,0dh
    mov ah,02h
    int 21h
    ret
crlf endp
;--------------------------------------------------------------
clear proc near
    lea di,temp_tab
    xor al,al;一样的数字，异或之后全为0
    mov cx,32
    rep stosb
    lea di,temp_nam
    xor al,al
    mov cx,20
    rep stosb
    ret
clear endp
;--------------------------------------------------------------
prognam ends
    end start
