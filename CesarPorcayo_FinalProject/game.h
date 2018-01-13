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

#define NUMCOLORS 6
enum {BLACKID=(256-NUMCOLORS), BLUEID, GREENID, REDID, WHITEID, GRAYID};
extern unsigned short colors[NUMCOLORS];

#define PLAYERINDEX 0
#define LVL1CRYSTALINDEX 1
#define CLUEINDEX 4
#define LVL2CRYSTALINDEX 5
#define LVL3CRYSTALINDEX 6
#define PORTALINDEX 7


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