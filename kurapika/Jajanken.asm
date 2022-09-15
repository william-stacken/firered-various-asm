.thumb
.align 2

.org 0x142DC
hook2: 				@@ Overwrites the fight menu if jajanken has been used. (The moves and PP you have access to)
ldr r0, .hook2
bx r0

.align 2

.hook2: .word 0x08801C15

.org 0x14824
hook3: 				@@ Skips the attack canceler subroutine when move selected if jajaneken bit is set. (Like torment, disable, choice band, out of pp etc)
ldr r1, .hook3
bx r1

.align 2

.hook3: .word 0x08801C75
.word 0xE07A1820	@@ the instructions add r0, r4, r0 and a branch. Had room to add them here.

.org 0x15EC4
hook4: 				@@ Changes the move to use to either rock, paper or scissors.
ldr r3, .hook4
bx r3

.align 2

.hook4: .word 0x08801C9D

.org 0x17820
hook: 				@@ Checks if Jajanken disabled and bit is set, in which case struggle.
ldr r6, .hook
bx r6

.align 2

.hook: .word 0x08801BDD

.org 0x1D7F6
hook8: 				@@ Skips "But there was no PP left for the move!" if bit set.
ldr r5, .hitmarker
ldr r0, .hook8
bx r0

.align 2

.hook8: .word 0x08801D7D

add r0, r4, #0x0	@@ Shift the instructions forward one step to load hitmarker pointer b4 branchexchancing.
add r0, #0x24
add r1, r1, r0
ldrb r0, [r1]

.org 0x1D854

.align 2

.hitmarker: .word 0x02023DD0

.org 0x238FC
hook5: 				@@ Sets jajanken as last move used if rock, paper och scissors was last move used.
ldr r3, .hook5
bx r3

.align 2

.hook5: .word 0x08801CE5

.org 0x23AB8
hook6: 				@@ Same as above, but for Mirror Move
ldr r1, .hook6
bx r1

.align 2

.hook6: .word 0x08801D29

.org 0x2ED4C
hook7: 				@@ Disables switching moves via select if jajanken bit is true
ldr r0, .hook7
bx r0

.align 2

.hook7: .word 0x08801D41

.org 0x801B80
setjajankenbit:
push {lr}
ldr r0, .userbank
ldr r1, .status3
ldrb r3, [r0]
lsl r0, r3, #0x2
add r0, r0, r1
ldr r1, [r0]
mov r2, #0x80
lsl r2, r2, #0xF
orr r1, r2
str r1, [r0]
ldr r0, .moveselector	@@ Fixes bug that allows user to select the unused fourth move if jajanken was used from the fourth moveslot.
add r0, r0, r3
mov r1, #0x0
strb r1, [r0]
pop {pc}

clearjajankenbit:
push {lr}
ldr r0, .userbank
ldr r1, .status3
ldrb r0, [r0]
lsl r0, r0, #0x2
add r0, r0, r1
ldr r1, [r0]
ldr r2, .bitarray
and r1, r2
str r1, [r0]
pop {pc}

.align 2

.userbank: .word 0x02023D6B
.bitarray: .word 0xFFBFFFFF
.moveselector: .word 0x02023FFC

checkjajankenbit:	@@ takes in active bank in r0.
push {r4, lr}
ldr r4, .status3
lsl r0, r0, #0x2
add r0, r0, r4
ldr r0, [r0]
mov r4, #0x80
lsl r4, r4, #0xF	@@ Jajanken flag = 0x400000
and r0, r4
pop {r4, pc}

.align 2

.status3: .word 0x02023DFC

strugglecheck:
mov r10, r0			@@ stuff that was overwritten by the branchexchange
mov r0, r7			@@ r7 = active bank
bl checkjajankenbit
cmp r0, #0x0
beq return1
mov r0, r12			@@ Disable struct pointer, 0x02023e0c
mov r6, #0x1C
mul r6, r7
add r0, r0, r6
ldrh r0, [r0, #0x4]
mov r6, #0xF7
lsl r6, r6, #0x1	@@ r6 = 0x1EE, jajanken index
cmp r0, r6
bne return1
mov r0, #0xF		@@ Jajanken was used and is disabled, 0xF sets struggle.
ldr r6, .ret2
bx r6

return1:
sub r0, r1, r7		@@ stuff that was overwritten by the branchexchange
lsl r0, #0x2
mov r8, r0
ldr r6, .ret1
bx r6

.align 2

.ret1: .word 0x08017829
.ret2: .word 0x08017969

fightmenuoverwrite:
ldrb r4, [r5]		@@ loads active bank
mov r0, r4
bl checkjajankenbit
cmp r0, #0x0
beq return2
mov r2, sp
ldr r3, .moves		@@ Stores the users moves to be displayed from a table. In this case 0x1EF, 0x1F0, 0x1F1 and 0x0.
ldrh r0, [r3]
strh r0, [r2, #0x4]
ldrh r0, [r3, #0x2]
strh r0, [r2, #0x6]
ldrh r0, [r3, #0x4]
strh r0, [r2, #0x8]
ldrh r0, [r3, #0x6]
strh r0, [r2, #0xA]
ldr r0, .bytefield	@@ Current and Max PP. Stores multiple 0x1 and 0x0 bytes at once.
str r0, [r2, #0xC]
str r0, [r2, #0x10]
ldr r3, .bdata		@@ Gets active PKMNs data
mov r0, #0x58
mul r0, r4
add r3, r0, r3
ldrh r0, [r3]		@@ Stores Species, type1 and type2. Not sure why its needed.
strh r0, [r2, #0x14]
add r3, #0x21
ldrb r0, [r3]
strb r0, [r2, #0x16]
ldrb r0, [r3, #0x1]
strb r0, [r2, #0x17]
add r0, sp, #0xC	@@ Stores a pointer to sp + 0xc (The current PP) for some reason
str r0, [r2, #0x18]
ldr r2, .ret4
bx r2

return2:
mov r0, #0x1C		@@ stuff that was overwritten by the branchexchange
mul r0, r4
ldr r2, .ret3
bx r2

.align 2

.bytefield: .word 0x00010101
.bdata: .word 0x02023BE4
.moves: .word 0x08801B78
.ret3: .word 0x080142E5
.ret4: .word 0x080143B9

attackcancelskip:
cmp r2, r0
beq return3
ldr r1, .ret6
ldrb r0, [r5]		@@ active bank
bl checkjajankenbit
cmp r0, #0x0
beq return4
add r1, #0x44		@@ skips a function call if bit is set by adding 0x44 to the address.

return4:
bx r1

return3:
ldr r0, .pointer	@@ stuff that was overwritten by the branchexchange
ldr r1, .ret5
bx r1

.align 2

.pointer: .word 0x02023E82
.ret5: .word 0x0801482D
.ret6: .word 0x08014839

moveuser:
ldrb r2, [r4]		@@ active bank
mov r3, r0			@@ r0 contains which move the player selected
mov r0, r2
bl checkjajankenbit
cmp r0, #0x0
beq return5
ldr r0, .moves1		@@ jajanken move table
add r0, r3, r0
ldr r1, .ret7
add r1, #0x6
bx r1

return5:
mov r1, #0x58		@@ stuff that was overwritten by the branchexchange
mul r1, r2
add r0, r3, r1
ldr r3, .ret7
bx r3

.align 2

.moves1: .word 0x08801B78
.ret7: .word 0x08015ECD

checkjmove_func:	@@ Checks if last used move is rock, paper och scssors and changes to jajanken if true
mov r2, #0xF7		@@ jajanken, 0x1EE
lsl r2, r2, #0x1
cmp r0, r2
bls notj
add r2, r2, #0x4
cmp r0, r2
bcs notj
sub r0, r2, #0x4
strh r0, [r1]
mov r0, #0x1
bx lr

notj:
mov r0, #0x0
bx lr
nop

setlastmoveused:
ldrh r0, [r0]		@@ load from 02023D4C
bl checkjmove_func
cmp r0, #0x0
beq return6
mov r0, r9			@@ attacker bank
ldrb r0, [r0]
lsl r0, r0, #0x1
ldr r1, .pointer1
add r0, r0, r1
ldrh r0, [r0]
ldr r1, .move
bl checkjmove_func
cmp r0, #0x0
beq return7
ldr r2, .ret9
bx r2

return6:
strh r0, [r1]		@@ stuff that was overwritten by the branchexchange
ldr r0, .pointer1
mov r3, r9
ldr r1, .ret8
bx r1

return7:
ldr r0, .ret8
add r0, r0, #0x6
bx r0

.align 2

.pointer1: .word 0x02023DB0
.move: .word 0x02023D4A
.ret8: .word 0x08023905
.ret9: .word 0x08023967

mirrormovefix:
ldrh r0, [r3]		@@ load from 02023D4C
bl checkjmove_func
cmp r0, #0x0
bne return8
ldrh r0, [r3]
strh r0, [r1]

return8:
ldr r0, .ret10
bx r0

.align 2

.ret10: .word 0x08023ACD

selectdisable:
mov r0, #0x4
and r0, r1
cmp r0, #0x0
beq return9
ldr r0, .activbank
ldrb r0, [r0]
bl checkjajankenbit
cmp r0, #0x0
bne playsound
ldr r0, .ret11
bx r0

playsound:
mov r0, #0x1A
ldr r1, .sound
bl bx

return9:
add sp, #0x4
pop {r3}
mov r8, r3
pop {r4-r7}
pop {r0}
bx r0

bx:
bx r1

.align 2

.ret11: .word 0x0802ED55
.sound: .word 0x080722CD
.activbank: .word 0x02023BC4

noPPleftskip:
ldrb r0, [r3]		@@ load from 02023D6B, attacker bank
bl checkjajankenbit
cmp r0, #0x0
beq return10
ldr r0, .ret13
bx r0

return10:
ldrb r2, [r3]
mov r0, #0x58
mul r2, r0
add r1, r1, r2
ldr r0, .ret12
bx r0

.align 2

.ret12: .word 0x0801D801
.ret13: .word 0x0801D86D

