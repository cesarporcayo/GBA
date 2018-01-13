
//{{BLOCK(background2)

//======================================================================
//
//	background2, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 4 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 128 + 2048 = 2688
//
//	Time-stamp: 2017-11-12, 21:49:48
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BACKGROUND2_H
#define GRIT_BACKGROUND2_H

#define background2TilesLen 128
extern const unsigned short background2Tiles[64];

#define background2MapLen 2048
extern const unsigned short background2Map[1024];

#define background2PalLen 512
extern const unsigned short background2Pal[256];

#endif // GRIT_BACKGROUND2_H

//}}BLOCK(background2)
