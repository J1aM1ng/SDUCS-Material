; 示例4.1
;*******************************************************
data segment
 Pgsize dw ?
 
 buf_size  db 80
 s_buf db ?
 buf db 200 dup(?)
 read_size dw ?

 cur    dw ?
 handle    dw ?
 mess_getname db 0dh,0ah," Please input filename: $"
 mess_err1 db 0ah,0dh," Illegal filename ! $"
 mess_err2 db 0ah,0dh," File not found !$"
 mess_err3 db 0ah,0dh," File read error !$"
 mess_psize   db 0ah,0dh," Page Size : $"
 crlf   db 0ah,0dh,"$"
 mess_star db 0ah,0dh,"*********************************************"
     db 0ah,0dh,"$"
data  ends
;******************************************************
code segment
     assume ds:data,cs:code
     
main proc far
 start:    
     push   ds       ;保存旧的数据段
     sub ax,ax
     push   ax
     mov ax,data
     mov ds,ax

     mov Pgsize,12      ;设置初始页面行数
     mov cur,200     ;buf现在为空
     call   getline     ;得到输入的文件名
     call   openf       ;打开文件;(ax)=0 则没有指定的文件
     or  ax,ax       
     jnz display     ;ax不等于0跳转，等于0则输出错误信息
     
     mov dx,offset mess_err2  ;此时ax=0，输出错误信息
     mov ah,09h
     int 21h

     jmp file_end
 display:  
     mov cx,Pgsize
 show_page:   
     call   read_block     ;从文件中读200个字节到buf，读一行
     or  ax,ax
     jnz next2       ;(ax=1)成功则跳转

     mov dx,offset mess_err3
     mov ah,09h
     int 21h      ;读入失败输出错误信息
     jmp file_end
 next2:    
     call   show_block     ;打印出buf中的一行
     or  bx,bx
     jz  file_end    ;(bx)=0 则到了文件尾，文件读取结束.
     or  cx,cx
     jnz show_page      ;(cx)=0则这一页显示结束，cx不为0则跳转至show_page

     mov dx,offset mess_star
     mov ah,09h
     int 21h      ;打印出一行**
 wait_space:  
     mov ah,1
     int 21h      ;键盘输入并回显，在al中

     cmp al," "
     jnz psize       ;不是空格，则跳转
     jmp display     ;是空格，则显示下一页
 psize:    
     cmp al,"p"
     jnz wait_space     ;也不是p则继续等待
     call   change_psize   ;是p则改变之后每一页的显示行数
 here:  
     mov ah,1
     int 21h

     cmp al," "      ;再一直等待空格的出现，然后进行下一页的显示
     jnz here
     jmp display

 file_end: 
     ret
main endp
 ;******************************************************

 ;******************************************************
change_psize proc near
     push   ax
     push   bx
     push   cx
     push   dx

     mov dx,offset mess_psize
     mov ah,09h  
     int 21h     ;输出 Page Size :

     mov ah,01
     int 21h     ;输入一个字符，al

     cmp al,0dh     ;输入的为回车，跳转
     jz  illeg      
     sub al,"0"     ;否则得到输入对应的一位数的二进制
     mov cl,al      ;将数字赋给cl
 getp:  
     mov ah,1    ;再次输入
     int 21h

     cmp al,0dh
     jz  pgot    ;输入的为回车，个位数或者两位数输入结束，跳转，结束输入

     sub al,"0"
     mov dl,al      ;dl存放个位数

     mov al,cl      ;十位数给al
     mov cl,dl      ;个位数给cl，交换al(之后存放十位数)和cl(之后存放个位数).

     mov bl,10
     mul bl      ;al*10
     add cl,al      ;结果放在cl中,cl+al
     jmp getp
 pgot:  
     mov dl,0ah
     mov ah,2
     int 21h      ;输出换行

     cmp cx,0
     jle illeg       ;<=0非法

     cmp cx,24
     jg  illeg       ;>24非法

     mov Pgsize,cx
 illeg:    
     mov dl,0ah
     mov ah,2
     int 21h      ;输出换行

     pop dx
     pop cx
     pop bx
     pop ax
     ret
change_psize endp
 ;******************************************************

 ;******************************************************
openf proc near
     push   bx
     push   cx
     push   dx

     mov dx,offset buf     ;buf中存输入的文件名
     mov al,0     ;读文件
     mov ah,3dh      ;打开文件，成功:AX=文件代号；错误:AX=错误码
     int 21h

     mov handle,ax      ;(如果成功了)文件代号为handle
     mov ax,1     ;ax为1
     jnc ok       ;没进位时跳转，如果打开成功(CF!=1)了，跳转
     mov ax,0     ;失败了ax为0
 ok:    
     pop dx
     pop cx
     pop bx
     ret
openf endp
 ;******************************************************

 ;******************************************************
getline proc near
     push   ax       ;保存数据
     push   bx
     push   cx
     push   dx

     mov dx,offset mess_getname 
     mov ah,09h
     int 21h      ;输出 Please input filename:

     mov dx,offset buf_size
     mov ah,0ah      ;键盘输入到缓冲区，  buf_size db 80(缓冲区最大字符数),s_buf db ?(实际输入的字符数),buf db 200 dup(?)(输入的内容)
     int 21h

     mov dx,offset crlf    ;输出换行回车
     mov ah,09h
     int 21h

     mov bl,s_buf
     mov bh,0
     mov [buf + bx],0   ;放0到文件名的结尾，buf是缓冲区起始地址，加上实际字符数便为文件结尾，来形成 the asciiz string.

     pop dx
     pop cx
     pop bx
     pop ax
     ret
getline endp
 ;******************************************************

 ;******************************************************
read_block proc near
     push   bx
     push   cx
     push   dx
     ;判断buf是否为空
     cmp cur,200     ;cur为200，buf为空则继续进行下面操作
     jnz back     ;不为空
 
     ; DS:DX=数据缓冲区地址
     ; BX=文件代号
; CX=读取的字节数
     mov cx,200      ;读取的字符数
     mov bx,handle      ;文件代号
     mov dx,offset buf     ;要输入数据缓冲区地址，读入的存到buf
     mov ah,3fh      ;读buf文件，读成功:AX=实际读入的字节数；AX=0 已到文件尾；读出错:AX=错误码
     int 21h
     mov read_size,ax   ;实际读入的字节数放入read_size

     mov cur,0       ;读入成功，cur为0，ax为1
     mov ax,1
     jnc back     ;读入成功则跳转(CF!=1即CF=0)
     mov cur,200     ;否则读入失败，cur仍为200，ax=0
     mov ax,0
 back:  
     pop dx
     pop cx
     pop bx
     ret
read_block endp
 ;******************************************************

 ;******************************************************
show_block proc near
     push   ax
     push   dx

     mov bx,cur      ;初始bx为0，再次调用时，bx为上一次cur所在的位置
 loop1:    
     cmp bx,200
     jl  lp       ;小于则跳转
     jmp exit     ;大于等于则退出
 lp:    
     mov dl,buf[bx]     ;将缓冲区的内容赋给dl
     
     cmp bx,read_size   ;判断是否是文件结尾
     jge exit_eof    ;bx从0开始，当bx==read_size是，则到达文件结尾，跳转，此处用大于等于
    ;  cmp dl,1ah    ;判断是否是文件结尾

    ;  jz  exit_eof     ;是则跳转

     inc bx       ;+1

     inc cur      ;cur记录buf中目前读到的位置，都移动到下一个读取的位置
     mov ah,02       ;显示输出，输出字符为dl
     int 21h

     cmp dl,0ah      ;换行是0ah
     jz  exit_ln     ;如果是换行键，则退出，显示出一行

     jmp loop1
 exit_eof:
     mov bx,0
 exit_ln:  
     dec cx        ;cx存放Pgsize
 exit:  
     pop dx
     pop ax
     ret
show_block endp
 ;******************************************************
code ends
end start
;读入一页时，先读入200个字节，不断移动指针输出字符，然后判断是否遇到换行符，如果遇到则输出换行。然后判断buf是否为空，如果为空，则继续输入200个字节；如果不为空，则指针继续移动输出换行，知道遇到文件结尾。