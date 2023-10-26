#include <gb/gb.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <gb/metasprites.h>
#include "Alice.h"

#define MAX(x, y) (((x) > (y)) ? (x) : (y))
#define MIN(x, y) (((x) < (y)) ? (x) : (y))
#define ABS(x) ((x < 0) ? -x : x)

#define FLOOR_Y 100

#define ALICE_RUN_FRAMECOUNT 3

// PLAYER VARIABLES
uint16_t aliceX = 40; // FACE VALUE (HOLDS FRACTIONAL PART)
uint16_t aliceDrawX = 40; // TRUE VALUE
uint8_t aliceFrame = 0; // FACE VALUE (HOLDS FRACTIONAL PART)
uint16_t aliceDrawFrame; // TRUE VALUE
uint8_t aliceDirection;
// JOYPAD VARIABLES
uint8_t joypadCurrent=0;
uint8_t joypadPrevious=0;
// TEST VARIABLES
uint16_t answer = 8738;
uint8_t speed = 24;
uint8_t currentSpeed=0;

// DEFINE ALICE METASPRITE
const metasprite_t alice_metasprite[] = {
    {.dy=-16, .dx=-8, .dtile=0, .props=0},
    {.dy=0, .dx=8, .dtile=2, .props=0},
    {.dy=16, .dx=-8, .dtile=8, .props=0},
    {.dy=0, .dx=8, .dtile=10, .props=0},
    METASPR_TERM
};

// CUSTOM FUNCTION TO PRINT NUMBERS OF A SPECIFIED AMOUNT OF DIGITS
void DrawNumber(uint8_t x,uint8_t y, uint16_t number,uint8_t digits){

    unsigned char buffer[8]={'0','0','0','0','0','0','0','0',};

    // Convert the number to a decimal string (stored in the buffer char array)
    uitoa(number, buffer, 10);

    // The background address of the first digit
    uint8_t *vramAddr= get_bkg_xy_addr(x,y);

    // Get the length of the number so we can add leading zeroes
    uint8_t len =strlen(buffer);

    // Add some leading zeroes
    // uitoa will not do this for us
    // Increase the VRAM address each iteration to move to the next tile
    for(uint8_t i=0;i<digits-len;i++)        
        set_vram_byte(vramAddr++,272);
        
    // Draw our number
    // Increase the VRAM address each iteration to move to the next tile
    for(uint8_t i=0;i<len;i++)        
        set_vram_byte(vramAddr++,(buffer[i]-'0')+272);
}

int8_t HandleInput()
{
    int8_t movement = 0;
    if(joypadCurrent & J_LEFT)
    {
        movement = -1;
        aliceDirection=0;
    }
    else if (joypadCurrent & J_RIGHT)
    {
        movement = 1;
        aliceDirection = 1;
        if (currentSpeed < speed)
        {
            currentSpeed+=2;
        }
    }
    else if (joypadCurrent & J_UP)
    {
        speed++;
    }
    else if (joypadCurrent & J_DOWN)
    {
        speed--;
    }
    else{
        if (currentSpeed!=0)
        {
            currentSpeed-=2;
        }
    }
    return movement;
}
/**
void printFloat16(uint16_t num)
{
    sprintf("\nFloating #: %d.%d \n", num>>8, (num&0xFF)*1000/(1<<8));
}
**/

void main(void)
{
    set_sprite_data(0, 24, AliceTileLabel); // put alice tiles in VRAM
    // INIT graphics
    SHOW_BKG;
    SHOW_SPRITES;
    SPRITES_8x16;
    DISPLAY_ON;
    printf("DrawX:\n");


    aliceX = 80;
    aliceDrawX = aliceX;
    aliceDrawFrame = aliceFrame;

    uint8_t startingSprite=0;
    startingSprite+=move_metasprite(alice_metasprite, 0, startingSprite, aliceDrawX, FLOOR_Y);
    hide_sprites_range(startingSprite, 40);

    // Loop forever
    while(1) { 
        // GET INPUT
        joypadPrevious=joypadCurrent;
        joypadCurrent=joypad();
        int16_t movement= HandleInput();
        // SUBPIXEL RESOLUTION
        // Increase / decrease the "face" value
        aliceX+=movement*currentSpeed; // this is alice's velocity we're calculating
        //printf("speed: %d\n", speed);
        // Draw Alice at the true value
        aliceDrawX=aliceX>>4;

		// Game main loop processing goes here
        // DRAW ALICE LOGIC AT THE END OF ALL CODE
        if (aliceDirection==1)move_metasprite(alice_metasprite, 0, 0,aliceDrawX, FLOOR_Y);
        else move_metasprite_vflip(alice_metasprite, 0, 0, aliceDrawX+4,FLOOR_Y);

		// Done processing, yield CPU and wait for start of next frame
        DrawNumber(6, 0, aliceDrawX, 4);
        DrawNumber(6, 1, currentSpeed,4);
        wait_vbl_done();
    }
}
