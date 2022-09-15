.thumb
.align 2

.org 0xF1D20
main:
ldr r1, .hook
bx r1

.align 2

.hook: .word 0x08800461

.org 0x800460
main2:
ldrh r1, [r0]
ldr r0, .chainjail
cmp r1, r0
bne next
ldr r1, .loc
mov r0, #0x5
strh r0, [r1]
mov r0, r2
ldr r2, .return3
bx r2

next:
cmp r1, #0x53
bne end
ldr r1, .loc
ldr r0, .return
bx r0

end:
ldr r0, .return2
bx r0

.align 2

.chainjail: .word 0x000001E7
.loc: .word 0x02037F02
.return: .word 0x080F1D29
.return2: .word 0x080F1D35
.return3: .word 0x080F1D71

.org 0x8009F4
main3:
push {r0-r2}
ldr r0, .move
ldrh r1, [r0]
ldr r3, .chainjail2
cmp r1, r3
bne nextcheck
ldr r1, .bdata
ldr r2, .attacker
ldrb r2, [r2]
mov r3, #0x58
mul r2, r3
add r2, #0x22
add r1, r1, r2
ldrb r1, [r1]
cmp r1, #0x1E
bne nextcheck
mov r3, #0x50
ldr r0, .next2
bx r0

nextcheck:
ldr r3, .next
bx r3

.align 2

.move: .word 0x02023D4A
.chainjail2: .word 0x000001E7
.bdata: .word 0x02023BE4
.attacker: .word 0x02023D6B
.next: .word 0x08908865
.next2: .word 0x089088C1
