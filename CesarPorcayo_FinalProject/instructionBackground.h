
//{{BLOCK(instructionBackground)

//======================================================================
//
//	instructionBackground, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 15 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 480 + 2048 = 3040
//
//	Time-stamp: 2017-11-27, 21:12:33
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONBACKGROUND_H
#define GRIT_INSTRUCTIONBACKGROUND_H

#define instructionBackgroundTilesLen 480
extern const unsigned short instructionBackgroundTiles[240];

#define instructionBackgroundMapLen 2048
extern const unsigned short instructionBackgroundMap[1024];

#define instructionBackgroundPalLen 512
extern const unsigned short instructionBackgroundPal[256];

#endif // GRIT_INSTRUCTIONBACKGROUND_H

//}}BLOCK(instructionBackground)
