assume cs:codesg
codesg segment

        mov ax,0
        call far ptr s
        inc ax
      s:pop ax
        add ax,ax
        pop bx
        add ax,bx
codesg ends
end

