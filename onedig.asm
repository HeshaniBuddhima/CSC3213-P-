;Write an 8086 assembly language program to
;read two single-digit numbers from the keyboard,add them, and display the sum



.model small
.stack 100h
.data
msg1 db "Enter the first digit: $"
msg2 db "Enter the second digit: $"
msg3 db "sum is: $"
n1 db 0
n2 db 0
.code
start:

mov ax,@data
mov ds,ax

mov dx,offset msg1
mov ah,09h
int 21h; 2=al=50-48

mov ah,01h;read input num 1
int 21h
sub al,48;al=al-48=2
mov n1,al

mov dl,10
mov ah,02h
int 21h

mov dx,offset msg2
mov ah,09h
int 21h

mov ah,01h
int 21h;n2=3
sub al,48
mov n2,al

mov dl,10
mov ah,02h
int 21h

mov dx,offset msg3
mov ah,09h
int 21h

mov dl,n1;get sum
add dl,n2
add dl,48
mov ah,02h
int 21h

mov ax,4c00h
int 21h
end start
