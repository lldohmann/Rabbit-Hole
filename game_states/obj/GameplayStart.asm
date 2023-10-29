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
;res\GameplayStart.c:3: void GameplayStartSetup(){}
;	---------------------------------
; Function GameplayStartSetup
; ---------------------------------
_GameplayStartSetup::
	ret
;res\GameplayStart.c:4: uint8_t GameplayStartUpdate(){}
;	---------------------------------
; Function GameplayStartUpdate
; ---------------------------------
_GameplayStartUpdate::
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
