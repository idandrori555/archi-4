x db 0x7F
y db 0x80

start:
    mov al, x
    xor ah, ah
    push ax

    mov al, y
    xor ah, ah
    push ax

    call swap
    add sp, 4

end:
    xor ah, ah
    int 16h
    ret

PROC swap
    push bp
    mov bp, sp

    mov ax, [bp+4]
    mov bx, [bp+6]
    xchg bx, cx
    mov [bp+4], ax
    mov [bp+6], bx

    xor ax, ax ; 'return' 0

    mov sp, bp
    pop bp
    ret 4 ; 2 words
ENDP
