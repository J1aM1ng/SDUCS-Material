data segment
  Pgsize    dw ?

  buf_size   db 80
  s_buf     db ?
  buf      db 200 dup(?)
  read_size   dw ?
  read_size2  dw ?
  isblock    db 0
  names     db 20 dup(?)
  tar_buf    db 2550 dup(?)
  tar_buf_size dw ?

  cur      dw ?
  handle    dw ?
  
  buf_tmp    db 24*80 dup(?)
  cur_tmp    dw ?
  name_tmp   db "t0m1p",0
  handle_tmp  dw ?
  mark     db ?          ;标记是否有删除操作
  mess_getname db 0dh,0ah,"  Please input filename: $"

  mess_err1   db 0ah,0dh,"  Illegal filename ! $"
  mess_err2   db 0ah,0dh,"  File not found !$"
  mess_err3   db 0ah,0dh,"  File read error !$"
  mess_psize  db 0ah,0dh,"  Page Size : $"
  mess_dele   db 0dh,0ah,"  The last page is deleted !$"
  
  mess_ok    db 0dh,0ah,"file opened!"
  
  crlf     db 0ah,0dh,"$"
  mess_star   db 0ah,0dh,"*********************************************"
         db 0ah,0dh,"$"
     
  mess_getname2 db 0dh,0ah,"  Please input filename that copy to: $"
  mess_err4   db 0ah,0dh,"  File create error !$"
  mess_copy   db 0dh,0ah,"  The last page is copied to the file!", 0ah,0dh,"$"

  names2_size  db 19
  names2_len  db ?
  names2    db 20 dup(?)

  name_copy   db 20 dup(?)

  handle2    dw ?
  buf2     db 200 dup(?)
  mark2     db ?
  ;mark2表示c操作之前是否还有c操作，如果有，则不需要保留至临时文件
  mark3      db ?
  ;mark3表示在c操作之前是否有d操作，如果有d操作则这一页不需要store存储到临时文件中
data  ends

code segment
          assume ds:data, cs:code
main proc far
  start:      
  ; 存原来ds
          push  ds
          sub  ax, ax
  ; 赋值data给现在ds
          push  ax
          mov  ax, data
          mov  ds, ax
  ; 初始化
          mov  mark, 0
          mov  PgSize, 12
          mov  cur, 200
  ; 输入文件名
          call  getline
  ; 打开对应的文件
          call  openf
          or   ax, ax         ; 判断ax是否是0
  ; 如果不是0，则打开成功
          jnz  display
  ; (ax)=0 则没有指定的文件
          mov  dx, offset mess_err2
          mov  ah, 09h
          int  21h
          jmp  file_end
  display:     
          mov  cx, Pgsize       ; 初始页数为12
          mov  cur_tmp, 0
          mov  mark2,0
          mov  mark3,0
  show_page:    
          call  read_block       ; 从文件中读200个字节到buf
          or   ax, ax
          jnz  next2
  ; 读入失败输出错误信息
          mov  dx, offset mess_err3
          mov  ah, 09h
          int  21h           ; (ax=0)读入失败输出  File read error !
          jmp  file_end
  next2:      
  ; 打印并保存一行
          call  show_and_reserve
  ; 判断是否到文件尾了，bx=0到文件尾，跳转
          or   bx, bx
          jz   file_end
  ; 是否一页结束了？
          or   cx, cx
          jnz  show_page
          mov  dx, offset mess_star
          mov  ah, 09h
          int  21h
  ; 一页输入结束，等待输入空格
  wait_space:   
          mov  ah, 1
          int  21h
  ; 键盘输入并回显，在al中
          cmp  al, " "
          jnz  psize
          call  write_buf_tmp      ;输入的是空格则写进去
          jmp  display
  psize:      
  ; 判断输入的是否是p
          cmp  al,"p"
          jnz  delete
          call  write_buf_tmp
          call  change_psize
          jmp  stick
  delete:     
          cmp  al, "d"
          jnz  copy
          mov  mark, 1         ; 有了删除操作，故使mark=1
          mov  mark3,1         ; 在c之前有删除操作

  ; 输出  The last page is deleted !
          mov  dx, offset mess_dele
          mov  ah, 09h
          int  21h

          mov  dx, offset crlf
          mov  ah, 09h
          int  21h

  copy_c:     
          mov  ah,1          ;再次输入字符 可以多次输入
          int  21h
  copy:      
          cmp  al,'c'
          jnz  stick1
  startCopy:    
          call  doCopy

          cmp  mark2,1         ;之前输入过c,第二次c不用保存
          jz   stick

          cmp  mark3,1
          jnz  store          ;这个时候mark2=0(第一次c),mark3=0,没有按d，所以要保存到临时文件
          jmp  copy_c         ;已经进行了删除操作则不用保存临时文件，可继续输入c
  store:                     
          call  write_buf_tmp
          mov  mark2,1
          jmp  copy_c

  stick:      
          mov  ah, 1          ;不是则重新输入字符
          int  21h
  stick1:     
          cmp  al, " "         ;查看是否是空格
          jnz  stick

          jmp  display
  file_end:    
          call  write_buf_tmp      ;将最后一页写到临时文件中
          cmp  mark,0
          jz   ok
          call  write_tmp_back     ; 说明mark为1，即中间进行过删除操作，所以要重写文件
  ok:       
          ret
main endp

  ; 根据输入，改变每页显示的行数
change_psize proc near
          push  ax
          push  bx
          push  cx
          push  dx
  ; 输出  Page Size :
          mov  dx, offset mess_psize
          mov  ah, 09h
          int  21h
  ; 输入一个字符，al
          mov  ah, 01
          int  21h
  ; 输入的为回车，跳转
          cmp  al, 0dh
          jz   illeg
  ; 否则得到输入对应的一位数的二进制
          sub  al, "0"
          mov  cl, al
  getp:      
  ; 再得到输入的一位数
          mov  ah, 1
          int  21h
  ; 输入的为回车，跳转，结束输入
          cmp  al, 0dh
          jz   pgot
  ; 最后得到的输入多位数结果放在cl中
          sub  al, "0"
          mov  dl, al
          mov  al, cl
          mov  cl, dl
          mov  bl, 10
          mul  bl
          add  cl, al
          jmp  getp
  pgot:      
  ; 输出换行
          mov  dl, 0ah
          mov  ah, 2
          int  21h
  ; 输入<=0和>24非法
          cmp  cx, 0
          jle  illeg
          cmp  cx, 24
          jg   illeg
          mov  PgSize, cx
  illeg:      
  ; ;输出换行
          mov  dl, 0ah
          mov  ah, 2          ; 实验书pdf 和 实体书不一样的地方
          int  21h
          pop  dx
          pop  cx
          pop  bx
          pop  ax
          ret
change_psize endp

  ; 打开文件
openf proc near
          push  bx
          push  cx
          push  dx
  ; 打开指定文件
          mov  dx, offset names    ; names中存输入的文件名
          mov  al, 2          ; 为读和写打开文件
          mov  ah, 3dh
          int  21h
  ; (如果成功了)文件代号存到handle
          mov  handle, ax
          mov  ax, 0
          jc   quit          ; cf=1则跳转，即打开文件失败
  ; 打开文件成功，同时再建立一个临时文件
          mov  dx, offset name_tmp
          mov  cx, 0          ;文件的属性
          mov  ah, 3ch
          int  21h
          mov  handle_tmp, ax
          jc   quit
          mov  ax, 1
  quit:      
          pop  dx
          pop  cx
          pop  bx
          ret
openf endp

  ; 得到输入的文件名
getline proc near
          push  ax
          push  bx
          push  cx
          push  dx
  ; 输出  Please input filename:
          mov  dx, offset mess_getname
          mov  ah, 09h
          int  21h
  ; 输入到缓冲区，buf_size db 80（最大），s_buf db ?（实际），buf db 200 dup(?)（内容）
          mov  dx, offset buf_size
          mov  ah, 0ah
          int  21h
  ; 输出换行回车
          mov  dx, offset crlf
          mov  ah, 09h
          int  21h
  ; 放0到文件名的结尾，来 形成 the asciiz string.
          mov  bl, s_buf
          mov  bh, 0
          mov  names[bx],0
  ; 得到输入的文件名称names
  name_move:    
          dec  bx
          mov  al, buf[bx]
          mov  names[bx], al
          jnz  name_move

          pop  dx
          pop  cx
          pop  bx
          pop  ax
          ret
getline endp

  ; 从文件中读200字符
read_block proc  near
          push  bx
          push  cx
          push  dx
          mov  ax, 1
          cmp  cur, 200
          jnz  back
  ; 此时要读取新的200个字符
          mov  cx, 200         ; 读取的字符数
          mov  bx, handle       ; 文件代号
          mov  dx, offset buf     ; 读入的东西存到buf
          mov  ah, 3fh
          int  21h
          mov  read_size,ax
  ; 读入成功，cur为0，ax为1
          mov  cur, 0
          mov  ax, 1
          jnc  back          ; 读入成功（cf！=1）则跳转
          mov  cur, 200
          mov  ax, 0
  back:      
          pop  dx
          pop  cx
          pop  bx
          ret
read_block endp

  ; 打印一行并保存这些字符到buf_tmp
show_and_reserve proc near
          push  ax
          push  dx
          mov  bx, cur
          mov  bp, cur_tmp
  loop1:      
          cmp  bx, 200
          jl   lp
          jmp  exit          ; 大于等于则退出
  lp:       
          mov  dl, buf[bx]
          mov  ds:buf_tmp[bp], dl   ; 同时要保存这一页的所有字符

          cmp  bx,read_size      ;判断是否是文件结尾
          jge  exit_eof        ;是则跳转
  ; 指针增加
          inc  bx
          inc  cur
          inc  bp
          inc  cur_tmp
  ; ; 在这里加一行注释，来表示这行代码或接下来几行代码或接下来的程序段所做的事情
  ; cmp   dl, 1ah
  ; jz   exit_eof

  ; 显示输出dl中的字符
          mov  ah, 02
          int  21h
  ; 是换行则退出
          cmp  dl, 0ah
          jz   exit_ln
          jmp  loop1
  exit_eof:    
          mov  bx,0
  exit_ln:     
          dec  cx           ; 行数（这页还需要读的行）-1
  exit:      
          pop  dx
          pop  ax
          ret
show_and_reserve endp

  ; 输入空格后，将这一页写到临时文件中
write_buf_tmp proc near
          push  ax
          push  bx
          push  cx
          push  dx
  ; 把buf_tmp中的cur_tmp字节个内容写到文件代号为handle_tmp的磁盘中
          mov  dx, offset buf_tmp
          mov  cx, cur_tmp
          mov  bx, handle_tmp
          mov  ah, 40h
          int  21h
          pop  dx
          pop  cx
          pop  bx
          pop  ax
          ret
write_buf_tmp endp

write_tmp_back proc near
          push  ax
          push  bx
          push  cx
          push  dx
  ; 将临时文件中的内容写回原文件
  ; 关闭临时文件
          mov  bx, handle_tmp
          mov  ah, 3eh
          int  21h
  ; 关闭原文件
          mov  bx, handle
          mov  ah, 3eh
          int  21h
  ; 为读打开临时文件
          mov  dx, offset name_tmp
          mov  al, 0
          mov  ah, 3dh
          int  21h
          mov  handle_tmp, ax
  ; 为写打开原来文件
          mov  dx, offset names
          mov  al, 1
          mov  ah, 3dh
          int  21h
          mov  handle,ax
  
          mov  si, 1
  wrt_back:    
  ; 读临时文件200个字节到buf中
          mov  bx, handle_tmp
          mov  ah, 3fh
          mov  cx, 200
          mov  dx, offset buf
          int  21h
          jc   wrt_end         ; 读失败，则结束

          mov  si, ax         ; 实际读入的字节数给si
  ; buf上的cx个字节写入到原文件
          mov  bx, handle
          mov  ah, 40h
          mov  cx, si         ; 实验书pdf 和 实体书不一样的地方
          mov  dx, offset buf
          int  21h
  ; 读入的字节为0则结束了，关闭原文件
          or   si, si
          jnz  wrt_back
          mov  ah, 3eh
          mov  bx, handle
          int  21h
  wrt_end:     
          pop  dx
          pop  cx
          pop  bx
          pop  ax
          ret
write_tmp_back endp

doCopy proc near
          push  ax
          push  bx
          push  cx
          push  dx

          mov  dx,offset mess_getname2  ;输出Please input filename that copy to: $
          mov  ah,09h
          int  21h

          mov  dx,offset names2_size   ;键盘输入
          mov  ah,0ah
          int  21h

          mov  dx, offset crlf
          mov  ah, 09h
          int  21h

          mov  bl,names2_len
          mov  bh,0
          mov  names2[bx],0      ;insert 0 to   form the asciiz string. 形成 0结尾字符串

          cmp  bx,0
          jnz  name_move1
          mov  isblock,1
          jmp  quitC          ;输入名字有误，退出子程序
  name_move1:   
          dec  bx
          mov  al,names2[bx]
          mov  name_copy[bx],al    ;move the  line got into name string
          jnz  name_move1        ;循环，将names2的内容复制到name_copy

  ; 打开指定文件
          mov  dx, offset name_copy  ; names中存输入的文件名
          mov  al, 0          ; al=0读，并打开name_copy文件
          mov  ah, 3dh
          int  21h
  ; (如果成功了)文件代号存到handle2
          mov  handle2, ax

          jnc  joinC          ; cf=0则跳转，即打开文件成功
  ; 打开文件失败，创建这个文件
          mov  dx, offset name_copy
          mov  cx, 0          ;文件的属性
          mov  ah, 3ch
          int  21h
          mov  handle2, ax
          jc   quitC
  ; mov  ax, 1
  joinC:      
          call  read_tar        ;得到文件总字符数量
          call  write_tar        ;移动文件指针并写入

          mov  dx,offset mess_copy   ;输出The last page is copied to the file!
          mov  ah,09h
          int  21h

  quitC:      
          pop  dx
          pop  cx
          pop  bx
          pop  ax
          ret
doCopy endp

; 从文件中读2550字符
read_tar proc  near
          push  bx
          push  cx
          push  dx
          mov  tar_buf_size,0
  read:      
  ; 每次读取2550个字符
          mov  cx, 2550        ; 读取的字符数
          mov  bx, handle2       ; 文件代号
          mov  dx, offset tar_buf   ; 读入的东西存到buf
          mov  ah, 3fh         ; 读文件
          int  21h
          
          cmp  ax,1           ;实际读入的字节数
          jb   back1          ;小于1则读入不成功或者读入完成，跳转
          add  tar_buf_size,ax      ;当前总字节数=实际读入的字节数+之前的字节数
          jmp  read
  back1:      
          pop  dx
          pop  cx
          pop  bx
          ret
read_tar endp

move_point proc near
          push  bx
          push  cx
          push  dx
  ;关闭文件
          mov  ah,3eh
          mov  bx,handle2
          int  21h
  ;再打开，使文件指针指向文件头
          mov  dx,offset name_copy
          mov  al,2
          mov  ah,3dh
          int  21h
          mov  handle2,ax
  ; mov  ax,1           ;
          jc   back2          ;cf=1，文件打开失败跳转
  ;移动文件指针到文件末尾
          mov  ah,42h          ;移动文件指针 BX=文件代号 CX:DX=位移量 AL=移动方式 0:从文件头绝对位移
          mov  al,0           ;DX:AX=新文件指针位置
          mov  bx,handle2
          mov  cx,0
          mov  dx,tar_buf_size
          int  21h

          jnc  back2          ;移动成功跳转至back2
  ; 移动失败输出错误信息
          mov  dx, offset mess_err4
          mov  ah, 09h
          int  21h
  back2:      
          pop  dx
          pop  cx
          pop  bx
          ret

move_point endp

write_tar proc near
          push  ax
          push  bx
          push  cx
          push  dx

          call  move_point
  ;从文件末尾开始写入一页内容
          mov  dx,offset buf_tmp
          mov  cx,cur_tmp
          mov  bx,handle2
          mov  ah,40h         ;写文件或设备 DS:DX=数据缓冲区地址 BX=文件代号 CX=写入的字节数  写成功: AX=实际写入的字节数
          int  21h
          jc   exitw         

  exitw:      
          mov  ah,3eh         ;关闭文件
          mov  bx,handle2
          int  21h

          pop  dx
          pop  cx
          pop  bx
          pop  ax
          ret
write_tar endp
  ;

code  ends
    end start