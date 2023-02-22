data segment
arr db 80 dup(?)
msg1 db 10,13,"Enter array size: $"
msg2 db 10,13,"Enter array element: $"
msg3 db 10,13,"Sum of array is :$"
count db ?
n db ?
k db 00h

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
    skip:mov n,al

    mov cl,n
    mov si,offset arr
    rpt:lea dx,msg2
    mov ah,09h
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    cmp al,09h
    jle skip1
    sub al,07h
    skip1: mov [si],al
    inc si
    dec cl
    jnz rpt

    mov cl,n
    mov si,offset arr
    mov al,00
   rpt1: mov bl,[si]
    add al,bl
    daa
    inc si
    dec cl
    jnz rpt1

    mov ch,al
    lea dx,msg3
    mov ah,09h
    int 21h
    

    mov bl,0f0h
    and al,bl
    mov cl,04
    ror al,cl
    add al,30h
    cmp al,39h
    jle skip2
    add al,07h
    skip2:
    mov dl,al
    mov ah,02h
    int 21h
    
    mov al,ch
    mov bl,0fh
    and al,bl
    add al,30h
    cmp al,39h
    jle skip3
    add al,07h
    skip3:
    mov dl,al
    mov ah,02h
    int 21h

    mov ah,4ch
    int 21h

code ends
end start






