data segment
msg1 db "Enter first number: $"
msg2 db 10,13, "Enter second number: $"
msg3 db 10,13, "Sum of two number is: $"
a db ?
b db ?
sum db ?

data ends

code segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax

        lea dx,msg1
        mov ah,09h
        int 21h
        mov ah,01h      ;inputting first no
        int 21h
        mov bh,al
        mov ah,01h
        int 21h
        mov bl,al

        lea dx,msg2
        mov ah,09h
        int 21h
        mov ah,01h       ;inputting second no
        int 21h
        mov ch,al
        mov ah,01h         
        int 21h
        mov cl,al      

        mov al,bl       ;moving low digit of first no to al
        mov ah,00       ;clear ah before aaa
        add al,cl       ;adding low digit of two nos
        aaa
        add ax,3030h    ;convert to ascii code
        mov bl,al       ;store low digit of res in bl and carry will be in ah
        mov al,ah
        mov ah,00h
        add al,bh       ;add carry with bh
        add al,ch       ;adding high digits
        aaa
        add ax,3030h    ;converting to ascii code
        mov bh,al       ;storing high digit of res to bh
        mov cl,ah       ;storing final carry to cl

        lea dx,msg3     ;printing msg3
        mov ah,09h
        int 21h
        mov dl,cl       ;printing result
        mov ah,02h
        int 21h
        mov dl,bh
        mov ah,02h
        int 21h
        mov dl,bl
        mov ah,02h
        int 21h

        mov ah,4ch
        int 21h
code ends
end start
