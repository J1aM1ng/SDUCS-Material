;编程：当发生除法溢出时，在屏幕中间显示“overflow！”，返回DOS。

;首先请结合前面的中断知识仔细分析，程序中的相关细节的处理。

assume cs:code
code segment
start:
	
	;相关处理	
	
      	mov ax,4c00h
      	int 21h

  do0:
	;显示字符串 "overflow!"

      	mov ax,4c00h;返回DOS
      	int 21h

code ends
end start
