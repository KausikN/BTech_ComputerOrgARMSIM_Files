.equ SDelay, 0x10000
.equ Multiple, 10000

StartL:
mov r0, #2

ldr r1, =Multiple
Ltimer:
ldr r2, =SDelay
b Stimer

StartS:
ldr r2, =SDelay
Stimer:
subs r2, r2, #1
bne Stimer

subs r0, r0, #2
moveq r0, #1
movne r0, #2

swi 0x201

subs r1, r1, #1
bne Ltimer

swi 0x11