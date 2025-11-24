org 100h

jmp start

arr db 8, 3, 11, 19, 2, 6, 3
arr_size equ ($-arr)

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

PROC findMin
    push bp
    mov bp, sp
    
    push bx
    push cx
    push dx
    push di
    push si
    
    mov cx, [bp + 4] ; size
    dec cx ; we want size - 1 
    mov di, [bp + 6] ; arr ptr
    
    mov al, [di]     ; first element in arr (byte)
    xor ah, ah
    
    xor si, si       ; si will hold the index of minimum (starts at 0)
    xor bx, bx       ; bx will be current index counter
    
    inc di           ; move to next byte
    inc bx           ; increment current index
    
search_min_loop:
    mov dl, [di]
    xor dh, dh
    
    cmp dx, ax
    jge not_new_min
    
    mov al, dl     ; update min value
    xor ah, ah
    mov si, bx       ; update min index
    
not_new_min:
    inc di
    inc bx
    loop search_min_loop
    
    mov ax, si       ; return index in ax
  
    pop si
    pop di
    pop dx
    pop cx
    pop bx

    pop bp
    ret
ENDP findMin


PROC sort
    push bp
    mov bp, sp
    
    mov cx, [bp + 4] ; size
    dec cx ; we want size - 1 
    mov di, [bp + 6] ; arr ptr
    
sort_loop:

no_swap:

    pop bp
    ret
ENDP sort

start:
    ; Pass arguments to sort
    push offset arr
    push arr_size
    call sort
    add sp, 4


    xor ah, ah
    int 16h
    ret
    
; include magshimim.inc