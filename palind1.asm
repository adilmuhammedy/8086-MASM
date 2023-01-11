data segment
msg1 db "Enter a string: $"
msg2 db "It is a palindrome $"
msg3 db "it is not a palindrome: $"
str1 db 80 dup("$")
str2 db 80 dup("$")
data ends

code segment
assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax

    lea dx,msg1
    mov ah,09h
    int 21H

    mov bl,0
    lea si,str1
    repeat:mov ah,01h
    int 21H
    cmp al,13
    je skip
    mov [si],al
    inc si
    inc bl
    jmp repeat
    skip: mov cl,bl

    dec si
    mov di,offset str1
    rp:
    mov al,[di]
    cmp al,[si]
    jne skip2           ;not pali
    inc di
    dec si
    mov al,[si]
    cmp al,'$'
    je skipw
    jmp rp
  
    skipw:lea dx,msg2
    mov ah,09h
    int 21H
    jmp exitfrom
    skip2:lea dx,msg3
    mov ah,09h
    int 21H

   exitfrom:mov ah,4ch
   int 21h

code ends
end start