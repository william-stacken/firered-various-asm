.thumb
.align 2

main:
ldr r0, .bdata
ldrb r3, [r6]
mov r1, #0x58
mul r1, r3
add r0, r0, r1
add r0, #0x20
ldrb r1, [r0]
cmp r1, #0x8B
bne return
ldrb r1, [r0, #0x2]
cmp r1, #0x1E
bne return
ldrh r0, [r0, #0xC]
mov r1, #0x6
bl linker
ldr r3, .damage
cmp r0, #0x0
bne next
mov r0, #0x1

next:
str r0, [r3]
ldr r0, .bscript
ldr r1, .success
bx r1

return:
ldr r1, .fail
bx r1

linker:
ldr r3, .divmod
bx r3

.align 2

.bdata: .word 0x02023BE4
.damage: .word 0x02023D50
.bscript: .word 0x08800FFF
.divmod: .word 0x081E4019
.success: .word 0x08018C05
.fail: .word 0x08018C13
