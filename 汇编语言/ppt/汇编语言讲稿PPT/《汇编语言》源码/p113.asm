assume cs:code
code segment
	mov ax,0ffffh
	mov ds,ax	;设置(ds)=0ffffh
	
	mov dx,0	;初始化累加寄存器，(dx)=0
	
	mov al,ds:[0]
	mov ah,0 	;(ax)=((ds)*16+0)=(0ffff0h)
	add dx,ax	;向dx中加上0ffffh:0单元的数值

	mov al,ds:[1]
	mov ah,0 	;(ax)=((ds)*16+1)=(0ffff1h)
	add dx,ax	;向dx中加上0ffffh:1单元的数值

	mov al,ds:[2]
	mov ah,0 	;(ax)=((ds)*16+2)=(0ffff2h)
	add dx,ax	;向dx中加上0ffffh:2单元的数值

	mov al,ds:[3]
	mov ah,0 	;(ax)=((ds)*16+3)=(0ffff3h)
	add dx,ax	;向dx中加上0ffffh:3单元的数值

	mov al,ds:[4]
	mov ah,0 	;(ax)=((ds)*16+4)=(0ffff4h)
	add dx,ax	;向dx中加上0ffffh:4单元的数值

	mov al,ds:[5]
	mov ah,0 	;(ax)=((ds)*16+5)=(0ffff5h)
	add dx,ax	;向dx中加上0ffffh:5单元的数值

	mov al,ds:[6]
	mov ah,0 	;(ax)=((ds)*16+6)=(0ffff6h)
	add dx,ax	;向dx中加上0ffffh:6单元的数值

	mov al,ds:[7]
	mov ah,0 	;(ax)=((ds)*16+7)=(0ffff7h)
	add dx,ax	;向dx中加上0ffffh:7单元的数值

	mov al,ds:[8]
	mov ah,0 	;(ax)=((ds)*16+8)=(0ffff8h)
	add dx,ax	;向dx中加上0ffffh:8单元的数值

	mov al,ds:[9]
	mov ah,0 	;(ax)=((ds)*16+9)=(0ffff9h)
	add dx,ax	;向dx中加上0ffffh:9单元的数值

	mov al,ds:[0ah]
	mov ah,0 	;(ax)=((ds)*16+0ah)=(0ffffah)
	add dx,ax	;向dx中加上0ffffh:0ah单元的数值

	mov al,ds:[0bh]
	mov ah,0 	;(ax)=((ds)*16+0bh)=(0ffffbh)
	add dx,ax	;向dx中加上0ffffh:0bh单元的数值

	mov ax,4c00h	;程序返回
	int 21h
code ends
end 