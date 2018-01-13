# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 13 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 69 "myLib.h"
extern unsigned short *videoBuffer;
# 90 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();
void loadPalette(const unsigned short * palette);





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 163 "myLib.h"
void hideSprites();
# 190 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 201 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 241 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 394 "myLib.h"
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 14 "main.c" 2
# 1 "level1Background.h" 1
# 22 "level1Background.h"
extern const unsigned short level1BackgroundTiles[15440];


extern const unsigned short level1BackgroundMap[1024];


extern const unsigned short level1BackgroundPal[256];
# 15 "main.c" 2
# 1 "title.h" 1
# 22 "title.h"
extern const unsigned short titleTiles[1424];


extern const unsigned short titleMap[1024];


extern const unsigned short titlePal[256];
# 16 "main.c" 2
# 1 "game.h" 1
typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;

extern ANISPRITE player;
extern ANISPRITE crystal;
extern ANISPRITE portal;
extern ANISPRITE clue;
extern int crystalCount;
extern int livesRemaining;
extern int score;
extern int vOff;
extern int hOff;
extern int seed;
extern int level;
extern int crystalFound;
extern int pauseSelect;

enum {RESUME, CONTROLS, EXIT};


enum {BLACKID=(256-6), BLUEID, GREENID, REDID, WHITEID, GRAYID};
extern unsigned short colors[6];
# 46 "game.h"
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void drawPlayer();
void animatePlayer();
void initCrystal();
void updateCrystal();
void drawCrystal();
void animateCrystal();
void initClue();
void updateClue();
void drawClue();
void animateClue();
void initPortal();
void updatePortal();
void drawPortal();
void animatePortal();
void drawNumber(int, int, int, int);
# 17 "main.c" 2
# 1 "background.h" 1
# 22 "background.h"
extern const unsigned short backgroundTiles[16016];


extern const unsigned short backgroundMap[1024];


extern const unsigned short backgroundPal[256];
# 18 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[1680];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 19 "main.c" 2
# 1 "win.h" 1
# 22 "win.h"
extern const unsigned short winTiles[1952];


extern const unsigned short winMap[1024];


extern const unsigned short winPal[256];
# 20 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[1184];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 21 "main.c" 2
# 1 "spriteSheet.h" 1
# 21 "spriteSheet.h"
extern const unsigned short spriteSheetTiles[16384];


extern const unsigned short spriteSheetPal[256];
# 22 "main.c" 2
# 1 "instructionsBackground.h" 1
# 22 "instructionsBackground.h"
extern const unsigned short instructionsBackgroundTiles[2416];


extern const unsigned short instructionsBackgroundMap[1024];


extern const unsigned short instructionsBackgroundPal[256];
# 23 "main.c" 2
# 1 "level2Background.h" 1
# 22 "level2Background.h"
extern const unsigned short level2BackgroundTiles[15264];


extern const unsigned short level2BackgroundMap[1024];


extern const unsigned short level2BackgroundPal[256];
# 24 "main.c" 2
# 1 "level3Background.h" 1
# 22 "level3Background.h"
extern const unsigned short level3BackgroundTiles[9744];


extern const unsigned short level3BackgroundMap[1024];


extern const unsigned short level3BackgroundPal[256];
# 25 "main.c" 2
# 1 "level1Dash.h" 1
# 22 "level1Dash.h"
extern const unsigned short level1DashTiles[320];


extern const unsigned short level1DashMap[1024];


extern const unsigned short level1DashPal[256];
# 26 "main.c" 2
# 1 "level2Dash.h" 1
# 22 "level2Dash.h"
extern const unsigned short level2DashTiles[288];


extern const unsigned short level2DashMap[1024];


extern const unsigned short level2DashPal[256];
# 27 "main.c" 2
# 1 "level3Dash.h" 1
# 22 "level3Dash.h"
extern const unsigned short level3DashTiles[304];


extern const unsigned short level3DashMap[1024];


extern const unsigned short level3DashPal[256];
# 28 "main.c" 2
# 1 "sound.h" 1
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
}SOUND;

extern SOUND soundA;
extern SOUND soundB;

void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);
void muteSound();
void unmuteSound();
void stopSound();

void setupInterrupts();
void interruptHandler();
# 29 "main.c" 2
# 1 "level1Sound.h" 1
# 20 "level1Sound.h"
extern const unsigned char level1Sound[2069412];
# 30 "main.c" 2
# 1 "level2Sound.h" 1
# 20 "level2Sound.h"
extern const unsigned char level2Sound[1175732];
# 31 "main.c" 2
# 1 "level3Sound.h" 1
# 20 "level3Sound.h"
extern const unsigned char level3Sound[2073083];
# 32 "main.c" 2
# 1 "titleSound.h" 1
# 20 "titleSound.h"
extern const unsigned char titleSound[653925];
# 33 "main.c" 2
# 1 "portalSound.h" 1
# 20 "portalSound.h"
extern const unsigned char portalSound[15318];
# 34 "main.c" 2
# 1 "cloudsBackground.h" 1
# 22 "cloudsBackground.h"
extern const unsigned short cloudsBackgroundTiles[9824];


extern const unsigned short cloudsBackgroundMap[1024];


extern const unsigned short cloudsBackgroundPal[256];
# 35 "main.c" 2
# 1 "controlsBackground.h" 1
# 22 "controlsBackground.h"
extern const unsigned short controlsBackgroundTiles[2048];


extern const unsigned short controlsBackgroundMap[1024];


extern const unsigned short controlsBackgroundPal[256];
# 36 "main.c" 2


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
        buttons = (*(volatile unsigned short *)0x04000130);
 }
}

void initialize() {
    (*(unsigned short *)0x4000000) = 0 | (1<<8);

    buttons = (*(volatile unsigned short *)0x04000130);

    setupSounds();
    setupInterrupts();

    goToStart();
    level = 1;
}

void goToStart() {
    (*(volatile unsigned short *)0x04000016) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;
    level = 1;

    loadPalette(titlePal);
    (*(volatile unsigned short*)0x400000A) = (0<<14) | ((0)<<2) | ((30)<<8) | 1;

    DMANow(3, titleTiles, &((charblock *)0x6000000)[0], 2848/2);

    DMANow(3, titleMap, &((screenblock *)0x6000000)[30], 2048/2);

    DMANow(3, spriteSheetTiles, &((charblock *)0x6000000)[4], 32768/2);
    DMANow(3, spriteSheetPal, ((unsigned short *)0x5000200), 256);

    playSoundA(titleSound, 653925, 11025, 1);
    hideSprites();
    (*(unsigned short *)0x4000000) = 0 | (1<<9) | (1<<12);

    state = START;

    player.width = 8;
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
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);




    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {

        srand(seed);

        goToInstructions();
    }
}

void goToInstructions() {

    (*(volatile unsigned short *)0x04000016) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;
    loadPalette(instructionsBackgroundPal);
    (*(volatile unsigned short*)0x400000A) = ((0)<<2) | ((31)<<8) | (0<<14);



    DMANow(3, instructionsBackgroundTiles, &((charblock *)0x6000000)[0], 4832/2);
    DMANow(3, instructionsBackgroundMap, &((screenblock *)0x6000000)[31], 2048/2);





    (*(unsigned short *)0x4000000) = 0 | (1<<9);

    state = INSTRUCTIONS;
}

void instructions() {
    waitForVBlank();

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        stopSound();
        playSoundA(level1Sound, 2069412, 11025, 0);
        playSoundB(portalSound, 15318, 11025, 1);
        goToLevel1();
        vOff = 10;
        hOff = 0;
        initGame();
    } else if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
        goToStart();
    }
}

void goToLevel1() {
    level = 1;

    (*(volatile unsigned short *)0x0400001A) = vOff;
    (*(volatile unsigned short *)0x04000018) = hOff;
    (*(volatile unsigned short *)0x04000016) = 6;
    (*(volatile unsigned short *)0x04000014) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;
    loadPalette(level1BackgroundPal);
    (*(volatile unsigned short*)0x400000A) = ((1)<<2) | ((29)<<8) | (0<<14) | 0;
    (*(volatile unsigned short*)0x400000C) = ((0)<<2) | ((31)<<8) | (0<<14) | 1;
    (*(volatile unsigned short*)0x4000008) = ((2)<<2) | ((27)<<8) | (0<<14) | 0;

    *(unsigned short*)0x4000050 = (1 << 0) | (1 << 9) | (1 << 10) | (1 << 6) | (1 << 12);
    *(unsigned short*)0x4000052 = (14) | ((2) << 8);


    DMANow(3, level1BackgroundTiles, &((charblock *)0x6000000)[0], 30880/2);
    DMANow(3, level1BackgroundMap, &((screenblock *)0x6000000)[31], 2048/2);
    DMANow(3, level1DashTiles, &((charblock *)0x6000000)[1], 640/2);
    DMANow(3, level1DashMap, &((screenblock *)0x6000000)[29], 2048/2);
    DMANow(3, cloudsBackgroundTiles, &((charblock *)0x6000000)[2], 19648/2);
    DMANow(3, cloudsBackgroundMap, &((screenblock *)0x6000000)[27], 2048/2);



    DMANow(3, spriteSheetTiles, &((charblock *)0x6000000)[4], 32768/2);
    DMANow(3, spriteSheetPal, ((unsigned short *)0x5000200), 256);

    hideSprites();
    (*(unsigned short *)0x4000000) = 0 | (1<<10) | (1<<8) | (1<<9) | (1<<12);


    state = GAME;
}

void goToLevel2() {

    level = 2;
    (*(volatile unsigned short *)0x0400001A) = vOff;
    (*(volatile unsigned short *)0x04000018) = hOff;
    (*(volatile unsigned short *)0x04000016) = 6;
    (*(volatile unsigned short *)0x04000014) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 90;
    loadPalette(level2BackgroundPal);
    (*(volatile unsigned short*)0x400000C) = ((0)<<2) | ((31)<<8) | (0<<14) | 1;
    (*(volatile unsigned short*)0x400000A) = ((1)<<2) | ((29)<<8) | (0<<14) | 0;
    (*(volatile unsigned short*)0x4000008) = ((2)<<2) | ((27)<<8) | (0<<14) | 0;

    *(unsigned short*)0x4000050 = (1 << 0) | (1 << 9) | (1 << 10) | (1 << 6) | (1 << 12);
    *(unsigned short*)0x4000052 = (4) | ((12) << 8);

    DMANow(3, level2BackgroundTiles, &((charblock *)0x6000000)[0], 30528/2);
    DMANow(3, level2BackgroundMap, &((screenblock *)0x6000000)[31], 2048/2);
    DMANow(3, level2DashTiles, &((charblock *)0x6000000)[1], 576/2);
    DMANow(3, level2DashMap, &((screenblock *)0x6000000)[29], 2048/2);
    DMANow(3, cloudsBackgroundTiles, &((charblock *)0x6000000)[2], 19648/2);
    DMANow(3, cloudsBackgroundMap, &((screenblock *)0x6000000)[27], 2048/2);

    DMANow(3, spriteSheetTiles, &((charblock *)0x6000000)[4], 32768/2);
    DMANow(3, spriteSheetPal, ((unsigned short *)0x5000200), 256);

    hideSprites();


    (*(unsigned short *)0x4000000) = 0 | (1<<10) | (1<<9) | (1<<8) | (1<<12);

    state = GAME;
}

void goToLevel3() {
    level = 3;

    (*(volatile unsigned short *)0x0400001A) = vOff;
    (*(volatile unsigned short *)0x04000018) = hOff;
    (*(volatile unsigned short *)0x04000016) = 6;
    (*(volatile unsigned short *)0x04000014) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 150;
    loadPalette(level3BackgroundPal);
    (*(volatile unsigned short*)0x400000C) = ((0)<<2) | ((31)<<8) | (0<<14) | 1;
    (*(volatile unsigned short*)0x400000A) = ((1)<<2) | ((29)<<8) | (0<<14)| 0;
    (*(volatile unsigned short*)0x4000008) = ((2)<<2) | ((27)<<8) | (0<<14) | 0;

    *(unsigned short*)0x4000050 = (1 << 0) | (1 << 9) | (1 << 10) | (1 << 6) | (1 << 12);
    *(unsigned short*)0x4000052 = (12) | ((4) << 8);


    DMANow(3, level3BackgroundTiles, &((charblock *)0x6000000)[0], 19488/2);
    DMANow(3, level3BackgroundMap, &((screenblock *)0x6000000)[31], 2048/2);
    DMANow(3, level3DashTiles, &((charblock *)0x6000000)[1], 608/2);
    DMANow(3, level3DashMap, &((screenblock *)0x6000000)[29], 2048/2);
    DMANow(3, cloudsBackgroundTiles, &((charblock *)0x6000000)[2], 19648/2);
    DMANow(3, cloudsBackgroundMap, &((screenblock *)0x6000000)[27], 2048/2);

    DMANow(3, spriteSheetTiles, &((charblock *)0x6000000)[4], 32768/2);
    DMANow(3, spriteSheetPal, ((unsigned short *)0x5000200), 256);

    hideSprites();


    (*(unsigned short *)0x4000000) = 0 | (1<<10) | (1<<9) | (1<<8) | (1<<12);

    state = GAME;
}

void game() {

    updateGame();
    drawGame();

    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
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
                playSoundA(level2Sound, 1175732, 11025, 0);
                playSoundB(portalSound, 15318, 11025, 1);
                initGame();
                break;
            case 2:
                stopSound();
                vOff = 10;
                hOff = 0;
                goToLevel3();
                playSoundA(level3Sound, 2073083, 11025, 0);
                playSoundB(portalSound, 15318, 11025, 1);
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

    (*(volatile unsigned short *)0x04000016) = 0;
    loadPalette(pausePal);

    (*(volatile unsigned short*)0x400000A) = (0<<14) | ((0)<<2) | ((31)<<8);

    DMANow(3, pauseTiles, &((charblock *)0x6000000)[0], 2368/2);

    DMANow(3, pauseMap, &((screenblock *)0x6000000)[31], 2048/2);

    level = 4;

    DMANow(3, spriteSheetTiles, &((charblock *)0x6000000)[4], 32768/2);
    DMANow(3, spriteSheetPal, ((unsigned short *)0x5000200), 256);

    hideSprites();
    (*(unsigned short *)0x4000000) = 0 | (1<<9) | (1<<12);




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
    if (pauseSelect == RESUME && (!(~(oldButtons)&((1<<7))) && (~buttons & ((1<<7))))) {
        pauseSelect = CONTROLS;
    } else if (pauseSelect == CONTROLS && (!(~(oldButtons)&((1<<7))) && (~buttons & ((1<<7))))) {
        pauseSelect = EXIT;
    } else if (pauseSelect == CONTROLS && (!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6))))) {
        pauseSelect = RESUME;
    } else if (pauseSelect == EXIT && (!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6))))) {
        pauseSelect = CONTROLS;
    }
    if (pauseSelect == RESUME && (!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
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

    } else if (pauseSelect == CONTROLS && (!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        goToControls();
    } else if (pauseSelect == EXIT && (!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        goToStart();
    }

    hideSprites();
# 475 "main.c"
    drawCrystal();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);
}

void goToWin() {
    (*(unsigned short *)0x4000000) = 0 | (1<<9);
    loadPalette(winPal);
    (*(volatile unsigned short*)0x400000A) = (0<<14) | ((0)<<2) | ((31)<<8);

    DMANow(3, winTiles, &((charblock *)0x6000000)[0], 3904/2);

    DMANow(3, winMap, &((screenblock *)0x6000000)[31], 2048/2);

    state = WIN;
}

void win() {

    waitForVBlank();

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
}

void goToLose() {
    stopSound();
    (*(volatile unsigned short *)0x04000016) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;
    (*(unsigned short *)0x4000000) = 0 | (1<<9);
    loadPalette(losePal);
    (*(volatile unsigned short*)0x400000A) = (0<<14) | ((0)<<2) | ((31)<<8);

    DMANow(3, loseTiles, &((charblock *)0x6000000)[0], 3360/2);

    DMANow(3, loseMap, &((screenblock *)0x6000000)[31], 2048/2);



    state = LOSE;
}

void lose() {

    waitForVBlank();

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
}

void goToControls() {

    (*(volatile unsigned short *)0x04000016) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;
    loadPalette(controlsBackgroundPal);
    (*(volatile unsigned short*)0x400000A) = ((0)<<2) | ((31)<<8) | (0<<14);



    DMANow(3, controlsBackgroundTiles, &((charblock *)0x6000000)[0], 4096/2);
    DMANow(3, controlsBackgroundMap, &((screenblock *)0x6000000)[31], 2048/2);





    (*(unsigned short *)0x4000000) = 0 | (1<<9);




    state = CONTROLS1;
}

void controls() {
    waitForVBlank();


    if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
        goToPause();
    }
}
