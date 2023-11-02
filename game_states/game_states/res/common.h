#define GAMEFIRSTLOAD 0
#define GAMEPLAYSTART 1
#define GAMEPLAYEND 2
#define COREGAMELOOP 3

extern uint8_t joypadPrevious, joypadCurrent;
extern void DrawNumber(uint8_t x, uint8_t y, uint16_t number, uint8_t digits);
