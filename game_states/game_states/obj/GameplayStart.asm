;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module GameplayStart
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _GameplayStartUpdate
	.globl _GameplayStartSetup
	.globl _puts
	.globl _printf
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
;res\GameplayStart.c:6: void GameplayStartSetup(){
;	---------------------------------
; Function GameplayStartSetup
; ---------------------------------
_GameplayStartSetup::
;res\GameplayStart.c:8: printf("  Area of a Circle\n\n");
	ld	de, #___str_23
	call	_puts
;res\GameplayStart.c:9: printf("This C program uses ");
	ld	de, #___str_4
	push	de
	call	_printf
	pop	hl
;res\GameplayStart.c:10: printf("fixed point notation");
	ld	de, #___str_5
	push	de
	call	_printf
	pop	hl
;res\GameplayStart.c:11: printf("for calculations as ");
	ld	de, #___str_6
	push	de
	call	_printf
	pop	de
;res\GameplayStart.c:19: printf("Press A to continue.\n");
	ld	de, #___str_30
;res\GameplayStart.c:20: }
	jp	_puts
___str_4:
	.ascii "This C program uses "
	.db 0x00
___str_5:
	.ascii "fixed point notation"
	.db 0x00
___str_6:
	.ascii "for calculations as "
	.db 0x00
___str_23:
	.ascii "     Exercise 1"
	.db 0x0a
	.ascii "  Area of a Circle"
	.db 0x0a
	.db 0x00
___str_30:
	.ascii "original hardware "
	.db 0x0a
	.ascii "didn't support "
	.db 0x0a
	.ascii "floating point"
	.db 0x0a
	.ascii "numbers. "
	.db 0x0a
	.db 0x0a
	.ascii "A state machine is "
	.db 0x0a
	.ascii "used to organize the"
	.db 0x0a
	.ascii "program."
	.db 0x0a
	.ascii "Press A to continue."
	.db 0x00
;res\GameplayStart.c:21: uint8_t GameplayStartUpdate(){
;	---------------------------------
; Function GameplayStartUpdate
; ---------------------------------
_GameplayStartUpdate::
;res\GameplayStart.c:22: joypadPrevious=joypadCurrent;
	ld	a, (#_joypadCurrent)
	ld	(#_joypadPrevious),a
;res\GameplayStart.c:23: joypadCurrent=joypad();
	call	_joypad
;res\GameplayStart.c:25: if (joypadCurrent && J_A) return COREGAMELOOP;
	ld	(#_joypadCurrent),a
	or	a, a
;res\GameplayStart.c:26: else return GAMEPLAYSTART;
	ld	a, #0x03
	ret	NZ
	ld	a, #0x01
;res\GameplayStart.c:27: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
