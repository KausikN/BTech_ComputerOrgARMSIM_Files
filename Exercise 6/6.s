.equ SDelay, 0x100000
.equ EndVal, 10
.equ A, 0x80
.equ B, 0x40
.equ C, 0x20
.equ P, 0x10
.equ D, 0x08
.equ E, 0x04
.equ F, 0x02
.equ G, 0x01

Digits:
	.word	A|B|C|D|E|G		@ 0
	.word	B|C				@ 1
	.word	A|B|F|E|D		@ 2
	.word	A|B|F|C|D		@ 3
	.word	G|F|B|C			@ 4
	.word	A|G|F|C|D		@ 5
	.word	A|G|F|E|D|C		@ 6
	.word	A|B|C			@ 7
	.word	A|B|C|D|E|F|G	@ 8
	.word	A|B|F|G|C		@ 9
	.word	0				@ Blank Display

ldr r1, =EndVal
DisplaySegment:
	ldr r2, =Digits
	DisStart:
		ldr r0, [r2],#4
		swi 0x200
		subs r1, r1, #1
		bne Timer
		beq End


Timer:
	ldr r4, =SDelay
	Stimer:
		subs r4, r4, #1
		bne Stimer
	b DisStart

End:
swi 0x11