.thumb
.align 2

main:
push {r0-r5, lr}
ldr r0, var8000
ldr r5, var8005
mov r4, #0x1
mov r3, #0x1E

next:
ldrh r1, [r0]
add r2, r1, #0x0
lsl r2, r2, r3
lsr r2, r2, #0x1E
cmp r2, #0x0
beq nope
mul r4, r2

nope:
sub r3, r3, #0x2
cmp r3, #0x14
beq section
b next

section:
add r0, r0, #0x2
mov r3, #0x1E
cmp r0, r5
beq done
b next

done:
ldr r0, LASTRESULT
mov r1, #0xC8
cmp r4, r1
bhi no
mov r3, #0x0
str r3, [r0]
b allgood

no:
mov r3, #0x1
str r3, [r0]

allgood:
pop {r0-r5, pc}

.align 2

var8000: .word 0x020370B8
var8005: .word 0x020370C2
LASTRESULT: .word 0x020370D0
