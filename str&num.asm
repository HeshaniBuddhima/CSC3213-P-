.model small
.stack 100h

.data
n1 db 2
msg db "hello $"

.code
start:
mov ax,@data
mov ds,ax

mov dx,offset msg
mov ah,09h
int 21h

mov dl,10
mov ah,02h
int 21h

mov dl,n1;dl=2
add dl,48  
mov ah,02h
int 21h 

mov ax,4c00h
int 21h
end start