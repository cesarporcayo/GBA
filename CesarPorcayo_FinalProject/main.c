/*****************************************
I am making a game where a character must collect hidden 
crystals from each level in order to move onto the next.
As of now, I have the character moving and all necessary sprites showing up
and collsion and animation working. So if you collect the crystal you move on to next
level. However, only one level currently is functional. Backgrounds scroll 
as expected. The clue is not fully established yet, however its sprite is available. 
I still have to add more to environment and have a more interacting environment with player.
Most importantly though I have to find a way to control crystal locations and clues given.
******************************************/


#include "myLib.h"
#include "level1Background.h"
#include "title.h"
#include "game.h"
#include "background.h"
#include "lose.h"
#include "win.h"
#include "pause.h"
#include "spriteSheet.h"
#include "instructionsBackground.h"
#include "level2Background.h"
#include "level3Background.h"
#include "level1Dash.h"
#include "level2Dash.h"
#include "level3Dash.h"
#include "sound.h"
#include "level1Sound.h"
#include "level2Sound.h"
#include "level3Sound.h" 
#include "titleSound.h"
#include "portalSound.h"
#include "cloudsBackground.h"
#include "controlsBackground.h"


void initialize();
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();
void goToLevel1();
void goToLevel2();
void goToLevel3();

enum {START, GAME, PAUSE, WIN, LOSE, INSTRUCTIONS, CONTROLS1};

int state;
int seed;
int pauseSelect;

unsigned short buttons;
unsigned short oldButtons;

int hOff;
int vOff;
int oldLevel;


int main() {

    initialize();

    while(1) {

       switch(state) {

            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case CONTROLS1:
                controls();
                break;
        }

        oldButtons = buttons;
        buttons = BUTTONS;
	}
}

void initialize() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    buttons = BUTTONS;

    setupSounds();
    setupInterrupts();

    goToStart();
    level = 1;
}

void goToStart() {
    REG_BG1VOFF = 0;
    REG_BG1HOFF = 0;
    level = 1;
    
    loadPalette(titlePal);
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30) | 1;

    DMANow(3, titleTiles, &CHARBLOCK[0], titleTilesLen/2);
    
    DMANow(3, titleMap, &SCREENBLOCK[30], titleMapLen/2);

    DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);
    DMANow(3, spriteSheetPal, SPRITEPALETTE, 256);

    playSoundA(titleSound, TITLESOUNDLEN, TITLESOUNDFREQ, 1);
    hideSprites();
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;

    state = START;

    player.width = 8; //INTRO ANIMATION
    player.height = 16;
    player.rdel = 1;
    player.cdel = 1;
    player.screenRow = 35;  
    player.screenCol = 200;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = 2;

    portal.width = 32;
    portal.height = 32;
    portal.screenRow = 40;
    portal.screenCol = 102;
    portal.aniCounter = 0;
    portal.curFrame = 0;
    portal.numFrames = 4;

    seed = 0;
}

void start() {

    seed++;
    
    if(player.aniCounter % 20 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
        if (player.screenCol >= 115) {
            player.screenCol--;
        } else {
            player.aniState = 0;
            if (player.screenRow <= 50) {
                player.screenRow++;
            }
        }
    }

    if(portal.aniCounter % 20 == 0) {
        portal.curFrame = (portal.curFrame + 1) % portal.numFrames;
    }
    portal.aniCounter++;
    
    
    hideSprites();
    if (player.screenRow <=50) {
       player.aniCounter++; 
    }
    
    drawPlayer();
    drawPortal();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);
    
    
    

    if (BUTTON_PRESSED(BUTTON_START)) {

        srand(seed);

        goToInstructions();
    }
}

void goToInstructions() {
    
    REG_BG1VOFF = 0;
    REG_BG1HOFF = 0;
    loadPalette(instructionsBackgroundPal);
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;
    //REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(27) | BG_SIZE_SMALL;


    DMANow(3, instructionsBackgroundTiles, &CHARBLOCK[0], instructionsBackgroundTilesLen/2); //background is a image made in usenti
    DMANow(3, instructionsBackgroundMap, &SCREENBLOCK[31], instructionsBackgroundMapLen/2);
    // DMANow(3, background1Tiles, &CHARBLOCK[1], background1TilesLen/2);
    // DMANow(3, background1Map, &SCREENBLOCK[27], background1MapLen/2);

   

    REG_DISPCTL = MODE0 | BG1_ENABLE;

    state = INSTRUCTIONS;
}

void instructions() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        playSoundA(level1Sound, LEVEL1SOUNDLEN, LEVEL1SOUNDFREQ, 0);
        playSoundB(portalSound, PORTALSOUNDLEN, PORTALSOUNDFREQ, 1);
        goToLevel1();
        vOff = 10;
        hOff = 0;
        initGame();
    } else if (BUTTON_PRESSED(BUTTON_B)) {
        goToStart();
    }
}

void goToLevel1() {
    level = 1;
    
    REG_BG2VOFF = vOff;
    REG_BG2HOFF = hOff;
    REG_BG1VOFF = 6;
    REG_BG1HOFF = 0;
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;
    loadPalette(level1BackgroundPal);
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(29) | BG_SIZE_SMALL | 0;
    REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL | 1;
    REG_BG0CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(27) | BG_SIZE_SMALL | 0;

    REG_BLDMOD = BG0_A | BG1_B | BG2_B | NORMAL_TRANS | OBJ_B;
    REG_COLEV = WEIGHTOFA(14) | WEIGHTOFB(2);


    DMANow(3, level1BackgroundTiles, &CHARBLOCK[0], level1BackgroundTilesLen/2); //background is a image made in usenti
    DMANow(3, level1BackgroundMap, &SCREENBLOCK[31], level1BackgroundMapLen/2);
    DMANow(3, level1DashTiles, &CHARBLOCK[1], level1DashTilesLen/2);
    DMANow(3, level1DashMap, &SCREENBLOCK[29], level1DashMapLen/2);
    DMANow(3, cloudsBackgroundTiles, &CHARBLOCK[2], cloudsBackgroundTilesLen/2);
    DMANow(3, cloudsBackgroundMap, &SCREENBLOCK[27], cloudsBackgroundMapLen/2);



    DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);
    DMANow(3, spriteSheetPal, SPRITEPALETTE, 256);

    hideSprites();
    REG_DISPCTL = MODE0 | BG2_ENABLE | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;


    state = GAME;
}

void goToLevel2() {
    
    level = 2;
    REG_BG2VOFF = vOff;
    REG_BG2HOFF = hOff;
    REG_BG1VOFF = 6;
    REG_BG1HOFF = 0;
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 90;
    loadPalette(level2BackgroundPal);
    REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL | 1;
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(29) | BG_SIZE_SMALL | 0;
    REG_BG0CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(27) | BG_SIZE_SMALL | 0;

    REG_BLDMOD = BG0_A | BG1_B | BG2_B | NORMAL_TRANS | OBJ_B;
    REG_COLEV = WEIGHTOFA(4) | WEIGHTOFB(12);

    DMANow(3, level2BackgroundTiles, &CHARBLOCK[0], level2BackgroundTilesLen/2); //background is a image made in usenti
    DMANow(3, level2BackgroundMap, &SCREENBLOCK[31], level2BackgroundMapLen/2);
    DMANow(3, level2DashTiles, &CHARBLOCK[1], level2DashTilesLen/2);
    DMANow(3, level2DashMap, &SCREENBLOCK[29], level2DashMapLen/2);
    DMANow(3, cloudsBackgroundTiles, &CHARBLOCK[2], cloudsBackgroundTilesLen/2);
    DMANow(3, cloudsBackgroundMap, &SCREENBLOCK[27], cloudsBackgroundMapLen/2);

    DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);
    DMANow(3, spriteSheetPal, SPRITEPALETTE, 256);

    hideSprites();
   

    REG_DISPCTL = MODE0 | BG2_ENABLE | BG1_ENABLE | BG0_ENABLE | SPRITE_ENABLE;

    state = GAME;
}

void goToLevel3() {
    level = 3;
    
    REG_BG2VOFF = vOff;
    REG_BG2HOFF = hOff;
    REG_BG1VOFF = 6;
    REG_BG1HOFF = 0;
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 150;
    loadPalette(level3BackgroundPal);
    REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL | 1;
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(29) | BG_SIZE_SMALL| 0;
    REG_BG0CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(27) | BG_SIZE_SMALL | 0;

    REG_BLDMOD = BG0_A | BG1_B | BG2_B | NORMAL_TRANS | OBJ_B;
    REG_COLEV = WEIGHTOFA(12) | WEIGHTOFB(4);


    DMANow(3, level3BackgroundTiles, &CHARBLOCK[0], level3BackgroundTilesLen/2); //background is a image made in usenti
    DMANow(3, level3BackgroundMap, &SCREENBLOCK[31], level3BackgroundMapLen/2);
    DMANow(3, level3DashTiles, &CHARBLOCK[1], level3DashTilesLen/2);
    DMANow(3, level3DashMap, &SCREENBLOCK[29], level3DashMapLen/2);
    DMANow(3, cloudsBackgroundTiles, &CHARBLOCK[2], cloudsBackgroundTilesLen/2);
    DMANow(3, cloudsBackgroundMap, &SCREENBLOCK[27], cloudsBackgroundMapLen/2);

    DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);
    DMANow(3, spriteSheetPal, SPRITEPALETTE, 256);

    hideSprites();
   

    REG_DISPCTL = MODE0 | BG2_ENABLE | BG1_ENABLE | BG0_ENABLE | SPRITE_ENABLE;

    state = GAME;
}

void game() {

    updateGame();
    drawGame();
    // Scroll the background
    if(BUTTON_PRESSED(BUTTON_START)) {
        pauseSound();
        oldLevel = level;
        goToPause();

    }
    

    
    if (soundA.duration < soundA.vbCount && !crystalFound) {
        goToLose();
    }
    if (crystalFound && collision(player.worldRow, player.worldCol, player.height, player.width,
        portal.worldRow + portal.height/2, portal.worldCol+portal.width/2, 1, 1)) {
        switch(level) {
            case 1:
                stopSound();
                vOff = 90;
                hOff = 0;
                goToLevel2();
                playSoundA(level2Sound, LEVEL2SOUNDLEN, LEVEL2SOUNDFREQ, 0);
                playSoundB(portalSound, PORTALSOUNDLEN, PORTALSOUNDFREQ, 1);
                initGame();
                break;
            case 2:
                stopSound();
                vOff = 10;
                hOff = 0;
                goToLevel3();
                playSoundA(level3Sound, LEVEL3SOUNDLEN, LEVEL3SOUNDFREQ, 0);
                playSoundB(portalSound, PORTALSOUNDLEN, PORTALSOUNDFREQ, 1);
                initGame();
                break;
            case 3: 
                stopSound();
                goToWin();
                break;
        }
    }
    waitForVBlank();

    
}

void goToPause() {

    REG_BG1VOFF = 0;
    loadPalette(pausePal);

    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen/2);
    
    DMANow(3, pauseMap, &SCREENBLOCK[31], pauseMapLen/2);
    
    level = 4;

    DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);
    DMANow(3, spriteSheetPal, SPRITEPALETTE, 256);

    hideSprites();
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;


    

    state = PAUSE;
    crystal.width = 8;
    crystal.height = 16;
    crystal.screenRow = 40;
    crystal.screenCol = 90;
    crystal.aniCounter = 0;
    crystal.curFrame = 0;
    crystal.numFrames = 4;
    pauseSelect = RESUME;
}

void pause() {
    
    waitForVBlank();
    if (pauseSelect == RESUME && BUTTON_PRESSED(BUTTON_DOWN)) {
        pauseSelect = CONTROLS;
    } else if (pauseSelect == CONTROLS && BUTTON_PRESSED(BUTTON_DOWN)) {
        pauseSelect = EXIT;
    } else if (pauseSelect == CONTROLS && BUTTON_PRESSED(BUTTON_UP)) {
        pauseSelect = RESUME;
    } else if (pauseSelect == EXIT && BUTTON_PRESSED(BUTTON_UP)) {
        pauseSelect = CONTROLS;
    } 
    if (pauseSelect == RESUME && BUTTON_PRESSED(BUTTON_A)) {
        level = oldLevel;
        switch(level) {
            case 1:
            unpauseSound();
                goToLevel1();
                break;
            case 2:
            unpauseSound();
                goToLevel2();
                break;
            case 3: 
            unpauseSound();
                goToLevel3();
                break;  
        }
        
    } else if (pauseSelect == CONTROLS && BUTTON_PRESSED(BUTTON_A)) {
        goToControls();
    } else if (pauseSelect == EXIT && BUTTON_PRESSED(BUTTON_A)) {
        goToStart();
    }

    hideSprites();
    // if (pauseSelect == RESUME) {
    //     crystal.screenRow = 40;
    //     crystal.screenCol = 90;
    // } else if (pauseSelect == CONTROLS) {
    //     crystal.screenRow = 75;
    //     crystal.screenCol = 75;
    // } else if (pauseSelect == EXIT) {
    //     crystal.screenRow = 120;
    //     crystal.screenCol = 105;
    // }
    
    drawCrystal();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);
}

void goToWin() {
    REG_DISPCTL = MODE0 | BG1_ENABLE;
    loadPalette(winPal);
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen/2);
    
    DMANow(3, winMap, &SCREENBLOCK[31], winMapLen/2);
    
    state = WIN;
}

void win() {
    
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToLose() {
    stopSound();
    REG_BG1VOFF = 0;
    REG_BG1HOFF = 0;
    REG_DISPCTL = MODE0 | BG1_ENABLE;
    loadPalette(losePal);
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen/2);
    
    DMANow(3, loseMap, &SCREENBLOCK[31], loseMapLen/2);
    
    
    
    state = LOSE;
}

void lose() {
     
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToControls() {
    
    REG_BG1VOFF = 0;
    REG_BG1HOFF = 0;
    loadPalette(controlsBackgroundPal);
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;
    //REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(27) | BG_SIZE_SMALL;


    DMANow(3, controlsBackgroundTiles, &CHARBLOCK[0], controlsBackgroundTilesLen/2); //background is a image made in usenti
    DMANow(3, controlsBackgroundMap, &SCREENBLOCK[31], controlsBackgroundMapLen/2);
    // DMANow(3, background1Tiles, &CHARBLOCK[1], background1TilesLen/2);
    // DMANow(3, background1Map, &SCREENBLOCK[27], background1MapLen/2);

   
   
    REG_DISPCTL = MODE0 | BG1_ENABLE;


    
    
    state = CONTROLS1;
}

void controls() {
    waitForVBlank();

    
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToPause();
    }
}

