assume cs:b,ds:a,ss:c

a segment
  dw 0123H,0456H,0789H,0abcH,0defH,0fedH,0cbaH,0987H
a ends

c segment
  dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
c ends

b segment
d:    mov ax,c
      mov ss,ax
      mov sp,20h	;设置栈顶ss:sp指向c:20
      
      mov ax,a
      mov ds,ax		;希望用ds:bx访问a段中的数据，ds指向a段

      mov bx,0		;ds:bx指向a段中的第一个单元
      mov cx,8
    s:push [bx]
      add bx,2
      loop s		;以上将a段中的0~15单元中的8个字型数据依次入栈

      mov bx,0
      mov cx,8
   s0:pop [bx]
      add bx,2
      loop s0		;以上使8个字型数据依次出栈并送到a段的0~15单元中

      mov ax,4c00h
      int 21h
b ends
end d
