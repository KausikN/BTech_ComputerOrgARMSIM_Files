.equ SDelay, 2
.equ Multiple, 2

mov r0, #0
swi 0x6c
swi 0x00

ldr r1, =Multiple
Ltimer:
ldr r0, =SDelay
b Stimer

Stimer:
subs r0, r0, #1
bne Stimer

subs r1, r1, #1
bne Ltimer

swi 0x11