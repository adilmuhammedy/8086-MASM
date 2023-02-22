data segment
msg1 db 10,13,"Enter a string $"
msg2 db 10,13,"Correct $"
msg3 db 10,13,"Not Correct $"
str1 db 80 dup("$")

data ends

code segment
assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax
    lea dx,msg1
    mov ah,09h
    int 21h
    lea si,str1
    rpt:mov ah,01h
    int 21h
    cmp al,13
    je skip
    mov [si],al
    inc si
    jmp rpt

    skip:
    lea si,str1
    mov al,[si]
    cmp al,'c'
    jne go
    inc si
    mov al,[si]
    cmp al,'u'
    jne go
    inc si
    mov al,[si]
    cmp al,'s'
    jne go
    inc si
    mov al,[si]
    cmp al,'a'
    jne go
    inc si
    mov al,[si]
    cmp al,'t'
    jne go
    inc si
    mov al,[si]
    cmp al,'$'
    jne go
    lea dx,msg2
    mov ah,09h
    int 21h
    jmp exit
    go:
    lea dx,msg3
    mov ah,09h
    int 21h

    exit:mov ah,4ch
    int 21h

code ends
end start

