.thumb
.align 2

.org 0x1DAF4
hook:
ldr r0, .hook
bx r0

.align 2

.hook: .word 0x08800F19

.org 0x800EF4
main:
push {r4, lr}
ldr r4, .status3
ldr r0, .defender
ldrb r0, [r0]
lsl r0, r0, #0x2
add r4, r4, r0
bl rand
lsr r0, r0, #0xE
add r0, #0x4
lsl r0, r0, #0x13
ldr r1, [r4]
orr r1, r0
str r1, [r4]
pop {r4, pc}

rand:
ldr r0, .rand
bx r0
lsl r0, r0, #0x0

main2:
ldr r0, .status3
ldr r1, .attacker
ldrb r2, [r1]
lsl r1, r2, #0x2
add r0, r0, r1
ldr r1, [r0]
lsl r1, r1, #0xA
lsr r1, r1, #0x1D
cmp r1, #0x4
bcc return
mov r0, #0x3
and r1, r0
ldr r0, .pointer
ldr r0, [r0]
add r0, r0, r2
add r0, #0x80
ldrb r0, [r0]
cmp r0, r1
bne return
ldr r0, .bscript
ldr r1, .scriptexec
str r0, [r1]
ldr r0, .return
bx r0

return:
ldr r1, .scriptexec
ldr r0, [r1]
add r0, #0x1
str r0, [r1]
ldr r0, .return
bx r0

.align 2

.status3: .word 0x02023DFC
.defender: .word 0x02023D6C
.rand: .word 0x08044EC9
.attacker: .word 0x02023D6B
.pointer: .word 0x02023FE8
.bscript: .word 0x08800E71
.scriptexec: .word 0x02023D74
.return: .word 0x0801DAFD
