FileName: .asciz "Hello.txt"
.equ DestAddress, 0x2000
ldr r0, =FileName
mov r1, #0x0
swi 0x66
ldr r1, =DestAddress
mov r2, #0x100
swi 0x6a
swi 0x68
ldr r0, =DestAddress

Loop:
ldrb r0, [r1],#0x01
mov r3, r0
subs r3, r3, #0x2c
moveq r0, #0xa
swi 0x00
subs r0, r0, #0x81
bne Loop

swi 0x11