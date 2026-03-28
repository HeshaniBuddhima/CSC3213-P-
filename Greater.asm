
;Write an assembly program to compare two numbers.
;Display the greater number.


;jg label	;Jump if Greater
;jl label	;Jump if less
;jge label	;Jump if Greater or equal
;jle label	;Jump if Less or equal



.model small
.stack 100h

.data
msg1 db "Greater number is: $"
n1 db 5
n2 db 3

.code
start:
main:


mov ax,@data
mov ds,ax

;load numbers in to registers
mov al,n1
mov bl,n2

;compare numbers
cmp al,bl  ;5  3
jge FG	;If al>=bl, jump to FG

SG:
;Display message
mov dx,offset msg1 
mov ah,09h
int 21h

;Display number
mov dl,n2
add dl,48
mov ah,02h
int 21h

jmp Endnn

FG:
;Display message
mov dx,offset msg1 
mov ah,09h
int 21h

;Display number
mov dl,n1
add dl,48
mov ah,02h
int 21h

;Exit Program
Endnn:
mov ax,4c00h
int 21h
end start

