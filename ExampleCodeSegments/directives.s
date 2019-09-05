MyString:  .asciz "Hello Class!"
.equ SWI_Exit,0X11
.equ Ten, 0x10
ldr r1, =Ten
ldr r0, =MyString
swi 0X2
mov r0,#0x02
swi 0x201 @ left LED on
mov r0,#0x01
swi 0x201 @ right LED on
mov r0,#0x03
swi 0x201 @ both LEDs on
swi SWI_Exit
    
