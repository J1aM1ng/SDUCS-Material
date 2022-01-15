;接收从键盘输入的一个班的血神个成绩，并存放于50字的grade数组中，其中grade+i保存学号为i+1的学生的成绩
;然后根据grade中的学生成绩，把名次填入50字的rank数组中，其中rank+i的内容是学号为i+1的学生的名次
;再按学号顺序把名次从终端上显示出来
datarea segment ;数据段
    grade dw 50 dup(?) ;dw为字类型，db为字节类型
    rank dw 50 dup(?)
    count dw ? ;计数器，记录当前已输入的学生的人数
    mess1 db 'Grade? $'
    mess2 db 13,10,'Input Error!',13,10,'$' ;报错提示，13：回车；10：换行；$:09号系统调用规定的字符串的结束符
    mess3 db 'Rank: $'
datarea ends ;数据段结束
;
prognam segment ;程序段
;
main proc far ;总控模块，功能：根据输入的学生成绩，计算并显示学生名次。算法为：一个学生的名次等于成绩高于该学生的人数+1
    assume cs:prognam,ds:datarea ;伪码，声明各寄存器的值，cs存的是程序段首地址，ds存的是数据段首地址
start:
;设置返回栈
    push ds ;ds寄存器的值压栈，保存数据断点
    sub ax,ax ;ax寄存器置零
    push ax ;ax压栈
    
    mov ax,datarea ;将数据段首地址放到ax寄存器中，过渡一下
    mov ds,ax ;将ax寄存器中值放到ds寄存器中，实际上就是将数据段首地址放到了ds寄存器中，至此，ds:datarea

    call input ;调用input子模块
    call rankp ;调用rankp子模块
    call output ;调用output子模块
    ret ;返回dos
main endp
;
input proc near ;input模块,功能：接收一个班的学习成绩，调用子模块decibin把从键盘输入的一个十进制数转换为二进制数
                ;调用子模块crlf完成回车、换行功能
    lea dx,mess1 ;将数据mess1在数据段中的偏移地址放到dx寄存器中
    mov ah,09 ;将dos调用的09号功能放入ah，在屏幕上显示dx中存储的地址所对应的字符串，即mess1
    int 21h ;命令dos工作，即执行ah中的功能（这里是09号功能）
;
    mov si,0 ;si是源变址寄存器，默认在ds中
    mov count,0 ;给count初始化为0
enter:
    call decibin ;调用子模块decibin，把从键盘输入的一个十进制数转换为二进制数
    inc count ;已输入的学生+1
    cmp dl,',' ;比较dl中的值和逗号的ascii码
    je store ;相等则跳转，即(dl)==0时，跳转到store段进行存储（已经输入的某个学生的成绩）
    cmp dl,13 ;比较dl中的值和13
    je exit2 ;（dl)==13（即为回车键，说明已经输入完了全部学生）时，跳转到exit2段进行处理
    jne error ;不相等（不为回车键）则跳转error块，报错
store:
    mov grade[si],bx ;将bx中二进制数放到grade[si]中
    add si,2 ;si+=2,因为grade[]每个元素是字类型，为两个字节，故存放偏移地址的si寄存器应+2
    jmp enter ;无条件跳转到enter块中（即存储完之后循环执行enter块）
error:
    lea dx,mess2 ;将mess2的偏移地址放入dx中
    mov ah,09 ;09号系统调用，在屏幕上显示dx中的字符串
    int 21h ;命令dos执行ah中的系统调用
exit2:
    mov grade[si],bx ;将bx中的二进制数放到grade[si]中
    call crlf ;调用子模块crlf，
    ret 
input endp ;input模块结束
;
rankp proc near ;rankp模块
    mov di,count 
    mov bx,0 
loop1:
    mov ax,grade[bx]
    mov word ptr rank[bx],0 
    mov cx,count 
    lea si,grade
next:
    cmp ax,[si]
    jg no_count 
    inc word ptr rank[bx]
no_count:
    add si,2
    loop next 
    add bx,2
    dec di 
    jne loop1 
    ret 
rankp endp
;
output proc near ;output模块
    lea dx,mess3 
    mov ah,09 
    int 21h 
;
    mov si,0
    mov di,count 
next1:
    mov bx,rank[si]
    call binidec ;调用binidec子模块，将rank数组中的二进制数转换成十进制数并在终端上显示出来
    mov dl,','
    mov ah,02
    int 21h 
    add si,2
    dec di 
    jnz next1 
    call crlf ;调用crlf子模块，完成回车、换行功能
    ret
output endp 
;
decibin proc near ;decibin模块，功能：把从键盘取得的一个十进制数转换为二进制数，并将该数存入BX寄存器中
    mov bx,0 ;首先清空bx寄存器，即给bx寄存器置零
newchar:
    mov ah,1 ;给ah装入dos调用的01号指令，即键盘输入并显示（从键盘中输入的字符的ascii码放入al寄存器中并在屏幕上显示该字符）
    int 21h ;命令dos执行ah中的01号指令，这时用户输入
    mov dl,al ;将用户输入的数据从al中放到dl中
    sub al,30h ;al = al - 30h，即将用户输入的数字对应字符的ascii码转换为对应的数字，并回存到al中（ascii转binary）
    jl exit1 ;小于跳转，即若(al)<30h（也就是说，用户输入的不是数字），则跳转到exit1
    cmp al,9d ;比较(al)和9d，相当于减法运算的作用（改变标志位），在
    jg exit1 ;有符号大于则跳转，若(al)>9d，说明用户输入的ascii码大于数字9的ascii码，也非法，跳转到exit1进行处理
    cmp al,9d 
    jg exit1 
    cbw ;将al扩展为ax（8位扩展至16位）
;
    xchg ax,bx ;交换（ax)和（bx）
    mov cx,10d ;给cx赋上十进制的10
    mul cx ;使（cx)和(ax)相乘，结果的低位放在ax中，高位放在dx中
    xchg ax,bx ;交换（ax)和（bx）
;
    add bx,ax ;bx=ax+bx
    jmp newchar ;跳到newchar段头，循环执行，直至输入非法字符
exit1: ret ;用户输入不合法，直接返回dos
decibin endp
;
binidec proc near ;binidec模块，功能：把BX寄存器中的二进制数转换为十进制数，并在终端屏幕上显示出来
    push bx ;对
    push cx 
    push si 
    push di 
    mov cx,100d 
    call dec_div ;调用子模块dec_div用来作除法运算并显示字符
    mov cx,10d 
    call dec_div ;调用子模块dec_div用来作除法运算并显示字符
    mov cx,1d 
    call dec_div ;调用子模块dec_div用来作除法运算并显示字符
    pop di 
    pop si 
    pop cx 
    pop bx 
    ret 
binidec endp 
;
dec_div proc near ;模块dev_div，功能；把BX寄存器中的二进制数除以相应的十的幂，并在屏幕上显示一位商。余数保存在BX寄存器中
    mov ax,bx 
    mov dx,0 
    div cx 
    mov bx,dx 
    mov dl,al 

    add dl,30h
    mov ah,02h 
    int 21h 
    ret 
dec_div endp
;
crlf proc near ;crlf模块，功能：完成一次回车、换行操作
    mov dl,0ah ;在dl中放入0ah(换行符)
    mov ah,02h ;dos调用：屏幕上显示dl中的字符
    int 21h ;命令dos执行ah中的调用

    mov dl,0ah ;在dl中放入0ah(换行符)
    mov ah,02h ;dos调用：屏幕上显示dl中的字符
    int 21h ;命令dos执行ah中的调用

    mov dl,0dh ;在dl中放入0dh（回车键）
    mov ah,02h ;dos调用：屏幕上显示dl中的字符
    int 21h ;命令dos执行ah中的调用

    ret ;返回dos
crlf endp 
;
prognam ends 
;
    end start 