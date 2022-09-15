.thumb
.align 2

main:
push {r0-r7, lr}
ldr r0, FreeRAM
mov r1, #0xFE
strb r1, [r0]
sub r0, #0x3
mov r7, #0x0
mov r6, #0x16
mov r8, r6
ldr r2, var8004

loop:
mov r6, #0x1E
mov r1, #0xA3
mov r4, #0xA2
add r4, r7, r4
lsl r4, r4, #0x8
add r1, r4, r1
mov r4, #0xF0
lsl r4, #0x10
add r1, r4, r1
ldrh r3, [r2]
lsl r3, r3, r6
lsr r3, #0x1E
mov r4, #0xA1
mov r5, #0xA1
cmp r3, #0x0
beq zero
add r4, r3, r4
b next

zero:
add r5, #0x1

next:
cmp r6, r8
beq done
sub r6, #0x2
ldrh r3, [r2]
lsl r3, r3, r6
lsr r3, #0x1E
cmp r3, #0x0
beq zero
add r4, r3, r4
b next

done:
cmp r4, #0xAA
bhi overflow

section:
lsl r4, r4, #0x18
add r1, r4, r1
add r0, r0, #0x4
str r1, [r0]
mov r1, #0xE4
lsl r5, r5, #0x8
add r1, r5, r1
mov r4, #0xEA
lsl r4, r4, #0x10
add r1, r4, r1
add r0, r0, #0x4
str r1, [r0]
add r7, r7, #0x1
sub r2, r2, #0x2
cmp r7, #0x5
bne loop
mov r1, #0xFF
strb r1, [r0, #0x3]
pop {r0-r7, pc}

overflow:
mov r4, #0xAB
b section

.align 2

FreeRAM: .word 0x0203F42B
var8004: .word 0x020370C0
