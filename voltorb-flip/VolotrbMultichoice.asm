.thumb
.align 2

main:
push {r0-r7, lr}
ldr r0, Flag
ldr r1, Multichoice
ldrb r2, [r1]
mov r3, #0x5
mul r2, r3, r2
add r0, r2, r0
ldrb r2, [r1]
lsl r2, r2, #0x1
mov r3, #0x1E
sub r2, r3, r2
mov r8, r0
mov r3, #0x0
mov r4, #0x0
mov r7, #0x0
add r1, #0x1

one:
bl troll
cmp r0, #0x1
beq oneset
mov r6, #0xAC
lsl r6, r7
add r7, #0x8
add r3, r6, r3
b onenext

oneset:
ldr r6, var8000
add r6, r4, r6
ldrh r6, [r6]
lsl r6, r2
lsr r6, r6, #0x1E
mov r5, #0xA1
add r6, r5, r6
lsl r6, r7
add r7, #0x8
add r3, r6, r3

onenext:
mov r6, #0xFF
lsl r6, r7
add r3, r6, r3
mov r0, r8
sub r0, #0x1
mov r8, r0
add r7, #0x8
add r4, #0x2
cmp r4, #0xA
beq done
cmp r7, #0x20
beq onestr
b one

onestr:
str r3, [r1]
mov r3, #0x0
mov r7, #0x0
add r1, #0x4
b one

done:
mov r2, #0xCC
lsl r2, r2, #0x10
add r3, r2, r3
mov r2, #0xE3
lsl r2, r2, #0x18
add r3, r2, r3
str r3, [r1]
add r1, #0x4
mov r3, #0xEB
mov r2, #0xA2
lsl r2, r2, #0x10
add r3, r2, r3
ldr r5, Multichoice
ldrb r2, [r5]
cmp r2, #0x4
beq adjust
add r6, r2, #0x0
add r6, #0x1
strb r6, [r5]
b continue

adjust
mov r6, #0x0
strb r6, [r5]

continue:
add r2, #0x1
mov r6, #0xA1
add r2, r6, r2
lsl r2, r2, #0x18
add r3, r2, r3
str r3, [r1]
add r1, #0x4
mov r2, #0xFF
strb r2, [r1]
pop {r0-r7, pc}

.align 2

Flag: .word 0x0000210D
Multichoice: .word 0x0203F45F
var8000: .word 0x020370B8

troll:
lsl r0, r0, #0x0