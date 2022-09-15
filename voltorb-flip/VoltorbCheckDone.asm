.thumb
.align 2

main:
push {r0-r4, lr}
ldr r0, var8000
ldr r4, var8005
mov r3, #0x1E

next:
ldrh r1, [r0]
add r2, r1, #0x0
lsl r2, r2, r3
lsr r2, r2, #0x1E
cmp r2, #0x1
bhi notdone
sub r3, r3, #0x2
cmp r3, #0x14
beq switch
b next

switch:
add r0, r0, #0x2
mov r3, #0x1E
cmp r0, r4
beq done
b next

notdone:
ldr r0, var8009
mov r1, #0x0
strh r1, [r0]
b allgood

done:
ldr r0, var8009
mov r1, #0x1
strh r1, [r0]

allgood:
pop {r0-r4, pc}

.align 2

var8000: .word 0x020370B8
var8005: .word 0x020370C2
var8009: .word 0x020370CA
