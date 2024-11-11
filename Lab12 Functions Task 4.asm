.model small
.stack 100h
.data      
    m1 db 'Enter first value: $'
    m2 db 'Enter second value: $'
    m3 db 'Enter third value: $'
    m4 db 'Result: $'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov dx, offset m1
    mov ah, 9
    int 21h
    call input
    mov bx, ax
    call space

    mov dx, offset m2
    mov ah, 9
    int 21h
    call input
    mul bx
    call space

    mov dx, offset m3
    mov ah, 9
    int 21h
    call input
    mul ax    
    call space

    call display

    mov ah, 4ch
    int 21h
main endp

input proc
    xor ax, ax
    mov ah, 1
    int 21h
    sub al, '0'
    mov ah, 0
    ret
input endp

space proc
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h
    ret
space endp

display proc
    mov dx, offset m4
    mov ah, 9
    int 21h
    
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h
    ret
display endp
end main
