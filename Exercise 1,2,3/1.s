FileName: .asciz "Hello.txt"		
Message: .asciz "12,32,73\n9"
ldr r0, =FileName
mov r1, #0x1
swi 0x66
ldr r1, =Message
swi 0x69			
swi 0x68
swi 0x11