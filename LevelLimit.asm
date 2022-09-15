.text
.align 2
.thumb
.thumb_func

main:
push {r4-r7, lr}
ldr r0, .HOF
lsl r0, r0, #0x0
lsl r0, r0, #0x0
cmp r0, #0x0
bne next
mov r6, #0x14
ldr r0, .Badge1
lsl r0, r0, #0x0
cmp r0, #0x0
beq two
mov r6, #0x1E

two:
ldr r0, .Badge2
lsl r0, r0, #0x0
cmp r0, #0x0
beq three
mov r6, #0x1E

three:
ldr r0, .Badge3
lsl r0, r0, #0x0
cmp r0, #0x0
beq four
mov r6, #0x1E

four:
ldr r0, .Badge4
lsl r0, r0, #0x0
cmp r0, #0x0
beq five
mov r6, #0x1E

five:
ldr r0, .Badge5
lsl r0, r0, #0x0
cmp r0, #0x0
beq six
mov r6, #0x1E

six:
ldr r0, .Badge6
lsl r0, r0, #0x0
cmp r0, #0x0
beq seven
mov r6, #0x1E

seven:
ldr r0, .Badge7
lsl r0, r0, #0x0
cmp r0, #0x0
lsl r0, r0, #0x0
mov r6, #0x1E

.align 2

.Badge1: .word 0x00000820
.Badge2: .word 0x00000821
.Badge3: .word 0x00000822
.Badge4: .word 0x00000823
.Badge5: .word 0x00000824
.Badge6: .word 0x00000825
.Badge7: .word 0x00000826
.Badge8: .word 0x00000827




