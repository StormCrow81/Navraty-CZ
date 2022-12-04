
const  string  ITEMHELPER_WAYPOINT = " DEAD " ; // Daedalus can't take constants as the value of constants... // Icarus' waypoint

//--------------------------------------
//   MEM_Helper
//--------------------------------------

INSTANCE ITEM_HELPER_INST (C_NPC)
{
    name = "Itemhelper";
    id = 54;

    /* immortal: */
    flags = 2;
    attribute   [ATR_HITPOINTS_MAX] = 2;
    attribute   [ATR_HITPOINTS]     = 2;

    /* any visual: */
    Mdl_SetVisual           (self,  "Meatbug.mds");
};

var oCNpc Item_Helper;

func void GetItemHelper() {
    Item_Helper = Hlp_GetNpc (ITEM_HELPER_INST);

    if (!Hlp_IsValidNpc (Item_Helper)) {
        // cache self
        var C_NPC selfBak;
        selfBak = Hlp_GetNpc (self);
        Wld_InsertNpc (ITEM_HELPER_INST, ITEMHELPER_WAYPOINT);
        Item_Helper = Hlp_GetNpc (self);
        self = Hlp_GetNpc(selfBak);
    };
};

func int Itm_GetPtr(var int instance) {	
	GetItemHelper();
	if (!Npc_HasItems(Item_Helper, instance)) {
		CreateInvItem(Item_Helper, instance);
	};
	Npc_GetInvItem(Item_Helper, instance);
	return _@(item);
};
