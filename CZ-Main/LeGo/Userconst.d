
/***********************************\
              READ-ONLY
\***********************************/
// The following constants may NOT be changed, only used.

//========================================
// Anim8
//========================================
// Forms of movement
const int A8_Constant  = 1;
const  int A8_SlowEnd = 2 ;
const  int A8_SlowStart = 3 ;
const int A8_Wait      = 4;

//========================================
// Buttons
//========================================
const int BUTTON_ACTIVE = 1;
const int BUTTON_ENTERED = 2;

//========================================
// Aligns (used in View)
//========================================
const int ALIGN_CENTER = 0;
const int ALIGN_LEFT   = 1;
const int ALIGN_RIGHT  = 2;
const int ALIGN_TOP    = 3;
const int ALIGN_BOTTOM = 4;


//========================================
// Interface
//========================================
//                        R           G          B          A           R G B
const int COL_Aqua    =             (255<<8) | (255<<0) | (255<<24); //#00FFFF
const int COL_Black   =                                   (255<<24); //#000000
const int COL_Blue    =                        (255<<0) | (255<<24); //#0000FF
const int COL_Fuchsia = (255<<16) |            (255<<0) | (255<<24); //#FF00FF
const int COL_Gray    = (128<<16) | (128<<8) | (128<<0) | (255<<24); //#808080
const int COL_Green   =             (128<<8) |            (255<<24); //#008000
const int COL_Lime    =             (255<<8) |            (255<<24); //#00FF00
const int COL_Maroon  = (128<<16) |                       (255<<24); //#800000
const int COL_Navy    =                        (128<<0) | (255<<24); //#000080
const int COL_Olive   = (128<<16) | (128<<8) |            (255<<24); //#808000
const int COL_Purple  = (128<<16) |            (128<<0) | (255<<24); //#800080
const int COL_Red     = (255<<16) |                       (255<<24); //#FF0000
const int COL_Silver  = (192<<16) | (192<<8) | (192<<0) | (255<<24); //#C0C0C0
const int COL_Teal    =             (128<<8) | (128<<0) | (255<<24); //#008080
const int COL_White   = (255<<16) | (255<<8) | (255<<0) | (255<<24); //#FFFFFF
const int COL_Yellow  = (255<<16) | (255<<8) |            (255<<24); //#FFFF00

const int PS_X = 0;
const int PS_Y = 1;

const int PS_VMax = 8192;

//========================================
// Gamestate
//========================================
const int Gamestate_NewGame     = 0;
const int Gamestate_Loaded      = 1;
const int Gamestate_WorldChange = 2;
const int Gamestate_Saving      = 3;

//========================================
// Cursor
//========================================
const int CUR_LeftClick  = 0;
const int CUR_RightClick = 1;
const int CUR_MidClick   = 2;
const int CUR_WheelUp    = 3;
const int CUR_WheelDown  = 4;


/***********************************\
               MODIFY
\***********************************/
// The following constants are not used as parameters but as specifications.
// They may be changed freely.

//========================================
// Bloodsplats
//========================================
const  int  BLOODSPLAT_NUM = 15 ; // Maximum number on the screen
const int BLOODSPLAT_TEX = 6;  // Maximale Anzahl an Texturen ( "BLOODSPLAT" + texID + ".TGA" )
const  int  BLOODSPLAT_DAM = 7 ;  // Damage multiplier related to texture size ( damage * 2^BLOODSPLAT_DAM )

//========================================
// Cursor
//========================================
const  string Cursor_Texture = " CURSOR.TGA " ; // Texture used, LeGo provides a "CURSOR.TGA".

//========================================
// Buffs
//========================================
const int Buffs_DisplayForHero = 1;

//========================================
// Interface
//========================================
const  string Print_LineSeperator = " ~ " ; // Better not to change

/* ==== PrintS ==== */
// <<Virtual Positions>>
const int    PF_PrintX      = 200;     // Startposition X
const int    PF_PrintY      = 5000;    // Startposition Y
const  int     PF_TextHeight = 170 ;     // Spacing between individual lines

// <<Milisekunden>>
const  int     PF_FadeInTime = 300 ;     // Time to show the text lines
const  int     PF_FadeOutTime = 1000 ;    // Time to hide the text lines
const  int     PF_MoveYTime = 300 ;     // Time to move a row
const  int     PF_WaitTime = 3000 ;    // Time to wait before hiding again

const  string PF_Font = " FONT_OLD_10_WHITE.TGA " ; // Font used

//========================================
// Talents
//========================================
const  int  AIV_TALENT = AIV_TALENT_INDEX ; // AI var used

//========================================
// Dialoggestures
//========================================
// The animation being played can be described like this:
//   DIAG_Prefix + AniName + DIAG_Suffix + ((rand() % (Max - (Min - 1))) + Min).ToString("00");
const string DIAG_Prefix = "DG_";
const string DIAG_Suffix = "_";

//========================================
// Buffs
//========================================
const int Buff_FadeOut = 1; // Deactivate fade-out by setting this to 0

