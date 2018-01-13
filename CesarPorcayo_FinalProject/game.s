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
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	ldr	r2, [r3, #0]
	ldr	r3, .L8+4
	mov	r0, #8
	mov	r1, #1
	str	r0, [r3, #24]
	cmp	r2, #2
	mov	r0, #16
	str	r0, [r3, #28]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	beq	.L4
	cmp	r2, #3
	moveq	r2, #125
	streq	r2, [r3, #8]
	streq	r2, [r3, #12]
	beq	.L2
	cmp	r2, r1
	beq	.L7
.L2:
	mov	r2, #0
	mov	r1, #3
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r1, [r3, #48]
	str	r2, [r3, #36]
	bx	lr
.L7:
	mov	r2, #50
	str	r2, [r3, #8]
	mov	r2, #115
	str	r2, [r3, #12]
	b	.L2
.L4:
	mov	r2, #230
	str	r2, [r3, #8]
	mov	r2, #20
	str	r2, [r3, #12]
	b	.L2
.L9:
	.align	2
.L8:
	.word	level
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	ldr	r2, [r3, #36]
	ldr	r1, [r3, #4]
	ldr	ip, [r3, #44]
	mov	r1, r1, asl #23
	add	ip, r2, ip, asl #5
	ldrb	r0, [r3, #0]	@ zero_extendqisi2
	ldr	r2, .L11+4
	mov	r1, r1, lsr #23
	mov	r3, ip, asl #1
	orr	r1, r1, #16384
	orr	r3, r3, #1024
	strh	r0, [r2, #0]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	bx	lr
.L12:
	.align	2
.L11:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.global	__aeabi_idivmod
	.align	2
	.global	animatePlayer
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L21
	ldr	r3, .L21+4
	ldr	r5, [r4, #32]
	smull	r2, r3, r5, r3
	mov	r2, r5, asr #31
	rsb	r3, r2, r3, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, asl #2
	cmp	r5, r3, asl #2
	mov	r3, #4
	str	r6, [r4, #40]
	str	r3, [r4, #36]
	bne	.L14
	add	r0, r4, #44
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	ldr	r3, .L21+8
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L14:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #3
	streq	r3, [r4, #36]
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #36]
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #32
	moveq	r3, #2
	streq	r3, [r4, #36]
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	moveq	r3, #1
	streq	r3, [r4, #36]
	beq	.L19
	ldr	r3, [r4, #36]
	cmp	r3, #4
	ldr	r3, .L21
	moveq	r2, #0
	streq	r2, [r3, #44]
	streq	r6, [r3, #36]
	beq	.L13
.L19:
	add	r5, r5, #1
	str	r5, [r4, #32]
.L13:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r8, .L173
	sub	sp, sp, #20
	ldr	r3, [r8, #0]
	cmp	r3, #2
	beq	.L26
	cmp	r3, #3
	beq	.L27
	cmp	r3, #1
	beq	.L25
	ldr	r4, .L173+4
	ldr	r6, .L173+8
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	ldr	r5, .L173+12
.L28:
	ldr	sl, .L173+16
	ldr	r7, [sl, #0]
	cmp	r7, #0
	beq	.L158
.L83:
	ldr	r2, [r6, #0]
	ldr	r3, [r5, #0]
	rsb	r0, r2, r0
	rsb	r1, r3, r1
	stmia	r4, {r0, r1}	@ phole stm
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	animatePlayer
.L25:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #64
	beq	.L159
	ldr	r4, .L173+4
	ldr	r6, .L173+8
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
.L30:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L34
	ldr	ip, [r4, #16]
	rsb	ip, ip, r0
	mov	r2, ip, asl #8
	ldr	r3, .L173+20
	add	r5, r2, r1
	mov	r5, r5, asl #1
	ldrh	r5, [r3, r5]
	cmp	r5, #0
	ldr	r5, .L173+4
	beq	.L34
	ldr	r7, [r5, #24]
	add	r2, r2, r7
	add	r2, r2, r1
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	bne	.L160
.L34:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L35
	ldr	ip, [r4, #28]
	ldr	r7, [r4, #16]
	add	r5, ip, r7
	sub	r5, r5, #1
	add	r5, r5, r0
	mov	r2, r5, asl #8
	ldr	r3, .L173+20
	add	sl, r2, r1
	mov	sl, sl, asl #1
	ldrh	sl, [r3, sl]
	cmp	sl, #0
	ldr	sl, .L173+4
	beq	.L35
	ldr	r9, [sl, #24]
	add	r2, r2, r9
	add	r2, r2, r1
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	bne	.L161
.L35:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L38
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
.L33:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L122
	ldr	r3, [r4, #20]
	rsb	r3, r3, r1
	ldr	r2, .L173+20
	add	ip, r3, r0, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	ldr	ip, .L173+4
	beq	.L122
	ldr	r5, [ip, #28]
	add	r5, r0, r5
	sub	r5, r5, #1
	add	r5, r3, r5, asl #8
	mov	r5, r5, asl #1
	ldrh	r2, [r2, r5]
	cmp	r2, #0
	bne	.L108
.L122:
	ldr	r5, .L173+12
.L39:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L42
	ldr	r3, [r4, #20]
	rsb	r3, r3, r1
	ldr	r2, .L173+20
	add	ip, r3, r0, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	ldr	ip, .L173+4
	beq	.L42
	ldr	r7, [ip, #28]
	add	r7, r0, r7
	sub	r7, r7, #1
	add	r7, r3, r7, asl #8
	mov	r7, r7, asl #1
	ldrh	r2, [r2, r7]
	cmp	r2, #0
	bne	.L162
.L42:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L43
	add	r7, r4, #20
	ldmia	r7, {r7, ip}	@ phole ldm
	add	r3, ip, r7
	sub	r3, r3, #1
	add	r3, r3, r1
	ldr	r2, .L173+20
	add	sl, r3, r0, asl #8
	mov	sl, sl, asl #1
	ldrh	sl, [r2, sl]
	cmp	sl, #0
	ldr	sl, .L173+4
	beq	.L43
	ldr	r9, [sl, #28]
	add	r9, r0, r9
	sub	r9, r9, #1
	add	r9, r3, r9, asl #8
	mov	r9, r9, asl #1
	ldrh	r2, [r2, r9]
	cmp	r2, #0
	bne	.L163
.L43:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L133
	ldr	ip, [r4, #20]
	ldr	r3, [r4, #24]
	add	r3, ip, r3
	sub	r3, r3, #1
	add	r3, r3, r1
	ldr	r2, .L173+20
	b	.L156
.L158:
	ldr	fp, .L173+24
	ldr	ip, [fp, #8]
	ldr	r9, [fp, #28]
	ldr	lr, [fp, #12]
	ldr	fp, [fp, #24]
	ldr	r2, [r4, #28]
	str	ip, [sp, #0]
	str	r9, [sp, #8]
	ldr	r3, [r4, #24]
	str	lr, [sp, #4]
	str	fp, [sp, #12]
	ldr	ip, .L173+28
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r9, .L173+4
	bne	.L84
	add	r0, r9, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	b	.L83
.L27:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #64
	beq	.L164
	ldr	r4, .L173+4
	ldr	r6, .L173+8
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
.L66:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L70
	ldr	ip, [r4, #16]
	rsb	ip, ip, r0
	mov	r2, ip, asl #8
	ldr	r3, .L173+32
	add	r5, r2, r1
	mov	r5, r5, asl #1
	ldrh	r5, [r3, r5]
	cmp	r5, #0
	ldr	r5, .L173+4
	beq	.L70
	ldr	r7, [r5, #24]
	add	r2, r2, r7
	add	r2, r2, r1
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	bne	.L165
.L70:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L71
	ldr	ip, [r4, #28]
	ldr	r7, [r4, #16]
	add	r5, ip, r7
	sub	r5, r5, #1
	add	r5, r5, r0
	mov	r2, r5, asl #8
	ldr	r3, .L173+32
	add	sl, r2, r1
	mov	sl, sl, asl #1
	ldrh	sl, [r3, sl]
	cmp	sl, #0
	ldr	sl, .L173+4
	beq	.L71
	ldr	r9, [sl, #24]
	add	r2, r2, r9
	add	r2, r2, r1
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	bne	.L166
.L71:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L74
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
.L69:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L130
	ldr	r3, [r4, #20]
	rsb	r3, r3, r1
	ldr	r2, .L173+32
	add	ip, r3, r0, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	ldr	ip, .L173+4
	beq	.L130
	ldr	r5, [ip, #28]
	add	r5, r0, r5
	sub	r5, r5, #1
	add	r5, r3, r5, asl #8
	mov	r5, r5, asl #1
	ldrh	r2, [r2, r5]
	cmp	r2, #0
	bne	.L118
.L130:
	ldr	r5, .L173+12
.L75:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L78
	ldr	r3, [r4, #20]
	rsb	r3, r3, r1
	ldr	r2, .L173+32
	add	ip, r3, r0, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	ldr	ip, .L173+4
	beq	.L78
	ldr	r7, [ip, #28]
	add	r7, r0, r7
	sub	r7, r7, #1
	add	r7, r3, r7, asl #8
	mov	r7, r7, asl #1
	ldrh	r2, [r2, r7]
	cmp	r2, #0
	bne	.L167
.L78:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L79
	add	r7, r4, #20
	ldmia	r7, {r7, ip}	@ phole ldm
	add	r3, ip, r7
	sub	r3, r3, #1
	add	r3, r3, r1
	ldr	r2, .L173+32
	add	sl, r3, r0, asl #8
	mov	sl, sl, asl #1
	ldrh	sl, [r2, sl]
	cmp	sl, #0
	ldr	sl, .L173+4
	beq	.L79
	ldr	r9, [sl, #28]
	add	r9, r0, r9
	sub	r9, r9, #1
	add	r9, r3, r9, asl #8
	mov	r9, r9, asl #1
	ldrh	r2, [r2, r9]
	cmp	r2, #0
	bne	.L168
.L79:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L133
	ldr	ip, [r4, #20]
	ldr	r3, [r4, #24]
	add	r3, ip, r3
	sub	r3, r3, #1
	ldr	r2, .L173+32
	add	r3, r3, r1
.L156:
	add	r7, r3, r0, asl #8
	mov	r7, r7, asl #1
	ldrh	r7, [r2, r7]
	cmp	r7, #0
	ldr	r7, .L173+4
	beq	.L28
	ldr	sl, [r7, #28]
	add	sl, r0, sl
	sub	sl, sl, #1
	add	sl, r3, sl, asl #8
	mov	sl, sl, asl #1
	ldrh	r2, [r2, sl]
	cmp	r2, #0
	beq	.L28
	ldr	r2, [r5, #0]
	cmp	r2, #15
	ble	.L28
	cmp	r3, #256
	addle	r1, r1, ip
	strle	r1, [r7, #12]
	b	.L28
.L26:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #64
	beq	.L169
	ldr	r4, .L173+4
	ldr	r6, .L173+8
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
.L48:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L52
	ldr	ip, [r4, #16]
	rsb	ip, ip, r0
	mov	r2, ip, asl #8
	ldr	r3, .L173+36
	add	r5, r2, r1
	mov	r5, r5, asl #1
	ldrh	r5, [r3, r5]
	cmp	r5, #0
	ldr	r5, .L173+4
	beq	.L52
	ldr	r7, [r5, #24]
	add	r2, r2, r7
	add	r2, r2, r1
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	bne	.L170
.L52:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L53
	ldr	ip, [r4, #28]
	ldr	r7, [r4, #16]
	add	r5, ip, r7
	sub	r5, r5, #1
	add	r5, r5, r0
	mov	r2, r5, asl #8
	ldr	r3, .L173+36
	add	sl, r2, r1
	mov	sl, sl, asl #1
	ldrh	sl, [r3, sl]
	cmp	sl, #0
	ldr	sl, .L173+4
	beq	.L53
	ldr	r9, [sl, #24]
	add	r2, r2, r9
	add	r2, r2, r1
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	bne	.L171
.L53:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L56
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
.L51:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L126
	ldr	r3, [r4, #20]
	rsb	r3, r3, r1
	ldr	r2, .L173+36
	add	ip, r3, r0, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	ldr	ip, .L173+4
	beq	.L126
	ldr	r5, [ip, #28]
	add	r5, r0, r5
	sub	r5, r5, #1
	add	r5, r3, r5, asl #8
	mov	r5, r5, asl #1
	ldrh	r2, [r2, r5]
	cmp	r2, #0
	bne	.L113
.L126:
	ldr	r5, .L173+12
.L57:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L60
	ldr	r3, [r4, #20]
	rsb	r3, r3, r1
	ldr	r2, .L173+36
	add	ip, r3, r0, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	ldr	ip, .L173+4
	beq	.L60
	ldr	r7, [ip, #28]
	add	r7, r0, r7
	sub	r7, r7, #1
	add	r7, r3, r7, asl #8
	mov	r7, r7, asl #1
	ldrh	r2, [r2, r7]
	cmp	r2, #0
	bne	.L172
.L60:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L61
	add	r7, r4, #20
	ldmia	r7, {r7, ip}	@ phole ldm
	add	r3, ip, r7
	sub	r3, r3, #1
	add	r3, r3, r1
	ldr	r2, .L173+36
	add	sl, r3, r0, asl #8
	mov	sl, sl, asl #1
	ldrh	sl, [r2, sl]
	cmp	sl, #0
	ldr	sl, .L173+4
	beq	.L61
	ldr	r9, [sl, #28]
	add	r9, r0, r9
	sub	r9, r9, #1
	add	r9, r3, r9, asl #8
	mov	r9, r9, asl #1
	ldrh	r2, [r2, r9]
	cmp	r2, #0
	beq	.L61
	ldr	r2, [r5, #0]
	cmp	r2, #15
	bgt	.L61
.L148:
	cmp	r3, #256
	ldr	r3, [r4, #4]
	add	ip, ip, ip, lsr #31
	addle	r1, r1, r7
	add	r3, r3, ip, asr #1
	strle	r1, [sl, #12]
	cmp	r3, #119
	ldr	r3, .L173+4
	ble	.L131
	add	r2, r2, #1
	str	r2, [r5, #0]
	ldr	r1, [r3, #12]
	b	.L28
.L169:
	ldr	r4, .L173+4
	add	r0, r4, #8
	ldmia	r0, {r0, r1, ip}	@ phole ldm
	rsb	ip, ip, r0
	ldr	r3, .L173+36
	add	r2, r1, ip, asl #8
	mov	r5, r2, asl #1
	ldrh	r5, [r3, r5]
	cmp	r5, #0
	beq	.L123
	ldr	r5, [r4, #24]
	add	r2, r2, r5
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L123
	ldr	r6, .L173+8
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ble	.L48
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #0]
	add	r2, r2, r2, lsr #31
	cmp	ip, #0
	add	r2, r0, r2, asr #1
	strge	ip, [r4, #8]
	cmp	r2, #80
	suble	r3, r3, #1
	ldr	r2, .L173+4
	strle	r3, [r6, #0]
.L124:
	ldr	r0, [r2, #8]
	b	.L51
.L164:
	ldr	r4, .L173+4
	add	r0, r4, #8
	ldmia	r0, {r0, r1, ip}	@ phole ldm
	rsb	ip, ip, r0
	ldr	r3, .L173+32
	add	r2, r1, ip, asl #8
	mov	r5, r2, asl #1
	ldrh	r5, [r3, r5]
	cmp	r5, #0
	beq	.L127
	ldr	r5, [r4, #24]
	add	r2, r2, r5
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L127
	ldr	r6, .L173+8
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ble	.L66
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #0]
	add	r2, r2, r2, lsr #31
	cmp	ip, #0
	add	r2, r0, r2, asr #1
	strge	ip, [r4, #8]
	cmp	r2, #80
	suble	r3, r3, #1
	ldr	r2, .L173+4
	strle	r3, [r6, #0]
.L128:
	ldr	r0, [r2, #8]
	b	.L69
.L159:
	ldr	r4, .L173+4
	add	r0, r4, #8
	ldmia	r0, {r0, r1, ip}	@ phole ldm
	rsb	ip, ip, r0
	ldr	r3, .L173+20
	add	r2, r1, ip, asl #8
	mov	r5, r2, asl #1
	ldrh	r5, [r3, r5]
	cmp	r5, #0
	beq	.L119
	ldr	r5, [r4, #24]
	add	r2, r2, r5
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L119
	ldr	r6, .L173+8
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ble	.L30
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #0]
	add	r2, r2, r2, lsr #31
	cmp	ip, #0
	add	r2, r0, r2, asr #1
	strge	ip, [r4, #8]
	cmp	r2, #80
	suble	r3, r3, #1
	ldr	r2, .L173+4
	strle	r3, [r6, #0]
.L120:
	ldr	r0, [r2, #8]
	b	.L33
.L119:
	ldr	r6, .L173+8
	b	.L30
.L123:
	ldr	r6, .L173+8
	b	.L48
.L127:
	ldr	r6, .L173+8
	b	.L66
.L61:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L133
	ldr	ip, [r4, #20]
	ldr	r3, [r4, #24]
	add	r3, ip, r3
	sub	r3, r3, #1
	add	r3, r3, r1
	ldr	r2, .L173+36
	b	.L156
.L133:
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	b	.L28
.L84:
	ldr	r3, .L173+40
	mov	lr, pc
	bx	r3
	mov	r1, #20224
	mov	r2, #11008
	add	r2, r2, #17
	mov	r3, r7
	ldr	r0, .L173+44
	add	r1, r1, #183
	ldr	ip, .L173+48
	mov	lr, pc
	bx	ip
	ldr	r2, .L173+52
	ldr	r3, [r8, #0]
	str	r7, [r2, #0]
	cmp	r3, #2
	mov	r2, #1
	str	r2, [sl, #0]
	beq	.L87
	cmp	r3, #3
	beq	.L88
	cmp	r3, r2
	bne	.L85
	ldr	r3, .L173+56
	add	r0, r9, #24
	ldmia	r0, {r0, ip}	@ phole ldm
	ldr	r1, [r3, #28]
	ldr	r2, [r3, #24]
	add	ip, ip, ip, lsr #31
	add	r0, r0, r0, lsr #31
	add	r1, r1, r1, lsr #31
	mov	ip, ip, asr #1
	add	r2, r2, r2, lsr #31
	mov	r0, r0, asr #1
	sub	r1, ip, r1, asr #1
	sub	r2, r0, r2, asr #1
	add	r1, r1, #230
	add	r2, r2, #20
	str	r1, [r3, #8]
	str	r2, [r3, #12]
.L85:
	ldr	ip, .L173+60
	mov	lr, #0
	mov	r1, #15296
	mov	r2, #11008
	ldr	r0, .L173+64
	add	r1, r1, #22
	str	lr, [ip, #0]
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L173+68
	mov	lr, pc
	bx	ip
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	b	.L83
.L56:
	ldr	r5, [r4, #16]
	ldr	ip, [r4, #28]
	add	ip, r5, ip
	sub	ip, ip, #1
	add	ip, ip, r0
	mov	r2, ip, asl #8
	ldr	r3, .L173+36
	add	r7, r2, r1
	mov	r7, r7, asl #1
	ldrh	r7, [r3, r7]
	cmp	r7, #0
	ldr	r7, .L173+4
	beq	.L51
	ldr	sl, [r7, #24]
	add	r2, r2, sl
	add	r2, r2, r1
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L51
	ldr	r3, [r6, #0]
	cmp	r3, #95
	ble	.L51
	cmp	ip, #256
	addle	r0, r0, r5
	strle	r0, [r7, #8]
	b	.L51
.L38:
	ldr	r5, [r4, #16]
	ldr	ip, [r4, #28]
	add	ip, r5, ip
	sub	ip, ip, #1
	add	ip, ip, r0
	mov	r2, ip, asl #8
	ldr	r3, .L173+20
	add	r7, r2, r1
	mov	r7, r7, asl #1
	ldrh	r7, [r3, r7]
	cmp	r7, #0
	ldr	r7, .L173+4
	beq	.L33
	ldr	sl, [r7, #24]
	add	r2, r2, sl
	add	r2, r2, r1
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L33
	ldr	r3, [r6, #0]
	cmp	r3, #95
	ble	.L33
	cmp	ip, #256
	addle	r0, r0, r5
	strle	r0, [r7, #8]
	b	.L33
.L74:
	ldr	r5, [r4, #16]
	ldr	ip, [r4, #28]
	add	ip, r5, ip
	sub	ip, ip, #1
	add	ip, ip, r0
	mov	r2, ip, asl #8
	ldr	r3, .L173+32
	add	r7, r2, r1
	mov	r7, r7, asl #1
	ldrh	r7, [r3, r7]
	cmp	r7, #0
	ldr	r7, .L173+4
	beq	.L69
	ldr	sl, [r7, #24]
	add	r2, r2, sl
	add	r2, r2, r1
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L69
	ldr	r3, [r6, #0]
	cmp	r3, #95
	ble	.L69
	cmp	ip, #256
	addle	r0, r0, r5
	strle	r0, [r7, #8]
	b	.L69
.L108:
	ldr	r5, .L173+12
	ldr	r2, [r5, #0]
	cmp	r2, #0
	ble	.L39
.L150:
	cmp	r3, #0
	strge	r3, [ip, #12]
	ldr	r3, [r4, #24]
	ldr	r1, [r4, #4]
	add	r3, r3, r3, lsr #31
	add	r3, r1, r3, asr #1
	cmp	r3, #120
	ldr	r3, .L173+4
	bgt	.L131
	sub	r2, r2, #1
	str	r2, [r5, #0]
	ldr	r1, [r3, #12]
	b	.L28
.L118:
	ldr	r5, .L173+12
	ldr	r2, [r5, #0]
	cmp	r2, #0
	bgt	.L150
	b	.L75
.L113:
	ldr	r5, .L173+12
	ldr	r2, [r5, #0]
	cmp	r2, #0
	bgt	.L150
	b	.L57
.L165:
	ldr	r3, [r6, #0]
	cmp	r3, #0
	bgt	.L70
	cmp	ip, #0
	strge	ip, [r5, #8]
	movge	r0, ip
	b	.L69
.L162:
	ldr	r2, [r5, #0]
	cmp	r2, #0
	bgt	.L42
.L137:
	cmp	r3, #0
	strge	r3, [ip, #12]
	movge	r1, r3
	b	.L28
.L160:
	ldr	r3, [r6, #0]
	cmp	r3, #0
	bgt	.L34
	cmp	ip, #0
	strge	ip, [r5, #8]
	movge	r0, ip
	b	.L33
.L172:
	ldr	r2, [r5, #0]
	cmp	r2, #0
	bgt	.L60
	b	.L137
.L170:
	ldr	r3, [r6, #0]
	cmp	r3, #0
	bgt	.L52
	cmp	ip, #0
	strge	ip, [r5, #8]
	movge	r0, ip
	b	.L51
.L167:
	ldr	r2, [r5, #0]
	cmp	r2, #0
	bgt	.L78
	b	.L137
.L168:
	ldr	r2, [r5, #0]
	cmp	r2, #15
	bgt	.L79
	cmp	r3, #256
	ldr	r3, [r4, #4]
	add	ip, ip, ip, lsr #31
	addle	r1, r1, r7
	add	r3, r3, ip, asr #1
	strle	r1, [sl, #12]
	cmp	r3, #119
	addgt	r2, r2, #1
	ldr	r3, .L173+4
	strgt	r2, [r5, #0]
.L131:
	ldr	r1, [r3, #12]
	b	.L28
.L166:
	ldr	r3, [r6, #0]
	cmp	r3, #95
	bgt	.L71
	ldr	r2, [r4, #0]
	cmp	r5, #256
	add	ip, ip, ip, lsr #31
	addle	r0, r0, r7
	add	r2, r2, ip, asr #1
	strle	r0, [sl, #8]
	cmp	r2, #79
	ldr	r2, .L173+4
	ble	.L128
	add	r3, r3, #1
	str	r3, [r6, #0]
	ldr	r0, [r2, #8]
	b	.L69
.L163:
	ldr	r2, [r5, #0]
	cmp	r2, #15
	bgt	.L43
	b	.L148
.L161:
	ldr	r3, [r6, #0]
	cmp	r3, #95
	bgt	.L35
	ldr	r2, [r4, #0]
	cmp	r5, #256
	add	ip, ip, ip, lsr #31
	addle	r0, r0, r7
	add	r2, r2, ip, asr #1
	strle	r0, [sl, #8]
	cmp	r2, #79
	ldr	r2, .L173+4
	ble	.L120
	add	r3, r3, #1
	str	r3, [r6, #0]
	ldr	r0, [r2, #8]
	b	.L33
.L171:
	ldr	r3, [r6, #0]
	cmp	r3, #95
	bgt	.L53
	ldr	r2, [r4, #0]
	cmp	r5, #256
	add	ip, ip, ip, lsr #31
	addle	r0, r0, r7
	add	r2, r2, ip, asr #1
	strle	r0, [sl, #8]
	cmp	r2, #79
	ldr	r2, .L173+4
	ble	.L124
	add	r3, r3, #1
	str	r3, [r6, #0]
	ldr	r0, [r2, #8]
	b	.L51
.L87:
	ldr	r3, .L173+56
	add	r0, r9, #24
	ldmia	r0, {r0, ip}	@ phole ldm
	ldr	r1, [r3, #28]
	ldr	r2, [r3, #24]
	add	ip, ip, ip, lsr #31
	add	r0, r0, r0, lsr #31
	add	r1, r1, r1, lsr #31
	mov	ip, ip, asr #1
	add	r2, r2, r2, lsr #31
	mov	r0, r0, asr #1
	sub	r1, ip, r1, asr #1
	sub	r2, r0, r2, asr #1
	add	r1, r1, #128
	add	r2, r2, #128
	str	r1, [r3, #8]
	str	r2, [r3, #12]
	b	.L85
.L88:
	ldr	r3, .L173+56
	add	r0, r9, #24
	ldmia	r0, {r0, ip}	@ phole ldm
	ldr	r1, [r3, #28]
	ldr	r2, [r3, #24]
	add	ip, ip, ip, lsr #31
	add	r0, r0, r0, lsr #31
	add	r1, r1, r1, lsr #31
	mov	ip, ip, asr #1
	add	r2, r2, r2, lsr #31
	mov	r0, r0, asr #1
	sub	r1, ip, r1, asr #1
	sub	r2, r0, r2, asr #1
	add	r1, r1, #50
	add	r2, r2, #200
	str	r1, [r3, #8]
	str	r2, [r3, #12]
	b	.L85
.L174:
	.align	2
.L173:
	.word	level
	.word	player
	.word	vOff
	.word	hOff
	.word	crystalFound
	.word	collisionmapBitmap
	.word	crystal
	.word	collision
	.word	collisionmap3Bitmap
	.word	collisionmap2Bitmap
	.word	stopSound
	.word	crystalSound
	.word	playSoundA
	.word	transparency
	.word	portal
	.word	portalHide
	.word	portalSound
	.word	playSoundB
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	initCrystal
	.type	initCrystal, %function
initCrystal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L176
	mov	r3, #8
	str	r3, [r4, #24]
	mov	r3, #16
	str	r3, [r4, #28]
	mov	r3, #20
	str	r3, [r4, #8]
	ldr	r3, .L176+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L176+8
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #7
	rsb	r2, r3, r3, asl #4
	mov	r3, #0
	sub	r0, r0, r2, asl #4
	str	r3, [r4, #32]
	str	r3, [r4, #44]
	mov	r3, #4
	str	r0, [r4, #12]
	str	r3, [r4, #48]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L177:
	.align	2
.L176:
	.word	crystal
	.word	rand
	.word	-2004318071
	.size	initCrystal, .-initCrystal
	.align	2
	.global	updateCrystal
	.type	updateCrystal, %function
updateCrystal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r3, .L195
	ldr	r4, [r3, #0]
	cmp	r4, #0
	ldrne	r4, .L195+4
	beq	.L193
.L179:
	ldr	r3, .L195+8
	ldr	r2, [r3, #0]
	ldr	r3, .L195+12
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	ldr	r3, [r3, #0]
	rsb	r2, r2, r0
	rsb	r3, r3, r1
	stmia	r4, {r2, r3}	@ phole stm
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L193:
	ldr	r7, .L195+16
	mov	lr, pc
	bx	r7
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	ands	r3, r3, #4
	beq	.L194
	ldr	r3, .L195+20
	smull	r1, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #11
	rsb	r2, r3, r3, asl #5
	add	r3, r3, r2, asl #2
	add	r3, r3, r3, asl #2
	sub	r0, r0, r3, asl #3
	cmp	r0, #29
	ldreq	r3, .L195+24
	ldrne	r3, .L195+24
	movne	r2, #1
	streq	r4, [r3, #0]
	strne	r2, [r3, #0]
.L181:
	mov	lr, pc
	bx	r7
	ldr	r5, .L195+28
	mov	r6, r0
	mov	lr, pc
	bx	r7
	ldr	r2, [r5, #0]
	ldr	r3, .L195+32
	smull	r1, r3, r2, r3
	mov	r1, r2, asr #31
	rsb	r3, r1, r3, asr #5
	rsb	r1, r3, r3, asl #5
	add	r3, r3, r1, asl #2
	subs	r3, r2, r3, asl #2
	bne	.L192
	cmp	r2, #0
	bne	.L191
.L192:
	ldr	r4, .L195+4
.L183:
	ldr	r1, [r4, #28]
	ldr	r3, [r4, #0]
	rsb	r1, r1, #0
	add	r2, r2, #1
	cmp	r3, r1
	str	r2, [r5, #0]
	movlt	r3, #1
	blt	.L184
	cmp	r3, #160
	movle	r3, #0
	movgt	r3, #1
.L184:
	str	r3, [r4, #52]
	b	.L179
.L194:
	ldr	r2, .L195+24
	str	r3, [r2, #0]
	b	.L181
.L191:
	mov	r2, #-2080374781
	add	r2, r2, #2162688
	ldr	r4, .L195+36
	add	r2, r2, #2112
	smull	r1, lr, r2, r6
	smull	r1, r4, r0, r4
	mov	ip, r0, asr #31
	add	r4, r4, r0
	mov	r1, r6, asr #31
	add	lr, lr, r6
	rsb	ip, ip, r4, asr #7
	rsb	lr, r1, lr, asr #7
	ldr	r4, .L195+4
	rsb	lr, lr, lr, asl #5
	rsb	ip, ip, ip, asl #4
	sub	ip, r0, ip, asl #4
	sub	r6, r6, lr, asl #3
	mov	r1, #20224
	mov	r2, #11008
	add	r1, r1, #183
	add	r2, r2, #17
	str	ip, [r4, #8]
	ldr	r0, .L195+40
	str	r6, [r4, #12]
	ldr	ip, .L195+44
	mov	lr, pc
	bx	ip
	ldr	r2, [r5, #0]
	cmp	r2, #500
	ldreq	r3, .L195+48
	moveq	r1, #1
	streq	r1, [r3, #0]
	b	.L183
.L196:
	.align	2
.L195:
	.word	crystalFound
	.word	crystal
	.word	vOff
	.word	hOff
	.word	rand
	.word	1759218605
	.word	transparency
	.word	crystalSpawn
	.word	274877907
	.word	-2004318071
	.word	crystalSound
	.word	playSoundB
	.word	portalHide
	.size	updateCrystal, .-updateCrystal
	.align	2
	.global	drawCrystal
	.type	drawCrystal, %function
drawCrystal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L218
	ldr	r3, [r3, #0]
	sub	r3, r3, #1
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L197
.L203:
	.word	.L199
	.word	.L200
	.word	.L201
	.word	.L202
.L217:
	ldr	r3, .L218+4
	mov	r2, #16384
	mov	r1, #512	@ movhi
	add	r2, r2, #87
	mov	ip, #80	@ movhi
	mov	r0, #136	@ movhi
	strh	r2, [r3, #50]	@ movhi
	strh	ip, [r3, #48]	@ movhi
	strh	r0, [r3, #52]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	r1, [r3, #40]	@ movhi
.L197:
	bx	lr
.L202:
	ldr	r3, .L218+8
	ldr	r3, [r3, #0]
	cmp	r3, #1
	beq	.L216
	cmp	r3, #2
	beq	.L217
	cmp	r3, #0
	bxne	lr
	ldr	r3, .L218+4
	mov	r2, #16384
	add	r2, r2, #75
	mov	ip, #512	@ movhi
	mov	r1, #27	@ movhi
	strh	r2, [r3, #10]	@ movhi
	mov	r2, #8	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	strh	ip, [r3, #40]	@ movhi
	strh	ip, [r3, #48]	@ movhi
	bx	lr
.L201:
	ldr	r3, .L218+12
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L211
	ldr	r2, .L218+16
	ldr	r1, [r2, #52]
	ldr	r3, .L218+4
	mov	ip, #512	@ movhi
	cmp	r1, #0
	strh	ip, [r3, #40]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	bne	.L212
	ldr	r1, .L218+20
	ldr	r1, [r1, #0]
	cmp	r1, #0
	beq	.L213
.L212:
	mov	r0, #512	@ movhi
	strh	r0, [r3, #48]	@ movhi
	b	.L214
.L200:
	ldr	r3, .L218+12
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L207
	ldr	r2, .L218+16
	ldr	r1, [r2, #52]
	ldr	r3, .L218+4
	cmp	r1, #0
	mov	r1, #512	@ movhi
	strh	r1, [r3, #48]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	bne	.L208
	ldr	r1, .L218+20
	ldr	r1, [r1, #0]
	cmp	r1, #0
	beq	.L209
.L208:
	mov	r2, #512	@ movhi
	strh	r2, [r3, #40]	@ movhi
	b	.L210
.L199:
	ldr	r3, .L218+12
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L204
	ldr	r2, .L218+16
	ldr	r1, [r2, #52]
	ldr	r3, .L218+4
	mov	r0, #512	@ movhi
	cmp	r1, #0
	strh	r0, [r3, #40]	@ movhi
	strh	r0, [r3, #48]	@ movhi
	bne	.L205
	ldr	r1, .L218+20
	ldr	r1, [r1, #0]
	cmp	r1, #0
	beq	.L206
.L205:
	mov	r1, #512	@ movhi
	strh	r1, [r3, #8]	@ movhi
	bx	lr
.L207:
	ldr	r3, .L218+4
	mov	r1, #16384
	mov	r2, #4160
	add	r1, r1, #30
	add	r2, r2, #8
	mov	ip, #142	@ movhi
	strh	r1, [r3, #42]	@ movhi
	strh	r2, [r3, #44]	@ movhi
	strh	ip, [r3, #40]	@ movhi
.L210:
	mov	r2, #16384
	add	r2, r2, #20
	mov	r0, #142	@ movhi
	mov	r1, #8	@ movhi
	strh	r0, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	bx	lr
.L211:
	ldr	r3, .L218+4
	mov	r2, #16384
	add	r2, r2, #40
	strh	r2, [r3, #50]	@ movhi
	mov	r1, #142	@ movhi
	mov	r2, #136	@ movhi
	strh	r1, [r3, #48]	@ movhi
	strh	r2, [r3, #52]	@ movhi
.L214:
	mov	r0, #16384
	mov	r1, r0
	mov	r2, #4160
	add	r0, r0, #20
	mov	ip, #142	@ movhi
	add	r1, r1, #30
	add	r2, r2, #8
	strh	r0, [r3, #10]	@ movhi
	mov	r0, #8	@ movhi
	strh	ip, [r3, #8]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	strh	ip, [r3, #40]	@ movhi
	strh	r1, [r3, #42]	@ movhi
	strh	r2, [r3, #44]	@ movhi
	bx	lr
.L204:
	ldr	r3, .L218+4
	mov	r2, #16384
	add	r2, r2, #20
	mov	ip, #142	@ movhi
	mov	r0, #8	@ movhi
	strh	ip, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	bx	lr
.L216:
	ldr	r3, .L218+4
	mov	r2, #16384
	add	r2, r2, #70
	mov	r0, #53	@ movhi
	strh	r2, [r3, #42]	@ movhi
	mov	r1, #72	@ movhi
	mov	r2, #512	@ movhi
	strh	r0, [r3, #40]	@ movhi
	strh	r1, [r3, #44]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	strh	r2, [r3, #48]	@ movhi
	bx	lr
.L206:
	ldr	r1, [r2, #4]
	mov	r1, r1, asl #23
	ldrb	r0, [r2, #0]	@ zero_extendqisi2
	mov	r1, r1, lsr #23
	mov	r2, #1024
	orr	r1, r1, #16384
	add	r2, r2, #8
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	bx	lr
.L209:
	ldr	r1, [r2, #4]
	mov	r1, r1, asl #23
	ldrb	r0, [r2, #0]	@ zero_extendqisi2
	mov	r1, r1, lsr #23
	mov	r2, #1088
	orr	r1, r1, #16384
	add	r2, r2, #8
	strh	r0, [r3, #40]	@ movhi
	strh	r1, [r3, #42]	@ movhi
	strh	r2, [r3, #44]	@ movhi
	b	.L210
.L213:
	ldr	r1, [r2, #4]
	mov	r1, r1, asl #23
	ldrb	r0, [r2, #0]	@ zero_extendqisi2
	mov	r1, r1, lsr #23
	mov	r2, #1152
	orr	r1, r1, #16384
	add	r2, r2, #8
	strh	r0, [r3, #48]	@ movhi
	strh	r1, [r3, #50]	@ movhi
	strh	r2, [r3, #52]	@ movhi
	b	.L214
.L219:
	.align	2
.L218:
	.word	level
	.word	shadowOAM
	.word	pauseSelect
	.word	crystalFound
	.word	crystal
	.word	transparency
	.size	drawCrystal, .-drawCrystal
	.align	2
	.global	initClue
	.type	initClue, %function
initClue:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L221
	mov	r1, #8
	str	r1, [r3, #24]
	mov	r1, #12
	mov	r2, #0
	str	r1, [r3, #28]
	mov	r1, #120
	str	r1, [r3, #8]
	str	r2, [r3, #32]
	mov	r1, #40
	str	r2, [r3, #44]
	mov	r2, #4
	str	r1, [r3, #12]
	str	r2, [r3, #48]
	bx	lr
.L222:
	.align	2
.L221:
	.word	clue
	.size	initClue, .-initClue
	.align	2
	.global	drawClue
	.type	drawClue, %function
drawClue:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L227
	str	r4, [sp, #-4]!
	ldr	r2, [r3, #52]
	cmp	r2, #0
	beq	.L224
	ldr	r2, .L227+4
	ldr	r2, [r2, #0]
	cmp	r2, #0
	beq	.L226
.L224:
	ldr	r2, .L227+8
	ldr	r4, [r2, #0]
	ldr	r2, .L227+12
	ldrb	r0, [r3, #0]	@ zero_extendqisi2
	ldr	r1, [r3, #4]
	ldr	r3, .L227+16
	ldr	r2, [r2, #0]
	ldr	ip, [r3, #0]
	mvn	r0, r0, asl #17
	ldr	r3, .L227+20
	add	r2, r2, r4, asl #5
	mvn	r0, r0, lsr #17
	bic	r1, r1, #65024
	orr	r2, r2, ip, asl #12
	strh	r0, [r3, #32]	@ movhi
	strh	r1, [r3, #34]	@ movhi
	strh	r2, [r3, #36]	@ movhi
.L223:
	ldmfd	sp!, {r4}
	bx	lr
.L226:
	ldr	r3, .L227+20
	mov	r2, #512	@ movhi
	strh	r2, [r3, #32]	@ movhi
	b	.L223
.L228:
	.align	2
.L227:
	.word	clue
	.word	clueFound
	.word	clueTileRow
	.word	clueTileCol
	.word	cluePalRow
	.word	shadowOAM
	.size	drawClue, .-drawClue
	.align	2
	.global	animateClue
	.type	animateClue, %function
animateClue:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r5, .L248
	ldr	r3, .L248+4
	ldr	r4, [r5, #32]
	smull	r2, r3, r4, r3
	mov	r2, r4, asr #31
	add	r3, r3, r4
	rsb	r3, r2, r3, asr #3
	rsb	r3, r3, r3, asl #4
	cmp	r4, r3
	bne	.L230
	ldr	r3, .L248+8
	ldr	r6, [r3, #0]
	cmp	r6, #0
	beq	.L246
.L231:
	ldr	r3, .L248+12
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L232
	ldr	ip, .L248+16
	ldr	r0, .L248+20
	ldr	r2, [ip, #8]
	ldr	r1, [r0, #8]
	cmp	r2, r1
	bgt	.L247
	bge	.L234
	rsb	r2, r2, r1
	cmp	r2, #49
	bgt	.L234
.L245:
	ldr	r2, [ip, #12]
	ldr	r1, [r0, #12]
	cmp	r2, r1
	ble	.L236
	rsb	r2, r1, r2
	cmp	r2, #49
	ble	.L238
.L232:
	add	r4, r4, #1
	str	r4, [r5, #32]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L230:
	ldr	r3, .L248+8
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L232
	b	.L231
.L246:
	ldr	r0, [r5, #44]
	ldr	r3, .L248+24
	add	r0, r0, #1
	ldr	r1, [r5, #48]
	mov	lr, pc
	bx	r3
	ldr	r3, .L248+28
	mov	r2, r1, asl #1
	str	r2, [r3, #0]
	ldr	r3, .L248+32
	mov	r2, #10
	str	r2, [r3, #0]
	ldr	r3, .L248+36
	str	r1, [r5, #44]
	str	r6, [r3, #0]
	b	.L232
.L247:
	rsb	r2, r1, r2
	cmp	r2, #49
	ble	.L245
.L234:
	ldr	r2, .L248+28
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L248+32
	mov	r1, #10
	str	r1, [r2, #0]
	ldr	r2, .L248+36
	str	r3, [r2, #0]
	b	.L232
.L236:
	bge	.L232
	rsb	r2, r2, r1
	cmp	r2, #49
	bgt	.L232
.L238:
	ldr	r2, .L248+32
	mov	r1, #25
	str	r1, [r2, #0]
	ldr	r2, .L248+28
	str	r3, [r2, #0]
	ldr	r3, .L248+36
	mov	r2, #2
	str	r2, [r3, #0]
	b	.L232
.L249:
	.align	2
.L248:
	.word	clue
	.word	-2004318071
	.word	clueFound
	.word	crystalFound
	.word	player
	.word	crystal
	.word	__aeabi_idivmod
	.word	clueTileRow
	.word	clueTileCol
	.word	cluePalRow
	.size	animateClue, .-animateClue
	.align	2
	.global	updateClue
	.type	updateClue, %function
updateClue:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r5, .L257
	sub	sp, sp, #20
	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	.L256
	ldr	r3, .L257+4
	mov	r2, #145
	str	r2, [r3, #0]
	mov	r2, #200
	str	r2, [r3, #4]
.L254:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	animateClue
.L256:
	ldr	r4, .L257+4
	ldr	r3, .L257+8
	ldr	ip, [r4, #24]
	ldr	r7, [r4, #8]
	ldr	r6, [r4, #12]
	ldr	lr, [r4, #28]
	ldr	r2, [r3, #28]
	add	r0, r3, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	ldr	r3, [r3, #24]
	str	ip, [sp, #12]
	str	r7, [sp, #0]
	stmib	sp, {r6, lr}	@ phole stm
	ldr	ip, .L257+12
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldrne	r2, .L257+16
	movne	r3, #1
	strne	r3, [r2, #0]
	ldr	r2, [r4, #28]
	strne	r3, [r5, #0]
	ldr	r3, [r4, #0]
	rsb	r2, r2, #0
	cmp	r3, r2
	movlt	r3, #1
	blt	.L253
	cmp	r3, #160
	movle	r3, #0
	movgt	r3, #1
.L253:
	ldr	r2, .L257+20
	ldr	r1, [r2, #0]
	ldr	r2, .L257+24
	ldr	ip, [r4, #8]
	ldr	r0, [r4, #12]
	ldr	r2, [r2, #0]
	rsb	r1, r1, ip
	rsb	r2, r2, r0
	str	r3, [r4, #52]
	stmia	r4, {r1, r2}	@ phole stm
	b	.L254
.L258:
	.align	2
.L257:
	.word	clueFound
	.word	clue
	.word	player
	.word	collision
	.word	clueHide
	.word	vOff
	.word	hOff
	.size	updateClue, .-updateClue
	.align	2
	.global	initPortal
	.type	initPortal, %function
initPortal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L260
	stmfd	sp!, {r4, r5}
	ldr	r1, [r3, #28]
	ldr	r2, [r3, #24]
	ldr	ip, [r3, #8]
	ldr	r0, [r3, #12]
	ldr	r3, .L260+4
	add	r5, r1, r1, lsr #31
	add	r4, r2, r2, lsr #31
	sub	ip, ip, #16
	mov	r2, #0
	sub	r0, r0, #16
	mov	r1, #32
	add	ip, ip, r5, asr #1
	add	r0, r0, r4, asr #1
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	mov	r2, #4
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	str	r2, [r3, #48]
	ldmfd	sp!, {r4, r5}
	bx	lr
.L261:
	.align	2
.L260:
	.word	player
	.word	portal
	.size	initPortal, .-initPortal
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L263
	stmfd	sp!, {r4, lr}
	ldr	r1, [r3, #20]
	ldr	r2, [r3, #28]
	rsb	r2, r2, r1
	ldr	r1, .L263+4
	mov	r4, #0
	str	r4, [r1, #0]
	ldr	r1, .L263+8
	mov	r3, #1
	str	r3, [r1, #0]
	ldr	r1, .L263+12
	str	r3, [r1, #0]
	ldr	r3, .L263+16
	str	r4, [r3, #0]
	ldr	r3, .L263+20
	str	r4, [r3, #0]
	ldr	r3, .L263+24
	str	r4, [r3, #0]
	ldr	r3, .L263+28
	str	r4, [r3, #0]
	ldr	r3, .L263+32
	str	r4, [r3, #0]
	ldr	r3, .L263+36
	str	r2, [r3, #0]
	ldr	r3, .L263+40
	str	r4, [r3, #0]
	ldr	r3, .L263+44
	str	r4, [r3, #0]
	ldr	r3, .L263+48
	str	r4, [r3, #0]
	bl	initPlayer
	bl	initCrystal
	ldr	r3, .L263+52
	mov	r2, #8
	str	r2, [r3, #24]
	mov	r2, #12
	str	r2, [r3, #28]
	mov	r2, #120
	str	r2, [r3, #8]
	mov	r2, #40
	str	r2, [r3, #12]
	mov	r2, #4
	str	r4, [r3, #32]
	str	r4, [r3, #44]
	str	r2, [r3, #48]
	ldmfd	sp!, {r4, lr}
	b	initPortal
.L264:
	.align	2
.L263:
	.word	soundA
	.word	crystalCounter
	.word	transparency
	.word	livesRemaining
	.word	crystalSpawn
	.word	clueFound
	.word	clueHide
	.word	portalHide
	.word	count
	.word	time
	.word	bgOffsetCounter
	.word	crystalFound
	.word	hOff2
	.word	clue
	.size	initGame, .-initGame
	.align	2
	.global	drawPortal
	.type	drawPortal, %function
drawPortal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L269
	stmfd	sp!, {r4, r5}
	ldr	r2, [r3, #52]
	cmp	r2, #0
	bne	.L266
	ldr	r2, .L269+4
	ldr	r2, [r2, #0]
	cmp	r2, #0
	bne	.L266
	ldr	r2, .L269+8
	ldr	r2, [r2, #0]
	ldr	r1, [r3, #4]
	sub	ip, r2, #1
	ldr	r5, [r3, #44]
	add	r4, r2, #2
	mov	r1, r1, asl #23
	mov	ip, ip, asl #12
	ldr	r2, .L269+12
	ldrb	r0, [r3, #0]	@ zero_extendqisi2
	mvn	r1, r1, lsr #6
	orr	ip, ip, #1024
	add	r3, r4, r5, asl #5
	mvn	r1, r1, lsr #17
	orr	r3, ip, r3, asl #2
	strh	r0, [r2, #56]	@ movhi
	strh	r1, [r2, #58]	@ movhi
	strh	r3, [r2, #60]	@ movhi
	b	.L265
.L266:
	ldr	r3, .L269+12
	mov	r2, #512	@ movhi
	strh	r2, [r3, #56]	@ movhi
.L265:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L270:
	.align	2
.L269:
	.word	portal
	.word	portalHide
	.word	level
	.word	shadowOAM
	.size	drawPortal, .-drawPortal
	.align	2
	.global	drawGame
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L286
	ldr	r3, .L286+4
	sub	sp, sp, #44
	mov	lr, pc
	bx	r3
	bl	drawPlayer
	bl	drawCrystal
	bl	drawClue
	bl	drawPortal
	ldr	r3, [r4, #0]
	cmp	r3, #1
	beq	.L282
	cmp	r3, #2
	beq	.L283
	cmp	r3, #3
	beq	.L281
	ldr	r5, .L286+8
	ldr	r6, .L286+12
.L273:
	ldr	r3, .L286+16
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L275
	ldr	r3, .L286+20
	ldr	r3, [r3, #0]
	cmp	r3, #1000
	bge	.L275
	cmp	r3, #99
	bgt	.L284
	cmp	r3, #9
	ble	.L277
	ldr	r1, .L286+24
	smull	r2, r1, r3, r1
	mov	r2, r3, asr #31
	rsb	r1, r2, r1, asr #2
	add	r2, r1, r1, asl #2
	sub	r3, r3, r2, asl #1
	add	r7, r1, #105
	ldr	r2, .L286+28
	add	ip, r3, #105
	mov	r7, r7, asl #3
	mov	ip, ip, asl #3
	add	r1, r1, #512
	add	r3, r3, #512
	add	lr, r2, r7
	add	r0, r2, ip
	mov	r8, #150	@ movhi
	orr	r1, r1, #1024
	orr	r3, r3, #1024
	mov	r9, #40	@ movhi
	mov	sl, #45	@ movhi
	strh	r8, [r2, r7]	@ movhi
	strh	r9, [lr, #2]	@ movhi
	strh	r1, [lr, #4]	@ movhi
	strh	r8, [r2, ip]	@ movhi
	strh	sl, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
.L275:
	ldr	r3, .L286+32
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L286+28
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L286+36
	mov	lr, pc
	bx	ip
	ldr	r2, [r4, #0]
	ldrh	r0, [r6, #0]
	ldrh	r1, [r5, #0]
	mov	r3, #67108864
	cmp	r2, #1
	cmpne	r2, #3
	strh	r0, [r3, #24]	@ movhi
	strh	r1, [r3, #26]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #18]	@ movhi
	beq	.L285
	cmp	r2, #2
	bne	.L271
	ldr	r2, .L286+40
	ldr	r1, [r2, #0]
	mov	r0, r1, asl #16
	mov	r0, r0, lsr #16
	add	r1, r1, #1
	strh	r0, [r3, #16]	@ movhi
	str	r1, [r2, #0]
.L271:
	add	sp, sp, #44
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L285:
	ldr	r1, .L286+40
	ldr	r2, [r1, #0]
	cmp	r2, #0
	add	r0, r2, #3
	movge	r0, r2
	mov	r0, r0, asl #14
	mov	r0, r0, lsr #16
	add	r2, r2, #1
	strh	r0, [r3, #16]	@ movhi
	str	r2, [r1, #0]
	b	.L271
.L282:
	ldr	r6, .L286+12
	ldr	ip, [r6, #0]
	mov	sl, ip, asl #16
	mov	sl, sl, lsr #16
	ldr	r5, .L286+8
	rsb	r9, sl, #200
	rsb	lr, sl, #72
	ldrh	r1, [r5, #0]
	mov	r9, r9, asl #23
	mov	lr, lr, asl #23
	mvn	lr, lr, lsr #5
	rsb	ip, ip, #0
	mvn	r9, r9, lsr #5
	str	lr, [sp, #12]
	rsb	r0, sl, #8
	rsb	fp, r1, #128
	mvn	r9, r9, lsr #18
	mov	ip, ip, asl #23
	str	r9, [sp, #32]
	mvn	ip, ip, lsr #6
	ldr	r9, [sp, #12]
	rsb	sl, sl, #120
	mov	r0, r0, asl #23
	and	fp, fp, #255
	str	ip, [sp, #16]
	mvn	r0, r0, lsr #6
	orr	fp, fp, #16384
	mov	sl, sl, asl #23
	str	r0, [sp, #20]
	str	fp, [sp, #24]
	mvn	sl, sl, lsr #5
	ldr	fp, [sp, #16]
	mvn	r9, r9, lsr #18
	str	sl, [sp, #28]
	str	r9, [sp, #12]
	ldr	r9, [sp, #20]
	mvn	sl, fp, lsr #17
	ldr	fp, [sp, #28]
	mvn	r9, r9, lsr #17
	ldr	r3, .L286+28
	str	r9, [sp, #16]
	mvn	fp, fp, lsr #18
	ldr	r9, [sp, #24]
	str	fp, [sp, #20]
	mov	fp, #800
	strh	r9, [r3, fp]	@ movhi
	mov	r8, #800
	ldr	fp, [sp, #32]
	add	r8, r8, #2
	rsb	r1, r1, #136
	mov	r2, #13568
	add	r2, r2, #32
	strh	fp, [r3, r8]	@ movhi
	and	r1, r1, #255
	mov	r8, #804
	orr	r1, r1, #16384
	strh	r2, [r3, r8]	@ movhi
	mov	r8, #808
	strh	r1, [r3, r8]	@ movhi
	add	r8, sp, #12
	ldmia	r8, {r8, r9}	@ phole ldm
	mov	r7, #808
	mov	lr, #816
	mov	ip, #824
	add	r7, r7, #2
	add	lr, lr, #2
	add	ip, ip, #2
	strh	sl, [r3, lr]	@ movhi
	strh	r8, [r3, r7]	@ movhi
	strh	r9, [r3, ip]	@ movhi
	mov	r7, #812
	mov	lr, #820
	mov	ip, #828
	strh	r2, [r3, r7]	@ movhi
	strh	r2, [r3, lr]	@ movhi
	strh	r2, [r3, ip]	@ movhi
	mov	r0, #832
	mov	r7, #816
	mov	lr, #824
	mov	ip, #832
	ldr	sl, [sp, #20]
	strh	r1, [r3, r7]	@ movhi
	strh	r1, [r3, lr]	@ movhi
	strh	r1, [r3, ip]	@ movhi
	add	r0, r0, #2
	mov	r1, #836
	strh	sl, [r3, r0]	@ movhi
	strh	r2, [r3, r1]	@ movhi
	b	.L273
.L283:
	ldr	r6, .L286+12
	ldr	r3, [r6, #0]
	mov	r8, r3, asl #16
	mov	r8, r8, lsr #16
	rsb	fp, r8, #104
	rsb	r3, r3, #0
	mov	r1, r3, asl #23
	mov	fp, fp, asl #23
	rsb	r9, r8, #216
	mvn	r1, r1, lsr #6
	rsb	r8, r8, #160
	mvn	fp, fp, lsr #5
	str	r1, [sp, #12]
	mvn	fp, fp, lsr #18
	ldr	r5, .L286+8
	mov	r8, r8, asl #23
	str	fp, [sp, #24]
	mvn	r8, r8, lsr #6
	ldr	fp, [sp, #12]
	ldrh	sl, [r5, #0]
	str	r8, [sp, #16]
	mov	r9, r9, asl #23
	mvn	r8, fp, lsr #17
	ldr	fp, [sp, #16]
	ldr	r3, .L286+28
	rsb	r0, sl, #136
	mov	lr, #808
	mvn	r9, r9, lsr #5
	add	lr, lr, #2
	mvn	fp, fp, lsr #17
	rsb	sl, sl, #144
	and	r0, r0, #255
	mov	r2, #17664
	mvn	r9, r9, lsr #18
	add	r2, r2, #96
	strh	r9, [r3, lr]	@ movhi
	orr	r0, r0, #16384
	str	fp, [sp, #12]
	mov	lr, #812
	mov	fp, #800
	and	sl, sl, #255
	strh	r2, [r3, lr]	@ movhi
	strh	r0, [r3, fp]	@ movhi
	mov	lr, #816
	ldr	fp, [sp, #24]
	mov	r7, #800
	mov	ip, #816
	orr	sl, sl, #16384
	add	r7, r7, #2
	add	ip, ip, #2
	strh	sl, [r3, lr]	@ movhi
	mov	r1, #824
	ldr	lr, [sp, #12]
	strh	fp, [r3, r7]	@ movhi
	strh	r8, [r3, ip]	@ movhi
	add	r1, r1, #2
	mov	r7, #804
	mov	ip, #820
	strh	r2, [r3, r7]	@ movhi
	strh	r2, [r3, ip]	@ movhi
	strh	lr, [r3, r1]	@ movhi
	mov	r7, #808
	mov	ip, #824
	mov	r1, #828
	strh	r0, [r3, r7]	@ movhi
	strh	r0, [r3, ip]	@ movhi
	strh	r2, [r3, r1]	@ movhi
	b	.L273
.L281:
	ldr	r5, .L286+8
	ldr	r6, .L286+12
	ldrh	r0, [r5, #0]
	ldrh	fp, [r6, #0]
	rsb	r7, r0, #208
	rsb	r2, fp, #32
	and	r7, r7, #255
	str	r7, [sp, #12]
	rsb	lr, fp, #96
	rsb	ip, fp, #136
	rsb	r1, fp, #192
	mov	r2, r2, asl #23
	rsb	fp, fp, #232
	str	fp, [sp, #4]
	mvn	r2, r2, lsr #5
	ldr	fp, [sp, #12]
	mov	r1, r1, asl #23
	str	r2, [sp, #16]
	mvn	r1, r1, lsr #5
	str	r1, [sp, #32]
	mov	lr, lr, asl #23
	orr	r1, fp, #16384
	ldr	fp, [sp, #16]
	mov	lr, lr, lsr #23
	str	lr, [sp, #20]
	mvn	fp, fp, lsr #18
	str	fp, [sp, #12]
	mov	ip, ip, asl #23
	ldr	fp, [sp, #20]
	mov	ip, ip, lsr #23
	str	ip, [sp, #28]
	orr	fp, fp, #16384
	str	fp, [sp, #16]
	ldr	fp, [sp, #28]
	orr	fp, fp, #16384
	str	fp, [sp, #20]
	ldr	fp, [sp, #32]
	rsb	r0, r0, #200
	str	r0, [sp, #36]
	mvn	fp, fp, lsr #18
	str	fp, [sp, #28]
	ldr	fp, [sp, #36]
	and	fp, fp, #255
	str	fp, [sp, #32]
	ldr	fp, [sp, #4]
	bic	fp, fp, #65024
	str	fp, [sp, #36]
	mov	fp, #26368
	ldr	r3, .L286+28
	add	fp, fp, #199
	str	fp, [sp, #24]
	mov	fp, #832
	strh	r1, [r3, fp]	@ movhi
	mov	r9, #832
	ldr	fp, [sp, #12]
	mov	r2, #26368
	add	r9, r9, #2
	strh	fp, [r3, r9]	@ movhi
	mov	r8, r2
	mov	lr, r2
	mov	r9, #836
	add	r2, r2, #64
	strh	r2, [r3, r9]	@ movhi
	mov	r9, #840
	strh	r1, [r3, r9]	@ movhi
	mov	sl, #840
	ldr	r9, [sp, #16]
	add	sl, sl, #2
	strh	r9, [r3, sl]	@ movhi
	add	r8, r8, #74
	mov	sl, #844
	strh	r8, [r3, sl]	@ movhi
	mov	r7, #848
	ldr	sl, [sp, #20]
	add	r7, r7, #2
	mov	r8, #848
	add	lr, lr, #192
	strh	r1, [r3, r8]	@ movhi
	strh	sl, [r3, r7]	@ movhi
	mov	r7, #852
	strh	lr, [r3, r7]	@ movhi
	mov	lr, #856
	strh	r1, [r3, lr]	@ movhi
	mov	r1, #860
	ldr	lr, [sp, #32]
	strh	r2, [r3, r1]	@ movhi
	mov	ip, #856
	mov	r2, #864
	mov	r0, #864
	ldr	fp, [sp, #28]
	ldr	r1, [sp, #36]
	ldr	r7, [sp, #24]
	strh	lr, [r3, r2]	@ movhi
	add	ip, ip, #2
	add	r0, r0, #2
	mov	r2, #868
	strh	fp, [r3, ip]	@ movhi
	strh	r1, [r3, r0]	@ movhi
	strh	r7, [r3, r2]	@ movhi
	b	.L273
.L284:
	ldr	r1, .L286+44
	smull	r8, r1, r3, r1
	mov	r2, r3, asr #31
	rsb	r1, r2, r1, asr #5
	ldr	r0, .L286+24
	add	ip, r1, r1, asl #2
	add	ip, ip, ip, asl #2
	smull	r9, lr, r0, r3
	sub	ip, r3, ip, asl #2
	smull	sl, r0, ip, r0
	rsb	r2, r2, lr, asr #2
	mov	ip, ip, asr #31
	rsb	r0, ip, r0, asr #2
	add	r2, r2, r2, asl #2
	sub	r2, r3, r2, asl #1
	add	sl, r1, #105
	ldr	r3, .L286+28
	add	r7, r0, #105
	mov	sl, sl, asl #3
	mov	fp, #150	@ movhi
	add	ip, r2, #105
	mov	r7, r7, asl #3
	add	r9, r0, #512
	add	r1, r1, #512
	strh	fp, [r3, sl]	@ movhi
	add	r8, r3, sl
	add	lr, r3, r7
	mov	ip, ip, asl #3
	orr	r1, r1, #1024
	strh	fp, [r3, r7]	@ movhi
	add	r2, r2, #512
	orr	r9, r9, #1024
	mov	sl, #40	@ movhi
	mov	fp, #45	@ movhi
	strh	r1, [r8, #4]	@ movhi
	add	r0, r3, ip
	strh	sl, [r8, #2]	@ movhi
	strh	r9, [lr, #4]	@ movhi
	strh	fp, [lr, #2]	@ movhi
	orr	r2, r2, #1024
	mov	lr, #150	@ movhi
	mov	r1, #50	@ movhi
	strh	lr, [r3, ip]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	b	.L275
.L277:
	ldr	r1, .L286+24
	smull	fp, r1, r3, r1
	mov	r2, r3, asr #31
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, asl #2
	sub	r2, r3, r2, asl #1
	ldr	r0, .L286+28
	add	r1, r2, #105
	mov	r1, r1, asl #3
	add	r2, r2, #512
	mov	lr, #150	@ movhi
	add	r3, r0, r1
	orr	r2, r2, #1024
	strh	lr, [r0, r1]	@ movhi
	mov	r0, #45	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	b	.L275
.L287:
	.align	2
.L286:
	.word	level
	.word	hideSprites
	.word	vOff
	.word	hOff
	.word	crystalFound
	.word	time
	.word	1717986919
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	hOff2
	.word	1374389535
	.size	drawGame, .-drawGame
	.align	2
	.global	animatePortal
	.type	animatePortal, %function
animatePortal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r5, .L290
	ldr	r3, .L290+4
	ldr	r4, [r5, #32]
	smull	r2, r3, r4, r3
	mov	r2, r4, asr #31
	rsb	r3, r2, r3, asr #2
	add	r3, r3, r3, asl #2
	cmp	r4, r3, asl #1
	bne	.L289
	add	r0, r5, #44
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	ldr	r3, .L290+8
	mov	lr, pc
	bx	r3
	str	r1, [r5, #44]
.L289:
	add	r4, r4, #1
	str	r4, [r5, #32]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L291:
	.align	2
.L290:
	.word	portal
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animatePortal, .-animatePortal
	.align	2
	.global	updatePortal
	.type	updatePortal, %function
updatePortal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, .L299
	sub	sp, sp, #16
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ldrne	r4, .L299+4
	beq	.L298
.L293:
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #0]
	rsb	r2, r2, #0
	cmp	r3, r2
	movlt	r3, #1
	blt	.L294
	cmp	r3, #160
	movle	r3, #0
	movgt	r3, #1
.L294:
	ldr	r2, .L299+8
	ldr	r1, [r2, #0]
	ldr	r2, .L299+12
	ldr	ip, [r4, #8]
	ldr	r0, [r4, #12]
	ldr	r2, [r2, #0]
	rsb	r1, r1, ip
	rsb	r2, r2, r0
	str	r3, [r4, #52]
	stmia	r4, {r1, r2}	@ phole stm
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, r6, lr}
	b	animatePortal
.L298:
	ldr	r4, .L299+4
	ldr	r3, .L299+16
	ldr	ip, [r4, #24]
	ldr	r6, [r4, #8]
	ldr	r5, [r4, #12]
	ldr	lr, [r4, #28]
	ldr	r2, [r3, #28]
	add	r0, r3, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	ldr	r3, [r3, #24]
	str	ip, [sp, #12]
	str	r6, [sp, #0]
	stmib	sp, {r5, lr}	@ phole stm
	ldr	ip, .L299+20
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldreq	r3, .L299+24
	moveq	r2, #1
	streq	r2, [r3, #0]
	b	.L293
.L300:
	.align	2
.L299:
	.word	crystalFound
	.word	portal
	.word	vOff
	.word	hOff
	.word	player
	.word	collision
	.word	portalHide
	.size	updatePortal, .-updatePortal
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	updatePlayer
	bl	updateCrystal
	bl	updateClue
	bl	updatePortal
	ldr	r3, .L303
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L302
	ldr	r4, .L303+4
	ldr	r3, [r4, #0]
	cmp	r3, #1
	beq	.L302
	ldr	r3, .L303+8
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r3, [r4, #0]
.L302:
	ldr	r2, .L303+12
	ldr	r3, .L303+16
	ldr	r0, [r2, #20]
	ldr	r1, [r3, #0]
	ldr	r2, [r2, #28]
	rsb	r0, r2, r0
	add	r2, r1, #1
	ldr	r1, .L303+20
	str	r2, [r3, #0]
	str	r0, [r1, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L304:
	.align	2
.L303:
	.word	portalHide
	.word	count
	.word	stopSoundB
	.word	soundA
	.word	bgOffsetCounter
	.word	time
	.size	updateGame, .-updateGame
	.align	2
	.global	initTime
	.type	initTime, %function
initTime:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	initTime, .-initTime
	.align	2
	.global	drawNumber
	.type	drawNumber, %function
drawNumber:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L307
	add	r2, r2, #105
	mov	r2, r2, asl #3
	add	r3, r3, #512
	str	r4, [sp, #-4]!
	orr	r3, r3, #1024
	add	r4, ip, r2
	strh	r0, [ip, r2]	@ movhi
	strh	r1, [r4, #2]	@ movhi
	strh	r3, [r4, #4]	@ movhi
	ldmfd	sp!, {r4}
	bx	lr
.L308:
	.align	2
.L307:
	.word	shadowOAM
	.size	drawNumber, .-drawNumber
	.comm	shadowOAM,1024,4
	.comm	player,56,4
	.comm	crystal,56,4
	.comm	portal,56,4
	.comm	clue,56,4
	.comm	livesRemaining,4,4
	.comm	level,4,4
	.comm	crystalFound,4,4
	.comm	crystalCounter,4,4
	.comm	transparency,4,4
	.comm	crystalSpawn,4,4
	.comm	clueFound,4,4
	.comm	clueHide,4,4
	.comm	portalHide,4,4
	.comm	clueTileCol,4,4
	.comm	clueTileRow,4,4
	.comm	cluePalRow,4,4
	.comm	time,4,4
	.comm	count,4,4
	.comm	bgOffsetCounter,4,4
	.comm	hOff2,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
