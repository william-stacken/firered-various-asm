.thumb
.align 2

main:
push {r0-r5, lr}
ldr r0, var8004
ldr r1, var8008
ldrh r2, [r1]
add r1, r1, #0x2
ldrh r1, [r1]
mov r3, #0x1E
sub r3, r3, r1
sub r0, r0, r2
add r4, r0, #0x0
ldrh r1, [r0]
lsl r1, r1, r3
lsr r1, r1, #0x1E
ldr r0, var8008
strh r1, [r0]
add r2, r0, #0x4
ldrh r5, [r2]
mul r5, r1, r5
str r5, [r2]
ldrh r2, [r4]
ldr r0, ander
cmp r1, #0x1
bhi remove
b end

label:
and r2, r2, r0
strh r2, [r4]

end:
pop {r0-r5, pc}

remove:
cmp r3, #0x1E
beq label
cmp r3, #0x1C
beq two
cmp r3, #0x1A
beq three
cmp r3, #0x18
beq four
cmp r3, #0x16
beq five

two:
sub r0, r0, #0x9
b label

three:
lsl r0, r0, #0x1A
lsr r0, r0, #0x16
add r0, r0, #0xF
b label

four:
ldr r0, ander2
b label

five:
mov r0, #0xFF
b label

.align 2

var8004: .word 0x020370C0
var8008: .word 0x020370C8
ander: .word 0x000003FC
ander2: .word 0x0000033F
