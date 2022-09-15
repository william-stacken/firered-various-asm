.thumb
.align 2

.org 0x14FB8
hook:
ldr r3, .hook
bx r3

.align 2

.hook: .word 0x08800001

.org 0x15004
hook2:
ldr r2, .hook2
bx r2

.align 2

.hook2: .word 0x08800021

.org 0x800000
main:
add r0, r0, r1
ldrh r3, [r0, #0xC]
mov r0, #0xF3
lsl r0, r0, #0x1
cmp r0, r3
bne return
ldr r0, .pointer
ldr r0, [r0]
add r0, r9
add r0, #0x80
ldrb r0, [r0]
add r0, #0x1
add r3, r3, r0

return:
ldr r0, .returnaddr
bx r0
lsl r0, r0, #0x0

main2:
add r0, r0, r1
ldrh r2, [r0, #0xC]
mov r0, #0xF3
lsl r0, r0, #0x1
cmp r0, r2
bne return2
ldr r0, .pointer
ldr r0, [r0]
add r0, r10
add r0, #0x80
ldrb r0, [r0]
add r0, #0x1
add r2, r2, r0

return2:
ldr r0, .returnaddr2
bx r0

.align 2

.pointer: .word 0x02023FE8
.returnaddr: .word 0x08014FCB
.returnaddr2: .word 0x08015017

main3:
push {r4, lr}
ldr r2, .hitmarker
ldr r0, [r2]
ldr r1, .bitmap
and r0, r1
str r0, [r2]
ldr r0, .pointer2
ldr r1, .attacker
ldr r0, [r0]
ldrb r1, [r1]
add r0, r0, r1
add r0, #0x80
ldrb r0, [r0]
add r0, #0x1
ldr r4, .executemove
ldrh r1, [r4]
add r0, r0, r1
strh r0, [r4]
mov r1, #0x0
ldr r2, .target
bl targetlinker
ldr r1, .defender
strb r0, [r1]
ldrh r1, [r4]
mov r2, #0xC
mul r1, r2
ldr r2, .movedata
ldr r3, .movescript
add r0, r1, r2
ldrb r0, [r0]
lsl r0, r0, #0x2
add r0, r0, r3
ldr r0, [r0]
ldr r2, .target2
bl targetlinker
pop {r4, pc}

targetlinker:
bx r2

.align 2

.hitmarker: .word 0x02023DD0
.bitmap: .word 0xFFFFFBFF
.pointer2: .word 0x02023FE8
.attacker: .word 0x02023D6B
.executemove: .word 0x02023D4A
.target: .word 0x0801D05D
.defender: .word 0x02023D6C
.movedata: .word 0x08900000
.movescript: .word 0x08903B70
.target2: .word 0x08017521
