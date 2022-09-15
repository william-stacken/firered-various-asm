.thumb
.align 2

.org 0x800B40
main:
push {lr}
ldr r0, .bdata
ldr r1, .attacker
ldrb r1, [r1]
mov r2, #0x58
mul r1, r2
add r0, r0, r1
add r0, #0x20
ldrb r1, [r0]
cmp r1, #0x8B
bne fail
ldrb r1, [r0, #0x2]
cmp r1, #0x1E
beq fail
mov r1, #0x1E
strb r1, [r0, #0x2]
ldr r0, .outcomeA
ldr r1, .str
str r1, [r0]
b done

fail:
ldr r0, .exec
ldr r1, .failscript
str r1, [r0]

done:
pop {pc}



.align 2

.bdata: .word 0x02023BE4
.attacker: .word 0x020236DB
.outcomeA: .word 0x02022AB8
.str: .word 0xFF1E03FD
.exec: .word 0x02023D74
.failscript: .word 0x081D7DF2
