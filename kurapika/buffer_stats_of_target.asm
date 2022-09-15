.thumb
.align 2

MaxHP:
mov r3, #0x2C
b main

Attack:
mov r3, #0x2
b main

Defense:
mov r3, #0x4
b main

Sp.Atk:
mov r3, #0x8
b main

Sp.Def:
mov r3, #0xA
b main

Speed:
mov r3, #0x6

main:
ldr r0, .bdata
ldr r1, .defender
ldrb r1, [r1]
mov r2, #0x58
mul r1, r2
add r0, r0, r1
ldrh r1, [r0, r3]
ldr r0, .buffer1
mov r2, #0x0
mov r3, #0x3
bl ToString
b end

ToString:
ldr r4, .ToString
bx r4

nature:
ldr r0, .bdata
ldr r1, .defender
ldrb r1, [r1]
mov r2, #0x58
mul r1, r2
add r0, r0, r1
ldr r0, [r0, #0x48]
mov r1, #0x19
bl Remainder
lsl r0, r0, #0x2
ldr r1, .NatureTable
add r0, r0, r1
ldr r1, [r0]
ldr r0, .buffer1
bl bufferstring
b end

Remainder:
ldr r2, .remainder
bx r2

bufferstring:
ldr r2, .bufferstring
bx r2

item:
ldr r0, .bdata
ldr r1, .defender
ldrb r1, [r1]
mov r2, #0x58
mul r1, r2
add r0, r0, r1
ldrh r0, [r0, #0x2E]
ldr r1, .buffer1
cmp r0, #0x0
beq noitem
bl bufferitem
b end

noitem:
ldr r0, .none
str r0, [r1]
mov r0, #0xFF
strb r0, [r1, #0x4]

end:
ldr r0, .Stringbuffer1
mov pc, r0

bufferitem:
ldr r2, .bufferitem
bx r2

ability:
ldr r0, .bdata
ldr r1, .defender
ldrb r1, [r1]
mov r2, #0x58
mul r1, r2
add r0, r0, r1
add r0, #0x20
ldr r1, .Abilitybuffer
mov pc, r1

.align 2

.bdata: .word 0x02023BE4
.defender: .word 0x02023D6C
.buffer1: .word 0x02022AB8
.ToString: .word 0x08008E79
.Stringbuffer1: .word 0x080D7974
.remainder: .word 0x081E4685
.NatureTable: .word 0x08463E60
.bufferstring: .word 0x08008D85
.none: .word 0xD9E2E3C8
.bufferitem: .word 0x08099E91
.Abilitybuffer: .word 0x080D7FF0
