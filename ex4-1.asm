org 100h

x dw 0xA
y dw 0x80

jmp start

start:
    push [x]
    push [y]
    
    call min
    
    add sp, 4
    
    jmp end

PROC min
    push bp
    mov bp, sp

    mov ax, [bp+4]
    mov bx, [bp+6]
    
    cmp ax, bx
    jbe done
    mov ax, [bp+6]
    
done:
    pop bp
    ret 4
ENDP

end:
    xor ah, ah
    int 16h
    ret