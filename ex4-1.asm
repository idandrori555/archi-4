x dw 0x7F
y dw 0x80

push x
push y
call Min
add sp, 4
hlt

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