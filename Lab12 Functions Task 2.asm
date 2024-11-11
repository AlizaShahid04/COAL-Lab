.model small
.stack 100h
.data
    m1 db 'Enter first number: $'
    m2 db 'Enter second number: $'
    m3 db 'Result: $'
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
    mov cx, ax
    call space

    mov ax, bx
    call addn
    call display

    mov ax, bx
    call subt
    call display

    mov ax, bx
    call mult
    call display

    mov ah, 4ch
    int 21h
main endp

input proc
    mov ah, 1
    int 21h
    ret
input endp

addn proc
    add ax, cx
    ret
addn endp

subt proc
    sub ax, cx
    ret
subt endp

mult proc
    mul cx
    ret
mult endp

call space
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
    mov dx, offset m3
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
end main
