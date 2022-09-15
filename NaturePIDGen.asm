.thumb
.align 2
.equ div, 0x81E4684
.equ decrypt, 0x803FBE8
.equ start, 0x8XXXXXX @Unless you have custom functions for decrypting and dividing, this offset needs to be at a range where it can "bl" div and decrypt. I just replaced some vanilla text with the routine.

.org decrypt

.org start

PokeCheck:
push {r0-r7, lr}
ldr r0, var8000
ldr r2, party
ldrh r1, [r0, #0x8]
mov r0, #0x64
mul r0, r1
add r4, r2, r0
ldr r0, [r4]
mov r1, #0x19
bl div
ldr r5, var8000
ldrh r1, [r5]
cmp r0, r1
bne GenderCheck
mov r0, #0x0
b End

GenderCheck:
mov r6, r1
mov r0, r4
mov r1, #0xB
bl decrypt
mov r1, #0x1C
mul r0, r1
ldr r1, pokedata
add r0, r1, r0
ldrb r0, [r0, #0x10]
lsl r1, r0, #0x8
orr r6, r1
cmp r0, #0xFE 
beq Female
ldrb r1, [r4]
cmp r1, r0
bcs AbilityCheck

Female:
mov r0, #0x20
orr r6, r0

AbilityCheck:
lsl r1, r1, #0x1F
lsr r1, r1, #0x1F
cmp r1, #0x0
beq ShinyCheck
mov r0, #0x40
orr r6, r0

ShinyCheck:
ldrh r0, [r4]
ldrh r1, [r4, #0x2]
ldrh r2, [r4, #0x4]
ldrh r3, [r4, #0x6]
eor r0, r1
eor r0, r2
eor r0, r3
cmp r0, #0x8
bcs PIDGen
mov r0, #0x80
orr r6, r0

PIDGen:
lsl r7, r6, #0x1B
lsr r7, r7, #0x1B
mov r1, #0x1
and r1, r7
lsl r0, r6, #0x19
lsr r0, r0, #0x1F
cmp r0, r1
beq GenderGen
add r7, r7, #0x19

GenderGen:
lsr r1, r6, #0x8
cmp r1, #0xFF
beq ShinyGen
lsl r2, r6, #0x1A
lsr r2, r2, #0x1F

GenderLoop:
lsl r0, r7, #0x18
lsr r0, r0, #0x18
cmp r0, r1
bcc IfFemale
cmp r2, #0x0
beq ShinyGen

TryAgain:
add r7, #0x32
b GenderLoop

IfFemale:
cmp r2, #0x1
beq ShinyGen
b TryAgain

ShinyGen:
lsl r7, r7, #0x10
lsr r0, r7, #0x10
lsr r7, r7, #0x10
ldrh r1, [r4, #0x4]
ldrh r2, [r4, #0x6]
eor r0, r1
eor r0, r2
lsl r1, r6, #0x18
lsr r1, r1, #0x1F
cmp r1, #0x1
beq ShinyPID
neg r0, r0
sub r0, #0x1

ShinyPID:
lsl r0, r0, #0x10
orr r7, r0
ldr r6, ram
str r7, [r6]
str r4, [r6, #0x4]
mov r0, #0x1

End:
strh r0, [r5, #0x18]
pop {r0-r7, pc}

.align 2

var8000: .word 0x020370B8
party: .word 0x02024284
pokedata: .word 0x08254784
ram: .word 0x0203F448

SubstructureOrder:
push {r0-r7, lr}
ldr r5, ram2
ldr r0, [r5, #0x48]
mov r1, #0x18
bl div
mov r1, #0x6
swi #0x6

g_in_first: @This is JPAN:s routine for figuring out the substructure order of a PID.
cmp r0, #0x0
bne g_in_second
mov r2, #0x0
B g_final

g_in_second: 
cmp r1, #0x1
bgt g_in_third
mov r2, #0xC
b g_final

g_in_third: 
mov r2, #1
and r2, r1
cmp r2, #1
beq g_in_fourth
mov r2, #0x18
b g_final

g_in_fourth:
mov r2, #0x24

g_final: 
lsl r6, r2, #0x18

m_in_first: 
cmp r0, #0x3
bne m_in_second
mov r2, #0x0
b m_final

m_in_second:
cmp r1, #0x4
blt m_in_third
mov r2, #0xC
b m_final

m_in_third: 
mov r2, #0x1
and r2, r1
cmp r2, #0x1
bne m_in_fourth
mov r2, #0x18
b m_final

m_in_fourth:
mov r2, #0x24

m_final:
add r6, r2, r6

a_first:
cmp r0, #0x1
bgt a_second
cmp r0, #0x0
beq a_lesser_second
mov r2, #0x0
b a_final

a_second: 
mov r3, #0x2
beq a_greater_second
cmp r1, #0x3
beq a_greater_second
cmp r1, #0x0
beq a_greater_third
cmp r1, #0x5
beq a_greater_third
mov r2, #0x24
b a_final

a_greater_second:
mov r2, #0xC
b a_final

a_greater_third:
mov r2, #0x18
b a_final

a_lesser_second:
cmp r1, #0x1
bgt a_lesser_third
mov r2, #0xC
b a_final

a_lesser_third:
mov r2, #0x1
and r2, r1
cmp r2, #0x2
bne a_lesser_fourth
mov r2, #0x18
b a_final

a_lesser_fourth:
mov r2, #0x24

a_final:
lsl r2, r2, #0x10
add r6, r2, r6

e_first:
cmp r0, #0x2
blt e_second
cmp r0, #0x2
bgt e_greater_second
mov r2, #0x0
b e_final

e_second:
cmp r1, #0x2
beq e_lesser_second
cmp r1, #0x3
beq e_lesser_second
cmp r1, #0x0
beq e_lesser_third
cmp r1, #0x5
beq e_lesser_third
mov r2, #0x24
b e_final

e_lesser_second:
mov r2, #0xC
b e_final

e_lesser_third:
mov r2, #0x18
b e_final

e_greater_second:
cmp r1, #0x5
blt e_greater_third
mov r2, #0xC
b e_final

e_greater_third:
mov r2, #1
and r2, r1
cmp r2, #0
beq e_greater_fourth
mov r2, #0x18
b e_final

e_greater_fourth:
mov r2, #0x24

e_final:
lsl r2, r2, #0x8
add r6, r2, r6

WriteData:
ldr r7, [r5, #0x48]
ldr r4, [r5, #0x4C]
str r7, [r4]
ldr r0, [r4, #0x4]
eor r0, r7
add r4, #0x20
lsr r1, r6, #0x18
ldr r2, [r5, #0x8]
bl Write
lsl r1, r6, #0x8
lsr r1, r1, #0x18
ldr r2, [r5, #0xC]
bl Write
lsl r1, r6, #0x10
lsr r1, r1, #0x18
ldr r2, [r5, #0x10]
bl Write
lsl r1, r6, #0x18
lsr r1, r1, #0x18
ldr r2, [r5, #0x14]
bl Write
pop {r0-r7, pc}

Write:
ldr r3, [r2]
eor r3, r0
str r3, [r4, r1]
add r1, #0x4
ldr r3, [r2, #0x4]
eor r3, r0
str r3, [r4, r1]
add r1, #0x4
ldr r3, [r2, #0x8]
eor r3, r0
str r3, [r4, r1]
bx lr

.align 2

ram2: .word 0x0203F400

.org div @Needs to be above everything if the routine is located after 0x1E4684.

r0: New 32-bit enc-key
r1: Where to store the encrypted data
r2: Fångar upp decrypted values in ram
r3: Decrypted values. To be Xor:ed with r0
r4: Location of selected Poke
r5: RAM address
r6: New Data Structure Byte1: Micellaneous|Byte2: IVs etc|Byte3: Attacks|Byte4: Growth (Position from data)
r7: Generated PID

r4: Location of selected Poke
r5: var8000
r6: Bit 0-4: Random Nature|Bit 5: Gender|Bit 6: Ability|Bit 7: Shinyness|Bit 8-15: Gender Ratio
r7: Generated PID

Returns 0 to lastresult if nature is unchanged, and 1 if the PID was updated.

Requires a random 0x19 saved to var8000 and a position in var8004, random again if nature didn't change.