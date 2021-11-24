iFileName: .asciz "fileio.s"
oFileName: .asciz "output.s"
.equ DestAddress, 0x2000
.equ NewLine, 0x3000
ldr r0, =iFileName
mov r1, #0
swi 0x66
Loop:
ldr r1, =DestAddress
mov r2, #0x1000
mov r3, r0
swi 0x6a


ldr r2, =DestAddress

ldr r0, =oFileName
mov r1, #2
swi 0x66

mov r1, r2
swi 0x69

mov r4, #'\n'
mov r1, #0x3000
str r4, [r1]

swi 0x69
swi 0x68

mov r0, r3

B Loop
End:
swi 0x68
swi 0x11