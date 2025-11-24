jmp start

num1 dw 0x12
num2 dw 0x34

PROC swap
mov bx, sp

mov si, [bx+2] ; num 2
mov di, [bx+4] ; num 1

mov cx, [si]
mov dx, [di]

mov [si], dx
mov [di], cx

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