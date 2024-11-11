.model small
.stack 100h
.data
    m1 db 'Enter value for X: $'
    m2 db 'Enter value for Y: $'
    m3 db 'Enter value for Z: $'
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
    add bx, ax 
    call space

    mov dx, offset m3
    mov ah, 9
    int 21h
    call input
    sub bx, ax 
    call space

    dec bx

    mov ax, bx
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

display proc
    mov dx, offset m4
    mov ah, 9
    int 21h

    add ax, '0'
    mov dl, al
    mov ah, 2
    int 21h

    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h
    ret
display endp

space proc
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h
    ret
space endp
end main