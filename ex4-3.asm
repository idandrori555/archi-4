org 100h

jmp start

arr db 8, 3, 11, 19, 2, 6, 3
arr_size equ ($-arr)

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

PROC findMin
    mov bx, sp
    mov ax, [bx + 2]
    mov si, 0
    mov cx, 0xFFFF ; min here
    
    min_loop:
    cmp si, arr_size
    jge min_end
    
    inc si
    jmp min_loop

    
    min_end:
    ret
ENDP


PROC sort

ENDP

start:
push offset arr
call findMin
add sp, 2

end:
xor ah, ah
int 16h
ret


include magshimim.inc