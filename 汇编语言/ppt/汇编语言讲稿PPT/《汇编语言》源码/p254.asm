assume cs:code
data segment
	db 'conversation',0
data ends

code segment
start:	mov ax,data
	mov ds,ax
	mov si,0

	int 7ch

	mov ax,4c00h
	int 21h
code ends
end start
