; 显示月份名 direct
;
datasg segment para 'data'
three  db      3
;13:回车  10：换行
mess   db      'month?',13,10,'$' ;$dos 09 功能调用所规定的字符串的结束符

monin  label   byte
  max  db      3
  act  db      ? ;?为随机填充
  mon  db      3 dup(?) ;dup伪指令重复定义前面的数据，定义次数为入参
;
alfmon db      '???',13,10,'$'

montab db      'JAN','FEB','MAR','APR','MAY','JUN' ;月份表
       db      'JUL','AUG','SEP','OCT','NOV','DEC'
;
datasg ends
;
;
codesg segment para 'code'
       assume cs:codesg,ds:datasg,es:datasg ;伪指令，设置对应寄存器的值
main   proc    far
       push ds
       sub  ax,ax
       push ax
;把当前数据段的起始地址放入ds和es寄存器中
       mov ax,datasg
       mov ds,ax
       mov es,ax
; 输入月份：
start:
       lea dx,mess ;将操作数mess的偏移地址取到dx寄存器中
       mov ah,09 ;把09这个编号放到ah中
       int 21h ;命令dos系统工作，调用dos系统功能，dos默认查找ah中值
       ;调用09号功能，在显示器中显示（内存中的）字符串
       lea dx,monin ;将monin的偏移地址取到dx寄存器中
       mov ah,0ah
       int 21h ;键盘输入到缓冲区,即用户输入月份数
       mov dl,13
       mov ah,02
       int 21h ;显示（当前）输出
       mov dl,10
       mov ah,02
       int 21h
       cmp act,0
       je  exit ;相等则跳转
; 
;把ascii码转换成二进制
       mov ah,30h ;设置月份
       cmp act,2
       je  two
       mov al,mon
       jmp conv
two:
       mov al,mon+1
       mov ah,monin
conv:
       xor ax,3030h 
       cmp ah,0 ;是否是1-9月？
       jz  loc
       sub ah,ah
       add al,10
; 在表中定位月份
;
loc:
       lea si,montab
       dec al
       mul three
       add si,ax
       mov cx,03
       cld
       lea di,alfmon
       rep movsb
;
;
       lea dx,alfmon
       mov ah,09
       int 21h
       jmp start
;
exit:
       ret ;返回dos
main   endp
;
codesg ends
;
       end   main