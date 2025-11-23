jmp main


PROC Min
    mov si, sp
    mov bx, [si+2] ; second
    mov ax, [si+4] ; first
    jmp Min_main
    
Min_main:    
    cmp ax, bx
    jl Min_end 
    
    mov ax, bx 

Min_end: ret 
ENDP Min



main:
    push 0x12
    push 0x123
    call Min
    add sp, 4