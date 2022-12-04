
/***********************************\
              GAMESTATE
\***********************************/

//========================================
// Globals Gamestate-Variable
//========================================
// constants in Userconst.d
var int GameState;

//========================================
// [internal] variables
//========================================
var int _Gamestate_Event;

//========================================
// Add listener for gamestate
//========================================
func void Gamestate_AddListener(var func f) {
    Event_AddOnce(_Gamestate_Event, f);
};

//========================================
// Remove gamestate listener
//========================================
func void Gamestate_RemoveListener(var func f) {
    Event_Remove(_Gamestate_Event, f);
};

//========================================
// [internal] initialization
//========================================
func void _Gamestate_InitLate() {
    Event_Execute(_Gamestate_Event, Gamestate);
};

func void _Gamestate_Init(var int state) {
    if(!_Gamestate_Event) {
        _Gamestate_Event = Event_Create();
    };
    Gamestate = state;
    if(state == Gamestate_NewGame) {
        FF_ApplyExt(_Gamestate_InitLate, 1, 1);
    }
    else {
        _Gamestate_InitLate();
    };
};
