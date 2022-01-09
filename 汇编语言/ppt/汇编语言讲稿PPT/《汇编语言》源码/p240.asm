;除法溢出演示程序
assume cs:code
code segment
strat:
	mov ax,1000h
	mov bh,1
	div bh    ;除法操作

	mov ax,4c00h
      	int 21h

code ends
end
