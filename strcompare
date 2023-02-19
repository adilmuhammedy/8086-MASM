data segment
msg1 db "Enter a string: $"
msg2 db "Enter another string $"
msg3 db "Equal: $"
msg4 db "Not Equal: $"
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
    skip:

    lea dx,msg2
    mov ah,09h
    int 21H

    mov cl,0
    lea si,str2
    repeat1:mov ah,01h
    int 21H
    cmp al,13
    je skip1
    mov [si],al
    inc si
    inc cl
    jmp repeat1
    skip1:
    mov al,bl
    cmp al,cl
    je skip2
    lea dx,msg4
    mov ah,09h
    int 21h
    jmp exit1


    skip2:lea si,str1
    lea di,str2
    goto:
    mov bl,[si]
    cmp bl,[di]
    je rp
    lea dx,msg4
    mov ah,09h
    int 21h
    jmp exit1
    rp:
    inc si
    inc di
    dec cl
    jnz goto
    lea dx,msg3
    mov ah,09h
    int 21h
    


exit1:
    mov ah,4ch
    int 21H

code ends
end start


