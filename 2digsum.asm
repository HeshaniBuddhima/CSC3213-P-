

.model small
.stack 100h
.data

msg1 db "Enter the Number1: $"
t1 db 0
o1 db 0
dig1 db 0
r1 db 0

msg2 db "Enter the Number2: $"
t2 db 0
o2 db 0
dig2 db 0
r2 db 0

msg3 db "Addition: $"
msg4 db "Subtraction: $"

.code
start:
mov ax,@data
mov ds,ax

mov dx,offset msg1
mov ah,09h
int 21h

;read the first digit
mov ah,01h
int 21h
sub al,48
mov t1,al

;read the second digit
mov ah,01h
int 21h
sub al,48
mov o1,al

;t=2  0=3  t*10+3=23
mov bl,10
mov al,t1 ;al=t=2
mul bl  ;al=al*bl=2*10=20
add al,o1  ;al=al+o=20+3=23
mov dig1,al  ;dig=23

mov dl,10
mov ah,02h
int 21h








mov dx,offset msg2
mov ah,09h
int 21h

;read the first digit
mov ah,01h
int 21h
sub al,48
mov t2,al

;read the second digit
mov ah,01h
int 21h
sub al,48
mov o2,al

;t=2  0=3  t*10+3=23
mov bl,10
mov al,t2 ;al=t=2
mul bl  ;al=al*bl=2*10=20
add al,o2  ;al=al+o=20+3=23

mov dig2,al  ;dig=23

mov dl,10
mov ah,02h
int 21h

mov dx,offset msg3
mov ah,09h
int 21h

mov bl,10
mov dl,dig1
add dl,dig2
mov al,dl
mov ah,00
div bl

mov r1,ah

mov dl,al 
add dl,48
mov ah,02h
int 21h


mov dl,r1
add dl,48
mov ah,02h
int 21h

mov ax,4c00h
int 21h
end start
