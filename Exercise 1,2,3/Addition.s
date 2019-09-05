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

Loop1:
ldrb r0, [r1],#0x01
mov r3, r0
subs r3, r3, #0x2c
moveq r0, #0xa

mov r7, #0xa

mulne r5, r7, r5
subne r0, r0, #48
addne r5, r5, r0
beq Loop2
@subs r0, r0, #0x81
b Loop1

Loop2:
ldrb r2, [r1],#0x01
mov r3, r2
subs r3, r3, #0x2c
moveq r2, #0xa
mulne r6, r7, r6
subne r2, r2, #48
addne r6, r6, r2
addeq r5, r5, r6
moveq r6, #0
addne r2, r2, #48
subs r2, r2, #0x81
bne Loop2

mov r0, r5

Loop3:
mov r1,r0
mov r0,#1
swi 0x6b
swi 0x00
swi 0x11