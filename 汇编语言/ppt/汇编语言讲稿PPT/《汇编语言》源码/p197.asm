assume cs:code
stack segment
	db  8 dup (0)	;1000:0000  00 00 00 00 00 00 00 00
	db  8 dup (0)	;1000:0008  00 00 00 00 00 00 00 00
stack ends

code segment
start:	mov ax,stack	;1001:0000 B8 05 14	
	mov ss,ax	;1001:0003 8E D0
	mov sp,16	;1001:0005 BC 10 00
	mov ax,1000	;1001:0008 B8 E8 03
	call s		;1001:000B E8 05 00

	mov ax,4c00h	;1001:000E B8 00 4C
	int 21h		;1001:0011 CD 21

    s:	add ax,ax	;1001:0013 03 C0
	ret		;1001:0015 C3
code ends

end start
