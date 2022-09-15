.align 2
.thumb

main:
push {r0-r5, lr}
ldr r0, .Miscellaneous
ldrb r1, [r0]
sub r1, r1, #0x10
add r0, r0, r1

HP:
ldr r1, [r0]
mov r3, r1
lsl r1, #0x1F
lsr r1, #0x1F
lsl r3, #0x1E
lsr r3, #0x1F
mov r2, r1
mov r4, r3

Attack:
ldr r1, [r0]
mov r3, r1
lsl r1, #0x1A
lsr r1, #0x1F
lsl r3, #0x19
lsr r3, #0x1F
lsl r1, #0x1
lsl r3, #0x1
add r2, r1, r2
add r4, r3, r4

Defense:
ldr r1, [r0]
mov r3, r1
lsl r1, #0x15
lsr r1, #0x1F
lsl r3, #0x14
lsr r3, #0x1F
lsl r1, #0x2
lsl r3, #0x2
add r2, r1, r2
add r4, r3, r4

Speed:
ldr r1, [r0]
mov r3, r1
lsl r1, #0x10
lsr r1, #0x1F
lsl r3, #0xF
lsr r3, #0x1F
lsl r1, #0x3
lsl r3, #0x3
add r2, r1, r2
add r4, r3, r4

Sp.Atk:
ldr r1, [r0]
mov r3, r1
lsl r1, #0xB
lsr r1, #0x1F
lsl r3, #0xA
lsr r3, #0x1F
lsl r1, #0x4
lsl r3, #0x4
add r2, r1, r2
add r4, r3, r4

Sp.Def:
ldr r1, [r0]
mov r3, r1
lsl r1, #0x6
lsr r1, #0x1F
lsl r3, #0x5
lsr r3, #0x1F
lsl r1, #0x5
lsl r3, #0x5
add r2, r1, r2
add r4, r3, r4

Store:
mov r1, #0xF
mov r3, #0x28
mul r2, r1, r2
mul r4, r3, r4
mov r0, r2
mov r6, r4
mov r1, #0x3F
ldr r5, .Var8000
bl .Divmod
strh r0, [r5]
mov r0, r6
mov r1, #0x3F
bl .Divmod
add r0, r0, #0x1E
strh r0, [r5, #0x02]
pop {r0-r5, pc}

.align 2

.Miscellaneous: .word 0x0203F414
.Var8000: .word 0x020370B8
.Divmod: .word 0x081E4018