
/***********************************\
                TIMER
\***********************************/

//========================================
// [internal] variables
//========================================
const int _Timer_Diff = 0;
var int _Hour;
var int _Timer_Paused;
var int _Timer_PiM;

const int _TimerGT_Diff = 0;
var int _TimerGT;
var int _TimerGT_Paused;

//========================================
// [internal] initialization
//========================================
func void _Timer_Init() {
	_Timer_Diff = MEM_GetSystemTime() - _Timer;
};

func void _TimerGT_Init() {
	_TimerGT_Diff = MEM_GetSystemTime() - _TimerGT;
};

//========================================
// Get current time
//========================================
func int Timer() {
	if(!MEM_Game.timeStep) {
		if(_Timer_PiM) {
			_Timer_Paused = 2;
			return _Timer;
		};
	};
	if(_Timer_Paused) {
		if(_Timer_Paused == 2) {
			_Timer_Paused = 0;
			_Timer_Init();
		}
		else {
			return _Timer;
		};
	};
	_Timer = MEM_GetSystemTime() - _Timer_Diff;
	return _Timer;
};

func int TimerGT() {
	if(!MEM_Game.timeStep) {
		_TimerGT_Paused = 2;
		return _TimerGT;
	};
	if(_TimerGT_Paused) {
		if(_TimerGT_Paused == 2) {
			_TimerGT_Paused = 0;
			_TimerGT_Init();
		}
		else {
			return _TimerGT;
		};
	};
	_TimerGT = MEM_GetSystemTime() - _TimerGT_Diff;
	return _TimerGT;
};

//========================================
// Get the current time as a float
//========================================
func int TimerF() {
	return mkf(Timer());
};

//========================================
// Pause timer
//========================================
func void Timer_SetPause(var int on) {
	if(on) {
		_Timer_Paused = 1;
		return;
	};
	_Timer_Paused = 0;
	_Timer_Init();
};

//========================================
// Automatically pause in menus?
//========================================
func void Timer_SetPauseInMenu(var int on) {
	_Timer_PiM = on;
};

//========================================
// Check if the timer is paused
//========================================
func int Timer_IsPaused() {
	return _Timer_Paused > 0;
};
