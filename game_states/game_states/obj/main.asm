;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _init_gfx
	.globl _GameplayEndUpdate
	.globl _GameplayEndSetup
	.globl _CoreGameLoopUpdate
	.globl _CoreGameLoopSetup
	.globl _GameplayStartUpdate
	.globl _GameplayStartSetup
	.globl _wait_vbl_done
	.globl _joypad
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
;src\main.c:9: void init_gfx() {
;	---------------------------------
; Function init_gfx
; ---------------------------------
_init_gfx::
;src\main.c:15: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src\main.c:16: }
	ret
;src\main.c:18: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src\main.c:20: init_gfx();
	call	_init_gfx
;src\main.c:22: uint8_t currentGameState=GAMEFIRSTLOAD;
;src\main.c:23: uint8_t nextGameState=GAMEPLAYSTART;
	ld	bc, #0x100
;src\main.c:26: while(1) {
00120$:
;src\main.c:28: joypadPrevious=joypadCurrent;
	ld	a, (#_joypadCurrent)
	ld	(#_joypadPrevious),a
;src\main.c:29: joypadCurrent=joypad();
	call	_joypad
	ld	(#_joypadCurrent),a
;src\main.c:35: if (nextGameState!=currentGameState){
	ld	a, c
	sub	a, b
	jr	Z, 00110$
;src\main.c:37: currentGameState=nextGameState;
	ld	c, b
;src\main.c:40: if (currentGameState==GAMEPLAYSTART)GameplayStartSetup();
	ld	a, b
	dec	a
	jr	NZ, 00107$
	push	bc
	call	_GameplayStartSetup
	pop	bc
	jr	00110$
00107$:
;src\main.c:41: else if (currentGameState==COREGAMELOOP)CoreGameLoopSetup();
	ld	a, b
	sub	a, #0x03
	jr	NZ, 00104$
	push	bc
	call	_CoreGameLoopSetup
	pop	bc
	jr	00110$
00104$:
;src\main.c:42: else if (currentGameState==GAMEPLAYEND)GameplayEndSetup();
	ld	a, b
	sub	a, #0x02
	jr	NZ, 00110$
	push	bc
	call	_GameplayEndSetup
	pop	bc
00110$:
;src\main.c:46: if (currentGameState==GAMEPLAYSTART)nextGameState=GameplayStartUpdate();
	ld	a, c
	dec	a
	jr	NZ, 00117$
	push	bc
	call	_GameplayStartUpdate
	pop	bc
	ld	b, a
	jr	00118$
00117$:
;src\main.c:47: else if (currentGameState==COREGAMELOOP)nextGameState=CoreGameLoopUpdate();
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00114$
	push	bc
	call	_CoreGameLoopUpdate
	pop	bc
	ld	b, a
	jr	00118$
00114$:
;src\main.c:48: else if (currentGameState==GAMEPLAYEND)nextGameState=GameplayEndUpdate();
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00118$
	push	bc
	call	_GameplayEndUpdate
	pop	bc
	ld	b, a
00118$:
;src\main.c:52: wait_vbl_done();
	call	_wait_vbl_done
;src\main.c:54: }
	jr	00120$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
