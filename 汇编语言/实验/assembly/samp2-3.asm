;统计学生成绩 -- result
;
datarea segment ;定义数据段
  ;伪指令dw定义字类型变量，一个字数据占2个字节单元，读完一个，偏移量加2
  grade dw      56,69,84,82,73,88,99,63,100,80
  s5    dw      0 ;低于60分的人
  s6    dw      0 ;60-69分的人
  s7    dw      0 ;70-79分的人
  s8    dw      0 ;80-89分的人
  s9    dw      0 ;90-99分的人
  s10   dw      0 ;100分的人
datarea ends
;
prognam segment ;定义代码段
;
;proc定义过程
main  proc far 
      ;建立段寄存器寻址，各寄存器值初始化
      ;代码段寄存器cs指向代码段起始地址，ds用于访问数据段，存储数据断点额起始地址
      assume cs:prognam,ds:datarea
start: ;程序的执行部分开始
;设置返回栈，即保存断点
      push ds ;保存旧的数据段
      sub  ax,ax ;给ax置零
      push ax ;将ax压栈
;把当前数据段的起始地址放入ds寄存器中
      mov  ax,datarea
      mov  ds,ax

      mov  s5,0
      mov  s6,0
      mov  s7,0
      mov  s8,0
      mov  s9,0
      mov  s10,0
      mov  cx,10 ;初始化循环计数器值
      mov  bx,offset grade ;将grade数据标号的当前偏移量移入bx寄存器，当前偏移量即首地址
compare:
      mov  ax,[bx] ;将grade当前偏移量对应的值（即bx当前存储的偏移量在内存中grade进行访存，取到该值）放入寄存器ax
      cmp  ax,60 ;隐含操作（ax)-60，判断(ax)<60?，并调整标志位
      jl   five ;jump less 小于则跳转
      cmp  ax,70 ;隐含操作（ax)-70，判断(ax)<70?，并调整标志位
      jl   six ;jump less 小于则跳转
      cmp  ax,80 ;隐含操作（ax)-80，判断(ax)<80?，并调整标志位
      jl   seven ;jump less 小于则跳转
      cmp  ax,90 ;隐含操作（ax)-90，判断(ax)<90?，并调整标志位
      jl   eight ;jump less 小于则跳转
      cmp  ax,100 ;隐含操作（ax)-100，判断(ax) == 100?，并调整标志位
      jne  nine ;不相等则跳转
      inc  s10 ;若上面都未跳转，则s10++
      jmp  short change_addr ;短转移
nine: 
      inc  s9 ;s9++
      jmp  short change_addr ;短转移
eight:
      inc  s8 ;s8++
      jmp  short change_addr ;短转移
seven:
      inc  s7 ;s7++
      jmp  short change_addr ;短转移
six:
      inc  s6 ;s6++
      jmp  short change_addr ;短转移
five:
      inc  s5 ;s5++
change_addr:
      add  bx,2 ;bx = bx + 2,读完一个grade中元素，则偏移量加2
      loop compare ;循环compare段，共循环10次，将grade中10个元素都跑一遍
      ret ;返回DOS
main  endp ;程序主要部分结束(过程结束)
;
prognam    ends ;代码段结束
;
           end    start  ;汇编程序结束
      