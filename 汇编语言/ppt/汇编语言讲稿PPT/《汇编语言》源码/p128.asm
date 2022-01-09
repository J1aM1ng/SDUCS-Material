assume cs:codesg
codesg segment
	dw 0123H,0456H,0789H,0abcH,0defH,0fedH,0cbaH,0987H
	dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  	
				;用dw定义8个字型数据，在程序加载后，将取得8个字的
			    	;内存空间，存放这8个数据。我们在后面的程序中将这段
			    	;空间当作栈来使用。
  start: mov ax,cs		
	 mov ss,ax
	 mov sp,30h		;设置栈顶ss:sp指向cs:30

	 mov bx,0
	 mov cx,8
      s: push cs:[bx]
	 add bx,2
	 loop s			;以上将代码段0~15单元中的8个字型数据依次入栈

	 mov bx,0
	 mov cx,8
     s0: pop cs:[bx]
	 add bx,2
	 loop s0		;以上依次出栈8个字型数据到代码段0~15单元中
	 mov ax,4c00h
	 int 21h
codesg ends
end start			;指明程序的入口在start处