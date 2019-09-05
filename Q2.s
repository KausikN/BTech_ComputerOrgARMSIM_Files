HW: .asciz "Hi World!"
MOV r0, #'0'
SWI 0x00
MOV r0, #':'
SWI 0x00
LDR r0, =HW
SWI 0x02
END:
B END