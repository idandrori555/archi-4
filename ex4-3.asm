org 100h
jmp start

arr db 3, 2, 1
arr_size equ ($-arr)

PROC swap
    push bp
    mov bp, sp
    
    push si
    push di
    push ax
    push bx
    
    mov si, [bp + 4]
    mov di, [bp + 6] 
    
    mov al, [si]
    mov bl, [di]
    
    mov [si], bl
    mov [di], al
    
    pop bx
    pop ax
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
  
    mov cx, [bp + 4]  ; size
    dec cx            ; we want size - 1 
    mov di, [bp + 6]  ; arr
    
    mov al, [di]      ; first element
    
    xor si, si        ; idx of minimum
    xor bx, bx        ; idx countter
    
    inc di            ; start farom next byte
    inc bx
    
search_min_loop:
    cmp cx, 0
    jle done_search
    
    mov dl, [di]
    
    cmp dl, al
    jge not_new_min
    
    mov al, dl
    mov si, bx
    
not_new_min:
    inc di
    inc bx
    dec cx
    
    jmp search_min_loop
    
done_search:
    mov ax, si        ; return index in ax
    
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
    
    push si
    push cx
    push di
    push bx
    push dx
    
    mov cx, [bp + 4]  ; size
    mov di, [bp + 6]  ; arr ptr
    
    dec cx            ; size-1 times
    xor si, si        ; counter
    
sort_loop:
    cmp si, cx
    jge done_sort
    
    mov ax, cx
    sub ax, si
    inc ax
    
    mov bx, di
    add bx, si
    
    ; findMin
    push bx
    push ax
    call findMin
    add sp, 4
    
    cmp ax, 0
    je skip_swap
    
    ; addrs for swap
    mov bx, di
    add bx, si
    
    mov dx, si
    add dx, ax
    push bx
    
    mov bx, di
    add bx, dx
    push bx
    
    call swap
    add sp, 4
    
skip_swap:
    inc si
    jmp sort_loop
    
done_sort:
    pop dx
    pop bx
    pop di
    pop cx
    pop si
    pop bp
    ret
ENDP sort

start:
    ; sort
    push offset arr
    push arr_size
    call sort
    add sp, 4
    
    xor ah, ah
    int 16h
    ret