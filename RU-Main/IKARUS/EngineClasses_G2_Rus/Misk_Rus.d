
//--------------------------------------
// Node / Leaf. For Vobtree
//--------------------------------------

// template <class T> //NS: template for class T (any class can be used)
class zCTree {
    var int parent;            // zCTree*
    var int firstChild;        //zCTree* 
    var int next;              //zCTree* 
    var int prev;              // zCTree*
    var int data;              //T*
};

//--------------------------------------
// Lists, arrays. Often used.
//--------------------------------------

const int sizeof_zCArray = 12;

/* zCArray is a very simple but very important data structure. */

//template <class T>
class  zCArray {
    var int array;              // T* //Pointer to memory area
    var int numAlloc;           // int //How many elements to allocate memory for?
    var int numInArray;         // int // How many elements are actually stored
};

//template <class T> 
class  zCArraySort {
    var int array;              //T*
    var int numAlloc;           //int
    var int numInArray;         // int
    var int compare;            // int (*Compare)(const T* ele1,const T* ele2); //NS: function to compare two elements
};

//template <class T>
class zList {
    var int compare;            //int (*Compare)(const T* ele1,const T* ele2);
    var int count;              // Number of elements
    var int last;               //T*
    var int wurzel;             // T*
};

//template <class T> 
class  zCList {
    var int data;               //T*
    var int next;               //zCList<T>*
};

//template <class T> 
class zCListSort {
    var int compareFunc;        //int (*Compare)(T *ele1,T *ele2);
    var int data;               //T*
    var int next;               //zCListSort<T>*
};

// zMAT4
class  zMAT4 {
    /* The matrix looks like this:
     *
     * x1 y1 z1 p1
     * x2 y2 z2 p2
     * x3 y3 z3 p3
     *
     * Here x, y, z are unit coordinate transformation vectors.
     * To put it simply: x, y, z are three vectors that can be seen,
     * if VOB is selected (usually the y vector is directed upwards).
     * If (a1, a2, a3) are coordinates of a point in Vob's local system,
     * and M - matrix to convert Vob's coordinates to world coordinates,
     * then the coordinates of the point in the world system = M * (a1, a2, a3, 1)^T.
     * ("^T" means transpose, i.e. the vector is a column).
     * The fourth row of the matrix is ​​not used. */
	// NS: the last column is the coordinates of the Vob itself in the world
    
    /* Line by line */
    var int v0[ 4 ]; // zREAL[4]
    var int v1[ 4 ]; // zREAL[4]
    var int v2[ 4 ]; // zREAL[4]
    var int v3[ 4 ]; // zREAL[4]
};

// another entry, all numbers in one array:
class  zMATRIX4 {
    var int transformer[ 16 ]; // zREAL[16]
};

//------------------------------------------------
//   zTPlane: Plane in space
//------------------------------------------------

class zTPlane 
{
    var int distance;    // zREAL // probably the distance to the origin (what else?)
    var int normal[ 3 ];   // zPOINT3 //normal vector
};

//------------------------------------------------
//  zCPolygon
//------------------------------------------------

/* Values ​​for zCPolygon.portalPoly:
    enum zTPortalType   { zPORTAL_TYPE_NONE         = 0, 
                          zPORTAL_TYPE_SMALL        = 1, 
                          zPORTAL_TYPE_BIG          = 2, 
                          zPORTAL_TYPE_BIG_NOFADE   = 3 
                        };
*/
const int zCPolygon_bitfield_polyNumVert            = ((1 <<  8) - 1) <<  0;
const int zCPolygon_bitfield_portalPoly             = ((1 <<  2) - 1) <<  8;
const int zCPolygon_bitfield_occluder               = ((1 <<  1) - 1) << 10;
const int zCPolygon_bitfield_sectorPoly             = ((1 <<  1) - 1) << 11;
const int zCPolygon_bitfield_mustRelight            = ((1 <<  1) - 1) << 12;
const int zCPolygon_bitfield_portalIndoorOutdoor    = ((1 <<  1) - 1) << 13;
const int zCPolygon_bitfield_ghostOccluder          = ((1 <<  1) - 1) << 14;
const int zCPolygon_bitfield_noDynLightNear         = ((1 <<  1) - 1) << 15;
const  int zCPolygon_bitfield_sectorIndex = (( 1  <<  16 ) -  1 ) <<  16 ; // only for indoor

class zCVertFeature {
    var int vertNormal[ 3 ];    // zPOINT3
	var int lightStat;        //zCOLOR	
	var int lightDyn;         //zCOLOR	
	be int texu;             // zVALUE	
    var int texv;             //zVALUE 
};

class zCPolygon 
{
/* 0x0000 */     var int vertex;                 // zCVertex** //array
/*0x0004*/    var int lastTimeDrawn;          //int
    
              //zTPlane               polyPlane;
/*0x0008*/        var int polyPlane_distance;     //zREAL
/*0x000C*/        var int polyPlane_normal[3];    //zVEC3
    
/*0x0018*/    var int material;               //zCMaterial*
/*0x001C*/    var int lightmap;               //zCLightMap*

/*0x0020*/    var int clipVert;               //zCVertex      **    
/*0x0024*/    var int clipFeat;               //zCVertFeature **
/*0x0028*/    var int numClipVert;            //int

/* 0x002C */     var int feature;                // zCVertFeature ** //array
/* 0x0030 */     var int bitfield;
};

class zCMaterial {
    //zCObject {
      var int     _vtbl;
      var int    _zCObject_refCtr;
      var int    _zCObject_hashIndex;
      var int    _zCObject_hashNext;
      var string _zCObject_objectName;

	//zCArray<zCPolygon*>		polyList;
        var int polyList_array;         //zCPolygon**
        var int polyList_numAlloc;      //int
        var int polyList_numInArray;    // int
        
    var int polyListTimeStamp;          //zDWORD		
	var int texture;                    //zCTexture*	
	var int color;						//zCOLOR		
	var int smoothAngle;                //zREAL		
	var int matGroup;                   //zTMat_Group	
	var int bspSectorFront;			    //zCBspSector*	 //outdoor
	var int bspSectorBack;				//zCBspSector*	 //outdoor
	var int texAniCtrl;                 //zCTexAniCtrl
	var int detailObjectVisualName;     //zSTRING*		

	be int kambient;                        // zREAL
    var int kdiffuse;                        //zREAL
    
    var int m_bEnvironmentalMappingStrength; //zREAL
    
    var int bitfield[7]; //???
    
    /*
		zUINT8				 smooth					: 1;
		zUINT8				 dontUseLightmaps		: 1;
		zUINT8 texAniMap : 1;
		zUINT8				 lodDontCollapse		: 1;
		zUINT8				 noCollDet				: 1;
		zUINT8				 forceOccluder			: 1;
		zUINT8				 m_bEnvironmentalMapping: 1;
		zUINT8				 polyListNeedsSort		: 1;
		zUINT8				 matUsage				: 8;
		zUINT8				 libFlag				: 8;
		zTRnd_AlphaBlendFunc rndAlphaBlendFunc		: 8;
		zUINT8				 m_bIgnoreSun			: 1;
	*/
	                                       
	var int m_enuWaveMode;                   //zTWaveAniMode	
	var int m_enuWaveSpeed;                  //zTFFT			
	var int m_fWaveMaxAmplitude;             //float			
	var int m_fWaveGridSize;                 //float			
                                           
	var int detailTexture;                   //zCTexture*                  
	var int detailTextureScale;              //zREAL		                    
	var int texAniMapDelta[ 2 ];               // zPOINT2		                
                                           
	var int default_mapping[2];              //zPOINT2		                    
	var int texScale[ 2 ];                     // zPOINT2		                        
};

class zTPortalInfo {
	var int visible;        //zBYTE
	var int alpha;          // zBYTE
};

class zCBspSector {
	var string sectorName;             //zSTRING
	
    //zCArray<zCBspBase*>				sectorNodes;
        var int sectorNodes_array;        //zCBspBase**
        var int sectorNodes_numAlloc;    // int
        var int sectorNodes_numInArray;  // int
        
	var int sectorIndex;		        //zDWORD
    
	//zCArray<zCPolygon*>				sectorPortals;
        var int sectorPortals_array;        //zCPolygon**
        var int sectorPortals_numAlloc;    // int
        var int sectorPortals_numInArray;  // int
    
	//zCArray<zTPortalInfo>			sectorPortalInfo;
        var int sectorPortalInfo_array;      //zTPortalInfo*
        var int sectorPortalInfo_numAlloc;  //int
        var int sectorPortalInfo_numInArray; // int
    
	var int activated;          //zTFrameCtr	
	var int rendered;           //zTFrameCtr	
	//zTBBox2D	 activePortal;
        var int mins[ 2 ];                // zVEC2
        var int maxs[2];                //zVEC2
	var int sectorCenter[3];	//zVEC3
	var int hasBigNoFade;		// zBOOL8	
};

//--------------------------------------
// Boundingbox
//--------------------------------------

class zTBBox3D {
	var int mins[3]; //zPOINT3	
	var int maxs[ 3 ]; // zPOINT3
};

//--------------------------------------
// Portal
//--------------------------------------

class  oCPortalRoom {
    var string portalName;    // zSTRING
    var string ownerNpc;      // zSTRING
    var int ownerGuild;    //int           
};

class  oCPortalRoomManager {
    var int oldPlayerPortal;    // zSTRING*      
    var int curPlayerPortal;    // zSTRING*      
    var int oldPlayerRoom;      //oCPortalRoom*
    var int curPlayerRoom;      //oCPortalRoom*

    //zCArraySort <oCPortalRoom*> portals;
        var int portals_array;      //oCPortalRoom**
        var int portals_numAlloc;   // int
        var int portals_numInArray; // int
        var int portals_compare;    // int (*Compare)(const oCPortalRoom* ele1,const oCPortalRoom* ele2); // sorts by portal names.
};

//--------------------------------------
// Timer (technical and game implementation)
//--------------------------------------

class  zCTimer {
    var int factorMotion;        // zREAL //shouldn't be too small. Else: Freeze high Framerate!
    var int frameTimeFloat;      // zREAL [msec] //time between current and last frame, ms
    var int totalTimeFloat;      // zREAL [msec] // total time, ms
    var int frameTimeFloatSecs;  // zREAL [s] //same in sec.
    var int totalTimeFloatSecs;  // zREAL [s] //same in sec.
    var int lastTimer;           // zDWORD
    var int frameTime;           // zDWORD [msec] /as an integer
    var int totalTime;           // zDWORD [msec]
    var int minFrameTime;        // zDWORD // from "freezing". Otherwise the frame rate is rounded to 0 and nothing moves.
          
    var int forcedMaxFrameTime;  // zDWORD //frame cannot be longer than this value (in time). To avoid large jumps in time for objects? Anyway, it's kind of like the game will slow down if it doesn't match the rendering.
};

const int oCWorldTimer_TicksPerHour		  = 250000;
const  int oCWorldTimer_TicksPerMin_approx = 4167 ; // < 1 sec / day invalid

class  oCWorldTimer {
    // 250000 ticks per hour
    var int worldTime;    // zREAL   
    var int day;          //int      
};

//--------------------------------------
// Spawnmanager
//--------------------------------------

/* Pretty useless class,
* but the following three static variables are very interesting:
     SPAWN_INSERTTIME_MAX_Address
     SPAWN_INSERTRANGE_Address   
     SPAWN_REMOVERANGE_Address   
* They are declared in Ikarus_Const.d */

class  oTSpawnNode {
    var int npc;         //oCNpc *
    var int spawnPos[3]; //zVEC3
    var int hours;       // zREAL
};

class  oCSpawnManager {
    //zCArray<oTSpawnNode*> spawnList;
        var int spawnList_array;        //oTSpawnNode**
        var int spawnList_numAlloc;     //int
        var int spawnList_numInArray;   // int
        
    var int spawningEnabled;        //zBOOL
    var int fields[ 3 ];              // zVEC3
    var int insertTime;             // zREAL // Spawnmanager delay time (for performance reasons)

    var intspawnFlags ; // there were times when there was no copy protection, and evil pirates had to contend with decrepit immortal flags. outdated.
};

//--------------------------------------
// zCOLOR(color)
//--------------------------------------

const int zCOLOR_CHANNEL     = (1 << 8) - 1;
const int zCOLOR_SHIFT_RED   = 16;
const int zCOLOR_SHIFT_GREEN = 8;
const int zCOLOR_SHIFT_BLUE  = 0;
const int zCOLOR_SHIFT_ALPHA = 24;

const int zCOLOR_RED   = zCOLOR_CHANNEL << zCOLOR_SHIFT_RED;
const int zCOLOR_GREEN = zCOLOR_CHANNEL << zCOLOR_SHIFT_GREEN;
const int zCOLOR_BLUE  = zCOLOR_CHANNEL << zCOLOR_SHIFT_BLUE;
const int zCOLOR_ALPHA = zCOLOR_CHANNEL << zCOLOR_SHIFT_ALPHA;

//--------------------------------------
// lighting
//--------------------------------------
const int zCVobLight_bitfield_isStatic       = ((1 << 1) - 1) <<  0;
const int zCVobLight_bitfield_rangeAniSmooth = ((1 << 1) - 1) <<  1;
const int zCVobLight_bitfield_rangeAniLoop   = ((1 << 1) - 1) <<  2;
const int zCVobLight_bitfield_colorAniSmooth = ((1 << 1) - 1) <<  3;
const int zCVobLight_bitfield_colorAniLoop   = ((1 << 1) - 1) <<  4;
const int zCVobLight_bitfield_isTurnedOn     = ((1 << 1) - 1) <<  5;
const int zCVobLight_bitfield_lightQuality   = ((1 << 4) - 1) <<  6;
const int zCVobLight_bitfield_lightType      = ((1 << 4) - 1) << 10;
const int zCVobLight_bitfield_m_bCanMove     = ((1 << 1) - 1) << 14;

const int zCVobLight_lightData_colorAniList_array_offset = 300; //0x12C

class  zCVobLight {
    //zCVob {
      //zCObject {
      var int     _vtbl;
      var int    _zCObject_refCtr;
      var int    _zCObject_hashIndex;
      var int    _zCObject_hashNext;
      var string _zCObject_objectName;
      //}
      var int    _zCVob_globalVobTreeNode;
      var int    _zCVob_lastTimeDrawn;
      var int    _zCVob_lastTimeCollected;
      var int    _zCVob_vobLeafList_array;
      var int    _zCVob_vobLeafList_numAlloc;
      var int    _zCVob_vobLeafList_numInArray;
      var int     _zCVob_trafoObjToWorld[ 16 ];
      var int    _zCVob_bbox3D_mins[3];
      var int    _zCVob_bbox3D_maxs[3];
      var int    _zCVob_bsphere3D_center[3];
      var int    _zCVob_bsphere3D_radius;
      var int    _zCVob_touchVobList_array;
      var int    _zCVob_touchVobList_numAlloc;
      var int    _zCVob_touchVobList_numInArray;
      var int    _zCVob_type;
      var int    _zCVob_groundShadowSizePacked;
      var int    _zCVob_homeWorld;
      var int    _zCVob_groundPoly;
      var int    _zCVob_callback_ai;
      var int     _zCVob_trafo;
      var int    _zCVob_visual;
      var int    _zCVob_visualAlpha;
      var int    _zCVob_m_fVobFarClipZScale;
      var int    _zCVob_m_AniMode;
      var int    _zCVob_m_aniModeStrength;
      var int    _zCVob_m_zBias;
      var int     _zCVob_rigidBody;
      var int    _zCVob_lightColorStat;
      var int    _zCVob_lightColorDyn;
      var int    _zCVob_lightDirectionStat[3];
      var int    _zCVob_vobPresetName;
      var int     _zCVob_eventManager;
      var int    _zCVob_nextOnTimer;
      var int    _zCVob_bitfield[5];
      var int    _zCVob_m_poCollisionObjectClass;
      var int    _zCVob_m_poCollisionObject;
    
	// The VOB of a light source can have different colors and lighting ranges.
    // Also, there are animated sources!
    
             //zCVobLightData    lightData;
                 // zCArray<zVALUE> rangeAniScaleList; //zREAL ~ zVALUE
/*0x120*/            var int lightData_rangeAniScaleList_array;      //zVALUE*
/*0x124*/            var int lightData_rangeAniScaleList_numAlloc;   //int
/*0x128*/            var int lightData_rangeAniScaleList_numInArray; //int
         
                 //zCArray<zCOLOR>       colorAniList;
/*0x12C*/            var int lightData_colorAniList_array;           //zCOLOR*
/*0x130*/            var int lightData_colorAniList_numAlloc;        //int
/*0x134*/            var int lightData_colorAniList_numInArray;      //int
                 
/*0x138*/        var int lensFlareFXNo;                              //int                  
/*0x13C*/        var int lensFlareFX;                                //zCLensFlareFX*
                 
/* 0x140 */         var int lightColor;                                 // zCOLOR // Alpha channel is ignored
/*0x144*/        var int range;                                      //zVALUE
/* 0x148 */         var int rangeInv;                                   // zVALUE
/*0x14C*/        var int rangeBackup;                                //zVALUE
                 
                 // Data for source animation
                 // Sets the animation range
/* 0x150 */         var int rangeAniActFrame;                           // zVALUE
/* 0x154 */         var int rangeAniFPS;                                // zVALUE
                 
                 // Sets the animation color
/*0x158*/        var int colorAniActFrame;                           //zVALUE                
/*0x15C*/        var int colorAniFPS;                                //zVALUE                
                 
                 // directional light? I don't know about this possibility.
/*0x160*/        var int spotConeAngleDeg;                           //zREAL
                 
                 // Flags declared above
/*0x164*/        var int bitfield;
        
    
             //zTRayTurboValMap<zCPolygon*, int>affectedPolyMap;
                 /*
                 struct zSNode                                   
                 {                                               
                     KEY             m_Key       ;               
                     ELEMENT         m_Element   ;               
                     unsigned long   m_u32Hash   ;               
                     zSNode*         m_pNext     ;               
                 }; */
                 //zCArray<zSNode*>              m_arrNodes;
/*0x168*/            var int affectedPolyMap_m_arrNodes_array;       //zSNode**
/*0x16C*/            var int affectedPolyMap_m_arrNodes_numAlloc;    //int
/*0x170*/            var int affectedPolyMap_m_arrNodes_nunInArray;  //int
    
/* 0x174 */     var string lightPresetInUse;                // zSTRING
};

//--------------------------------------
// Book of magic
//--------------------------------------

/* Mud-freak added descriptions. Thanks for this! */

/* Used in a loop for the player to select a spell and
* contains mapping: spell <-> item <-> button. */

class  oCMag_Book {
    //zCArray    <oCSpell*>   spells;
        var int spells_array;
        var int spells_numAlloc;
        var int spells_numInArray;
    //zCArray    <oCItem*>    spellitems;
        var int spellitems_array;
        var int spellitems_numAlloc;
        var int spellitems_numInArray;
    
    where int wld;                // zCWorld*    
    var int owner;              //zCVob*      
    var int model;              // zCModel* //owner model (seems to be reserved)
    var int spellnr;            // int //selected spell --> n+4 = slot/button
    var int  MAG_HEIGHT ;         // zREAL // small offset to place the spell over the wearer's head (if selected)
    var int active;             // zBOOL //not used??
    var int remove_all;         // zBOOL // something internal? --> When the MagBook closes, if the previously selected spell is removed, then it is set to 1, otherwise it is set to 0 (ALL (including the previously selected) spells are returned "on the belt")
    var int in_movement;        // zBOOL // current rotation of spells above the player's head? --> and open/close
    var int show_handsymbol;    // zBOOL //? --> PFX or spell in hand (matches selected or not)
    var intstep ;               // zREAL //if there are n spells in the book, then this number = 360/n
    var int action;             // int // internal --> 0 = no action, 1 = rotate, 2 = open, 3 = close
    var int UNUSED;             //int         //
    var int open;               // zBOOL // current magic book display (circle above player's head)?
    var int open_delay_timer;   // zREAL // used as delay time before rune turns into pfx --> 2000 msec
    var int show_particles;     // zBOOL // current display of the spell above the player's head as pfx?
    var int targetdir;          // zREAL // to rotate the book when the player presses left or right --> how many degrees to rotate; Normally set to turn right (like 360/n), but left would be ((360/n)-1)*-1 (negative and 1 degree less)
    var int t1;                 // zREAL // - " - --> "Keyframes": FLOATNULL = start of action, FLOATEINS = end of action
    var int targetpos[ 3 ];       // zVEC3 //to pull the spell (from the belt) and to put it back. --> from position...
    var int startpos[ 3 ];        // zVEC3 // - " - --> ... per position (in the end, therefore, startpos and targetpos are swapped)

    var int nextRegister;       // int // not sure. Something to communicate with the keys? --> This value never seems to change
    var int  keys ;               // int //flags. If flag n of {0, 1, ..., 9} is enabled, then the & (1 << n) flag is set. --> Determines if there is a spell in slot (button) n+4, i.e. actually involved n = 6 (number of flags), not 9
};

//--------------------------------------
// Strings
//--------------------------------------

/*
    Displaying a string in memory.
    Gothic works well enough with strings that this class is unlikely to be needed.
    I used only as internal to allocate memory.
*/

class zString {
    var int _vtbl;
    var int_allocator ; // always 0
    var int ptr; // pointer to data
    var int len; // string length
    var int res; // bytes reserved
};

const int sizeof_zString = 20;

//--------------------------------------
// zCClassDef
//--------------------------------------

/* For each (derived from zCObject) class,
* there is a "control object" of type zCClassDef.
* It encapsulates some useful information
* about all objects of this class.
* Using MEM_GetClassDef(var int objPtr)
* you can determine which class an object belongs to.
* This means that if you send a VOB, then
* you will get zCClassDef for zCVob class.
 */

class zCClassDef {
    var string className;            //zSTRING
    var string baseClassName;        //zSTRING
    var string scriptClassName;      //zSTRING
    var int baseClassDef;            // zCClassDef* //ancestor class
    
    var int createNewInstance;       // zCObject* ( *) (void) // Pointer to a class dependent function
    var int createNewInstanceBackup; // zCObject* ( *) (void) // Pointer to a class dependent function
    
    /*
    enum zTClassFlags {
        zCLASS_FLAG_SHARED_OBJECTS = 1<<0, //Use multiple objects (e.g. render)
        zCLASS_FLAG_TRANSIENT = 1<<1, //Temporary, not saved.
        zCLASS_FLAG_RESOURCE = 1<<2, //no idea / doesn't matter, probably
    };*/
    
    var int classFlags;              // zDWORD //see above
    var int classSize;               // zDWORD //size in bytes
    
    var int numLivingObjects;        // Number of objects of this class
    var int numCtorCalled;           // How many times the constructor was called
    
    varint hashTable ;               // zCObject** //Hash table of size 1024. Objects are associated with zCObject.hashNext if more than one object is hashed with the same value.
    // zCArray<zCObject*> objectList; //all named (!) objects refer exactly (!) to this class (!) //Explanations to (!): 1.) There are no unnamed ones here. 2.) Objects of child classes do not count. 3.) This property can be very useful.
        var int objectList_array;       //zCObject**
        var int objectList_numAlloc;    //int
        var int objectList_numInArray;  //int
    
    var int archiveVersion;          // zWORD //probably not used
    var int archiveVersionSum;       // zWORD //probably not used
};      

//--------------------------------------
// oCLogTopic
//--------------------------------------

class  oCLogTopic {
	var string   		m_strDescription;
	var int       		m_enuSection	; //LOG_MISSION / LOG_NOTE
	var int            	m_enuStatus		; //LOG_RUNNING / ...
	
    //zCList<zString> m_lstEntries;
        var int m_lstEntries_data; //zString*
        var int m_lstEntries_next; //zCList<zString>*
};

/* oCLogManager == zCList<oCLogTopic> */

class  oCLogManager {
    var int data; //oCLogTopic*
    var int next; //zCList<oCLogTopic>*
};

const int oCLogManager_Ptr = 11191608; //0xAAC538

//--------------------------------------
// zERROR
//--------------------------------------

class  zERROR {
    var int _vtbl;
    var int onexit;  //void (*__cdecl)()
    var string filter_authors;
    var int 	filter_flag;
    var int filter_level;
    var int	target;
    var int	ack_type; //zERROR_TYPE
    var int log_file; //zFILE*
    var int indent_depth; //zBYTE
    var int spyHandle; //HWND
    var int spyMutex;  //zCMutex*
};
