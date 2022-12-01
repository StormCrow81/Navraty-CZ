
const int GOTHIC_BASE_VERSION = 2;

//--------------------------------------
// User variables:
//--------------------------------------

const  string  MEM_FARFARAWAY = " TOT " ;		// Mem-Helper spawns here
const string MEM_HELPER_NAME = "MEMHLP";    //его имя

const  int zERR_TYPE_OK = 0 ; /* [not used]   */
const int zERR_TYPE_INFO  = 1; /* MEM_Info           */
const int zERR_TYPE_WARN  = 2; /* MEM_Warn           */
const int zERR_TYPE_FAULT = 3; /* MEM_Error          */
const  int zERR_TYPE_FATAL = 4 ; /* [not used]   */

const int zERR_ReportToZSpy     = zERR_TYPE_INFO;  //все от zERR_TYPE_INFO
const  int zERR_ShowErrorBox = zERR_TYPE_FAULT; // output error messages to the MessageBox window
const  int zERR_PrintStackTrace = zERR_TYPE_WARN; // stack trace on warnings

const  int zERR_ErrorBoxOnlyForFirst = 1 ; /* never show more than one error message */
const  int zERR_StackTraceOnlyForFirst = 0 ; /* stack trace for first error only */

/* Debug messages:
* MEM_Debug is not used in Ikarus and is
* freely configurable information channel. */
 
const  string zERR_DEBUG_PREFIX = " Debug: " ;      // This prefix is ​​always placed before the message
const  int     zERR_DEBUG_TOSPY = 1 ;              // Send MEM_Debug messages to ZSpy?
const  int     zERR_DEBUG_TYPE = zERR_TYPE_INFO; // If so, how to send to ZSpy?
const  int     zERR_DEBUG_TOSCREEN = 0 ;              // Printing MEM_Debug messages to the screen via "Print".
const  int     zERR_DEBUG_ERRORBOX = 0 ;              // Show Error-Box window (with OK button).

//--------------------------------------
// Address
//--------------------------------------

// Parser
const int ContentParserAddress      = 11223232; //0xAB40C0;
const int vfxParserPointerAddress   =  9234156; //0x8CE6EC
const int menuParserPointerAddress  =  9248360; //0x8D1E68
const int pfxParserPointerAddress   =  9278004; //0x8D9234

// ShowDebug
const int showDebugAddress	= 11232372; //0xAB6474

// Array containing all created (and not destroyed) menus
const int MEMINT_MenuArrayOffset		= 9248324; //0x8D1E44
const int MEMINT_MenuItemArrayAddres	= 9248508; //0x8D1EFC

// Several useful static objects
const int MEMINT_oGame_Pointer_Address			= 11208836; //0xAB0884
const int MEMINT_zTimer_Address					= 10073044; //0x99B3D4
const int MEMINT_oCInformationManager_Address	= 11191384; //0xAAC458
const int MEMINT_gameMan_Pointer_address		= 9185624; //0x8C2958

// Array of engine random numbers (for hash):
const int crc_table_address	= 8598048; //0x833220

// Array with information about pressed keys
const int MEMINT_KeyEvent_Offset  = 9246328; //0x8D1678
const int MEMINT_KeyToggle_Offset = 9246904;
const int MEMINT_KeyBuffer_offset = 9248080; //0x8D1D50

// Static objects for spawn management (from Spawnmanager)
const int SPAWN_INSERTTIME_MAX_Address = 9153740;/*8BACCC*/ //zREAL*
const int SPAWN_INSERTRANGE_Address    = 9153744;/*8BACD0*/ //zREAL*
const int SPAWN_REMOVERANGE_Address    = 9153748;/*8BACD4*/ //zREAL*

// Game time does not change if set:
const int game_holdTime_Address = 11208840; //0xAB0888 //zBOOL*

// Static properties regarding the display of subtitles:
const  int oCNpc_isEnabledTalkBox_Address =   9142548 ; // 0x8B8114 //zBOOL* //overrides the next three settings
const int oCNpc_isEnabledTalkBoxPlayer_Address  =  9142552; //0x8B8118 //zBOOL*
const int oCNpc_isEnabledTalkBoxAmbient_Address = 11216504; //0xAB2678 //zBOOL*
const int oCNpc_isEnabledTalkBoxNoise_Address   = 11216508; //0xAB267C //zBOOL*

// global screen (zCView type) on it, for example, a life bar is displayed
const int screen_offset = 11232360;	//0xAB6468

// Gothic.ini encapsulation (ready for access via functions)
const int zoptions_Pointer_Address		= 9230728; //0x8CD988
// [modname].ini (ready for access via functions)
const int zgameoptions_Pointer_Address	= 9230732; //0x8CD98C

//bspFrameCtr:
const int bspFrameCtr_Address = 9259332; //0x8D4944;

// Performance counter, in ticks (ticks) per millisecond
const int PC_TicksPerMS_Address = 9255828; //0x8D3B94

//--------------------------------------
// Other constants
//--------------------------------------

// Address of method table for object recognition
const int oCMobFire_vtbl        = 8638876;
const int zCMover_vtbl          = 8627324;
const int oCMob_vtbl            = 8639700;
const int oCMobInter_vtbl       = 8639884;
const int oCMobLockable_vtbl    = 8637628;
const int oCMobContainer_vtbl   = 8637284;
const int oCMobDoor_vtbl        = 8638548;
const  int oCItem_vtbl = 8636420 ;
const int oCNpc_vtbl            = 8640292;
const int zCVobLight_vtbl		= 8624756;

