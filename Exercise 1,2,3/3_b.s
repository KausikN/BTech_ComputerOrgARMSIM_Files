FileName: .asciz "Hello.txt"

ldr r0, =FileName
mov r1, #0
swi 0x66
mov r2, r0
Loop:
mov r0, r2
swi 0x6c
bcs End
mov r1, r0
mov r0, #1
swi 0x6b
B Loop
End:
swi 0x68
swi 0x11