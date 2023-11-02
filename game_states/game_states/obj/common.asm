;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module common
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _DrawNumber
	.globl _strlen
	.globl _uitoa
	.globl _get_bkg_xy_addr
	.globl _set_vram_byte
	.globl _joypadPrevious
	.globl _joypadCurrent
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_joypadCurrent::
	.ds 1
_joypadPrevious::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;res\common.c:10: void DrawNumber(uint8_t x, uint8_t y, uint16_t number, uint8_t digits)
;	---------------------------------
; Function DrawNumber
; ---------------------------------
_DrawNumber::
	add	sp, #-20
	ldhl	sp,	#16
	ld	(hl-), a
	ld	(hl), e
;res\common.c:12: unsigned char buffer[8]="00000000";
	ldhl	sp,	#0
	ld	a,#0x30
	ld	(hl+),a
	ld	(hl+), a
	ld	a,#0x30
	ld	(hl+),a
	ld	(hl+), a
	ld	a,#0x30
	ld	(hl+),a
	ld	(hl+), a
	ld	a, #0x30
	ld	(hl+), a
	ld	(hl), #0x30
;res\common.c:15: uitoa(number, buffer, 10);
	ldhl	sp,	#22
	ld	a, (hl)
	ldhl	sp,	#18
	ld	(hl), a
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#19
	ld	(hl), a
	ld	a, #0x0a
	push	af
	inc	sp
	ld	hl, #1
	add	hl, sp
	push	hl
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_uitoa
	add	sp, #5
;res\common.c:18: uint8_t *vramAddr = get_bkg_xy_addr(x,y); 
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_get_bkg_xy_addr
	pop	hl
	ldhl	sp,	#18
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
;res\common.c:21: uint8_t len = strlen(buffer);
	ld	hl, #0
	add	hl, sp
	push	hl
	call	_strlen
	pop	hl
	ldhl	sp,	#18
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
;res\common.c:26: for (uint8_t i=0; i<digits-len;i++)
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#17
	ld	(hl), a
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#18
	ld	(hl+), a
	ld	(hl), #0x00
00104$:
	ldhl	sp,	#24
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#14
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#19
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#13
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00133$
	bit	7, d
	jr	NZ, 00134$
	cp	a, a
	jr	00134$
00133$:
	bit	7, d
	jr	Z, 00134$
	scf
00134$:
	jr	NC, 00101$
;res\common.c:28: set_vram_byte(vramAddr++, 272);
	ldhl	sp,	#17
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#17
	inc	(hl)
	jr	NZ, 00135$
	inc	hl
	inc	(hl)
00135$:
	ld	a, #0x10
	push	af
	inc	sp
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_set_vram_byte
	add	sp, #3
;res\common.c:26: for (uint8_t i=0; i<digits-len;i++)
	ldhl	sp,	#19
	inc	(hl)
	jr	00104$
00101$:
;res\common.c:33: for (uint8_t i=0; i<len; i++)
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, #0x00
00107$:
	ld	a, e
	ldhl	sp,	#8
	sub	a, (hl)
	jr	NC, 00109$
;res\common.c:35: set_vram_byte(vramAddr++, (buffer[i] -'0')+272);
	push	de
	ld	d, #0x00
	ld	hl, #2
	add	hl, sp
	add	hl, de
	pop	de
	ld	a, (hl)
	add	a, #0xe0
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	bc
	push	de
	push	af
	inc	sp
	push	hl
	call	_set_vram_byte
	add	sp, #3
	pop	de
;res\common.c:33: for (uint8_t i=0; i<len; i++)
	inc	e
	jr	00107$
00109$:
;res\common.c:37: }
	add	sp, #20
	pop	hl
	add	sp, #3
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
