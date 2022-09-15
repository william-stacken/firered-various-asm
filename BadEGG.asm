.align 2
.thumb

main:
push {r0-r2, lr}
ldr r0, .Variable
ldrb r0, [r0]
ldr r1, .Checksum
mov r2, #0x64
mul r0, r2
add r1, r0
ldrh r0, [r1]
add r0, #0x1
strh r0, [r1]
pop {r0-r2, pc}

.align 2

.Checksum: .word 0x0202423C
.Variable: .word 0x020370C0