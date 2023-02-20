data segment
arr db 80 dup(?)
msg1 db 10,13,"Enter array size: $"
msg2 db 10,13,"Enter array element: $"
msg3 db 10,13,"The array elements are:$"
msg4 db 10,13, "Enter element you want search: $"
msg5 db 10,13, "Found $"
msg6 db 10,13, "not found $"
n db ?
k db 00h

data ends

code segment
assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax

    mov ch,00h
    lea dx,msg1
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,30h
    cmp al,09h
    jle skip1
    sub al,07h
    skip1:mov n,al
    mov cl,n
    mov si,offset arr
    rpt:lea dx,msg2     ;inputting elements
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,30h
    cmp al,09h
    jle skip2
    sub al,07h
    skip2:
    mov [si],al
    inc si
    inc k
    dec cl
    jnz rpt

    mov cl,n

    lea dx,msg3         ;printing elements
    mov ah,09h
    int 21h
    
    mov si,offset arr
   rpt1:mov al,[si]
    add al,30h
    cmp al,39h
    jle skip3
    add al,07h
   skip3:mov dl,al
    mov ah,02h
    int 21h
    inc si
    dec cl
    jnz rpt1

    lea dx,msg4
    mov ah,09h
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    cmp al,09h
    jle skip7
    sub  al,07h
    skip7:mov cl,al

    mov ch,n
    mov si,offset arr       ;search element
    nxt:mov al,[si]
    cmp al,cl
    je skip4
    inc si
    dec ch
    jnz nxt
    lea dx,msg6
    mov ah,09h
    int 21h
    jmp exit
    skip4:lea dx,msg5
    mov ah,09h
    int 21h

    exit:mov ah,4ch
    int 21h

code ends
end start
