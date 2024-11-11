.model smalll
.stack 100h
.data
first db ' HI!!!!$'
second db ' My name is Aleeza$'
.code
main proc
    mov ax,@data
    mov ds, ax
    mov dx,offset first
    mov ah,9
    int 21h  
    
    call space
    mov dx,offset second
    mov ah,9
    int 21h  
    
    call space
    main endp 

space proc
    mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h
    ret
    space endp
end main