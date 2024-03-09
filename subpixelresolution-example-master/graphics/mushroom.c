//AUTOGENERATED FILE FROM png2asset

#include <stdint.h>
#include <gbdk/platform.h>
#include <gbdk/metasprites.h>

BANKREF(mushroom)

const palette_color_t mushroom_palettes[4] = {
	RGB8(255,128, 64), RGB8(  0,  0,  0), RGB8(168,168,168), RGB8(248,248,248)
	
};

const uint8_t mushroom_tiles[64] = {
	0x07,0x00,0x1e,0x07,
	0x3e,0x1f,0x7c,0x3f,
	0x79,0x3f,0x83,0x7f,
	0xb3,0x7f,0xf9,0x7f,
	0xf8,0x7f,0xb0,0x7f,
	0x8f,0x70,0x7f,0x0d,
	0x3f,0x1d,0x3f,0x1f,
	0x1f,0x0f,0x0f,0x00,
	
0xe0,0x00,0x18,0xe0,
	0x1c,0xf8,0x0e,0xfc,
	0xe6,0xfc,0xf1,0xfe,
	0xf1,0xfe,0xe7,0xfe,
	0x1f,0xfe,0x0d,0xfe,
	0xf1,0x0e,0xfe,0xb0,
	0xfc,0xb8,0xfc,0xf8,
	0xf8,0xf0,0xf0,0x00
	
};

const metasprite_t mushroom_metasprite0[] = {
	METASPR_ITEM(-8, -8, 0, 0), METASPR_ITEM(0, 8, 2, 0), METASPR_TERM
};

const metasprite_t* const mushroom_metasprites[1] = {
	mushroom_metasprite0
};