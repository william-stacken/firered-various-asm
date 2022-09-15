.thumb
.align 2

.org 0x14F86
hook2:
ldr r1, .hook2
bx r1

.align 2

.hook2: .word 0x08800251

.org 0x14FD4
hook3:
ldr r0, .hook3
bx r0

.align 2

.hook3: .word 0x08800285

.org 0x15D30
hook5:
ldr r0, .hook5
bx r0

.align 2

.hook5: .word 0x088002DD

.org 0x186F4
hook4:
ldr r0, .hook4
bx r0

.align 2

.hook4: .word 0x088002B9

.org 0x20A34
hook:
ldr r1, .hook
bx r1

.align 2

.hook: .word 0x088001ED

.org 0x8001EC
main:
and r5, r0
cmp r5, #0x0
bne return
ldr r0, .move
ldrh r0, [r0]
ldr r1, .chainjailid
cmp r0, r1
bne return2
mov r2, r9
ldrb r2, [r2]
mul r2, r6
add r2, r2, r4
ldr r1, .orr
ldr r0, [r2]
ldr r3, .return3
bx r3

return:
ldr r0, .return
bx r0

return2:
ldr r0, .return2
bx r0

.align 2

.move: .word 0x02023D4A
.chainjailid: .word 0x000001E7
.orr: .word 0x8000E000
.return3: .word 0x08020A55
.return: .word 0x080210ED
.return2: .word 0x08020A3D

.org 0x80022C
main2:
push {r0-r4}
ldr r0, .userBank
ldrb r0, [r0, #0x0]
ldr r1, .battleStruct
mov r2, #0x58
mul r0, r2
add r4, r0, r1
ldrh r3, [r4, #0x28]
ldr r0, .damageValue
stm r0!, {r3}
pop {r0-r4}
bx lr

.align
.damageValue:  .word 0x02023D50
.battleStruct:  .word 0x02023BE4
.userBank: .word 0x02023D6B

.org 0x800250
main3:
ldr r1, .bdata
mov r0, #0x58
mul r0, r3
add r0, r0, r1
ldr r0, [r0, #0x50]
lsr r0, r0, #0x1F
cmp r0, #0x1
beq struggle
ldr r0, .protect
lsl r1, r3, #0x4
add r1, r1, r0
ldrb r0, [r1]
lsl r0, r0, #0x1D
ldr r1, .return4
bx r1

struggle:
ldr r1, .return5
bx r1

.align 2

.bdata: .word 0x02023BE4
.protect: .word 0x02023E8C
.return4: .word 0x08014F91
.return5: .word 0x08014F95

.org 0x800284
main4:
ldr r0, .bdata2
mov r2, #0x58
mul r2, r1
add r0, r0, r2
ldr r0, [r0, #0x50]
lsr r0, r0, #0x1F
cmp r0, #0x1
beq struggle3
ldr r0, .protect2
lsl r1, r1, #0x4
add r1, r1, r0
ldrb r0, [r1]
ldr r1, .return6
bx r1

struggle3:
mov r2, #0xA5
ldr r1, .return7
bx r1

.align 2

.bdata2: .word 0x02023BE4
.protect2: .word 0x02023E8C
.return6: .word 0x08014FDD
.return7: .word 0x08014FE5

.org 0x8002B8
main5:
mul r4, r3
add r4, r10
ldr r0, [r4]
ldr r1, .bic
and r0, r1
str r0, [r4]
ldr r2, .outcomeA
mov r0, #0xFD
strb r0, [r2]
mov r0, #0x2
ldr r1, .return8
bx r1

.align 2

.bic: .word 0x7FFFFFFF
.outcomeA: .word 0x02022AB8
.return8: .word 0x080186FD

.org 0x8002DC
main6:
mov r8, r2
ldr r0, .bdata3
mov r3, #0x58
mul r3, r4
add r0, r0, r3
ldr r0, [r0, #0x50]
lsr r0, r0, #0x1F
cmp r0, #0x1
beq struggle2
lsl r0, r4, #0x4
add r3, r0, r1
ldrb r1, [r3]
lsl r0, r1, #0x1D
cmp r0, #0x0
bge returner
ldr r0, .return10
bx r0

returner:
ldr r0, .return11
bx r0

struggle2:
ldr r2, .moveid
ldr r1, .return9
bx r1

.align 2

.bdata3: .word 0x02023BE4
.moveid: .word 0x02023D4A
.return9: .word 0x08015D49
.return10: .word 0x08015D3D
.return11: .word 0x08015D9D
