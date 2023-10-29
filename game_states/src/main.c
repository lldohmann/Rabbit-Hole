#include <gb/gb.h>
#include <stdint.h>
#include "../res/GameFirstLoad.h"
#include "../res/GameplayStart.h"
#include "../res/CoreGameLoop.h"
#include "../res/GameplayEnd.h"
#include "../res/common.h"

void init_gfx() {
    // Load Background tiles and then map
    //set_bkg_data(0, 79u, dungeon_tiles);
    //set_bkg_tiles(0, 0, 32u, 32u, dungeon_mapPLN0);

	// Turn the background map on to make it visible
    SHOW_BKG;
}


void main(void)
{
	init_gfx();

    uint8_t currentGameState=GAMEFIRSTLOAD;
    uint8_t nextGameState=GAMEPLAYSTART;
    // Loop forever
    while(1) {
        // saVE THE LAST JOYPAD STATE
        joypadPrevious=joypadCurrent;
        joypadCurrent=joypad();

		// if we are changing game state
        if (nextGameState!=currentGameState){
            // Update our current game state
            currentGameState=nextGameState;

            // Call our game state's setup function
            if (currentGameState==GAMEPLAYSTART)GameplayStartSetup();
            else if (currentGameState==COREGAMELOOP)CoreGameLoopSetup();
            else if (currentGameState==GAMEPLAYEND)GameplayEndSetup();
        }

        // Call our game state's update function
        if (currentGameState==GAMEPLAYSTART)nextGameState=GameplayStartUpdate();
        else if (currentGameState==COREGAMELOOP)nextGameState=CoreGameLoopUpdate();
        else if (currentGameState==GAMEPLAYEND)nextGameState=GameplayEndUpdate();


		// Done processing, yield CPU and wait for start of next frame
        wait_vbl_done();
    }
}
