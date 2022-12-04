

const int Value_Lockpick = 15;
const int Value_Key_01 = 0;
const int Value_Key_02 = 0;
const int Value_Key_03 = 0;

instance ItKE_lockpick(C_Item)
{
	name = "Paklíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Lockpick;
	visual = "ITKE_LOCKPICK.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

// -----------------------------------------------Klyuchi --------------------------------

instance ItKe_City_Tower_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " City Tower Key... " ;
	inv_animate = 1;
};

instance ItKe_HanibalKey(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Bandit Leader Nestor's Key... " ;
	inv_animate = 1;
};

instance ItKe_City_Tower_02(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " City Tower Key... " ;
	inv_animate = 1;
};

instance ItKe_City_Tower_03(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " City Tower Key... " ;
	inv_animate = 1;
};

instance ItKe_City_Tower_04(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " City Tower Key... " ;
	inv_animate = 1;
};

instance ItKe_City_Tower_05(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " City Tower Key... " ;
	inv_animate = 1;
};

instance ItKe_City_Tower_06(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " City Tower Key... " ;
	inv_animate = 1;
};

instance ItKe_Valentino(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Valentine's Chest Key... " ;
	inv_animate = 1;
};

instance ItKe_Constantino(C_Item)
{
	name = " Constantine's Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Alchemist Constantine's Chest Key... " ;
	inv_animate = 1;
};

instance ItKe_WaterBringer(C_Item)
{
	name = " Water Bearer's Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItMi_Pliers.3DS";
	material = MAT_METAL;
	description = name;
	inv_animate = 1;
};

instance ItKe_Storage(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Harbor Warehouse Key... " ;
	inv_animate = 1;
};

instance ItKe_ThiefTreasure(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Thieves' Treasure Key... " ;
	inv_animate = 1;
};

instance ItKe_ZhiefGuildKey_MIS(C_Item)
{
	name = " Rusty Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " This key has been marked by salt sea water... " ;
	inv_animate = 1;
};

instance ItKe_XhiefGuildKey_Hotel_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Hotel cellar key... " ;
	inv_animate = 1;
};

instance ItKe_Richter(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Judge's Chest Key... " ;
	inv_animate = 1;
};

instance ItKe_Salandril(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Alchemist Salandril's Chest Key... " ;
	inv_animate = 1;
};

instance ItKe_Fingers(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Rusty key to Fingers room... " ;
	inv_animate = 1;
};

instance ItKe_Bromor(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = " Key " ;
	text[ 4 ] = " Brothel room key... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_Ship_Levelchange_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key to the captain's cabin on the paladin ship 'Esmeralda'... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_Xardas(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Chest Key in Xardas Tower... " ;
	inv_animate = 1;
};


instance ItKe_Innos_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " The key to enter the monastery of Fire mages... " ;
	inv_animate = 1;
};

instance ItKe_IgarazChest_Mis(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " The key to Igaraz's personal chest... " ;
	inv_animate = 1;
};


instance ItKe_KlosterBibliothek(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key to the monastery library... " ;
	inv_animate = 1;
};

instance ItKe_KDFPlayer(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key to the monastery cell... " ;
	inv_animate = 1;
};

instance ItKe_KlosterSchatz (C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key to the monastery treasury... " ;
	inv_animate = 1;
};


instance ItKe_KlosterStore(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key to the monastery pantry... " ;
	inv_animate = 1;
};

instance ItKe_MonastarySecretLibrary_Mis(C_Item) //EVT_OPEN_DOOR_LIBRARY
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_02;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key from the 'Halls of Irdorath' book... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_Hagen_DarkOrder_Ginnok(C_Item)
{
	name = " Old Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Lord Ginnok's Tomb Key... " ;
	inv_animate = 1;
};

instance ITKE_RUNE_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = " Key " ;
	text[ 4 ] = " Key to the chest under the bridge... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_ORLAN_HOTELROOM (C_Item)
{
	name = " Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Room key at the inn 'At the Dead Harpy'... " ;
	inv_animate = 1;
};

instance ITKE_ORLAN_TELEPORTSTATION(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = " Orlan's Key " ;
	text[ 4 ] = " Opens the cave door south of his inn... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_Hagen_DarkOrder_01(C_Item)
{
	name = " Old Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Lord Sengah's Tomb Key... " ;
	inv_animate = 1;
};

instance ItKe_Pass_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = " Lord Hagen's Key " ;
	text[ 4 ] = " Key from the winch of the gate to Mining Valley... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_Dexter(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Dexter's Chest Key... " ;
	inv_animate = 1;
};

instance ITKE_DARKTOWER_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key to Nergal's Tower... " ;
	inv_animate = 1;
};

instance ITKE_FORT(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Passage winch key to Azgan Fortress... " ;
	inv_animate = 1;
};

instance ItKe_Hagen_Innubis (C_Item) // dvoynoy!!!
{
	name = " Old Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Lord Inubis Tomb Key... " ;
	inv_animate = 1;
};

instance ItKe_EVT_CRYPT_01(C_Item) //mob_func_necrom
{
	name = " Old Steel Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " The key to the chest in the tomb of Lord Inubis... " ;
	inv_animate = 1;
};

instance ItKe_EVT_CRYPT_02(C_Item)
{
	name = " Old Brass Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " The key to the chest in the tomb of Lord Inubis... " ;
	inv_animate = 1;
};

instance ItKe_EVT_CRYPT_03(C_Item)
{
	name = " Old Copper Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " The key to the chest in the tomb of Lord Inubis... " ;
	inv_animate = 1;
};

instance ItKe_CHEST_SEKOB_XARDASBOOK_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_02;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Chest Key at Sekob's Farm... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_HAGEN_SECRETKEY(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key from the passage to the portal to the island of Etlu... " ;
	inv_animate = 1;
};

instance ItKe_MagicChest(C_Item)
{
	name = " Old Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " A very old iron key... " ;
	inv_animate = 1;
};

instance ItKe_Hagen_DarkOrder_02(C_Item)
{
	name = " Old Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Lord Ulzar's Tomb Key... " ;
	inv_animate = 1;
};

instance ItKe_PrisonKey_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key to the castle prison... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_OC_MAINGATE_MIS (C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key from the guardhouse of the castle gate in Mining Valley... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_FingersKey(C_Item)
{
	name = " Old Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " It has 'Fingers' stamped on it... " ;
	inv_animate = 1;
};

instance ItKe_OC_Store(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key to the castle warehouse... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_TWOSTORE(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key to the inner room of the castle warehouse... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_ERZBARONTREASURE(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = " Key " ;
	text[ 4 ] = " The name 'Gomez' is engraved on the key... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_MILTENKEY_NW(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " The key to the chest in the chapel of the mages in the castle... " ;
	inv_animate = 1;
};

instance ITKE_OC_TOWERCHEST (C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key to the chest in the castle tower in Mining Valley... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_ErzBaronFlur(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = " Key " ;
	text[ 4 ] = " The name 'Gomez' is engraved on the key... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_ErzBaronRaum(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = " Key " ;
	text[ 4 ] = " The name 'Gomez' is engraved on the key... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKEY_GOMEZTREASURE(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Gomez's chest key... " ;
	inv_animate = 1;
};

instance ITKE_NC_COOKCHEST(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " The key given to me by the castle cook... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_WaterMageDocuments(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key to the Water Mage Chest in New Camp... " ;
	inv_animate = 1;
};

instance ITKE_WOLFARMOR (C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Mercenary Wolf's Chest Key in Mining Valley... " ;
	inv_animate = 1;
};

instance ItKe_StoneDragon(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Stone Dragon Treasure Key... " ;
	inv_animate = 1;
};

instance ItKe_FireDragon(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Fire Dragon Treasure Key... " ;
	inv_animate = 1;
};

instance ItKe_SwampDragon(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Swamp Dragon Treasure Key... " ;
	inv_animate = 1;
};

instance ItKe_IceDragon(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Ice Dragon Treasure Key... " ;
	inv_animate = 1;
};

instance ItKe_Malbar(C_Item) //Scr_OpenChest_Malbar
{
	name = " Rusty Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Red Baron Malbara Key... " ;
	inv_animate = 1;
};

instance ITKE_XARDASGOBLINKEY (C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Ghost Goblin Chest Key... " ;
	inv_animate = 1;
};

instance ITKE_DRAKAR_KEY_CAPITAN (C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_OrcKey_02.3DS";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key to the captain's cabin on the goblin drake... " ;
	inv_animate = 1;
};

instance ITKE_DRAKAR_KEY_01 (C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_OrcKey.3DS";
	material = MAT_METAL;
	description = name;
	text[ 2 ] = " Key to the armory on the goblin dragon... " ;
	inv_animate = 1;
};

instance ITKE_DRAGONSNAPPER(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Dragon Snapper Stomach Key... " ;
	inv_animate = 1;
};

instance ITKE_Addon_Tavern_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = " Lou's Key " ;
	text[ 4 ] = " Key to the larder in the bandit camp... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_ADDON_BUDDLER_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = " Key " ;
	text[ 4 ] = " Chest key from bandit camp... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_Addon_Esteban_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = " Esteban's Key " ;
	text[ 4 ] = " Esteban's chest key... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_Addon_Thorus(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = " Thorus Key " ;
	text[ 4 ] = " Thorus Chest Key... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_ADDON_SKINNER(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = " Skinner key " ;
	text[ 4 ] = " Key to Skinner's Chest... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_SCATTYCHEST(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = " Scatty's Key " ;
	text[ 4 ] = " Scatty's Chest Key... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_Addon_Bloodwyn_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = " Bloodwyn's Key " ;
	text[ 4 ] = " Bloodwyn's Chest Key... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_Addon_Heiler (C_Item)	 // Scr_OpenChest_Garantula
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 2 ] = " Swampstone Guardian Key... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_CANYONLIBRARY_HIERARCHY_BOOKS_ADDON(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Strange looking goblin shaman key... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_Greg_ADDON_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = " Greg's Key " ;
	text[ 4 ] = " Captain Greg's Shack Key... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_TARAKOT (C_Item)
{
	name = " Copper Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKey_GoblinChest(C_Item)
{
	name = " Goblin Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " The goblin leader Shakzi had this key... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_PaladinTruhe(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Paladin Chest Key... " ;
	inv_animate = 1;
};

instance ItKe_Buerger(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " This key was lying on the fireplace... " ;
	inv_animate = 1;
};

instance ItKe_Ginnok(C_Item)
{
	name = " Rusty Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Lord Ginnok's Key... " ;
	inv_animate = 1;
};

instance ITKE_ORCSHAMAN_SHV (C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Goblin Shaman Ghost Chest Key in Shadow Valley... " ;
	inv_animate = 1;
};

instance ITKE_KOD_SHV(C_Item)	//Scr_OpenChest_225 226
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = " Dakat's Key " ;
	text[ 4 ] = " Chest Key in Dakat's Tomb... " ;
	inv_animate = 1;
};

instance ItKe_AhironKey(C_Item)	//
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = " Achiron's Key " ;
	text[ 4 ] = " Achiron's Chest Key... " ;
	inv_animate = 1;
};

instance ITKE_MAGE_SHV(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_02;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Priest's Chest Key in the Valley of Shadows... " ;
	inv_animate = 1;
};

instance ItKe_Oazis_01(C_Item)	//Scr_OpenChest_AV_01
{
	name = " Rusty Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	inv_animate = 1;
};

instance ItKe_Oazis_02(C_Item)	//Scr_OpenChest_AV_02
{
	name = " Rusty Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	inv_animate = 1;
};

instance ItKe_Oazis_03(C_Item)	//Scr_OpenChest_AV_03
{
	name = " Rusty Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	inv_animate = 1;
};

instance ItKe_Oazis_04(C_Item)	//Scr_OpenChest_AV_04
{
	name = " Rusty Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	inv_animate = 1;
};


instance ItKe_Caracust(C_Item)
{
	name = " Rusty Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	inv_animate = 1;
};

instance ItKe_Masiaf_Prision(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Winch Key in Osair's Cave... " ;
	inv_animate = 1;
};

instance ItKe_CorGalom(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key of Cor Kalom, Demon Masyaf... " ;
	inv_animate = 1;
};

instance ItKe_PW_Sklad(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Masyaf Temple Pantry Key... " ;
	inv_animate = 1;
};

instance ItKe_OrkKnastDI_MIS (C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key of Ur-Vatah, Goblin Commander... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_EVT_UNDEAD_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Lord Archol's Key... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_EVT_UNDEAD_02(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key of Mialeks, Builder of the Temple of Irdorath... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_ChestMasterDementor_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key to the chest of the guardian of the Irdorath Halls, the Dementor... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_LastDoorToUndeadDrgDI_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Old door key... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_FREEMINE(C_Item)
{
	name = " Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key from the guardhouse of the Free Mine... " ;
	inv_animate = 1;
};

instance ITKE_FREMINEKDW(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " The key to the chest in the Free Mine... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_VARUSKEY (C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Azgan Fortress Warehouse Key... " ;
	inv_animate = 1;
};

instance ITKE_GRIMKEY(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " The key to the guard's chest in the abandoned mine... " ;
	inv_animate = 1;
};

instance ITKE_XARDASOWT(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key to the chest in the flooded tower... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_SI_SIGN(C_Item)
{
	name = " Seal Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ITKE_SEAL_SKY.3DS";
	material = MAT_METAL;
	description = name;
	text[ 3 ] = " Paladin Chapel Entrance Seal Key... " ;
	text[ 4 ] = " There is a paladin monogram on the key... " ;
	inv_animate = 1;
};

instance ItKe_Sleeper(C_Item)
{
	name = "Symbol Spáče";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_OrcKey_02.3DS";
	material = MAT_METAL;
	description = name;
	inv_animate = 1;
};

instance ItKe_OrcMine_Elevator(C_Item)
{
	name = " Goblin Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_OrcKey.3DS";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Winch key in goblin mine... " ;
	inv_animate = 1;
};

instance ItKe_ShipOrcCap(C_Item)
{
	name = " Goblin Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_OrcKey.3DS";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Goblin Dragon Captain's Key... " ;
	inv_animate = 1;
};

instance ItKe_ArDagar(C_Item)
{
	name = " Goblin Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_OrcKey_02.3DS";
	material = MAT_METAL;
	description = " Key of Ar Dagar " ;
	text[ 4 ] = " Goblin Warehouse Key... " ;
	inv_animate = 1;
};

instance ItKe_OrcOreMine(C_Item)
{
	name = " Goblin Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_OrcKey.3DS";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Goblin Mine Key... " ;
	inv_animate = 1;
};

instance ItKe_OldOrcKey(C_Item)
{
	name = " Goblin Key " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_OrcKey.3DS";
	material = MAT_METAL;
	description = " Old Goblin Key " ;
	text[ 3 ] = " Semicircular key with cutouts at different angles... " ;
	text[ 4 ] = " On the lower part there is an inscription in goblin language... " ;
	inv_animate = 1;
};

instance ITKE_PORTALTEMPELWALKTHROUGH_ADDON(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " From the door in the ruined Temple of the Builders... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_Bandit(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Braga's Chest Key... " ;
	inv_animate = 1;
};

instance ItKe_SagittaChest(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Key to Sagitta's Chests... " ;
	inv_animate = 1;
};

instance ItKe_DarkZhnez(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Dark Reaper's Key... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_Garond(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Garond's Key... " ;
	inv_animate = 1;
};

// --------------epic danzh------------------------

instance ItKe_Arahar (C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_02;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Arahara's Key... " ;
	inv_animate = 1;
};

instance ItKe_LichKing(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_02;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Temple Guardian Key... " ;
	inv_animate = 1;
};
