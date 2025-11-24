org 100h

array db 8, 3, 11, 19, 2, 6, 3
arr_size equ ($-array)

jmp start

PROC swap:
    
ENDP

PROC findMin:

ENDP


PROC sort:

ENDP

start:
push array
call sort
add sp, 4 ; 'back' 2 words

end:
xor ah, ah
int 16h
ret
