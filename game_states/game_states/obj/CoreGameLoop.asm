;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module CoreGameLoop
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CoreGameLoopUpdate
	.globl _CoreGameLoopSetup
	.globl _puts
	.globl _fill_bkg_rect
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;res\CoreGameLoop.c:6: void CoreGameLoopSetup(){
;	---------------------------------
; Function CoreGameLoopSetup
; ---------------------------------
_CoreGameLoopSetup::
;res\CoreGameLoop.c:7: fill_bkg_rect(0,0,31,31, 0);
	xor	a, a
	ld	h, a
	ld	l, #0x1f
	push	hl
	ld	a, #0x1f
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	xor	a, a
	call	_fill_bkg_rect
	add	sp, #5
;res\CoreGameLoop.c:9: printf("Press B to change states again.\n");
	ld	de, #___str_4
;res\CoreGameLoop.c:10: }
	jp	_puts
___str_4:
	.ascii "This is the core game loop."
	.db 0x0a
	.ascii "Press B to change states again."
	.db 0x00
;res\CoreGameLoop.c:11: uint8_t CoreGameLoopUpdate(){
;	---------------------------------
; Function CoreGameLoopUpdate
; ---------------------------------
_CoreGameLoopUpdate::
;res\CoreGameLoop.c:12: if (joypadCurrent && J_B) return GAMEPLAYEND;
	ld	a, (#_joypadCurrent)
	or	a, a
;res\CoreGameLoop.c:13: else return COREGAMELOOP;
	ld	a, #0x02
	ret	NZ
	ld	a, #0x03
;res\CoreGameLoop.c:14: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
