.thumb
.align 2

.equ quickclawatk, 0x14E68
.equ quickclawdef, 0x14F46
.equ speedtie2, 0x1504E
.equ speedtie, 0x1507C
.equ run, 0x1683E
.equ yawn, 0x18BCA
.equ frozen, 0x194FA
.equ onffe, 0x19558
.equ confused, 0x19842
.equ paralyzed, 0x19910
.equ onnfs, 0x19946
.equ attracted, 0x199EC
.equ shedskin, 0x1A4B8
.equ effectspore, 0x1AB94
.equ effectsporebl, 0x1ABC0
.equ poisonpoint, 0x1AC8C
.equ static, 0x1AD68
.equ flamebody, 0x1AE44
.equ cutecharm, 0x1AF34
.equ kingsrock, 0x1CE9C
.equ kingsrock2, 0x1CFA6
.equ disobedience, 0x1D4D4
.equ disobedience2, 0x1D518
.equ disobedience3, 0x1D564
.equ triattackroutine, 0x1D568
.equ disobedience4, 0x1D65A
.equ disobedience5, 0x1D6CC
.equ disobedience6, 0x1D6F4
.equ disobedience7, 0x1D738
.equ accuracy, 0x1E150
.equ accmiss, 0x1E168
.equ acchit, 0x1E1BA
.equ critical, 0x1E40A
.equ shinycheck, 0x1E438
.equ differentstatus, 0x1E464
.equ critical2, 0x1E4F0
.equ critical3, 0x1E52A
.equ critical4, 0x1E580
.equ damage, 0x1F106
.equ word, 0x1F164
.equ focusband, 0x1F192
.equ focusband2, 0x1F1C4
.equ damagecmd8, 0x1F2B6
.equ word2, 0x1F314
.equ sleepturns, 0x20592
.equ sleepwords, 0x205C4
.equ sleepfinal, 0x205E0
.equ confusionturns, 0x207E6
.equ bindturns, 0x20A3C
.equ thrashturns, 0x20FF0
.equ scndeffects, 0x211A0
.equ twooneoneea, 0x211EA
.equ protect, 0x26FB8
.equ protect2, 0x2705C
.equ multihits, 0x281EE
.equ metronome, 0x29766
.equ psywave, 0x2982E
.equ disable, 0x29B2E
.equ encore, 0x29C66
.equ spite2, 0x2A548
.equ spite, 0x2A55E
.equ present, 0x2AEAA
.equ taedf, 0x2AED4
.equ magnitude, 0x2B022
.equ pickup, 0x2CEA4
.equ pickup2, 0x2CF0A
.equ ball, 0x2D6BC
.equ ball2, 0x2D720
.equ ball3, 0x2D780
.equ ball4, 0x2D7B8
.equ shiny, 0x3DAF6
.equ iv, 0x3DCD0
.equ iv2, 0x3DD1A
.equ random, 0x44EC8
.equ egg, 0x45A0C
.equ egg2, 0x45A38
.equ cleanse, 0x831FE
.equ encounter, 0x83356
.equ gamecorner, 0x1409B6
.equ gamecorner2, 0x140A58
.equ triattack, 0x1D6E7D
.equ uproarbugfix, 0x1D7E2C
.equ ptredit, 0x250328

.org quickclawatk
clawatk:
mov r0, r9
mov r1, #0x1
and r0, r1
cmp r0, #0x0
beq clawatknext
neg r1, r1
mov r8, r1
b clawatknext
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0

clawatknext:
lsl r0, r0, #0x0

.org quickclawdef
clawdef:
mov r0, r10
mov r1, #0x1
and r0, r1
cmp r0, #0x0
beq clawdefnext
mov r7, #0x1
neg r7, r7
b clawdefnext
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0

clawdefnext:
lsl r0, r0, #0x0

.org speedtie2
speedties2:
mov r0, r9
mov r1, #0x1
and r0, r1
cmp r0, #0x1
beq speedtie2next
mov r3, #0x2
b speedtiefinish2
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0

speedtie2next:
lsl r0, r0, #0x0

.org speedtie
speedties:
mov r1, r9
mov r0, r1
mov r1, #0x1
and r0, r1
cmp r0, #0x1
beq speedtie2next
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0

speedtienext:
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0

speedtiefinish2:
lsl r0, r0, #0x0

speedtiefinish:
lsl r0, r0, #0x0

.org run
.hword 0xE016

.org yawn
gasp:
ldrb r1, [r6]
mov r2, r1
mul r2, r5
add r2, r2, r4
mov r0, #0x1
and r0, r1
mov r1, #0x2
cmp r0, #0x0
bne minyawnsleep
add r1, #0x3

minyawnsleep:
str r1, [r2]
mov r0, #0x0

.org frozen
cold:
ldr r0, attackone
ldrb r0, [r0]
mov r1, #0x1
and r0, r1
cmp r0, #0x0
beq yesfreeze
b nofreeze

.align 2

attackone: .word 0x02023D6B

nextfreeze:
lsl r0, r0, #0x0
lsl r0, r0, #0x0

yesfreeze:
lsl r0, r0, #0x0

.org onffe
nofreeze:
lsl r0, r0, #0x0

.org confused
ldrb r2, [r5]
mov r1, #0x1
and r2, r1
cmp r2, #0x0
beq yesconfuse
b noconfuse
lsl r0, r0, #0x0

noconfuse:
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0

yesconfuse:
lsl r0, r0, #0x0

.org paralyzed
stun:
ldr r0, attacktwo
ldrb r0, [r0]
mov r1, #0x1
and r0, r1
cmp r0, #0x0
beq yespara
b nopara
lsl r0, r0, #0x0

yespara:
lsl r0, r0, #0x0

.org onnfs
nopara:
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0

.align 2

attacktwo: .word 0x02023D6B

.org attracted
ldr r0, attackthree
ldrb r0, [r0]
mov r1, #0x1
and r0, r1
cmp r0, #0x0
beq yesattract
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0

.align 2

attackthree: .word 0x02023D6B

nextattract:
lsl r0, r0, #0x0
lsl r0, r0, #0x0

yesattract:
lsl r0, r0, #0x0

.org shedskin
shedskins:
mov r0, r10
mov r1, #0x1
and r0, r1
cmp r0, #0x0
beq noshed
mov r4, #0x0
b yesshed
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0

noshed:
lsl r0, r0, #0x0
lsl r0, r0, #0x0

yesshed:
lsl r0, r0, #0x0

.org effectspore
shroom:
ldr r0, defendone
ldrb r0, [r0]
mov r1, #0x1
and r0, r1
cmp r0, #0x0
beq status
b nostatus
lsl r0, r0, #0x0

.align 2

defendone: .word 0x02023D6B

nostatus:
lsl r0, r0, #0x0
lsl r0, r0, #0x0

status:
lsl r0, r0, #0x0

.org effectsporebl
bls:
cmp r0, #0x3
bne changestatusreal
add r0, #0x2

changestatusreal:
bl changestatus
cmp r0, #0x0
beq status

.org poisonpoint
toxic:
ldr r0, defendtwo
ldrb r0, [r0]
mov r1, #0x1
and r0, r1
cmp r0, #0x0
beq poison
b nopoison
lsl r0, r0, #0x0

.align 2

defendtwo: .word 0x02023D6B

nopoison:
lsl r0, r0, #0x0
lsl r0, r0, #0x0

poison:
lsl r0, r0, #0x0

.org static
elec:
ldr r0, defendthree
ldrb r0, [r0]
mov r1, #0x1
and r0, r1
cmp r0, #0x0
beq parlyz
b noparlyz
lsl r0, r0, #0x0

.align 2

defendthree: .word 0x02023D6B

noparlyz:
lsl r0, r0, #0x0
lsl r0, r0, #0x0

parlyz:
lsl r0, r0, #0x0

.org flamebody
fire:
ldr r0, defendfour
ldrb r0, [r0]
mov r1, #0x1
and r0, r1
cmp r0, #0x0
beq burn
b noburn
lsl r0, r0, #0x0

.align 2

defendfour: .word 0x02023D6B

noburn:
lsl r0, r0, #0x0
lsl r0, r0, #0x0

burn:
lsl r0, r0, #0x0

.org cutecharm
charm:
ldr r0, defendfive
ldrb r0, [r0]
mov r1, #0x1
and r0, r1
cmp r0, #0x0
beq attract
b noattract
lsl r0, r0, #0x0

.align 2

defendfive: .word 0x02023D6B

noattract:
lsl r0, r0, #0x0
lsl r0, r0, #0x0

attract:
lsl r0, r0, #0x0

.org kingsrock
kingsrocks:
ldr r0, attackten
ldrb r0, [r0]
mov r1, #0x1
and r0, r1
cmp r0, #0x1
beq nokingsrock
b kingsrocknext
lsl r0, r0, #0x0

.align 2

attackten: .word 0x02023D6C

kingsrockanother:
lsl r0, r0, #0x0

kingsrocknext:
lsl r0, r0, #0x0

.org kingsrock2
nokingsrock:
lsl r0, r0, #0x0

.org disobedience
obedience:
mov r0, r8
ldrb r0, [r0]
mov r1, #0x1
and r0, r1
cmp r0, #0x0
beq obnext
mov r0, #0x0
b obfinish

.org disobedience2
obnext:
lsl r0, r0, #0x0
@resets rage, checks if snore and sleep etc, ends up at 3 if false

.org disobedience3
obanother:
b oblast
@brances to confusion

.org triattackroutine
tratk:
push {r4-r7, lr}
ldr r4, battledatathree
mov r5, #0x7
mov r6, #0x58
ldr r7, defenderfifteen
ldrb r7, [r7]
mul r6, r7
add r4, r4, r6
add r4, #0x20
ldrb r6, [r4]
cmp r6, #0x29
bne checkmagmaarmor
mov r1, #0x4
bic r5, r1
b typeonecheck

checkmagmaarmor:
cmp r6, #0x28
bne checklimber
mov r1, #0x1
bic r5, r1
b typeonecheck

checklimber:
cmp r6, #0x7
bne typeonecheck
mov r1, #0x2
bic r5, r1

typeonecheck:
ldrb r6, [r4, #0x1]
cmp r6, #0xA
bne icetypecheck
mov r1, #0x4
bic r5, r1
b typetwocheck

icetypecheck:
cmp r6, #0xF
bne typetwocheck
mov r1, #0x1
bic r5, r1

typetwocheck:
ldrb r6, [r4, #0x2]
cmp r6, #0xA
bne icetypechecktwo
mov r1, #0x4
bic r5, r1
b typecheckfinish

icetypechecktwo:
cmp r6, #0xF
bne typecheckfinish
mov r1, #0x1
bic r5, r1

typecheckfinish:
ldr r0, nextaddress
lsl r5, r5, #0x2
add r0, r0, r5
ldr r0, [r0]
mov pc, r0

.align 2

battledatathree: .word 0x02023BE4
defenderfifteen: .word 0x02023D6C
nextaddress: .word 0x0801D5D8
.word 0x0801D630
.word 0x0801D5F8
.word 0x0801D5FC
.word 0x0801D600
.word 0x0801D60E
.word 0x0801D612
.word 0x0801D620
.word 0x0801D630

rfiveone:
mov r0, #0x4
b typecheckend

rfivetwo:
mov r0, #0x5
b typecheckend

rfivethree:
bl rng
mov r1, #0x3
and r0, r1
lsr r0, r0, #0x1
add r0, r0, #0x4
b typecheckend

rfivefour:
mov r0, #0x3
b typecheckend

rfivefive:
bl rng
mov r1, #0x3
and r0, r1
lsr r0, r0, #0x1
add r0, r0, #0x3
b typecheckend

rfivesix:
bl rng
mov r1, #0x3
and r0, r1
mov r1, #0x1
bic r0, r1
add r0, r0, #0x3
b typecheckend

rfiveseven:
mov r0, #0x9

typecheckend:
ldr r1, effectbytetwo
strb r0, [r1, #0x3]
ldr r1, bscript
ldr r0, [r1]
add r0, #0x1
str r0, [r1]
pop {r4-r7, pc}

.align 2

effectbytetwo: .word 0x02023E82
bscript: .word 0x02023D74

psywavefunc:
mov r3, #0x64
mul r3, r0
neg r3, r3
add r3, #0x64
bx lr
lsl r0, r0, #0x0

criticalfunc:
ldrb r0, [r3]
strb r0, [r1]
ldr r0, defendsixteen
ldrb r0, [r0]
bx lr
lsl r0, r0, #0x0

.align 2

defendsixteen: .word 0x02023D6C

.org disobedience5
obandyetanother:
b oblast
@branches to confusion

metronomesplash:
push {r4, lr}
ldr r4, attackerthirtysix
bl rng
ldrb r2, [r4]
mov r1, #0x1
and r2, r1
cmp r2, #0x0
beq splash
b metronomeend
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0

splash:
mov r0, #0x95

metronomeend:
pop {r4, pc}

.align 2

attackerthirtysix: .word 0x02023D6B

.org disobedience6
oblast:
lsl r0, r0, #0x0
@confusion

.org disobedience7
obfinish:
lsl r0, r0, #0x0
@full obedience

.org accuracy
acccheck:
ldr r0, attackereleven
ldrb r0, [r0]
mov r1, #0x1
and r0, r1
cmp r0, #0x0
beq accnext
cmp r4, #0x64
bcc accnope
b accnext
lsl r0, r0, #0x0

.align 2

attackereleven: .word 0x02023D6C

.org accmiss
accnope:
lsl r0, r0, #0x0

.org acchit
accnext:
lsl r0, r0, #0x0

.org critical
crits:
ldr r1, bank
ldr r3, attacktwelwe
bl criticalfunc
ldr r4, pokebattledata
mov r12, r3
mov r1, #0x1
and r0, r1
cmp r0, #0x0
bne yescritical
b nocritical

.align 2

bank: .word 0x02023D6F
attacktwelwe: .word 0x02023D6B
pokebattledata: .word 0x02023BE4

.org shinycheck

noshiny:
push {lr}

noshinysecond:
mov r1, r4
lsl r2, r0, #0x10
orr r4, r2
eor r1, r0
ldr r0, trainerdma
ldr r0, [r0]
ldrh r2, [r0, #0xA]
eor r1, r2
ldrh r2, [r0, #0xC]
eor r1, r2
cmp r1, #0x8
bcs noshinydone
bl rng
mov r4, r0
bl rng
b noshinysecond

noshinydone:
pop {pc}

.align 2

trainerdma: .word 0x0300500C

.org differentstatus
changestatus:
push {r4-r7, lr}
ldr r4, battledatatwo
ldr r5, pokeinbattle
mov r6, #0x58
ldr r7, attackerfifteen
ldrb r7, [r7]
cmp r0, #0x1
beq inflictsleep
cmp r0, #0x2
beq inflictpoison
mul r6, r7
add r1, r4, r7
add r1, #0x20
ldrb r1, [r1]
cmp r1, #0x7
beq differentstatusend
b differentstatusfinish

inflictsleep:
mul r6, r7
add r1, r4, r6
add r1, #0x20
ldrb r1, [r1]
cmp r1, #0xF
beq differentstatusend
cmp r1, #0x48
beq differentstatusend
ldrb r6, [r5]
add r4, #0x50
mov r5, #0x70
mov r7, #0x0

differentstatusloop:
ldr r1, [r4]
and r1, r5
cmp r1, #0x0
bne freezeprevent
add r7, #0x1
cmp r7, r6
bcs differentstatusfinish
add r4, #0x58
b differentstatusloop

inflictpoison:
mul r6, r7
add r1, r4, r6
add r1, #0x20
ldrb r6, [r1]
cmp r6, #0x11
beq differentstatusend
ldrb r6, [r1, #0x1]
cmp r6, #0x3
beq differentstatusend
cmp r6, #0x8
beq differentstatusend
ldrb r6, [r1, #0x2]
cmp r6, #0x3
beq differentstatusend
cmp r6, #0x8
beq differentstatusend
b differentstatusfinish

differentstatusend:
mov r0, #0x0

differentstatusfinish:
cmp r0, #0x0
beq differentstatuspop
add r0, #0x40
ldr r1, effectbyte
strb r0, [r1, #0x3]

differentstatuspop:
pop {r4-r7, pc}

.align 2

battledatatwo: .word 0x02023BE4
pokeinbattle: .word 0x02023BCC
attackerfifteen: .word 0x02023D6B
effectbyte: .word 0x02023E82

.org critical2
yescritical:
lsl r0, r0, #0x0
ldrb r1, [r0, #0x1]

.org critical3
critconfirmed:
ldr r1, critmarker
mov r0, #0x2
b critend

.align 2

critmarker: .word 0x02023D71

freezeprevent:
ldr r4, battledatafour
mov r6, #0x58
ldr r7, attackersixteen
ldrb r7, [r7]
mul r7, r6
add r4, r4, r7
add r4, #0x20
ldrb r0, [r4]
cmp r0, #0x7
bne differentstatusend
ldrb r0, [r4, #0x1]
cmp r0, #0x3
bne steelcheck
b checktypeend

steelcheck:
cmp r0, #0x8
bne checktypetwo
b checktypeend

checktypetwo:
ldrb r0, [r4, #0x2]
cmp r0, #0x3
bne steelchecktwo
b checktypeend

steelchecktwo:
cmp r0, #0x8
bne differentstatusend

checktypeend:
mov r0, #0x41
b differentstatusfinish

.align 2

battledatafour: .word 0x02023BE4
attackersixteen: .word 0x02023D6B

.org critical4
nocritical:
lsl r0, r0, #0x0
lsl r0, r0, #0x0

critend:
lsl r0, r0, #0x0

.org damage
roll:
ldr r0, defender
ldrb r0, [r0]
mov r1, #0x1
and r0, r1
cmp r0, #0x0
beq foe
mov r1, #0x55
b next

foe:
lsl r0, r0, #0x0
mov r1, #0x64

next:
lsl r0, r0, #0x0

.org word
.align 2

defender: .word 0x02023D6C

.org focusband
focusbands:
mov r1, #0x1
and r0, r1
cmp r0, #0x0
beq focusbandnext
b focusbandactivate
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0

focusbandactivate:
lsl r0, r0, #0x0

.org focusband2
focusbandnext:
lsl r0, r0, #0x0

.org damagecmd8
dmgcmd8:
ldr r0, defender42
ldrb r0, [r0]
mov r1, #0x1
and r0, r1
mov r1, #0x55
cmp r0, #0x0
bne foe42
mov r1, #0x64
b foe42
lsl r0, r0, #0x0

foe42:
lsl r0, r0, #0x0

.org word2
.align 2

defender42: .word 0x02023D6C

.org sleepturns
sturns:
ldr r2, sleepwordone
ldr r1, sleepwordtwo
ldrb r0, [r1]
mov r1, #0x58
mul r1, r0
add r2, #0x4C
add r3, r1, r2
mov r1, #0x1
and r0, r1
cmp r0, #0x1
beq sleepingnext
mov r1, #0x4

sleepingnext:
add r1, #0x1
str r1, [r3]
b sleepingfinal

.org sleepwords

.align 2

sleepwordone: .word 0x02023BE4
sleepwordtwo: .word 0x02023D6E

.org sleepfinal
sleepingfinal:
lsl r0, r0, #0x0

.org confusionturns
cturns:
mov r3, r9
ldrb r0, [r3]
add r2, r0, #0x0
mul r2, r5
add r2, r2, r4
mov r1, #0x1
and r0, r1
cmp r0, #0x1
beq confunext
mov r1, #0x4
b confunext
lsl r0, r0, #0x0

confunext:
add r1, #0x1
ldr r0, [r2]
orr r0, r1
str r0, [r2]

.org bindturns
bindturn:
ldrb r2, [r3]
add r0, r2, #0x0
mul r2, r6
add r2, r2, r4
mov r1, #0x1
and r0, r1
mov r1, #0x3
mul r1, r0
neg r1, r1
add r1, #0x6
lsl r1, r1, #0xD
ldr r0, [r2]
orr r0, r1
str r0, [r2]

.org thrashturns
thrashturn:
mov r3, r9
ldrb r2, [r3]
mul r2, r5
add r2, r2, r4
sub r0, r3, #0x3
ldrb r0, [r0]
mov r1, #0x1
and r1, r0
mov r0, #0x2
add r1, r1, r0
lsl r1, r1, #0xA
ldr r0, [r2]
orr r0, r1
str r0, [r2]

.org scndeffects
scnd:
ldr r0, attack
b anotherscnd

.align 2

attack: .word 0x02023D6C

anotherscnd:
ldrb r0, [r0]
mov r1, #0x1
and r0, r1
cmp r4, #0x64
bcs yesscnd
cmp r0, #0x1
beq noscnd

yesscnd:
lsl r0, r0, #0x0

.org twooneoneea
noscnd:
lsl r0, r0, #0x0

.org protect
detect:
mov r0, #0x1
and r1, r0
cmp r1, #0x1
beq protectnext
cmp r4, #0x1
bcs protectfail
cmp r6, #0x0
beq protectfail
b protectnext
lsl r0, r0, #0x0
lsl r0, r0, #0x0

protectnext:
lsl r0, r0, #0x0

.org protect2
protectfail:
lsl r0, r0, #0x0

.org multihits
multihit:
ldr r0, attackfive
ldrb r0, [r0]
mov r1, #0x1
and r0, r1
cmp r0, #0x1
beq multinext
mov r0, #0x4

multinext:
add r0, #0x1
b multihitnext

.align 2

attackfive: .word 0x02023D6C

multihitnext:
lsl r0, r0, #0x0

.org metronome
metronomes:
bl metronomesplash

.org psywave
psywaves:
ldr r0, attackseven
ldrb r0, [r0]
mov r1, #0x1
and r0, r1
bl psywavefunc
b psywavedone

.align 2

attackseven: .word 0x02023D6C

psywavenext:
lsl r0, r0, #0x0

psywavedone:
lsl r0, r0, #0x0

.org disable
disables:
ldrb r2, [r6]
mov r0, #0x1
and r0, r2
neg r0, r0
mov r3, #0x2
bic r0, r3
mov r1, #0x1C
mul r1, r2
add r1, r8
add r2, r0, #0x5

.org encore
encores:
ldrb r3, [r4]
mov r1, #0x1C
mul r1, r3
add r1, r9
mov r2, #0x1
and r3, r2
mov r2, #0x3
mul r2, r3
neg r2, r2
add r2, #0x6

.org spite2
mul r0, r3
lsl r3, r3, #0x0

.org spite
spites:
ldrb r0, [r4]
mov r6, #0x1
and r6, r0
neg r6, r6
mov r1, #0x2
bic r6, r1
add r6, r6, #0x5

.org present
presents:
ldr r0, attacksix
ldrb r0, [r0]
mov r4, #0x1
and r0, r4
cmp r0, #0x0
beq presentnext
mov r4, #0xF0
b presentnext
lsl r0, r0, #0x0

.align 2

attacksix: .word 0x02023D6C

.org taedf
presentnext:
lsl r0, r0, #0x0

.org magnitude
magnitudes:
ldr r0, attackeight
ldrb r0, [r0]
mov r3, #0x1
and r3, r0
mov r0, #0x63
mul r3, r0
b magnitudenext

.align 2

attackeight: .word 0x02023D6B

magnitudenext:
lsl r0, r0, #0x0

.org pickup
pickups:
b nopickup

.org pickup2
nopickup:
lsl r0, r0, #0x0

.org ball
aCalc:
cmp r6, #0xFE
bls ballnext
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
b ballanother

ballnext:
lsr r6, r6, #0x1
b bCalc

.org ball2
bCalc:
lsl r0, r0, #0x0

.org ball3
ballanother:
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
ldr r2, ballword

.org ball4
.align 2

ballword: .word 0x00000000

.org shiny
noshinies:
bl rng
mov r4, r0
bl rng
bl noshiny
b absoluteshiny
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0

absoluteshiny:
lsl r0, r0, #0x0

.org iv
ivs:
mov r0, #0x0
b ivnext
lsl r0, r0, #0x0
lsl r0, r0, #0x0

ivnext:
lsl r0, r0, #0x0

.org iv2
ivstwo:
mov r0, #0x0
b ivnexttwo
lsl r0, r0, #0x0
lsl r0, r0, #0x0

ivnexttwo:
lsl r0, r0, #0x0

.org random
rng:
lsl r0, r0, #0x0

.org egg
daycare:
pop {r4}
pop {r0}
bx r0

.org egg2
daycares:
pop {r4}
pop {r0}
bx r0

.org cleanse
tag:
mov r0, #0x0
b cleansenext
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0

cleansenext:
lsl r0, r0, #0x0

.org encounter
encounters:
ldr r0, encountermod
mov r1, #0x0
strb r1, [r0, #0x9]
b encounternext
lsl r0, r0, #0x0

.align 2

encountermod: .word 0x020386D0

encounteranother:
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0
lsl r0, r0, #0x0

encounternext:
lsl r0, r0, #0x0

.org gamecorner
gamecorners:
mov r5, #0x0
b gamecornernext
lsl r0, r0, #0x0
lsl r0, r0, #0x0

gamecornernext:
lsl r0, r0, #0x0
lsl r0, r0, #0x0
b gamecornerfinish

.org gamecorner2
gamecornerfinish:
lsl r0, r0, #0x0

.org triattack
triattack:
.byte 0x83
.byte 0x28
.byte 0x00
.byte 0x69
.byte 0x1D
.byte 0x08

.org uproarbugfix
uproarbugfix:
.byte 0x69
.byte 0x1D
.byte 0x08
.byte 0x03
.byte 0x28
.byte 0x30
.byte 0x69
.byte 0x1D
.byte 0x08

.org ptredit @@ Tri Attack command replaces battle script cmd83 (nop3)

.align 2

.word 0x0801D569
