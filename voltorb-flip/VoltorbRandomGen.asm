.thumb
.align 2
.thumb_func

main:
push {r0-r4, lr}
ldr r1, .var8005
add r0, r1, #0x2
ldrh r0, [r0]
ldrh r1, [r1]
lsl r0, r0, r1
ldr r3, var8007
ldrb r3, [r3]
ldr r1, .var8000
ldr r2, .FreeRAM
mov r4, #0x5
cmp r3, r4
blt next
mov r4, #0xA
cmp r3, r4
blt tva
mov r4, #0xF
cmp r3, r4
blt tre
mov r4, #0x14
cmp r3, r4
blt fyra
mov r4, #0x19
cmp r3, r4
blt fem

tva:
add r1, #0x2
add r2, #0x2
b next

tre:
add r1, #0x4
add r2, #0x4
b next

fyra:
add r1, #0x6
add r2, #0x6
b next

fem:
add r1, #0x8
add r2, #0x8
b next

next:
ldrh r3, [r1]
add r3, r0, r3
strh r3, [r1]
strh r3, [r2]
pop {r0-r4, pc}


.align 2

.var8000: .word 0x020370B8
.FreeRAM: .word 0x0203F455
.var8005: .word 0x020370C2
var8007: .word 0x020370C6
