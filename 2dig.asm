.model small
.stack 100h
.data

msg1 db "Enter the Number: $"
t db 0
o db 0
dig db 0
r db 0

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
mov t,al

;read the second digit
mov ah,01h
int 21h
sub al,48
mov o,al

;t=2  0=3  t*10+3=23
mov bl,10
mov al,t ;al=t=2
mul bl  ;al=al*bl=2*10=20
add al,o  ;al=al+o=20+3=23

mov dig,al  ;dig=23

mov dl,10
mov ah,02h
int 21h

mov al,dig
mov ah,00
div bl  ;al/bl=23/10=2    ah=3

mov r,ah ;r=3

mov dl,al  ;print 2
add dl,48
mov ah,02h
int 21h

mov dl,r ;print 3
add dl,48
mov ah,02h
int 21h

mov ax,4c00h
int 21h
end start
