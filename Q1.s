MOV r1, #0x3000
MOV r3, #50
MOVS r2, #0x5
B:
STR r3, [r1],#4
SUBS r2, r2, #1
ADD r3, r3, #1
BNE B
MOVS r2, #0x5
SUB r1, r1, #20
B2:
LDR r0, [r1],#4
SWI 0x00
SUBS r2, r2, #1
BNE B2
