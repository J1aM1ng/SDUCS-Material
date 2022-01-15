; samp4_2
data segment
    Pgsize       dw ?

    buf_size     db 80
    s_buf        db ?
    buf          db 200 dup(?)

    read_size    dw ?

    names        db 20 dup(?)
    cur          dw ?
    handle       dw ?
    buf_tmp      db 24*80 dup(?)
    cur_tmp      dw ?
    name_tmp     db "t0m1p",0
    handle_tmp   dw ?
    mark         db ?
    mark1         db ?
    mess_getname db 0dh,0ah,"    Please input filename: $"
    mess_err1    db 0ah,0dh,"    Illegal filename ! $"
    mess_err2    db 0ah,0dh,"    File not found !$"
    mess_err3    db 0ah,0dh,"    File read error !$"
    mess_psize   db 0ah,0dh,"    Page Size : $"
    mess_dele    db 0dh,0ah,"    The last page is deleted !"
    crlf         db 0ah,0dh,"$"
    mess_star    db 0ah,0dh,"*********************************************"
                 db 0ah,0dh,"$"
data    ends

code segment
                     assume ds:data, cs:code
main proc far
    start:           
    ; 存原来ds
                     push   ds
                     sub    ax, ax
    ; 赋值data给现在ds
                     push   ax
                     mov    ax, data
                     mov    ds, ax
    ; 初始化
                     mov    mark, 0
                     mov    PgSize, 12
                     mov    cur, 200
    ; 输入文件名
                     call   getline
    ; 打开对应的文件
                     call   openf
                     or     ax, ax                  ; 判断ax是否是0
    ; 如果不是0，则打开成功
                     jnz    display
    ; (ax)=0 则提示错误
                     mov    dx, offset mess_err2       
                     mov    ah, 09h
                     int    21h
                     jmp    file_end
    display:         
                     mov    cx, Pgsize              ; 初始一页为12行
                     mov    cur_tmp, 0
                     mov    mark1,0
    show_page:       
                     call   read_block              ; 从文件中读200个字节到buf
                     or     ax, ax
                     jnz    next2
    ; 读入失败输出错误信息
                     mov    dx, offset mess_err3
                     mov    ah, 09h
                     int    21h                     ; (ax=0)读入失败输出    File read error !
                     jmp    file_end
    next2:           
    ; 打印并保存一行到buf_tmp
                     call   show_and_reserve
    ; 判断是否到文件尾了，bx=0到文件尾，跳转
                     or     bx, bx
                     jz     file_end
    ; 是否一页结束了？
                     or     cx, cx
                     jnz    show_page               ;不为0则跳转至show_page，继续输出
                     mov    dx, offset mess_star    ;为0输出****
                     mov    ah, 09h
                     int    21h
    ; 一页输入结束，等待输入空格
    
    wait_space:      
                     mov    ah, 1
                     int    21h
    ; 键盘输入并回显，在al中
                     cmp    al, " "
                     jnz    psize                          
                     call   write_buf_tmp           ;如果输入的是空格，不用删除，则直接写到临时文件
                     jmp    display
    psize:           
    ; 判断输入的是否是p
                     cmp    al,"p"
                     jnz    delete
                    ; call   write_buf_tmp
                     call   change_psize
                     jmp    stick
    delete:          
                     cmp    al, "d"
                     jnz    wait_space
                     mov    mark, 1                 ; 标记
                     mov    mark1, 1
    ; 输出    The last page is deleted !
                     mov    dx, offset mess_dele
                     mov    ah, 09h
                     int    21h
    ; 直到输入字符为空格，才重新进行下一页的处理（这一页不写到文件中）
    stick:           
                     mov    ah, 1
                     int    21h
                     cmp    al, " "                ;再次输入字符，如果是空格，转移至display；;如果不是，则跳转至p指令
                     jnz    psize
                     cmp    mark1,0
                     jnz    display                ;不为0，意味着删除了，不call   write_buf_tmp
                     call   write_buf_tmp          ;为0，意味着没有删除操作，call   write_buf_tmp，再跳转至display
                     jmp    display
    file_end:        
                     call   write_buf_tmp           ;将最后一页保存至临时文件
                     cmp    mark,0
                     jz     ok
                     call   write_tmp_back          ; 说明mark为1，即中间进行过删除操作，所以要重写文件
    ok:              
                     ret
main endp

    ; 根据输入，改变每页显示的行数
change_psize proc near
                     push   ax
                     push   bx
                     push   cx
                     push   dx
    ; 输出    Page Size :
                     mov    dx, offset mess_psize
                     mov    ah, 09h
                     int    21h
    ; 输入一个字符，al
                     mov    ah, 01
                     int    21h
    ; 输入的为回车，跳转
                     cmp    al, 0dh
                     jz     illeg
    ; 否则得到输入对应的一位数的二进制
                     sub    al, "0"
                     mov    cl, al
    getp:            
    ; 再得到输入的一位数
                     mov    ah, 1
                     int    21h
    ; 输入的为回车，跳转，结束输入
                     cmp    al, 0dh
                     jz     pgot
    ; 最后得到的输入多位数结果放在cl中
                     sub    al, "0"
                     mov    dl, al
                     mov    al, cl
                     mov    cl, dl
                     mov    bl, 10
                     mul    bl
                     add    cl, al
                     jmp    getp
    pgot:            
    ; 输出换行
                     mov    dl, 0ah
                     mov    ah, 2
                     int    21h
    ; 输入<=0和>24非法
                     cmp    cx, 0
                     jle    illeg
                     cmp    cx, 24
                     jg     illeg
                     mov    PgSize, cx
    illeg:           
    ; ;输出换行
                     mov    dl, 0ah
                     mov    ah, 2                   ; 实验书pdf 和 实体书不一样的地方
                     int    21h
                     pop    dx
                     pop    cx
                     pop    bx
                     pop    ax
                     ret
change_psize endp

    ; 打开文件，同时建立一个临时文件
openf proc near
                     push   bx
                     push   cx
                     push   dx
    ; 打开指定文件
                     mov    dx, offset names        ; names中存输入的文件名
                     mov    al, 2                   ; 为读和写打开文件
                     mov    ah, 3dh
                     int    21h
    ; (如果成功了)文件代号存到handle
                     mov    handle, ax
                     mov    ax, 0
                     jc     quit                    ; cf=1则跳转，即打开文件失败
    ; 打开文件成功，同时再建立一个临时文件
                     mov    dx, offset name_tmp
                     mov    cx, 0                   ;文件的属性，cx=文件属性
                     mov    ah, 3ch                 ;建立文件，成功:AX=文件代号 错误:AX=错误码
                     int    21h
                     mov    handle_tmp, ax          ;将文件代号给 handle_tmp
                     jc     quit                    ;cf=1则跳转，即建立文件失败
                     mov    ax, 1             
    quit:            
                     pop    dx
                     pop    cx
                     pop    bx
                     ret
openf endp

    ; 得到输入的文件名
getline proc near
                     push   ax
                     push   bx
                     push   cx
                     push   dx
    ; 输出    Please input filename:
                     mov    dx, offset mess_getname
                     mov    ah, 09h
                     int    21h
    ; 输入到缓冲区，buf_size  db  80（最大），s_buf  db  ?（实际），buf  db  200 dup(?)（内容）
                     mov    dx, offset buf_size
                     mov    ah, 0ah
                     int    21h
    ; 输出换行回车
                     mov    dx, offset crlf
                     mov    ah, 09h
                     int    21h
    ; 放0到文件名的结尾，来 形成 the asciiz string.
                     mov    bl, s_buf
                     mov    bh, 0
                     mov    names[bx],0
    ; 得到输入的文件名称names
    name_move:       
                     dec    bx
                     mov    al, buf[bx]
                     mov    names[bx], al
                     jnz    name_move

                     pop    dx
                     pop    cx
                     pop    bx
                     pop    ax
                     ret
getline endp

    ; 从文件中读200字符
read_block proc    near
                     push   bx
                     push   cx
                     push   dx
                     mov    ax, 1
                     cmp    cur, 200
                     jnz    back
    ; 此时要读取新的200个字符
                     mov    cx, 200                 ; 读取的字符数
                     mov    bx, handle              ; 文件代号
                     mov    dx, offset buf          ; 读入的东西存到buf
                     mov    ah, 3fh
                     int    21h
                     mov    read_size,ax
    ; 读入成功，cur为0，ax为1
                     mov    cur, 0
                     mov    ax, 1
                     jnc    back                    ; 读入成功（cf！=1）则跳转
                     mov    cur, 200
                     mov    ax, 0
    back:            
                     pop    dx
                     pop    cx
                     pop    bx
                     ret
read_block endp

    ; 打印一行并保存这些字符到buf_tmp
show_and_reserve proc near
                     push   ax
                     push   dx
                     mov    bx, cur
                     mov    bp, cur_tmp
    loop1:           
                     cmp    bx, 200
                     jl     lp                      ;小于跳转至lp
                     jmp    exit                    ; 大于等于则退出
    lp:              
                     mov    dl, buf[bx]             ; 将当前字符给dl
                     mov    ds:buf_tmp[bp], dl      ; 同时要保存这一页的所有字符

                     cmp    bx,read_size            ;判断是否是文件结尾
                     jge    exit_eof                ;是则跳转
    ; 指针增加
                     inc    bx
                     inc    cur
                     inc    bp
                     inc    cur_tmp
    ; ; 在这里加一行注释，来表示这行代码或接下来几行代码或接下来的程序段所做的事情
    ; cmp     dl, 1ah
    ; jz      exit_eof

    ; 显示输出dl中的字符
                     mov    ah, 02
                     int    21h
    ; 是换行则退出
                     cmp    dl, 0ah
                     jz     exit_ln
                     jmp    loop1
    exit_eof:        
                     mov    bx,0
    exit_ln:         
                     dec    cx                      ; 行数（这页还需要读的行）-1
    exit:            
                     pop    dx
                     pop    ax
                     ret
show_and_reserve endp

    ; 输入空格后，将这一页写到临时文件中
write_buf_tmp proc near
                     push   ax
                     push   bx
                     push   cx
                     push   dx
    ; 把buf_tmp中的cur_tmp字节个内容写到文件代号为handle_tmp(临时文件）的磁盘中
                     mov    dx, offset buf_tmp
                     mov    cx, cur_tmp
                     mov    bx, handle_tmp
                     mov    ah, 40h
                     int    21h
                     pop    dx
                     pop    cx
                     pop    bx
                     pop    ax
                     ret
write_buf_tmp endp

write_tmp_back proc near
                     push   ax
                     push   bx
                     push   cx
                     push   dx
    ; 将临时文件中的内容写回原文件
    ; 关闭临时文件
                     mov    bx, handle_tmp
                     mov    ah, 3eh
                     int    21h
    ; 关闭原文件
                     mov    bx, handle
                     mov    ah, 3eh
                     int    21h
    ; 以读方式，打开临时文件
                     mov    dx, offset name_tmp
                     mov    al, 0
                     mov    ah, 3dh
                     int    21h
                     mov    handle_tmp, ax
    ; 以写方式，打开原文件
                     mov    dx, offset names
                     mov    al, 1
                     mov    ah, 3dh
                     int    21h
                     mov    handle,ax
    
                     mov    si, 1
    wrt_back:        
    ; 读临时文件200个字节到buf中 
                     mov    bx, handle_tmp         
                     mov    ah, 3fh                 ; 读临时文件
                     mov    cx, 200
                     mov    dx, offset buf          ; 读200个字节到buf
                     int    21h
                     jc     wrt_end                 ; 读失败，则结束

                     mov    si, ax                  ; 实际读入的字节数给si
    ; 将buf上的cx个字节写入到原文件
                     mov    bx, handle
                     mov    ah, 40h                 ; 写文件
                     mov    cx, si                  ; 实验书pdf 和 实体书不一样的地方
                     mov    dx, offset buf
                     int    21h
    ; 读入的字节为0则结束了，关闭原文件
                     or     si, si
                     jnz    wrt_back
                     mov    ah, 3eh
                     mov    bx, handle
                     int    21h
    wrt_end:         
                     pop    dx
                     pop    cx
                     pop    bx
                     pop    ax
                     ret
write_tmp_back endp

code    ends
        end start