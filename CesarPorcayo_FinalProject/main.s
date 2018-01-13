	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToControls
	.type	goToControls, %function
goToControls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r4, #67108864
	mov	r3, #0
	strh	r3, [r4, #22]	@ movhi
	ldr	r0, .L2
	strh	r3, [r4, #20]	@ movhi
	ldr	r3, .L2+4
	mov	lr, pc
	bx	r3
	mov	ip, #7936	@ movhi
	mov	r0, #3
	ldr	r1, .L2+8
	mov	r2, #100663296
	mov	r3, #2048
	ldr	r5, .L2+12
	strh	ip, [r4, #10]	@ movhi
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L2+16
	mov	lr, pc
	bx	r5
	ldr	r3, .L2+20
	mov	r2, #6
	str	r2, [r3, #0]
	mov	r3, #512	@ movhi
	strh	r3, [r4, #0]	@ movhi
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	controlsBackgroundPal
	.word	loadPalette
	.word	controlsBackgroundTiles
	.word	DMANow
	.word	controlsBackgroundMap
	.word	state
	.size	goToControls, .-goToControls
	.align	2
	.global	goToInstructions
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r4, #67108864
	mov	r3, #0
	strh	r3, [r4, #22]	@ movhi
	ldr	r0, .L5
	strh	r3, [r4, #20]	@ movhi
	ldr	r3, .L5+4
	mov	lr, pc
	bx	r3
	mov	ip, #7936	@ movhi
	ldr	r5, .L5+8
	mov	r0, #3
	ldr	r1, .L5+12
	mov	r2, #100663296
	mov	r3, #2416
	strh	ip, [r4, #10]	@ movhi
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L5+16
	mov	lr, pc
	bx	r5
	ldr	r3, .L5+20
	mov	r2, #5
	str	r2, [r3, #0]
	mov	r3, #512	@ movhi
	strh	r3, [r4, #0]	@ movhi
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	instructionsBackgroundPal
	.word	loadPalette
	.word	DMANow
	.word	instructionsBackgroundTiles
	.word	instructionsBackgroundMap
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToStart
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L8
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r4, #0
	mov	r5, #1
	mov	r8, #67108864
	strh	r4, [r8, #22]	@ movhi
	ldr	r0, .L8+4
	str	r5, [r3, #0]
	ldr	r3, .L8+8
	strh	r4, [r8, #20]	@ movhi
	mov	lr, pc
	bx	r3
	mov	ip, #7680
	add	ip, ip, r5
	mov	r2, #100663296
	strh	ip, [r8, #10]	@ movhi
	ldr	r6, .L8+12
	mov	r7, r2
	mov	r0, #3
	ldr	r1, .L8+16
	mov	r3, #1424
	mov	lr, pc
	bx	r6
	mov	r0, #3
	ldr	r1, .L8+20
	add	r2, r7, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r6
	mov	r0, #3
	ldr	r1, .L8+24
	add	r2, r7, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r6
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L8+28
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r6
	mov	r1, #651264
	add	r1, r1, #2656
	mov	r2, #11008
	ldr	r0, .L8+32
	add	r1, r1, #5
	add	r2, r2, #17
	mov	r3, r5
	ldr	ip, .L8+36
	mov	lr, pc
	bx	ip
	ldr	r3, .L8+40
	mov	lr, pc
	bx	r3
	ldr	r0, .L8+44
	ldr	r3, .L8+48
	str	r4, [r0, #0]
	mov	r0, #8
	str	r0, [r3, #24]
	mov	r0, #16
	str	r0, [r3, #28]
	mov	r0, #35
	str	r0, [r3, #0]
	mov	r0, #200
	str	r0, [r3, #4]
	mov	r0, #3
	ldr	r2, .L8+52
	str	r0, [r3, #48]
	mov	r0, #2
	str	r5, [r3, #16]
	str	r5, [r3, #20]
	str	r4, [r3, #32]
	str	r4, [r3, #44]
	str	r0, [r3, #36]
	mov	r3, #40
	str	r3, [r2, #0]
	mov	r3, #102
	str	r3, [r2, #4]
	mov	r3, #4
	str	r3, [r2, #48]
	ldr	r3, .L8+56
	mov	r1, #32
	str	r4, [r3, #0]
	mov	r3, #4608	@ movhi
	str	r1, [r2, #24]
	str	r1, [r2, #28]
	str	r4, [r2, #32]
	str	r4, [r2, #44]
	strh	r3, [r8, #0]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	level
	.word	titlePal
	.word	loadPalette
	.word	DMANow
	.word	titleTiles
	.word	titleMap
	.word	spriteSheetTiles
	.word	spriteSheetPal
	.word	titleSound
	.word	playSoundA
	.word	hideSprites
	.word	state
	.word	player
	.word	portal
	.word	seed
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r3, #67108864
	mov	r1, #256	@ movhi
	add	r2, r3, #256
	ldrh	r2, [r2, #48]
	strh	r1, [r3, #0]	@ movhi
	ldr	r3, .L11
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, .L11+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L11+8
	mov	lr, pc
	bx	r3
	bl	goToStart
	ldr	r3, .L11+12
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	buttons
	.word	setupSounds
	.word	setupInterrupts
	.word	level
	.size	initialize, .-initialize
	.global	__aeabi_idivmod
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r5, .L22
	ldr	r6, .L22+4
	ldr	r3, [r5, #32]
	smull	r2, r6, r3, r6
	ldr	r4, .L22+8
	mov	r1, r3, asr #31
	ldr	r2, [r4, #0]
	rsb	r6, r1, r6, asr #3
	add	r6, r6, r6, asl #2
	add	r2, r2, #1
	subs	r6, r3, r6, asl #2
	str	r2, [r4, #0]
	bne	.L14
	ldr	r0, [r5, #44]
	ldr	r3, .L22+12
	add	r0, r0, #1
	ldr	r1, [r5, #48]
	mov	lr, pc
	bx	r3
	ldr	r3, [r5, #4]
	cmp	r3, #114
	subgt	r3, r3, #1
	str	r1, [r5, #44]
	strgt	r3, [r5, #4]
	ble	.L20
.L14:
	ldr	r7, .L22+16
	ldr	r3, .L22+4
	ldr	r6, [r7, #32]
	smull	r2, r3, r6, r3
	mov	r2, r6, asr #31
	rsb	r3, r2, r3, asr #3
	add	r3, r3, r3, asl #2
	cmp	r6, r3, asl #2
	bne	.L16
	add	r0, r7, #44
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	ldr	r3, .L22+12
	mov	lr, pc
	bx	r3
	str	r1, [r7, #44]
.L16:
	add	r6, r6, #1
	ldr	r3, .L22+20
	str	r6, [r7, #32]
	mov	lr, pc
	bx	r3
	ldr	r3, [r5, #0]
	cmp	r3, #50
	ldr	r3, .L22
	ldrle	r2, [r3, #32]
	addle	r2, r2, #1
	strle	r2, [r3, #32]
	ldr	r3, .L22+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+32
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L22+36
	mov	r2, #117440512
	ldr	ip, .L22+40
	mov	lr, pc
	bx	ip
	ldr	r3, .L22+44
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L13
	ldr	r3, .L22+48
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L21
.L13:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L20:
	ldr	r3, [r5, #0]
	cmp	r3, #50
	addle	r3, r3, #1
	str	r6, [r5, #36]
	strle	r3, [r5, #0]
	b	.L14
.L21:
	ldr	r3, .L22+52
	ldr	r0, [r4, #0]
	mov	lr, pc
	bx	r3
	bl	goToInstructions
	b	.L13
.L23:
	.align	2
.L22:
	.word	player
	.word	1717986919
	.word	seed
	.word	__aeabi_idivmod
	.word	portal
	.word	hideSprites
	.word	drawPlayer
	.word	drawPortal
	.word	waitForVBlank
	.word	shadowOAM
	.word	DMANow
	.word	oldButtons
	.word	buttons
	.word	srand
	.size	start, .-start
	.align	2
	.global	goToLevel1
	.type	goToLevel1, %function
goToLevel1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L25
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldrh	r1, [r3, #0]
	ldr	r3, .L25+4
	mov	r4, #67108864
	ldrh	r2, [r3, #0]
	strh	r1, [r4, #26]	@ movhi
	ldr	r1, .L25+8
	mov	r9, #1
	str	r9, [r1, #0]
	mov	r3, #0
	strh	r2, [r4, #24]	@ movhi
	mov	r2, #6	@ movhi
	strh	r2, [r4, #22]	@ movhi
	ldr	r0, .L25+12
	strh	r3, [r4, #20]	@ movhi
	strh	r3, [r4, #18]	@ movhi
	strh	r3, [r4, #16]	@ movhi
	ldr	r3, .L25+16
	mov	lr, pc
	bx	r3
	mov	r7, #7424
	mov	ip, #7936
	mov	sl, #6912
	mov	lr, #5696
	mov	r8, #524
	add	ip, ip, r9
	add	lr, lr, r9
	mov	r6, #100663296
	mov	r3, #15424
	add	r7, r7, #4
	add	sl, sl, #8
	add	r8, r8, #2
	strh	lr, [r4, #80]	@ movhi
	ldr	r5, .L25+20
	strh	r7, [r4, #10]	@ movhi
	mov	r0, #3
	strh	ip, [r4, #12]	@ movhi
	ldr	r1, .L25+24
	mov	r2, r6
	add	r3, r3, #16
	strh	r8, [r4, #82]	@ movhi
	strh	sl, [r4, #8]	@ movhi
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L25+28
	add	r2, r6, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L25+32
	add	r2, r6, #16384
	mov	r3, #320
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L25+36
	add	r2, r6, #59392
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	mov	r3, #9792
	mov	r0, #3
	ldr	r1, .L25+40
	add	r2, r6, #32768
	add	r3, r3, #32
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L25+44
	add	r2, r6, #55296
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L25+48
	add	r2, r6, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r5
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L25+52
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r5
	ldr	r3, .L25+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+60
	str	r9, [r3, #0]
	mov	r3, #5888	@ movhi
	strh	r3, [r4, #0]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	vOff
	.word	hOff
	.word	level
	.word	level1BackgroundPal
	.word	loadPalette
	.word	DMANow
	.word	level1BackgroundTiles
	.word	level1BackgroundMap
	.word	level1DashTiles
	.word	level1DashMap
	.word	cloudsBackgroundTiles
	.word	cloudsBackgroundMap
	.word	spriteSheetTiles
	.word	spriteSheetPal
	.word	hideSprites
	.word	state
	.size	goToLevel1, .-goToLevel1
	.align	2
	.global	instructions
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L32
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L32+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L28
	ldr	r2, .L32+8
	ldrh	r4, [r2, #0]
	ands	r4, r4, #8
	beq	.L30
.L28:
	tst	r3, #2
	beq	.L27
	ldr	r3, .L32+8
	ldrh	r3, [r3, #0]
	tst	r3, #2
	beq	.L31
.L27:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L31:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L30:
	ldr	r3, .L32+12
	mov	lr, pc
	bx	r3
	mov	r1, #2064384
	add	r1, r1, #4992
	mov	r2, #11008
	mov	r3, r4
	ldr	r0, .L32+16
	add	r1, r1, #36
	add	r2, r2, #17
	ldr	ip, .L32+20
	mov	lr, pc
	bx	ip
	mov	r1, #15296
	mov	r2, #11008
	ldr	r0, .L32+24
	add	r1, r1, #22
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L32+28
	mov	lr, pc
	bx	ip
	bl	goToLevel1
	ldr	r3, .L32+32
	mov	r2, #10
	str	r2, [r3, #0]
	ldr	r3, .L32+36
	str	r4, [r3, #0]
	ldr	r3, .L32+40
	mov	lr, pc
	bx	r3
	b	.L27
.L33:
	.align	2
.L32:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	level1Sound
	.word	playSoundA
	.word	portalSound
	.word	playSoundB
	.word	vOff
	.word	hOff
	.word	initGame
	.size	instructions, .-instructions
	.align	2
	.global	goToLevel2
	.type	goToLevel2, %function
goToLevel2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	ldr	r3, .L35
	ldrh	r1, [r3, #0]
	ldr	r3, .L35+4
	mov	r4, #67108864
	ldrh	r2, [r3, #0]
	strh	r1, [r4, #26]	@ movhi
	ldr	r1, .L35+8
	mov	ip, #2
	str	ip, [r1, #0]
	mov	r3, #0
	strh	r2, [r4, #24]	@ movhi
	mov	r2, #6	@ movhi
	strh	r2, [r4, #22]	@ movhi
	strh	r3, [r4, #20]	@ movhi
	strh	r3, [r4, #18]	@ movhi
	mov	r3, #90	@ movhi
	ldr	r0, .L35+12
	strh	r3, [r4, #16]	@ movhi
	ldr	r3, .L35+16
	mov	lr, pc
	bx	r3
	mov	r7, #7936
	mov	ip, #7424
	mov	sl, #6912
	mov	lr, #5696
	mov	r8, #3072
	add	ip, ip, #4
	add	lr, lr, #1
	mov	r6, #100663296
	mov	r3, #15232
	add	r7, r7, #1
	add	sl, sl, #8
	add	r8, r8, #4
	strh	lr, [r4, #80]	@ movhi
	ldr	r5, .L35+20
	strh	r7, [r4, #12]	@ movhi
	mov	r0, #3
	strh	ip, [r4, #10]	@ movhi
	ldr	r1, .L35+24
	mov	r2, r6
	add	r3, r3, #32
	strh	r8, [r4, #82]	@ movhi
	strh	sl, [r4, #8]	@ movhi
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L35+28
	add	r2, r6, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L35+32
	add	r2, r6, #16384
	mov	r3, #288
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L35+36
	add	r2, r6, #59392
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	mov	r3, #9792
	mov	r0, #3
	ldr	r1, .L35+40
	add	r2, r6, #32768
	add	r3, r3, #32
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L35+44
	add	r2, r6, #55296
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L35+48
	add	r2, r6, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r5
	mov	r2, #83886080
	add	r2, r2, #512
	mov	r0, #3
	ldr	r1, .L35+52
	mov	r3, #256
	mov	lr, pc
	bx	r5
	ldr	r3, .L35+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L35+60
	mov	r2, #1
	str	r2, [r3, #0]
	mov	r2, #5888	@ movhi
	strh	r2, [r4, #0]	@ movhi
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	vOff
	.word	hOff
	.word	level
	.word	level2BackgroundPal
	.word	loadPalette
	.word	DMANow
	.word	level2BackgroundTiles
	.word	level2BackgroundMap
	.word	level2DashTiles
	.word	level2DashMap
	.word	cloudsBackgroundTiles
	.word	cloudsBackgroundMap
	.word	spriteSheetTiles
	.word	spriteSheetPal
	.word	hideSprites
	.word	state
	.size	goToLevel2, .-goToLevel2
	.align	2
	.global	goToLevel3
	.type	goToLevel3, %function
goToLevel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, .L38
	ldrh	r1, [r3, #0]
	ldr	r3, .L38+4
	ldrh	r2, [r3, #0]
	mov	r4, #67108864
	strh	r1, [r4, #26]	@ movhi
	strh	r2, [r4, #24]	@ movhi
	ldr	r2, .L38+8
	mov	r5, #3
	str	r5, [r2, #0]
	mov	r3, #0
	mov	r2, #6	@ movhi
	strh	r2, [r4, #22]	@ movhi
	strh	r3, [r4, #20]	@ movhi
	strh	r3, [r4, #18]	@ movhi
	mov	r3, #150	@ movhi
	ldr	r0, .L38+12
	strh	r3, [r4, #16]	@ movhi
	ldr	r3, .L38+16
	mov	lr, pc
	bx	r3
	mov	r8, #1024
	mov	lr, #7936
	mov	r9, #7424
	mov	fp, #6912
	mov	sl, #5696
	add	lr, lr, #1
	add	ip, r8, #12
	mov	r7, #100663296
	mov	r3, #9728
	add	r9, r9, #4
	add	fp, fp, #8
	add	sl, sl, #1
	strh	lr, [r4, #12]	@ movhi
	strh	ip, [r4, #82]	@ movhi
	ldr	r6, .L38+20
	mov	r0, r5
	ldr	r1, .L38+24
	mov	r2, r7
	add	r3, r3, #16
	strh	r9, [r4, #10]	@ movhi
	strh	sl, [r4, #80]	@ movhi
	strh	fp, [r4, #8]	@ movhi
	mov	lr, pc
	bx	r6
	ldr	r1, .L38+28
	add	r2, r7, #63488
	mov	r3, r8
	mov	r0, r5
	mov	lr, pc
	bx	r6
	mov	r0, r5
	ldr	r1, .L38+32
	add	r2, r7, #16384
	mov	r3, #304
	mov	lr, pc
	bx	r6
	mov	r0, r5
	ldr	r1, .L38+36
	add	r2, r7, #59392
	mov	r3, r8
	mov	lr, pc
	bx	r6
	mov	r3, #9792
	mov	r0, r5
	ldr	r1, .L38+40
	add	r2, r7, #32768
	add	r3, r3, #32
	mov	lr, pc
	bx	r6
	mov	r0, r5
	ldr	r1, .L38+44
	add	r2, r7, #55296
	mov	r3, r8
	mov	lr, pc
	bx	r6
	mov	r0, r5
	ldr	r1, .L38+48
	add	r2, r7, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r6
	mov	r2, #83886080
	add	r2, r2, #512
	mov	r0, r5
	ldr	r1, .L38+52
	mov	r3, #256
	mov	lr, pc
	bx	r6
	ldr	r3, .L38+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+60
	mov	r2, #1
	str	r2, [r3, #0]
	mov	r2, #5888	@ movhi
	strh	r2, [r4, #0]	@ movhi
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	vOff
	.word	hOff
	.word	level
	.word	level3BackgroundPal
	.word	loadPalette
	.word	DMANow
	.word	level3BackgroundTiles
	.word	level3BackgroundMap
	.word	level3DashTiles
	.word	level3DashMap
	.word	cloudsBackgroundTiles
	.word	cloudsBackgroundMap
	.word	spriteSheetTiles
	.word	spriteSheetPal
	.word	hideSprites
	.word	state
	.size	goToLevel3, .-goToLevel3
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r4, #0
	mov	r6, #67108864
	ldr	r0, .L41
	ldr	r3, .L41+4
	strh	r4, [r6, #22]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r7, #100663296
	mov	ip, #7936	@ movhi
	ldr	r5, .L41+8
	strh	ip, [r6, #10]	@ movhi
	mov	r0, #3
	ldr	r1, .L41+12
	mov	r2, r7
	mov	r3, #1184
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L41+16
	add	r2, r7, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	ldr	ip, .L41+20
	mov	r8, #4
	str	r8, [ip, #0]
	mov	r0, #3
	ldr	r1, .L41+24
	add	r2, r7, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r5
	mov	r2, #83886080
	ldr	r1, .L41+28
	add	r2, r2, #512
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r5
	ldr	r3, .L41+32
	mov	lr, pc
	bx	r3
	ldr	r2, .L41+36
	ldr	r3, .L41+40
	mov	r1, #2
	str	r1, [r2, #0]
	mov	r2, #8
	str	r2, [r3, #24]
	mov	r2, #16
	str	r2, [r3, #28]
	mov	r2, #40
	str	r2, [r3, #0]
	mov	r2, #90
	str	r2, [r3, #4]
	str	r4, [r3, #32]
	str	r4, [r3, #44]
	str	r8, [r3, #48]
	ldr	r3, .L41+44
	str	r4, [r3, #0]
	mov	r3, #4608	@ movhi
	strh	r3, [r6, #0]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	pausePal
	.word	loadPalette
	.word	DMANow
	.word	pauseTiles
	.word	pauseMap
	.word	level
	.word	spriteSheetTiles
	.word	spriteSheetPal
	.word	hideSprites
	.word	state
	.word	crystal
	.word	pauseSelect
	.size	goToPause, .-goToPause
	.align	2
	.global	controls
	.type	controls, %function
controls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L46
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+4
	ldrh	r3, [r3, #0]
	tst	r3, #2
	beq	.L43
	ldr	r3, .L46+8
	ldrh	r3, [r3, #0]
	tst	r3, #2
	beq	.L45
.L43:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L45:
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L47:
	.align	2
.L46:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	controls, .-controls
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L72
	mov	lr, pc
	bx	r4
	ldr	r2, .L72+4
	ldr	r3, [r2, #0]
	cmp	r3, #0
	bne	.L49
	ldr	r3, .L72+8
	ldrh	r1, [r3, #0]
	tst	r1, #128
	bne	.L68
.L50:
	ldrh	r1, [r3, #0]
.L54:
	tst	r1, #1
	beq	.L57
	ldr	r3, .L72+12
	ldrh	r3, [r3, #0]
	tst	r3, #1
	bne	.L57
	ldr	r3, .L72+16
	ldr	r3, [r3, #0]
	ldr	r2, .L72+20
	cmp	r3, #2
	str	r3, [r2, #0]
	beq	.L59
	cmp	r3, #3
	beq	.L60
	cmp	r3, #1
	beq	.L69
.L57:
	ldr	r3, .L72+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+28
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L72+32
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L72+36
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	bx	lr
.L49:
	cmp	r3, #1
	beq	.L70
	cmp	r3, #2
	bne	.L55
	ldr	r3, .L72+8
	ldrh	r1, [r3, #0]
	tst	r1, #64
	beq	.L62
	ldr	r1, .L72+12
	ldrh	r1, [r1, #0]
	tst	r1, #64
	bne	.L62
	mov	r1, #1
	str	r1, [r2, #0]
.L61:
	ldrh	r3, [r3, #0]
	tst	r3, #1
	beq	.L57
.L71:
	ldr	r3, .L72+12
	ldrh	r3, [r3, #0]
	tst	r3, #1
	bne	.L57
	bl	goToControls
	b	.L57
.L68:
	ldr	r1, .L72+12
	ldrh	r1, [r1, #0]
	tst	r1, #128
	bne	.L50
	mov	r1, #1
	str	r1, [r2, #0]
	b	.L61
.L70:
	ldr	r3, .L72+8
	ldrh	r1, [r3, #0]
	tst	r1, #128
	beq	.L53
	ldr	r0, .L72+12
	ldrh	r0, [r0, #0]
	tst	r0, #128
	moveq	r1, #2
	streq	r1, [r2, #0]
	beq	.L62
.L53:
	tst	r1, #64
	beq	.L61
	ldr	r0, .L72+12
	ldrh	r0, [r0, #0]
	ands	r0, r0, #64
	streq	r0, [r2, #0]
	beq	.L54
	b	.L61
.L56:
	cmp	r3, #2
	bne	.L57
	ldr	r3, .L72+8
.L62:
	ldrh	r3, [r3, #0]
	tst	r3, #1
	beq	.L57
	ldr	r3, .L72+12
	ldrh	r3, [r3, #0]
	tst	r3, #1
	bne	.L57
	bl	goToStart
	b	.L57
.L55:
	cmp	r3, #1
	bne	.L56
	ldr	r3, .L72+8
	ldrh	r3, [r3, #0]
	tst	r3, #1
	beq	.L57
	b	.L71
.L69:
	ldr	r3, .L72+40
	mov	lr, pc
	bx	r3
	bl	goToLevel1
	b	.L57
.L60:
	ldr	r3, .L72+40
	mov	lr, pc
	bx	r3
	bl	goToLevel3
	b	.L57
.L59:
	ldr	r3, .L72+40
	mov	lr, pc
	bx	r3
	bl	goToLevel2
	b	.L57
.L73:
	.align	2
.L72:
	.word	waitForVBlank
	.word	pauseSelect
	.word	oldButtons
	.word	buttons
	.word	oldLevel
	.word	level
	.word	hideSprites
	.word	drawCrystal
	.word	shadowOAM
	.word	DMANow
	.word	unpauseSound
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r5, #67108864
	mov	r3, #512	@ movhi
	ldr	r0, .L75
	strh	r3, [r5, #0]	@ movhi
	ldr	r3, .L75+4
	mov	lr, pc
	bx	r3
	mov	ip, #7936	@ movhi
	ldr	r4, .L75+8
	mov	r0, #3
	ldr	r1, .L75+12
	mov	r2, #100663296
	mov	r3, #1952
	strh	ip, [r5, #10]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L75+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L75+20
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L76:
	.align	2
.L75:
	.word	winPal
	.word	loadPalette
	.word	DMANow
	.word	winTiles
	.word	winMap
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L80
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L80+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L77
	ldr	r3, .L80+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L79
.L77:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L79:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L81:
	.align	2
.L80:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L83
	mov	lr, pc
	bx	r3
	mov	r4, #67108864
	mov	r3, #0
	strh	r3, [r4, #22]	@ movhi
	strh	r3, [r4, #20]	@ movhi
	mov	r3, #512	@ movhi
	ldr	r0, .L83+4
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, .L83+8
	mov	lr, pc
	bx	r3
	mov	ip, #7936	@ movhi
	ldr	r5, .L83+12
	mov	r0, #3
	ldr	r1, .L83+16
	mov	r2, #100663296
	mov	r3, #1680
	strh	ip, [r4, #10]	@ movhi
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L83+20
	mov	lr, pc
	bx	r5
	ldr	r3, .L83+24
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L84:
	.align	2
.L83:
	.word	stopSound
	.word	losePal
	.word	loadPalette
	.word	DMANow
	.word	loseTiles
	.word	loseMap
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, .L97
	sub	sp, sp, #16
	mov	lr, pc
	bx	r3
	ldr	r3, .L97+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L97+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L86
	ldr	r3, .L97+12
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L95
.L86:
	ldr	r3, .L97+16
	ldr	r2, [r3, #20]
	ldr	r3, [r3, #28]
	cmp	r2, r3
	ldrge	r4, .L97+20
	bge	.L87
	ldr	r4, .L97+20
	ldr	r3, [r4, #0]
	cmp	r3, #0
	beq	.L96
.L88:
	ldr	r4, .L97+24
	add	r5, r4, #24
	ldmia	r5, {r5, r6}	@ phole ldm
	ldr	ip, [r4, #8]
	ldr	r4, [r4, #12]
	ldr	r3, .L97+28
	add	r6, r6, r6, lsr #31
	add	r5, r5, r5, lsr #31
	add	lr, ip, r6, asr #1
	add	ip, r4, r5, asr #1
	mov	r4, #1
	add	r0, r3, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	ldr	r2, [r3, #28]
	ldr	r3, [r3, #24]
	str	ip, [sp, #4]
	str	lr, [sp, #0]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	ldr	ip, .L97+32
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L89
	ldr	r3, .L97+36
	ldr	r5, [r3, #0]
	cmp	r5, #2
	beq	.L91
	cmp	r5, #3
	beq	.L92
	cmp	r5, r4
	bne	.L89
	ldr	r3, .L97+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L97+44
	mov	r2, #90
	str	r2, [r3, #0]
	ldr	r3, .L97+48
	mov	r4, #0
	str	r4, [r3, #0]
	bl	goToLevel2
	mov	r1, #1163264
	add	r1, r1, #12416
	mov	r2, #11008
	mov	r3, r4
	ldr	r0, .L97+52
	add	r1, r1, #52
	add	r2, r2, #17
	ldr	ip, .L97+56
	mov	lr, pc
	bx	ip
	mov	r1, #15296
	mov	r2, #11008
	mov	r3, r5
	ldr	r0, .L97+60
	add	r1, r1, #22
	add	r2, r2, #17
	ldr	ip, .L97+64
	mov	lr, pc
	bx	ip
	ldr	r3, .L97+68
	mov	lr, pc
	bx	r3
	b	.L89
.L96:
	bl	goToLose
.L87:
	ldr	r3, [r4, #0]
	cmp	r3, #0
	bne	.L88
.L89:
	ldr	r3, .L97+72
	mov	lr, pc
	bx	r3
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L95:
	ldr	r3, .L97+76
	mov	lr, pc
	bx	r3
	ldr	r3, .L97+36
	ldr	r2, [r3, #0]
	ldr	r3, .L97+80
	str	r2, [r3, #0]
	bl	goToPause
	b	.L86
.L91:
	ldr	r3, .L97+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L97+44
	mov	r2, #10
	str	r2, [r3, #0]
	ldr	r3, .L97+48
	mov	r5, #0
	str	r5, [r3, #0]
	bl	goToLevel3
	mov	r1, #2064384
	add	r1, r1, #8640
	mov	r2, #11008
	mov	r3, r5
	ldr	r0, .L97+84
	add	r1, r1, #59
	add	r2, r2, #17
	ldr	ip, .L97+56
	mov	lr, pc
	bx	ip
	mov	r1, #15296
	mov	r2, #11008
	mov	r3, r4
	ldr	r0, .L97+60
	add	r1, r1, #22
	add	r2, r2, #17
	ldr	ip, .L97+64
	mov	lr, pc
	bx	ip
	ldr	r3, .L97+68
	mov	lr, pc
	bx	r3
	b	.L89
.L92:
	ldr	r3, .L97+40
	mov	lr, pc
	bx	r3
	bl	goToWin
	b	.L89
.L98:
	.align	2
.L97:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	soundA
	.word	crystalFound
	.word	portal
	.word	player
	.word	collision
	.word	level
	.word	stopSound
	.word	vOff
	.word	hOff
	.word	level2Sound
	.word	playSoundA
	.word	portalSound
	.word	playSoundB
	.word	initGame
	.word	waitForVBlank
	.word	pauseSound
	.word	oldLevel
	.word	level3Sound
	.size	game, .-game
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L102
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L102+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L99
	ldr	r3, .L102+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L101
.L99:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L101:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L103:
	.align	2
.L102:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bl	initialize
	mov	r5, #67108864
	ldr	r7, .L115
	ldr	r6, .L115+4
	ldr	r4, .L115+8
	add	r5, r5, #256
.L114:
	ldr	r3, [r7, #0]
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L105
.L113:
	.word	.L106
	.word	.L107
	.word	.L108
	.word	.L109
	.word	.L110
	.word	.L111
	.word	.L112
.L112:
	bl	controls
.L105:
	ldrh	r3, [r4, #0]
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	b	.L114
.L111:
	bl	instructions
	ldrh	r3, [r4, #0]
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	b	.L114
.L110:
	bl	lose
	ldrh	r3, [r4, #0]
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	b	.L114
.L109:
	bl	win
	ldrh	r3, [r4, #0]
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	b	.L114
.L108:
	bl	pause
	ldrh	r3, [r4, #0]
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	b	.L114
.L107:
	bl	game
	ldrh	r3, [r4, #0]
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	b	.L114
.L106:
	bl	start
	ldrh	r3, [r4, #0]
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	b	.L114
.L116:
	.align	2
.L115:
	.word	state
	.word	oldButtons
	.word	buttons
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	seed,4,4
	.comm	pauseSelect,4,4
	.comm	state,4,4
	.comm	oldLevel,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
