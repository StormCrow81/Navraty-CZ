
/***********************************\
              TRIALOGUE
\***********************************/

//========================================
// EquipWeapon by Sect Spinner
//   Who already owns this function can
//   just comment them out here
//========================================
/* EquipWeapon_TogglesEquip configure the behaviour
   when trying to equip an already equipped weapon:
    0: EquipWeapon will do nothing
    1: EquipWeapon will unequip this weapon
 */
const int EquipWeapon_TogglesEquip = 1;

func void EquipWeapon (var C_NPC slf, var int ItemInst) {

    if (!Npc_HasItems (slf, ItemInst)) {
        CreateInvItems (slf, ItemInst, 1);
    };

    if (!Npc_GetInvItem(slf, ItemInst)) {
        MEM_AssertFail("Unexpected behaviour in EquipWeapon.");
        return;
    };

    if ((item.mainflag == ITEM_KAT_NF) && (Npc_HasReadiedMeleeWeapon(slf)))
    || ((item.mainflag == ITEM_KAT_FF) && (Npc_HasReadiedRangedWeapon(slf))) {
        MEM_Warn ("EquipWeapon: Caller wants to equip a weapon while weapon of the same type is readied. Ignoring request.");
        return;
    };

    if (item.flags & ITEM_ACTIVE_LEGO)
    && (!EquipWeapon_TogglesEquip) {
        /* calling EquipWeapon would unequip the weapon. */
        MEM_Info ("EquipWeapon: This weapon is already equipped. Ignoring request.");
        return;
    };

    CALL_PtrParam(MEM_InstToPtr(item));
    CALL__thiscall(MEM_InstToPtr(slf), oCNpc__EquipWeapon);
};

//========================================
// helper functions
//========================================
func int Npc_GetArmor(var c_npc slf) {
    if(!Npc_HasEquippedArmor(slf)) { return -1; };
    var c_item itm; itm = Npc_GetEquippedArmor(slf);
    return Hlp_GetInstanceID(itm);
};
func int Npc_GetMeleeWeapon(var c_npc slf) {
    if(!Npc_HasEquippedMeleeWeapon(slf)) { return 0; };
    var c_item itm; itm = Npc_GetEquippedMeleeWeapon(slf);
    return Hlp_GetInstanceID(itm);
};
func int Npc_GetRangedWeapon(var c_npc slf) {
    if(!Npc_HasEquippedRangedWeapon(slf)) { return 0; };
    var c_item itm; itm = Npc_GetEquippedRangedWeapon(slf);
    return Hlp_GetInstanceID(itm);
};

//========================================
// User constants
//========================================

const  int TRIA_MaxNPC = 256 ; // What is the maximum number of Npcs that take part in a trialogue?

//========================================
// Readjust dialog camera
//========================================
func void DiaCAM_Update() {
    // This function was written by Sect Spinner.
    if(InfoManager_HasFinished()) { return; };
    var int aiCam; aiCam = MEM_ReadInt(zCAICamera__current);
    CALL_IntParam(1);
    CALL__thiscall(aiCam, zCAICamera_StartDialogCam);
};

//========================================
// Turn off dialogue camera
//========================================
func void DiaCAM_Disable() {
    MemoryProtectionOverride(zCAICamera__StartDialogCam, 4);
    MEM_WriteInt(zCAICamera__StartDialogCam, 268436674 ); // return 4
};

//========================================
// Turn on dialog camera
//========================================
func void DiaCAM_Enable() {
    MemoryProtectionOverride(zCAICamera__StartDialogCam, 4);
    MEM_WriteInt(zCAICamera__StartDialogCam, zCAICamera__StartDialogCam_oldInstr);
};


//========================================
// [internal] variables
//========================================
var int TRIA_NpcPtr[TRIA_MaxNPC]; // Collection of all participants
var int TRIA_Running;             // Is a trialogue running?
var int TRIA_CPtr;                // Counter for the collection
var int TRIA_Last;                // The Npc who spoke last
var int TRIA_Self;                // Pointer to self
var string TRIA_Camera;           // Is a tracking shot running?

func void ZS_TRIA() {};
func int ZS_TRIA_Loop() {
    if (InfoManager_hasFinished()) { // Stay in state until dialog is finished
        return LOOP_END;
    } else {
        return LOOP_CONTINUE;
    };
};

//========================================
// Make npcs wait for each other
//========================================
func void TRIA_Wait() {
    AI_WaitTillEnd(hero, self);
    AI_WaitTillEnd(self, hero);
    AI_WaitTillEnd(hero, self);
};

//========================================
// [internal] update visuals
//========================================
func void _TRIA_UpdateVisual(var c_npc slf, var int armor) {
    var oCNpc npc; npc = Hlp_GetNpc(slf);
    
	Mdl_SetVisualBody(
        slf,
        npc.body_visualName,
        (npc.bitfield[0]&oCNpc_bitfield0_body_TexVarNr)>>14,
        (npc.bitfield[1]&oCNpc_bitfield1_body_TexColorNr),
        npc.head_visualName,
        (npc.bitfield[1]&oCNpc_bitfield1_head_TexVarNr)>>16,
        (npc.bitfield[2]&oCNpc_bitfield2_teeth_TexVarNr),
        armor);
};

//========================================
// Swap equipped weapon
//========================================
func void Npc_TradeItem(var c_npc slf, var int itm0, var int itm1) {
    if(itm0) {
        EquipWeapon(slf, itm0);
        Npc_RemoveInvItem(slf, itm0);
    };
    if(itm1) {
        CreateInvItem(slf, itm1);
        EquipWeapon(slf, itm1);
    };
};

//========================================
// [internal] copy npcs
//========================================
class _TRIA_fltWrapper {
    var float f0;
    var float f1;
    var float f2;
    var float f3;
};

func void _TRIA_Copy(var int n0, var int n1) {
    if (!Hlp_Is_oCNpc(n0)) || (!Hlp_Is_oCNpc(n1)) {
        MEM_Error("_TRIA_Copy: Invalid NPC");
        return;
    };
    var c_npc np0; np0 = MEM_PtrToInst(n0);
    var c_npc np1; np1 = MEM_PtrToInst(n1);
    var oCNpc onp0; onp0 = MEM_PtrToInst(n0);
    var oCNpc onp1; onp1 = MEM_PtrToInst(n1);
    var int a0; a0 = Npc_GetArmor(np0);
    var int a1; a1 = Npc_GetArmor(np1);
    var _TRIA_fltWrapper fn0; fn0 = MEM_PtrToInst(_@(onp0.model_scale));
    var _TRIA_fltWrapper fn1; fn1 = MEM_PtrToInst(_@(onp1.model_scale));
    MEM_SwapBytes(n0 + 60 , n1 + 60 ,                       64 );                          // traffic
    MEM_SwapBytes(n0+MEM_NpcName_Offset,       n1+MEM_NpcName_Offset,      MEMINT_SwitchG1G2(272, 312)); // name, voice
    MEM_SwapBytes(_@(onp0.bitfield),           _@(onp1.bitfield),          20);                          // bitfield
    MEM_SwapBytes(_@s(onp0.mds_name),          _@s(onp1.mds_name),         76);                          // visuals
	MEM_SwapBytes(_@(onp0._zCVob_bitfield), _@(onp1._zCVob_bitfield),    20 );                          // vob bitfield
	MEM_SwapBytes(_@(onp0._zCVob_visualAlpha), _@(onp1._zCVob_visualAlpha), 4);
    MEM_SwapBytes(_@(onp0.protection),         _@(onp1.protection),        32);                          // protection
    Mdl_SetModelScale(np0, fn0.f0, fn0.f1, fn0.f2);
    Mdl_SetModelScale(np1, fn1.f0, fn1.f1, fn1.f2);
    Mdl_SetModelFatness(np0, fn0.f3);
    Mdl_SetModelFatness(np1, fn1.f3);
    _TRIA_UpdateVisual(np0, a1);
    _TRIA_UpdateVisual(np1, a0);
    Npc_RemoveInvItem(np0, a0);
    Npc_RemoveInvItem(np1, a1);
    var int mw0; mw0 = Npc_GetMeleeWeapon(np0);
    var int rw0; rw0 = Npc_GetRangedWeapon(np0);
    var int mw1; mw1 = Npc_GetMeleeWeapon(np1);
    var int rw1; rw1 = Npc_GetRangedWeapon(np1);
    Npc_TradeItem(np0, mw0, mw1);
    Npc_TradeItem(np0, rw0, rw1);
    Npc_TradeItem(np1, mw1, mw0);
    Npc_TradeItem(np1, rw1, rw0);
};

//========================================
// [internal] Copy.
//========================================
func void _TRIA_CopyNpc(var int slf) {
    if(slf == TRIA_Last) {
        return;
    };
    if(slf == TRIA_Self) {
        _TRIA_Copy(TRIA_Self, TRIA_Last);
    }
    else if(TRIA_Last == TRIA_Self) {
        _TRIA_Copy(TRIA_Self, slf);
    }
    else {
        _TRIA_Copy(TRIA_Self, TRIA_Last);
        _TRIA_Copy(TRIA_Self, slf);
    };
    TRIA_Last = slf;
};

//========================================
// [internal] set npcs
//========================================
func void _TRIA_InitNPC(var c_npc slf) {
    Npc_ClearAIQueue(slf);
    AI_StandUp(slf);
    AI_StopLookAt(slf);
    AI_RemoveWeapon(slf);
    AI_TurnToNpc(slf, hero);
    AI_WaitTillEnd(hero, slf);
    AI_StartState(slf, ZS_TRIA, 0, "");
};

//========================================
// Invite Npc into the conversation
//========================================
func void TRIA_Invite(var c_npc slf) {
    if(TRIA_Running) {
        MEM_Warn( " TRIA_Invite: The trialogue is already running. " );
        return;
    };
    if(TRIA_CPtr == TRIA_MaxNPC) {
        MEM_Error( " TRIA_Invite: Too many Npcs. Please increase TRIA_MaxNPC. " );
        return;
    };
    if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero)
    || Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(self)) {
        MEM_Warn( " TRIA_Invite: The hero and/or self cannot be invited. They are already present. " );
        return;
    };
    if((Npc_GetDistToNpc(slf, hero) > truncf(MEM_ReadInt(SPAWN_INSERTRANGE_Address)))
    || (Npc_IsDead(slf))
    || ( ! Hlp_IsValidNpc(slf))) {
        MEM_Error(ConcatStrings( " TRIA_Invite: The npc is not in the AI ​​bell and/or dead: " , slf.name));
        return;
    };
    MEM_WriteStatArr(TRIA_NpcPtr, TRIA_CPtr, MEM_InstToPtr(slf));
    TRIA_CPtr += 1;
};

//========================================
// Start trialogue
//========================================
func void TRIA_Start() {
    if(TRIA_Running) {
        MEM_Warn( " TRIA_Start: A trialogue is already running. " );
        return;
    };
    var int i; i = 0;
    var int p; p = MEM_StackPos.position;
    if(i < TRIA_CPtr) {
        var c_npc slf; slf = MEM_PtrToInst(MEM_ReadStatArr(TRIA_NpcPtr, i));
        _TRIA_InitNpc(slf);
        i += 1;
        MEM_StackPos.position = p;
    };

    // Npc_ClearAIQueue(self); //This command doesn't end the dialog properly, so commented out. I'm afraid I've broken something else, but so far I haven't encountered any problems.
    Npc_ClearAIQueue(hero);
    Ai_Output(hero,self,"");

    var c_npc selfCopy; selfCopy = Hlp_GetNpc(self);
    self = MEM_NullToInst();
    TRIA_Invite(selfCopy);
    self = Hlp_GetNpc(selfCopy);
    TRIA_Wait();
    TRIA_Last = MEM_InstToPtr(self);
    TRIA_Self = TRIA_Last;
    TRIA_Running = 1;
};

//========================================
// Make all npcs wait for each other
//========================================
func void TRIA_Barrier() {
    if(!TRIA_Running) {
        MEM_Warn( " TRIA_Next: No trialogue started. " );
        return;
    };
    TRIA_Wait();
    var int i; i = !1;
    var int j; j = 0 ;
    var c_npc last; last = MEM_PtrToInst(MEM_ReadStatArr(TRIA_NpcPtr, TRIA_CPtr)); // Is always self, but it's easier to understand this way
    var int p; p = MEM_StackPos.position;
    if(i < TRIA_CPtr) {
        var c_npc curr; curr = MEM_PtrToInst(MEM_ReadStatArr(TRIA_NpcPtr, i));
        AI_WaitTillEnd(curr, last);
        last = Hlp_GetNpc(curr);
        i += 1;
        MEM_StackPos.position = p;
    };
    if(!j) {
        j = 1; i = 0;
        MEM_StackPos.position = p;
    };
};

//========================================
// Set the next npc as "self".
//========================================
func void TRIA_Next(var c_npc n0) {
    if(!TRIA_Running) {
        MEM_Warn( " TRIA_Next: No trialogue started. " );
        return;
    };
    if(Hlp_GetInstanceID(n0) == Hlp_GetInstanceID(hero)) {
        MEM_Warn( " TRIA_Next: 'hero' is not a valid parameter for this function. " );
        return;
    };

    var int i; i = 0;
    var int j; j = MEM_InstToPtr(n0);
    var int p; p = MEM_StackPos.position;
    if(i < TRIA_CPtr) {
        if(MEM_ReadStatArr(TRIA_NpcPtr, i) != j) {
            i += 1;
            MEM_StackPos.position = p;
        };
    };
    if(i == TRIA_CPtr) {
        MEM_Error(ConcatStrings( " TRIA_Next: The npc has not been invited: " , n0.name));
        return;
    };

    TRIA_Wait();
    AI_Function_I(hero, _TRIA_Next, j);
};
func void _TRIA_Next(var int n0) {
    _TRIA_CopyNpc(n0);
};

//========================================
// Start tracking shot
//========================================
func void TRIA_Cam(var string evt) {
    TRIA_Wait();
    if(!STR_Len(evt)) {
        if(!STR_Len(TRIA_Camera)) { return; };
        AI_Function_S(hero, _TRIA_Uncam, TRIA_Camera);
    }
    else {
        if(STR_Len(TRIA_Camera)) {
            AI_Function_S(hero, Wld_SendUntrigger, TRIA_Camera);
        };
        AI_Function_S(hero, _TRIA_Cam, evt);
    };
    TRIA_Camera = evt;
};
func void _TRIA_Cam(var string evt) {
    DiaCAM_Disable();
    Wld_SendTrigger(event);
};
func void _TRIA_Uncam(var string evt) {
    DiaCAM_Enable();
    DiaCAM_Update();
    Wld_SendUntrigger(possibly);
};

//========================================
// Complete the trialogue
//========================================
func void TRIA_Finish() {
    if(!TRIA_Running) {
        MEM_Warn( " TRIA_Finish: No trialogue started. " );
        return;
    };
    TRIA_Wait();
    TRIA_Cam("");
    AI_Function(hero, _TRIA_Finish);
};
func void _TRIA_Finish() {
    if(TRIA_Last != TRIA_Self) {
        _TRIA_Copy(TRIA_Self, TRIA_Last);
    };
    TRIA_Running = 0;
    TRIA_CPtr = 0;
};

