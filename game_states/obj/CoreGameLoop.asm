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
;res\CoreGameLoop.c:3: void CoreGameLoopSetup(){}
;	---------------------------------
; Function CoreGameLoopSetup
; ---------------------------------
_CoreGameLoopSetup::
	ret
;res\CoreGameLoop.c:4: uint8_t CoreGameLoopUpdate(){}
;	---------------------------------
; Function CoreGameLoopUpdate
; ---------------------------------
_CoreGameLoopUpdate::
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
