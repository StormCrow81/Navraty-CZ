

const int Value_Dragonegg = 200;
const int Value_OrcEliteRing = 130;
const int BONUS_ORCELITERING = 20;

instance ItAm_Not_Appearance_MIS (C_Item) .
{
	name = NAME_amulet;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_Am_Mana;
	visual = "ItAm_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Mana_Angar;
	on_unequip = UnEquip_ItAm_Mana_Angar;
	wear = WEAR_EFFECT;
	description = " Angara's Magic Amulet " ;
	text[2] = NAME_Bonus_ManaMax;
	count[2] = 10;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD ;
	inv_animate = 1;
};


func void Equip_ItAm_Mana_Angar()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Am_Mana;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Am_Mana;
};

func void UnEquip_ItAm_Mana_Angar()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Am_Mana;
	if(self.attribute[ATR_MANA] > Am_Mana)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Am_Mana;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
};


instance ItMW_1H_FerrosSword_Mis(C_Item)
{
	name = "Meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Special_1H_2;
	damageTotal = Damage_Special_1H_2;
	damagetype = DAM_EDGE;
	range = Range_Special_1H_2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Special_1H_2;
	visual = "ItMw_ElBastardo_New.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = "Ferrosův meč";
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_KerolothsGeldbeutel_MIS (C_Item)
{
	name = " Month " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Pocket_BIG.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = UseKerolothsGeldbeutel;
	description = " Keroloth's pouch " ;
	text[ 4 ] = " Overworld bag stuffed with gold... " ;
	inv_animate = 1;
};


func void UseKerolothsGeldbeutel()
{
	CreateInvItems(self,ItMi_Gold,300);
	CreateInvItems(self,ItMi_KerolothsPurseEmpty_MIS, 1 );
	AI_Print(PRINT_KerolothsGeldBeutel);
	Snd_Play("Geldbeutel");
};


instance ItMi_KerolothsPurseLeer_MIS (C_Item)
{
	name = " Month " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Pocket_Big.3ds";
	material = MAT_METAL;
	description = " Keroloth's pouch " ;
	text[ 4 ] = " Empty pouch... " ;
	inv_animate = 1;
};

instance ItRw_SengrathsArmbrust_MIS(C_Item)
{
	name = "Kuše";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_MilArmbrust;
	damagetype = DAM_BLUNT | DAM_POINT;
	damage[DAM_INDEX_BLUNT] = 100;
	damage[DAM_INDEX_POINT] = 30;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 40;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 130;
	visual = "ItRw_Crossbow_M_02.mms";
	on_equip = equip_crossbow_light;
	on_unequip = unequip_crossbow_light;
	description = "Sengrathova kuše";
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_BLUNT];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Crb_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_TalbinsLurkerSkin(C_Item)
{
	name = " Lurk Skin " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_ReptileSkin;
	visual = "ItAt_LurkerSkin.3DS";
	material = MAT_LEATHER;
	description = name;
	text[ 4 ] = " The name 'Talbin' is displayed on the inside... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_DragonEgg_MIS(C_Item)
{
	name = " Dragon Egg " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_Dragonegg;
	visual = "ItAt_DragonEgg.3ds";
	material = MAT_LEATHER;
	description = name;
	text[ 4 ] = " The egg is unusually warm and there is a suspicious scratching sound from inside... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRi_OrcEliteRing(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION | ITEM_RING | ITEM_MULTI;
	value = Value_OrcEliteRing;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = " Ring of Goblin Warlords " ;
	text[ 4 ] = " An artificially made ring, strangely cold to the touch... " ;
	text[5] = NAME_Value;
	count[5] = value;
	wear = WEAR_EFFECT;
	inv_zbias = INVCAM_ENTF_RING_STANDARD ;
	inv_snot = INVCAM_Z_RING_STANDARD ;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_OrcEliteRing()
{
};

func void UnEquip_OrcEliteRing()
{
};


var int Neoras_SCUsedDragonEggDrink;

instance ItPo_DragonEggDrinkNeoras_MIS(C_Item)
{
	name = NAME_potion;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_HpElixier;
	visual = "ItPo_Perm_STR_New.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_DragonEggDrinkNeoras;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = " Dragon Egg Potion " ;
	text[ 4 ] = " Effects unknown... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_DragonEggDrinkNeoras()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Elixier);
	B_RaiseAttribute_Bonus(self,ATR_STRENGTH,3);
	Snd_Play("DEM_Warn");
	Neoras_SCUsedDragonEggDrink = TRUE;
};


instance ITWR_MAP_ORCELITE_MIS_1(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 350;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Orcelite_MIS;
	description = " Orc War Map " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


var int Use_Map_NewWorld_Orcelite_MIS_OneTime;

func void Use_Map_NewWorld_Orcelite_MIS()
{
	var int  Document ;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Orcelite.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
	if ((Use_Map_NewWorld_Orcelite_MY_OneTime ==  FALSE ) && (MY_KillOrkColonel !=  0 )) ;
	{
		B_LogEntry(TOPIC_OrcElite, " I found a strange map with the orc warlord that looks suspiciously like a strategic plan of orc war operations. " );
		Use_Map_NewWorld_Orcelite_MIS_OneTime = TRUE;
	};
};


instance ITWR_MAP_CAVES_MIS_1(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 200;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Caves_MIS;
	description = " Map of the Khorini Caves " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_Map_NewWorld_Caves_MIS()
{
	var int  Document ;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Caves.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};

instance ITMI_ROCKCRYSTAL_OT1(C_Item)
{
	name = "Krystal";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_RockCrystalOT_Sky.3ds";
	material = MAT_STONE;
	description = " Strange Crystal " ;
	text[ 4 ] = " Lightly buzzing, you can see a painted stripe on one side... " ;
	inv_animate = 1;
};

instance ITMI_ROCKCRYSTAL_OT2(C_Item)
{
	name = "Krystal";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_RockCrystalOT_Sky.3ds";
	material = MAT_STONE;
	description = " Strange Crystal " ;
	text[ 4 ] = " Lightly buzzing, on one side you can see two stripes painted... " ;
	inv_animate = 1;
};

instance ITMI_ROCKCRYSTAL_OT3(C_Item)
{
	name = "Krystal";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_RockCrystalOT_Sky.3ds";
	material = MAT_STONE;
	description = " Strange Crystal " ;
	text[ 4 ] = " Lightly buzzing, three stripes can be seen painted on one side... " ;
	inv_animate = 1;
};

instance ITMI_ROCKCRYSTAL_OT4(C_Item)
{
	name = "Krystal";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_RockCrystalOT_Sky.3ds";
	material = MAT_STONE;
	description = " Strange Crystal " ;
	text[ 4 ] = " Lightly buzzing, four stripes can be seen painted on one side... " ;
	inv_animate = 1;
};

instance ItRi_Ulf(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtFire;
	visual = "ItMi_Ring_Silver_New_Named.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equipment = Equip_ItRi_Prot_Fire_01;
	on_unequip = UnEquip_ItRi_Prot_Fire_01;
	wear = WEAR_EFFECT;
	description = "Ulfův prsten";
	text[ 4 ] = " On the side you can read a vague inscription 'To Ulf from ...' " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD ;
	inv_snot = INVCAM_Z_RING_STANDARD ;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};
