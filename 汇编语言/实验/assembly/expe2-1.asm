datarea         segment
      recol     db         13,10,'$'
      space     db         '$'
datarea         ends
;
prognam     segment
      assume cs:prognam,ds:datarea
;
      main      proc      far
      start:
            push      ds
            sub        ax,ax
            push      ax

            mov      ax,datarea
            mov      ds,ax
            mov      dl,21h
            mov      cx,11
;
      outside:
            push        cx
            mov         cx,20
;
      inside:
            mov         ah,02h
            int         21h
            inc         dl
            
            push        dx                        ;压入显示ASCII字符的dx，该段为显示空格
            lea         dx,space
            mov         ah,09h
            int         21h

            pop         dx                 ;弹出dx，循环inside共20次，即一行显示16个字符
            loop        inside

            push        dx                        ;压入显示ASCII字符的dx，该段为显示换行
            lea         dx,recol

            mov         ah,09h
            int         21h

            pop         dx                        ;弹出dx，继续输出其他字符
            pop         cx                        ;弹出cx，由11逐次减一实现11行的输出

            loop        outside
            ret
      main      endp
;
      prognam      ends
;
      end       start