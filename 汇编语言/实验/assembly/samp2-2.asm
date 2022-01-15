;program title goes here -- rank
datarea segment ;定义数据段
  grade dw 88,75,95,63,98,78,87,73,90,60
  rank  dw 10 dup(?)
datarea ends
;
prognam segment ;定义代码段
;
main proc far ;程序的主要部分
     assume cs:prognam,ds:datarea
start: ;执行部分地址开始
;设置返回栈
     push ds ;保存旧的数据段
     sub  ax,ax ;将AX置零
     push ax ;将其在栈中保存
; 将DS寄存器设置到当前数据段中
     mov  ax,datarea ;数据段地址
     mov  ds,ax ;放入DS寄存器
; 程序主要部分
     mov  di,10
     mov  bx,0
loop:
     mov  ax,grade[bx]
     mov  dx,0
     mov  cx,10
     lea  si,grade
next:
     cmp  ax,[si]
     jg   no_count
     inc  dx
no_count:
     add  si,2
     loop next
     mov  rank[bx],dx
     add  bx,2
     dec  di
     jne  loop
     ret  ;返回DOS
main endp ;程序主要部分结束
;
prognam ends ;代码段结束
     end  start ;汇编指令结束