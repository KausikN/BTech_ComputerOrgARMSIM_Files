iFileName: .asciz "output.txt"
.equ DestAddress1, 0x2000
.equ DestAddress2, 0x3000
.equ Answer, 0x4000
FinalFix: .asciz "\b "
ldr r0, =iFileName
mov r1, #0
swi 0x66

ldr r1, =DestAddress1
mov r2, #0x1000
mov r3, r0
swi 0x6a
mov r0, r3

ldr r1, =DestAddress2
mov r2, #0x1000
mov r3, r0
swi 0x6a
mov r0, r3

ldr r1, =DestAddress1
ldr r2, =DestAddress2
ldr r5, =Answer
mov r6, #0
Outer:
ldrb r3, [r1], #0x1
mov r8, r3
sub r3, r3, #48

ldrb r4, [r2], #0x1
mov r9, r4
sub r4, r4, #48

subs r8, r8, #0
moveq r3, #0

subs r9, r9, #0
moveq r4, #0

subs r8, r8, #0x81 ; 

subs r9, r9, #0x81 ;

adds r8, r8, r9
beq End

add r3, r3, r4
add r3, r3, r6
mov r4, r3
subs r3, r3, #10
movpl r6, #1
addpl r4, r3, #1
movmi r6, #0
add r4, r4, #48
strb r4, [r5], #0x1

b Outer

End:
swi 0x68

ldr r0, =iFileName
mov r1, #2
swi 0x66

mov r1, #0x3500
mov r2, #0xa
str r2, [r1]
swi 0x69

ldr r1, =Answer
swi 0x69

ldr r1, =FinalFix
swi 0x69

swi 0x68

swi 0x11