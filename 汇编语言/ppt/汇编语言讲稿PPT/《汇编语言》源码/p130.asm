assume cs:code,ds:data,ss:stack

data segment
  dw 0123H,0456H,0789H,0abcH,0defH,0fedH,0cbaH,0987H
data ends

stack segment
  dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
stack ends

code segment
start:mov ax,stack
      mov ss,ax
      mov sp,20h	;设置栈顶ss:sp指向stack:20
      
      mov ax,data
      mov ds,ax		;ds指向data段
      
      mov bx,0		;ds:bx指向data段中的第一个单元
      
      mov cx,8
    s:push [bx]
      add bx,2
      loop s		;以上将data段中的0~16单元中的8个字型数据依次入栈

      mov bx,0
      mov cx,8
   s0:pop [bx]
      add bx,2
      loop s0		;以上使8个字型数据依次出栈并送到data段的0~16单元中

      mov ax,4c00h
      int 21h
code ends
end start
