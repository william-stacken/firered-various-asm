.thumb
.align 2

main:
ldr r1, [sp, #0x0]
lsl r1, #0x8
lsr r1, #0x8
add r0, r6, r7
lsl r0, #0x3
add r0, r4, r0
add r0, r0, r3
ldrh r0, [r0, #0x2]
cmp r0, r1
beq evolve
ldr r1, .nextevocheck
mov pc, r1

evolve:
ldr r1, .var8004
mov r3, #0x1
strh r3, [r1]
ldr r3, .evodata
ldr r1, .evolvetime
mov pc, r1

.align 2

.nextevocheck: .word 0x0806D332
.evolvetime: .word 0x0806D1DC
.evodata: .word 0x0832531C
.var8004: .word 0x020375E0

removeitem:
lsl r0, #0x0
lsl r0, #0x0
lsl r0, #0x0
lsl r0, #0x0
ldr r1, .go
bx r1

.align 2

.go: .word 0x08F00FFF

setvar:
ldr r1, [sp, #0x4]
cmp r1, #0x0
bne next
ldr r2, .8004
strh r1, [r2]

next:
ldr r1, .table
add r0, r1
ldr r0, [r0]
mov pc, r0

go:
lsl r0, r0, #0x0
mov r1, #0xB
ldr r3, .encrypt
bl bx
ldr r0, .8004
ldrh r0, [r0]
cmp r0, #0x0
beq end
mov r0, r9
mov r1, #0xC
ldr r2, .noitem
ldr r3, .encrypt
bl bx

end:
mov r0, r9
ldr r1, .return
bx r1

bx:
bx r3

.align 2

.noitem: .word 0x08F00940
.encrypt: .word 0x0806ACAD
.return: .word 0x0813E9D5
.8004: .word 0x020375E0
.table: .word 0x0806D198
