#include <gb/gb.h>
#include <stdint.h>
#include <stdio.h>
#include "../res/common.h"

void GameplayStartSetup(){
    printf("     Exercise 1\n");
    printf("  Area of a Circle\n\n");
    printf("This C program uses ");
    printf("fixed point notation");
    printf("for calculations as ");
    printf("original hardware \n");
    printf("didn't support \n");
    printf("floating point\n");
    printf("numbers. \n\n");
    printf("A state machine is \n");
    printf("used to organize the"); 
    printf("program.\n");
    printf("Press A to continue.\n");
}
uint8_t GameplayStartUpdate(){
    joypadPrevious=joypadCurrent;
    joypadCurrent=joypad();

    if (joypadCurrent && J_A) return COREGAMELOOP;
    else return GAMEPLAYSTART;
}