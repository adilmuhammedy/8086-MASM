data segment
msg1 db "Enter a string: $"
msg2 db "Reverse: $"
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
        int 21h

        mov bl,0
        lea si,str1
       repeat:mov ah,01h
        int 21h
        cmp al,13
        je skip
        mov [si],al
        inc bl
        inc si
        jmp repeat

        ;lea si,str2
        skip:lea dx,msg2
        mov ah,09h
        int 21H
        mov cl,bl
        repeat1:dec si
        mov dx,[si]
        mov ah,02H
        int 21H
        loop repeat1


        mov ah,4ch
        int 21h
code ends
end start
