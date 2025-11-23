num1 dw 0x12
num2 dw 0x34

jmp start

PROC func
mov bx, sp

mov si, [bx+2] ; num 2
mov di, [bx+4] ; num 1

mov cx, [si]
mov dx, [di]

mov [si], dx
mov [di], cx

ret
ENDP func

start:
push offset num1
push offset num2

call func
add sp, 4
