org 100h

jmp start

num1 dw 0x12
num2 dw 0x34

PROC swap
    push bp
    mov bp, sp
    
    push si
    push di
    push cx
    push dx
    
    mov si, [bp + 4]
    mov di, [bp + 6]
    
    mov cx, [si]
    mov dx, [di]
    
    mov [si], dx
    mov [di], cx
    
    pop dx
    pop cx
    pop di
    pop si
    
    pop bp
    ret
ENDP swap

start:
    push offset num1
    push offset num2
    
    call swap
    add sp, 4

end:
    mov ah, 0
    int 16h
    ret