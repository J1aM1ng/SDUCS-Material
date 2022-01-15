; compare string
datarea segment                       		;define data segment  
	string1 db 'Move the cursor backward.'
	string2 db 'Move the cursor forward.'
	;
	mess1   db 'Match.',13,10,'$''$'
	mess2   db 'No match!',13,10,'$''$'
datarea ends
;

prognam segment                                		;define code segment    
	;
main proc far
	        assume cs:prognam,ds:datarea,es:datarea
	start:                                         	;starting execution address         
	;设置返回栈
	        push   ds                              	;save old data segment              
	        sub    ax,ax                           	;put zero in AX                     
	        push   ax                              	;save it on stack                       
	;设置ds,es段寄存器
	        mov    ax,datarea                      	;datarea segment addr            	
	        mov    ds,ax                           	; into DS register                    
	        mov    es,ax                           	; into ES register                    
	;比较字符串
	        lea    si,string1
	        lea    di,string2
	        cld
	        mov    cx,25
	        repz   cmpsb
	        jz     match
	        lea    dx,mess2
	        jmp    short disp
	match:         
	        lea    dx,mess1
	disp:          
	        mov    ah,09
	        int    21h
	        ret                                    	;return to DOS                              
main endp                                      		;end of main part of program         	
	;
prognam ends                                   		;end of code segment                       
;
end start ;end assembly