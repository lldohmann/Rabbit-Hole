#include <gb/gb.h>
#include <stdint.h>
#include <stdio.h>
#include "../res/common.h"

void CoreGameLoopSetup(){
    fill_bkg_rect(0,0,31,31, 0);
    printf("This is the core game loop.\n");
    printf("Press B to change states again.\n");
}
uint8_t CoreGameLoopUpdate(){
    if (joypadCurrent && J_B) return GAMEPLAYEND;
    else return COREGAMELOOP;
}