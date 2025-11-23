org 100h

array db 8, 3, 11, 19, 2, 6, 3
arr_size equ ($-array)

jmp start

PROC swap:
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

PROC findMin:
    push bp
    mov bp, sp

    mov ax, [bp+4] ; arr
    mov bx, [bp+6] ; size

    xor si, si ; counter
    xor cx, cx ; max

    jmp new_min_loop

new_min:
    mov cx, [ax+si]

    inc si
    jmp find_min_loop


find_min_loop:
    cmp [ax+si], bx
    jge end_find_min

    cmp [ax+si], cx
    jl new_min

    inc si
    jmp find_min_loop

end_find_min:
    pop bp
    ret 4

ENDP


PROC sort:
    push bp
    mov bp, sp

    mov ax, [bp+4] ; array
    mov cx, [bp+6] ; size
    xor si, si

loop1:
    cmp si, cx
    jge done

    inc si
    loop loop1

done:
    pop bp
    ret 4
ENDP

start:
  ; push args
  push array
  push array_size

  call sort

  add sp, 4 ; 'back' 2 words

end:
    xor ah, ah
    int 16h
    ret
