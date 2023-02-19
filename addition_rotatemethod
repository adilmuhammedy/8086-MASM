data segment
msg1 db "Enter first number: $"
msg2 db 10,13,"Enter second numebr: $"
msg3 db 10,13,"Addition of two number is: $"
a db ?
b db ?
c db 00h
data ends

code segment
assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax

    lea dx,msg1
    mov ah,09h
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    cmp al,09h
    jle skip
    sub al,07h
    skip:mov cl,04
    rol al,cl
    mov a,al

    mov ah,01h
    int 21h
    sub al,30h
    cmp al,09h
    jle skip1
    sub al,07h
    skip1:
    mov bl,a
    add al,bl
    mov a,al

    lea dx,msg2
    mov ah,09h
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    cmp al,09h
    jle skip2
    sub al,07h
    skip2:mov cl,04
    rol al,cl
    mov b,al

    mov ah,01h
    int 21h
    sub al,30h
    cmp al,09h
    jle skip3
    sub al,07h
    skip3:add al,b
    mov b,al
    mov cl,00h 
    mov al,a     ;addition
    mov bl,b
    add al,bl
    daa
    jnc goto
    inc cl
    goto:mov b,al   ;final result stored


    lea dx,msg3     ;result
    mov ah,09h
    int 21h
    add cl,30h
    cmp cl,39h
    jle skips
    add cl,07h
    skips:mov dl,cl
    mov ah,02h
    int 21h
    mov bl,b
    mov al,0f0h
    and al,bl
    mov cl,04
    ror al,cl
    add al,30h
    cmp al,39h
    jle skip4
    add al,07h
    skip4:mov dl,al
    mov ah,02h
    int 21h
    mov bl,b
    mov al,0fh
    and al,bl
    add al,30h
    cmp al,39h
    jle skip5
    add al,07h
    skip5:mov dl,al
    mov ah,02h
    int 21h

    mov ah,4ch
    int 21h



code ends
end start
