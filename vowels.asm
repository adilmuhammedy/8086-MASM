data segment
msg1 db 10,13,"Enter a string $"
msg2 db 10,13,"No of vowels= $"
str1 db 80 dup(?)
str2 db 80 dup(?)
m db ?
n db ?

data ends

code segment
assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax

    mov cl,00
    mov ch,00
    lea dx,msg1
    mov ah,09h
    int 21h

    lea si,str1
    rpt:mov ah,01h
    int 21h
    cmp al,13
    je skip1
    cmp al,'a'
    jne skip2
    inc ch
    skip2:cmp al,'e'
    jne skip3
    inc ch
    skip3:cmp al,'i'
    jne skip4
    inc ch
    skip4:cmp al,'o'
    jne skip5
    inc ch
    skip5:cmp al,'u'
    jne skip6
    inc ch

    skip6:mov [si],al
    inc si
    inc cl
    jmp rpt

    skip1:lea dx,msg2
    mov ah,09h
    int 21h
    mov al,ch
    add al,30h
    cmp al,39h
    jle skip7
    add al,07h
    skip7:
    mov dl,al
    mov ah,02h
    int 21h

    mov ah,4ch
    int 21h

code ends
end start
