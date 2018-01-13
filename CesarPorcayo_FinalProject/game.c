#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "spriteSheet.h"
#include "myLib.h."
#include "collisionmap.h"
#include "collisionmap2.h"
#include "collisionmap3.h"
#include "portalSound.h" 
#include "crystalSound.h"
#include "sound.h"

ANISPRITE player;
ANISPRITE crystal; 
ANISPRITE clue;
ANISPRITE portal;
OBJ_ATTR shadowOAM[128];
int level;
int crystalCounter;
int livesRemaining;
int transparency;
int crystalSpawn;
int clueFound;
int clueHide;
int portalHide;
int clueTileCol;
int clueTileRow;
int cluePalRow;
int time;
int count;
int bgOffsetCounter;
int crystalFound;
int hOff2;

#define MAPHEIGHT 256
#define MAPWIDTH 256

enum {SMALL, MEDIUM, LARGE};

enum {CHARFRONT,CHARRIGHT, CHARLEFT, CHARBACK, CHARIDLE};


void initGame() {
	
	crystalCounter = 0;
	transparency = 1;
	livesRemaining = 1;
	crystalSpawn = 0;
	clueFound = 0;
	clueHide = 0;
	portalHide = 0;
	count = 0;
	time = soundA.duration - soundA.vbCount;
	bgOffsetCounter = 0;
	crystalFound = 0;
	hOff2 = 0;
	
	initPlayer();
	initCrystal();
	initClue();
	initPortal();
}


void updateGame() {

	updatePlayer();

	updateCrystal();
	updateClue();
	updatePortal();
	if (portalHide && count !=1) {
		stopSoundB();
		count = 1;
	}
	time = (soundA.duration - soundA.vbCount);
	bgOffsetCounter++;
	
	
	
	
	
}

void drawGame() {
	hideSprites();
	drawPlayer();


	drawCrystal();
	drawClue();
	drawPortal();
	if (level == 1) { //fixes background glitch
		shadowOAM[100].attr0 = (ROWMASK & 128 - vOff) | ATTR0_REGULAR | ATTR0_WIDE;
		shadowOAM[100].attr1 = (COLMASK & 200 - hOff) | ATTR1_LARGE;
		shadowOAM[100].attr2 = ATTR2_TILEID(9, 0) | ATTR2_PALROW(3) | ATTR2_PRIORITY(1);
		shadowOAM[101].attr0 = (ROWMASK & 136 - vOff) | ATTR0_REGULAR | ATTR0_WIDE;
		shadowOAM[101].attr1 = (COLMASK & 72 - hOff) | ATTR1_LARGE;
		shadowOAM[101].attr2 = ATTR2_TILEID(9, 0) | ATTR2_PALROW(3) | ATTR2_PRIORITY(1);
		shadowOAM[102].attr0 = (ROWMASK & 136 - vOff) | ATTR0_REGULAR | ATTR0_WIDE;
		shadowOAM[102].attr1 = (COLMASK & 0 - hOff) | ATTR1_MEDIUM;
		shadowOAM[102].attr2 = ATTR2_TILEID(9, 0) | ATTR2_PALROW(3) | ATTR2_PRIORITY(1);
		shadowOAM[103].attr0 = (ROWMASK & 136 - vOff) | ATTR0_REGULAR | ATTR0_WIDE;
		shadowOAM[103].attr1 = (COLMASK & 8 - hOff) | ATTR1_MEDIUM;
		shadowOAM[103].attr2 = ATTR2_TILEID(9, 0) | ATTR2_PALROW(3) | ATTR2_PRIORITY(1);
		shadowOAM[104].attr0 = (ROWMASK & 136 - vOff) | ATTR0_REGULAR | ATTR0_WIDE;
		shadowOAM[104].attr1 = (COLMASK & 120 - hOff) | ATTR1_LARGE;
		shadowOAM[104].attr2 = ATTR2_TILEID(9, 0) | ATTR2_PALROW(3) | ATTR2_PRIORITY(1);
	} else if (level == 2) { //fixes background glitch
		shadowOAM[100].attr0 = (ROWMASK & 136 - vOff) | ATTR0_REGULAR | ATTR0_WIDE;
		shadowOAM[100].attr1 = (COLMASK & 104 - hOff) | ATTR1_LARGE;
		shadowOAM[100].attr2 = ATTR2_TILEID(11, 0) | ATTR2_PALROW(4) | ATTR2_PRIORITY(1);
		shadowOAM[101].attr0 = (ROWMASK & 136 - vOff) | ATTR0_REGULAR | ATTR0_WIDE;
		shadowOAM[101].attr1 = (COLMASK & 216 - hOff) | ATTR1_LARGE;
		shadowOAM[101].attr2 = ATTR2_TILEID(11, 0) | ATTR2_PALROW(4) | ATTR2_PRIORITY(1);
		shadowOAM[102].attr0 = (ROWMASK & 144 - vOff) | ATTR0_REGULAR | ATTR0_WIDE;
		shadowOAM[102].attr1 = (COLMASK & 0 - hOff) | ATTR1_MEDIUM;
		shadowOAM[102].attr2 = ATTR2_TILEID(11, 0) | ATTR2_PALROW(4) | ATTR2_PRIORITY(1);
		shadowOAM[103].attr0 = (ROWMASK & 136 - vOff) | ATTR0_REGULAR | ATTR0_WIDE;
		shadowOAM[103].attr1 = (COLMASK & 160 - hOff) | ATTR1_MEDIUM;
		shadowOAM[103].attr2 = ATTR2_TILEID(11, 0) | ATTR2_PALROW(4) | ATTR2_PRIORITY(1);
		// shadowOAM[104].attr0 = (ROWMASK & 136 - vOff) | ATTR0_REGULAR | ATTR0_WIDE;
		// shadowOAM[104].attr1 = (COLMASK & 120 - hOff) | ATTR1_LARGE;
		// shadowOAM[104].attr2 = ATTR2_TILEID(9, 0) | ATTR2_PALROW(3) | ATTR2_PRIORITY(1);
	} else if (level==3) {
		//Part of BG
		shadowOAM[104].attr0 = (ROWMASK & 208 - vOff) | ATTR0_REGULAR | ATTR0_WIDE;
		shadowOAM[104].attr1 = (COLMASK & 32 - hOff) | ATTR1_LARGE;
		shadowOAM[104].attr2 = ATTR2_TILEID(26, 0) | ATTR2_PALROW(6) | ATTR2_PRIORITY(1);
		shadowOAM[105].attr0 = (ROWMASK & 208 - vOff) | ATTR0_REGULAR | ATTR0_WIDE;
		shadowOAM[105].attr1 = (COLMASK & 96 - hOff) | ATTR1_SMALL;
		shadowOAM[105].attr2 = ATTR2_TILEID(26, 10) | ATTR2_PALROW(6) | ATTR2_PRIORITY(1);
		shadowOAM[106].attr0 = (ROWMASK & 208 - vOff) | ATTR0_REGULAR | ATTR0_WIDE;
		shadowOAM[106].attr1 = (COLMASK & 136 - hOff) | ATTR1_SMALL;
		shadowOAM[106].attr2 = ATTR2_TILEID(30, 0) | ATTR2_PALROW(6) | ATTR2_PRIORITY(1);
		shadowOAM[107].attr0 = (ROWMASK & 208 - vOff) | ATTR0_REGULAR | ATTR0_WIDE;
		shadowOAM[107].attr1 = (COLMASK & 192 - hOff) | ATTR1_LARGE;
		shadowOAM[107].attr2 = ATTR2_TILEID(26, 0) | ATTR2_PALROW(6) | ATTR2_PRIORITY(1);
		shadowOAM[108].attr0 = (ROWMASK & 200 - vOff) | ATTR0_REGULAR | ATTR0_SQUARE;
		shadowOAM[108].attr1 = (COLMASK & 232 - hOff) | ATTR1_TINY;
		shadowOAM[108].attr2 = ATTR2_TILEID(30, 7) | ATTR2_PALROW(6) | ATTR2_PRIORITY(1);
	
	}
	if (!crystalFound && time < 1000) {
		if (time / 100 >= 1) {
			drawNumber(150, 40, time/100, time/100);
			drawNumber(150, 45, (time%100)/10, (time%100)/10);
			drawNumber(150, 50, time%10, time%10);
		} else if (time / 10 >= 1) {
			drawNumber(150, 40, time/10, time/10);
			drawNumber(150, 45, time % 10,time % 10);
		} else {
			drawNumber(150, 45, time%10,time%10);
		}
	}
	

	waitForVBlank();
	DMANow(3, shadowOAM, OAM, 128*4);
	REG_BG2HOFF = hOff;
	REG_BG2VOFF = vOff;
	REG_BG0HOFF = hOff;
	REG_BG0VOFF = vOff;
	
	if(level==1 || level==3) {
		REG_BG0HOFF = hOff2++/4;
	} else if (level==2) {
		REG_BG0HOFF = hOff2++;
	}
}


void initPlayer() {
	player.width = 8;
	player.height = 16;
	player.rdel = 1;
	player.cdel = 1;
	switch (level) {
		case 1:
			player.worldRow = 50;  
			player.worldCol = 115;
			break;
		case 2:
			player.worldRow = 230;  
			player.worldCol = 20;
			break;	
		case 3:
			player.worldRow = 125;  
			player.worldCol = 125;	
			break;
	}
	
	player.aniCounter = 0;
	player.curFrame = 0;
	player.numFrames = 3;
	player.aniState = CHARFRONT;

}

void updatePlayer() {
		//moves player
	switch(level) {
		case 1:
			if (BUTTON_HELD(BUTTON_UP) && collisionmapBitmap[OFFSET(player.worldRow - player.rdel, player.worldCol, 256)] 
				&& collisionmapBitmap[OFFSET(player.worldRow - player.rdel, player.worldCol + player.width - 1, 256 )] && vOff >0) {
				if (player.worldRow - player.rdel >= 0) {
					player.worldRow -= player.rdel;
				}
				
				if (player.screenRow + player.height/2 <= SCREENHEIGHT/2) {
					vOff--;
				}

			} else if (BUTTON_HELD(BUTTON_UP) && collisionmapBitmap[OFFSET(player.worldRow - player.rdel, player.worldCol, 256)] 
				&& collisionmapBitmap[OFFSET(player.worldRow - player.rdel, player.worldCol + player.width - 1, 256 )] && vOff <=0) {

				if (player.worldRow - player.rdel >= 0) {
					player.worldRow -= player.rdel;
				}
			   

			}  else if (BUTTON_HELD(BUTTON_DOWN) && collisionmapBitmap[OFFSET(player.worldRow + player.height -1 + player.rdel, player.worldCol, 256)] 
				&& collisionmapBitmap[OFFSET(player.worldRow + player.height + player.rdel - 1, player.worldCol + player.width - 1, 256)] && vOff < 96 ) {
				if (player.worldRow + player.height - 1 + player.rdel <= 256) {
					player.worldRow += player.rdel;
				}
				if (player.screenRow + player.height/2 >= SCREENHEIGHT/2) {
					vOff++;
				}

			} else if (BUTTON_HELD(BUTTON_DOWN) && collisionmapBitmap[OFFSET(player.worldRow + player.height -1 + player.rdel, player.worldCol, 256)] 
				&& collisionmapBitmap[OFFSET(player.worldRow + player.height + player.rdel - 1, player.worldCol + player.width - 1, 256)] && vOff >= 96) {
				if (player.worldRow + player.height - 1 + player.rdel <= 256) {
					player.worldRow += player.rdel;
				}
				

			} 
			if (BUTTON_HELD(BUTTON_LEFT) && collisionmapBitmap[OFFSET(player.worldRow, player.worldCol - player.cdel, 256)] 
				&& collisionmapBitmap[OFFSET(player.worldRow + player.height - 1,player.worldCol - player.cdel , 256)] && hOff > 0) {
				if (player.worldCol - player.cdel >=0) {
					player.worldCol -= player.cdel;

				}
				if (player.screenCol + player.width/2 <= SCREENWIDTH/2) {
					hOff--;
				}

			} else if (BUTTON_HELD(BUTTON_LEFT) && collisionmapBitmap[OFFSET(player.worldRow, player.worldCol - player.cdel, 256)] 
				&& collisionmapBitmap[OFFSET(player.worldRow + player.height - 1, player.worldCol - player.cdel, 256)] && hOff <= 0) {

					if (player.worldCol - player.cdel >=0) {
						player.worldCol -= player.cdel;

					}

			} else if (BUTTON_HELD(BUTTON_RIGHT) && collisionmapBitmap[OFFSET(player.worldRow, player.worldCol + player.width -1 + player.cdel, 256)] 
				&& collisionmapBitmap[OFFSET(player.worldRow + player.height - 1, player.worldCol + player.width -1 + player.cdel, 256)] && hOff < 16) {
				if (player.worldCol + player.width -1 + player.cdel <= 256) {
					player.worldCol += player.cdel;

				}
				if (player.screenCol + player.width/2 >= SCREENWIDTH/2) {
					hOff++;
				}

			} else if (BUTTON_HELD(BUTTON_RIGHT) && collisionmapBitmap[OFFSET(player.worldRow, player.worldCol + player.width -1 + player.cdel, 256)] 
				&& collisionmapBitmap[OFFSET(player.worldRow + player.height - 1, player.worldCol + player.width -1 + player.cdel, 256)] && hOff >= 16) {

				if (player.worldCol + player.width -1 + player.cdel <= 256) {
					player.worldCol += player.cdel;
				}
				

			}
			break;
		case 2:
			if (BUTTON_HELD(BUTTON_UP) && collisionmap2Bitmap[OFFSET(player.worldRow - player.rdel, player.worldCol, 256)] 
				&& collisionmap2Bitmap[OFFSET(player.worldRow - player.rdel, player.worldCol + player.width - 1, 256 )] && vOff >0) {
				if (player.worldRow - player.rdel >= 0) {
					player.worldRow -= player.rdel;
				}
				
				if (player.screenRow + player.height/2 <= SCREENHEIGHT/2) {
					vOff--;
				}

			} else if (BUTTON_HELD(BUTTON_UP) && collisionmap2Bitmap[OFFSET(player.worldRow - player.rdel, player.worldCol, 256)] 
				&& collisionmap2Bitmap[OFFSET(player.worldRow - player.rdel, player.worldCol + player.width - 1, 256 )] && vOff <=0) {

				if (player.worldRow - player.rdel >= 0) {
					player.worldRow -= player.rdel;
				}
			   

			}  else if (BUTTON_HELD(BUTTON_DOWN) && collisionmap2Bitmap[OFFSET(player.worldRow + player.height -1 + player.rdel, player.worldCol, 256)] 
				&& collisionmap2Bitmap[OFFSET(player.worldRow + player.height + player.rdel - 1, player.worldCol + player.width - 1, 256)] && vOff < 96 ) {
				if (player.worldRow + player.height - 1 + player.rdel <= 256) {
					player.worldRow += player.rdel;
				}
				if (player.screenRow + player.height/2 >= SCREENHEIGHT/2) {
					vOff++;
				}

			} else if (BUTTON_HELD(BUTTON_DOWN) && collisionmap2Bitmap[OFFSET(player.worldRow + player.height -1 + player.rdel, player.worldCol, 256)] 
				&& collisionmap2Bitmap[OFFSET(player.worldRow + player.height + player.rdel - 1, player.worldCol + player.width - 1, 256)] && vOff >= 96) {
				if (player.worldRow + player.height - 1 + player.rdel <= 256) {
					player.worldRow += player.rdel;
				}
				

			} 
			if (BUTTON_HELD(BUTTON_LEFT) && collisionmap2Bitmap[OFFSET(player.worldRow, player.worldCol - player.cdel, 256)] 
				&& collisionmap2Bitmap[OFFSET(player.worldRow + player.height - 1,player.worldCol - player.cdel , 256)] && hOff > 0) {
				if (player.worldCol - player.cdel >=0) {
					player.worldCol -= player.cdel;

				}
				if (player.screenCol + player.width/2 <= SCREENWIDTH/2) {
					hOff--;
				}

			} else if (BUTTON_HELD(BUTTON_LEFT) && collisionmap2Bitmap[OFFSET(player.worldRow, player.worldCol - player.cdel, 256)] 
				&& collisionmap2Bitmap[OFFSET(player.worldRow + player.height - 1, player.worldCol - player.cdel, 256)] && hOff <= 0) {

					if (player.worldCol - player.cdel >=0) {
						player.worldCol -= player.cdel;

					}

			} else if (BUTTON_HELD(BUTTON_RIGHT) && collisionmap2Bitmap[OFFSET(player.worldRow, player.worldCol + player.width -1 + player.cdel, 256)] 
				&& collisionmap2Bitmap[OFFSET(player.worldRow + player.height - 1, player.worldCol + player.width -1 + player.cdel, 256)] && hOff < 16) {
				if (player.worldCol + player.width -1 + player.cdel <= 256) {
					player.worldCol += player.cdel;

				}
				if (player.screenCol + player.width/2 >= SCREENWIDTH/2) {
					hOff++;
				}

			} else if (BUTTON_HELD(BUTTON_RIGHT) && collisionmap2Bitmap[OFFSET(player.worldRow, player.worldCol + player.width -1 + player.cdel, 256)] 
				&& collisionmap2Bitmap[OFFSET(player.worldRow + player.height - 1, player.worldCol + player.width -1 + player.cdel, 256)] && hOff >= 16) {

				if (player.worldCol + player.width -1 + player.cdel <= 256) {
					player.worldCol += player.cdel;
				}
				

			}
			break;
		case 3:
			if (BUTTON_HELD(BUTTON_UP) && collisionmap3Bitmap[OFFSET(player.worldRow - player.rdel, player.worldCol, 256)] 
				&& collisionmap3Bitmap[OFFSET(player.worldRow - player.rdel, player.worldCol + player.width - 1, 256 )] && vOff >0) {
				if (player.worldRow - player.rdel >= 0) {
					player.worldRow -= player.rdel;
				}
				
				if (player.screenRow + player.height/2 <= SCREENHEIGHT/2) {
					vOff--;
				}

			} else if (BUTTON_HELD(BUTTON_UP) && collisionmap3Bitmap[OFFSET(player.worldRow - player.rdel, player.worldCol, 256)] 
				&& collisionmap3Bitmap[OFFSET(player.worldRow - player.rdel, player.worldCol + player.width - 1, 256 )] && vOff <=0) {

				if (player.worldRow - player.rdel >= 0) {
					player.worldRow -= player.rdel;
				}
			   

			}  else if (BUTTON_HELD(BUTTON_DOWN) && collisionmap3Bitmap[OFFSET(player.worldRow + player.height -1 + player.rdel, player.worldCol, 256)] 
				&& collisionmap3Bitmap[OFFSET(player.worldRow + player.height + player.rdel - 1, player.worldCol + player.width - 1, 256)] && vOff < 96 ) {
				if (player.worldRow + player.height - 1 + player.rdel <= 256) {
					player.worldRow += player.rdel;
				}
				if (player.screenRow + player.height/2 >= SCREENHEIGHT/2) {
					vOff++;
				}

			} else if (BUTTON_HELD(BUTTON_DOWN) && collisionmap3Bitmap[OFFSET(player.worldRow + player.height -1 + player.rdel, player.worldCol, 256)] 
				&& collisionmap3Bitmap[OFFSET(player.worldRow + player.height + player.rdel - 1, player.worldCol + player.width - 1, 256)] && vOff >= 96) {
				if (player.worldRow + player.height - 1 + player.rdel <= 256) {
					player.worldRow += player.rdel;
				}
				

			}
			if (BUTTON_HELD(BUTTON_LEFT) && collisionmap3Bitmap[OFFSET(player.worldRow, player.worldCol - player.cdel, 256)] 
				&& collisionmap3Bitmap[OFFSET(player.worldRow + player.height - 1,player.worldCol - player.cdel , 256)] && hOff > 0) {
				if (player.worldCol - player.cdel >=0) {
					player.worldCol -= player.cdel;

				}
				if (player.screenCol + player.width/2 <= SCREENWIDTH/2) {
					hOff--;
				}

			} else if (BUTTON_HELD(BUTTON_LEFT) && collisionmap3Bitmap[OFFSET(player.worldRow, player.worldCol - player.cdel, 256)] 
				&& collisionmap3Bitmap[OFFSET(player.worldRow + player.height - 1, player.worldCol - player.cdel, 256)] && hOff <= 0) {

					if (player.worldCol - player.cdel >=0) {
						player.worldCol -= player.cdel;

					}

			} else if (BUTTON_HELD(BUTTON_RIGHT) && collisionmap3Bitmap[OFFSET(player.worldRow, player.worldCol + player.width -1 + player.cdel, 256)] 
				&& collisionmap3Bitmap[OFFSET(player.worldRow + player.height - 1, player.worldCol + player.width -1 + player.cdel, 256)] && hOff < 16) {
				if (player.worldCol + player.width -1 + player.cdel <= 256) {
					player.worldCol += player.cdel;

				}
				if (player.screenCol + player.width/2 >= SCREENWIDTH/2) {
					hOff++;
				}

			} else if (BUTTON_HELD(BUTTON_RIGHT) && collisionmap3Bitmap[OFFSET(player.worldRow, player.worldCol + player.width -1 + player.cdel, 256)] 
				&& collisionmap3Bitmap[OFFSET(player.worldRow + player.height - 1, player.worldCol + player.width -1 + player.cdel, 256)] && hOff >= 16) {

				if (player.worldCol + player.width -1 + player.cdel <= 256) {
					player.worldCol += player.cdel;
				}
				

			}
			break;
	}

	if (!crystalFound && collision(player.worldRow, player.worldCol, player.height, player.width,
        crystal.worldRow, crystal.worldCol, crystal.height, crystal.width)) {
		stopSound();
		playSoundA(crystalSound, CRYSTALSOUNDLEN, CRYSTALSOUNDFREQ, 0);
		transparency = 0;
		crystalFound = 1;
		switch(level) {
			case 1:
				portal.worldRow	= 230-(portal.height/2)+player.height/2;
				portal.worldCol	= 20 -(portal.width/2)+player.width/2;
				break;
			case 2:
				portal.worldRow	= 128-(portal.height/2)+player.height/2;
				portal.worldCol	= 128 -(portal.width/2)+player.width/2;
				break;
			case 3:
				portal.worldRow	= 50-(portal.height/2)+player.height/2;
				portal.worldCol	=  200-(portal.width/2)+player.width/2;
				break;

		}
		
		portalHide = 0;
		playSoundB(portalSound, PORTALSOUNDLEN, PORTALSOUNDFREQ, 1);
	}
	

	
	player.screenRow = player.worldRow - vOff;
	player.screenCol = player.worldCol - hOff;


	

	animatePlayer();
	
}

void drawPlayer() {

	shadowOAM[0].attr0 = (ROWMASK & player.screenRow) | ATTR0_REGULAR | ATTR0_SQUARE;
	shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_SMALL;
	shadowOAM[0].attr2 = ATTR2_TILEID(player.curFrame * 2, player.aniState * 2) | ATTR2_PALROW(0) | ATTR2_PRIORITY(1);


} 

void animatePlayer() {
	player.prevAniState = player.aniState;
	player.aniState = CHARIDLE;

	if(player.aniCounter % 20 == 0) {
		player.curFrame = (player.curFrame + 1) % player.numFrames;
	}
	
	if(BUTTON_HELD(BUTTON_UP))
		player.aniState = CHARBACK;
	if(BUTTON_HELD(BUTTON_DOWN))
		player.aniState = CHARFRONT;
	if(BUTTON_HELD(BUTTON_LEFT))
		player.aniState = CHARLEFT;
	if(BUTTON_HELD(BUTTON_RIGHT))
		player.aniState = CHARRIGHT;

	if (player.aniState == CHARIDLE) {
		player.curFrame = 0;
		player.aniState = player.prevAniState;
	} else {
		player.aniCounter++;
	}
}



void initCrystal() {
	crystal.width = 8;
	crystal.height = 16;
	crystal.worldRow = 20;
	crystal.worldCol = rand()%240;
	crystal.aniCounter = 0;
	crystal.curFrame = 0;
	crystal.numFrames = 4;
	
}

void updateCrystal() {
	if (!crystalFound) {
		int random = rand()%5000;
		if (BUTTON_HELD(BUTTON_SELECT)) {
			transparency = 0;
		} else if (random == 29) {
			transparency = 0; //random number to see if the crystal should be transparent or not
		} else {
			transparency = 1;
		}
		int randomCol = rand()%248;
		int randomRow = rand()%240;

		if (crystalSpawn % 500 == 0 && crystalSpawn != 0) {
			crystal.worldRow = randomRow; //some random values
			crystal.worldCol = randomCol;
			playSoundB(crystalSound, CRYSTALSOUNDLEN, CRYSTALSOUNDFREQ, 0);
			if (crystalSpawn == 500) {
				portalHide = 1;
			}
			

		}

		crystalSpawn++;
		 
		crystal.hide = (crystal.screenRow < -crystal.height ||crystal.screenRow > 160) ? 1 : 0;
	}
	


	crystal.screenRow = crystal.worldRow - vOff;
	crystal.screenCol = crystal.worldCol - hOff;
	
	
}

void drawCrystal() {
	//Draws respective crystal based on level
	switch(level) {
		case 1:
			if (!crystalFound) {
				shadowOAM[LVL2CRYSTALINDEX].attr0 = ATTR0_HIDE;
				shadowOAM[LVL3CRYSTALINDEX].attr0 = ATTR0_HIDE;
				if (crystal.hide || (transparency)) {
					shadowOAM[LVL1CRYSTALINDEX].attr0 = ATTR0_HIDE;
				} else {
					shadowOAM[LVL1CRYSTALINDEX].attr0 = (ROWMASK & crystal.screenRow) | ATTR0_REGULAR | ATTR0_SQUARE;
					shadowOAM[LVL1CRYSTALINDEX].attr1 = (COLMASK & crystal.screenCol) | ATTR1_SMALL;
					shadowOAM[LVL1CRYSTALINDEX].attr2 = ATTR2_TILEID(0,8) | ATTR2_PALROW(0) | ATTR2_PRIORITY(1);
				}
			} else {
				shadowOAM[LVL1CRYSTALINDEX].attr0 = 142 | ATTR0_REGULAR | ATTR0_SQUARE;
				shadowOAM[LVL1CRYSTALINDEX].attr1 = 20 | ATTR1_SMALL;
				shadowOAM[LVL1CRYSTALINDEX].attr2 = ATTR2_TILEID(0,8) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0);
			}
			
			break;
		case 2:
			if (!crystalFound) {
				shadowOAM[LVL3CRYSTALINDEX].attr0 = ATTR0_HIDE;
				shadowOAM[LVL1CRYSTALINDEX].attr0 = ATTR0_HIDE;
				if (crystal.hide || (transparency)) {
					shadowOAM[LVL2CRYSTALINDEX].attr0 = ATTR0_HIDE;
				} else {
					shadowOAM[LVL2CRYSTALINDEX].attr0 = (ROWMASK & crystal.screenRow) | ATTR0_REGULAR | ATTR0_SQUARE;
					shadowOAM[LVL2CRYSTALINDEX].attr1 = (COLMASK & crystal.screenCol) | ATTR1_SMALL;
					shadowOAM[LVL2CRYSTALINDEX].attr2 = ATTR2_TILEID(2,8) | ATTR2_PALROW(0) | ATTR2_PRIORITY(1);
				}
			} else {
				shadowOAM[LVL2CRYSTALINDEX].attr0 = 142 | ATTR0_REGULAR | ATTR0_SQUARE;
				shadowOAM[LVL2CRYSTALINDEX].attr1 = 30 | ATTR1_SMALL;
				shadowOAM[LVL2CRYSTALINDEX].attr2 = ATTR2_TILEID(2,8) | ATTR2_PALROW(1) | ATTR2_PRIORITY(0);
			}
			shadowOAM[LVL1CRYSTALINDEX].attr0 = 142 | ATTR0_REGULAR | ATTR0_SQUARE;
			shadowOAM[LVL1CRYSTALINDEX].attr1 = 20 | ATTR1_SMALL;
			shadowOAM[LVL1CRYSTALINDEX].attr2 = ATTR2_TILEID(0,8) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0);
			break;
		case 3:
			if (!crystalFound) {
				shadowOAM[LVL2CRYSTALINDEX].attr0 = ATTR0_HIDE;
				shadowOAM[LVL1CRYSTALINDEX].attr0 = ATTR0_HIDE;
				if (crystal.hide || (transparency)) {
					shadowOAM[LVL3CRYSTALINDEX].attr0 = ATTR0_HIDE;
				} else {
					shadowOAM[LVL3CRYSTALINDEX].attr0 = (ROWMASK & crystal.screenRow) | ATTR0_REGULAR | ATTR0_SQUARE;
					shadowOAM[LVL3CRYSTALINDEX].attr1 = (COLMASK & crystal.screenCol) | ATTR1_SMALL;
					shadowOAM[LVL3CRYSTALINDEX].attr2 = ATTR2_TILEID(4,8) | ATTR2_PALROW(0) | ATTR2_PRIORITY(1);
				}
			} else {
				shadowOAM[LVL3CRYSTALINDEX].attr0 = 142 | ATTR0_REGULAR | ATTR0_SQUARE;
				shadowOAM[LVL3CRYSTALINDEX].attr1 = 40 | ATTR1_SMALL;
				shadowOAM[LVL3CRYSTALINDEX].attr2 = ATTR2_TILEID(4,8) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0);
			}
			shadowOAM[LVL1CRYSTALINDEX].attr0 = 142 | ATTR0_REGULAR | ATTR0_SQUARE;
			shadowOAM[LVL1CRYSTALINDEX].attr1 = 20 | ATTR1_SMALL;
			shadowOAM[LVL1CRYSTALINDEX].attr2 = ATTR2_TILEID(0,8) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0);
			shadowOAM[LVL2CRYSTALINDEX].attr0 = 142 | ATTR0_REGULAR | ATTR0_SQUARE;
			shadowOAM[LVL2CRYSTALINDEX].attr1 = 30 | ATTR1_SMALL;
			shadowOAM[LVL2CRYSTALINDEX].attr2 = ATTR2_TILEID(2,8) | ATTR2_PALROW(1) | ATTR2_PRIORITY(0);
			
			break;
		case 4:
			switch(pauseSelect) {
				case RESUME:
						shadowOAM[LVL1CRYSTALINDEX].attr0 = 27 | ATTR0_REGULAR | ATTR0_SQUARE;
						shadowOAM[LVL1CRYSTALINDEX].attr1 = 75 | ATTR1_SMALL;
						shadowOAM[LVL1CRYSTALINDEX].attr2 = ATTR2_TILEID(0,8) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0);
						
						shadowOAM[LVL2CRYSTALINDEX].attr0 = ATTR0_HIDE;
						shadowOAM[LVL3CRYSTALINDEX].attr0 = ATTR0_HIDE;
						break;
				case CONTROLS: 
					shadowOAM[LVL2CRYSTALINDEX].attr0 = 53 | ATTR0_REGULAR | ATTR0_SQUARE;
					shadowOAM[LVL2CRYSTALINDEX].attr1 = 70 | ATTR1_SMALL;
					shadowOAM[LVL2CRYSTALINDEX].attr2 = ATTR2_TILEID(2,8) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0);

					shadowOAM[LVL1CRYSTALINDEX].attr0 = ATTR0_HIDE;
					shadowOAM[LVL3CRYSTALINDEX].attr0 = ATTR0_HIDE;
					break;
				case EXIT:
					shadowOAM[LVL3CRYSTALINDEX].attr0 = 80 | ATTR0_REGULAR | ATTR0_SQUARE;
					shadowOAM[LVL3CRYSTALINDEX].attr1 = 87 | ATTR1_SMALL;
					shadowOAM[LVL3CRYSTALINDEX].attr2 = ATTR2_TILEID(4,8) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0);

					shadowOAM[LVL1CRYSTALINDEX].attr0 = ATTR0_HIDE;
					shadowOAM[LVL2CRYSTALINDEX].attr0 = ATTR0_HIDE;
					break;

			}
	}
	
}
			


void initClue() {
	clue.width = 8;
	clue.height = 12;
	clue.worldRow = 120;//rand()%256
	clue.worldCol = 40;
	clue.aniCounter = 0;
	clue.curFrame = 0;
	clue.numFrames = 4;
	
}

void updateClue() {
	if (!clueFound) {
		if (collision(player.worldRow, player.worldCol, player.height, player.width, clue.worldRow, clue.worldCol, clue.height, clue.width)) {
			clueFound = 1;
			clueHide = 1;
		}
		 
		clue.hide = (clue.screenRow < -clue.height ||clue.screenRow > 160) ? 1 : 0;


		clue.screenRow = clue.worldRow - vOff;
		clue.screenCol = clue.worldCol - hOff;
	} else if (clueFound){
		clue.screenRow = 145;
		clue.screenCol = 200;
	}

	animateClue();
		
}

void drawClue() { // the clue is going to be a marker that turns a color whenever ur within the the distance of the crystal

	if(clue.hide && !clueFound) {
		shadowOAM[CLUEINDEX].attr0 = ATTR0_HIDE;
	} else {
		shadowOAM[CLUEINDEX].attr0 = (ROWMASK & clue.screenRow) | ATTR0_REGULAR | ATTR0_TALL;
		shadowOAM[CLUEINDEX].attr1 = (COLMASK & clue.screenCol) | ATTR1_TINY;
		shadowOAM[CLUEINDEX].attr2 = ATTR2_TILEID(clueTileRow,clueTileCol) | ATTR2_PALROW(cluePalRow) | ATTR2_PRIORITY(0);
	}
}

void animateClue() {

	if(clue.aniCounter % 15 == 0 && !clueFound) {
		clue.curFrame = (clue.curFrame + 1) % clue.numFrames;
		clueTileRow = clue.curFrame * 2;
		clueTileCol = 10;
		cluePalRow = 0;
	} else if (clueFound && !crystalFound) {
		if (player.worldRow	> crystal.worldRow && player.worldRow - crystal.worldRow < 50) { // && player.worldRow - crystal.worldRow >= 30) { //within 5o pixels
			if (player.worldCol	> crystal.worldCol && player.worldCol - crystal.worldCol < 50) { // && player.worldCol - crystal.worldCol >= 30 ) {
				clueTileCol	= 25;
				clueTileRow	= 0;
				cluePalRow = 2;
			} else if (player.worldCol	< crystal.worldCol && crystal.worldCol - player.worldCol < 50) { // && crystal.worldCol - player.worldCol >= 30) {
				clueTileCol	= 25;
				clueTileRow	= 0;
				cluePalRow = 2;
			}
		} else if (player.worldRow	< crystal.worldRow && crystal.worldRow - player.worldRow < 50) { // && crystal.worldRow - player.worldRow >= 30) { //within 5o pixels
			if (player.worldCol	> crystal.worldCol && player.worldCol - crystal.worldCol < 50) { // && player.worldCol - crystal.worldCol >=30) {
				clueTileCol	= 25;
				clueTileRow	= 0;
				cluePalRow = 2;
			} else if (player.worldCol	< crystal.worldCol && crystal.worldCol - player.worldCol < 50) { // && crystal.worldCol - player.worldCol >= 30) {
				clueTileCol	= 25;
				clueTileRow	= 0;
				cluePalRow = 2;
			}
		} else {
			clueTileRow = 0;
			clueTileCol = 10;
			cluePalRow = 0;	
		}
	}
	clue.aniCounter++;
}

void initPortal() {
	portal.width = 32;
	portal.height = 32;
	portal.worldRow = player.worldRow-(portal.height/2)+player.height/2;  
	portal.worldCol = player.worldCol-(portal.width/2)+player.width/2;
	portal.aniCounter = 0;
	portal.curFrame = 0;
	portal.numFrames = 4;
	
}

void updatePortal() {
	
	if (!crystalFound && !collision(player.worldRow, player.worldCol, player.height, player.width, portal.worldRow,portal.worldCol, portal.height, portal.width)) {
		portalHide = 1;
	}
	 
	portal.hide = (portal.screenRow < -portal.height ||portal.screenRow > 160) ? 1 : 0;


	portal.screenRow = portal.worldRow - vOff;
	portal.screenCol = portal.worldCol - hOff;
	animatePortal();
	
	
}

void drawPortal() { // the clue is going to be a marker that turns a color whenever ur within the the distance of the crystal

	if(portal.hide ||portalHide) {
		shadowOAM[PORTALINDEX].attr0 = ATTR0_HIDE;
	} else {
		shadowOAM[PORTALINDEX].attr0 = (ROWMASK & portal.screenRow) | ATTR0_REGULAR | ATTR0_SQUARE;
		shadowOAM[PORTALINDEX].attr1 = (COLMASK & portal.screenCol) | ATTR1_MEDIUM;
		shadowOAM[PORTALINDEX].attr2 = ATTR2_TILEID(portal.curFrame * 4,12 + (level-1)*4) | ATTR2_PALROW(level-1) | ATTR2_PRIORITY(1);
	}
}

void animatePortal() {

	if(portal.aniCounter % 10 == 0) {
		portal.curFrame = (portal.curFrame + 1) % portal.numFrames;
	}
	portal.aniCounter++;
}
			
void initTime() {

}

void drawNumber(int worldRow, int worldCol, int index, int tileworldCol) {
	shadowOAM[105 + index].attr0 = worldRow | ATTR0_REGULAR | ATTR0_SQUARE;
	shadowOAM[105 + index].attr1 = worldCol | ATTR1_TINY;
	shadowOAM[105 + index].attr2 = ATTR2_TILEID(16,tileworldCol) | ATTR2_PALROW(0) | ATTR2_PRIORITY(1);
}



//RegB0CTL  add priority level at end od this ; highernumber more infront 
// has to do with alpha blending 
