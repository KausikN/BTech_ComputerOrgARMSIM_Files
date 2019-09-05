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

mov r0, #0x2
mov r1, #0x3
mul r0, r1, r0
swi 0x00

swi 0x11