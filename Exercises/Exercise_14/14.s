.equ VStart, 0x2000
.equ VSize, 100
.equ VIncDest, 0x3000
FileName: .asciz "Answer.txt"
NewLine: .asciz "\n"

ldr r0, =VStart
ldr r1, =VSize
mov r2, #0
PutValues:
	add r2, r2, #1
	str r2, [r0], #4
	subs r1, r1, #1
bne PutValues

Increment:

ldr r0, =VStart
ldr r1, =VSize
ldr r3, =VIncDest
IncLoop:
	ldr r2, [r0], #4
	add r2, r2, #1
	str r2, [r0]
	str r2, [r3], #4
	subs r1, r1, #1
bne IncLoop

AddVec:
ldr r0, =VStart
ldr r1, =VSize
ldr r3, =VIncDest
AddLoop:
	ldr r2, [r0]
	ldr r4, [r3], #4
	add r2, r2, r4
	str r2, [r0], #4
	subs r1, r1, #1
bne AddLoop

Multiplication:
ldr r0, =VStart
ldr r1, =VSize
MulLoop:
	ldr r2, [r0]
	mov r9, #5
	mov r8, r2
	mul r2, r8, r9
	str r2, [r0], #4
	subs r1, r1, #1
bne MulLoop

Division:

ldr r0, =VStart
ldr r1, =VSize
ldr r3, =VIncDest
DivLoop:
	ldr r2, [r0]
	mov r2, r2, lsr #2
	str r2, [r0], #4
	subs r1, r1, #1
bne DivLoop

ConstantAddition:

ldr r0, =VStart
ldr r1, =VSize
ldr r3, =VIncDest
ConLoop:
	ldr r2, [r0]
	add r2, r2, #16384
	str r2, [r0], #4
	subs r1, r1, #1
bne ConLoop



FilePut:

ldr r0, =FileName
mov r1, #0x2
swi 0x66	

ldr r2, =VStart
ldr r3, =VIncDest
ldr r4, =VSize
FileLoop:
	ldr r1, [r2], #4
	swi 0x6b

	ldr r1, =NewLine
	swi 0x69

	subs r4, r4, #1
bne FileLoop	
swi 0x68
swi 0x11

End: