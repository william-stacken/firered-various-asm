.thumb
.align 2

main:
push {r0-r4, lr}
ldr r0, var8004
ldrh r1, [r0]
mov r4, #0xC6
mov r3, #0xE3
lsl r3, #0x8
add r4, r3, r4
lsl r3, #0x8
add r4, r3, r4
mov r3, #0xDF
lsl r3, #0x18
add r4, r3, r4
mov r3, #0xE6
lsl r3, #0x8
add r3, #0xD9
cmp r1, #0x0
beq party
cmp r1, #0x1
beq box
cmp r1, #0x2
beq done

party:
add r0, #0x10
ldrh r1, [r0]
sub r1, #0x1
ldr r0, PokeOT
mov r2, #0x64
mul r1, r2
add r0, r1, r0
b store

box:
add r0, #0x16
ldrh r1, [r0]
mov r2, #0x9
lsl r2, #0x8
add r2, #0x60
mul r1, r2
add r0, #0x2
ldrh r0, [r0]
mov r2, #0x50
mul r0, r2
add r1, r0, r1
ldr r0, BoxLocation
ldr r0, [r0]
mov r2, #0x4D
lsl r2, #0x8
add r2, #0x90
add r0, r2, r0
add r0, r1, r0
add r0, #0x4

store:
add r0, #0x10
str r4, [r0]
str r3, [r0, #0x4]

done:
pop {r0-r4, pc}


.align 2

PokeOT: .word 0x02024288
var8004: .word 0x020370C0
BoxLocation: .word 0x0300500C