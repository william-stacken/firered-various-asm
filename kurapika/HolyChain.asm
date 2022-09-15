.thumb
.align 2

hook:
ldr r5, .hook
bx r5

.align 2

.hook: .word 0x08801941

main:
ldr r6, .bdata
ldrb r0, [r3]
mov r5, #0x58
mul r0, r5
add r6, r6, r0
ldr r0, .move
ldrh r0, [r0]
mov r1, #0xF5
lsl r1, r1, #0x1
cmp r0, r1
bne next
add r6, #0x20
ldrb r5, [r6]
cmp r5, #0x8B
bne fail
ldrb r5, [r0, #0x2]
cmp r5, #0x1E
beq next

fail:
ldrh r0, [r6, #0x2C]
lsr r0, r0, #0x1
b end

next:
ldrh r0, [r6, #0x2C]

end:
ldr r1, .damage
ldr r6, .bdata
ldr r5, .return
bx r5

.align 2

.move: .word 0x02023D4A
.damage: .word 0x02023D50
.bdata: .word 0x02023BE4
.return: .word 0x080272F9
