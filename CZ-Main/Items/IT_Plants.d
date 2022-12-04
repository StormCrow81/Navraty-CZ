

const int Value_Weed = 0;
const int Value_Beet = 3;
const int HP_Beet = 5;
const int Value_SwampHerb = 10;
const int VALUE_SWAMPHERB_02 = 250;
const int Value_SwampHerb_Balam = 50;
const int Value_Mana_Herb_01 = 10;
const int Mana_Mana_Herb_01 = 10;
const int Value_Mana_Herb_02 = 20;
const int Mana_Mana_Herb_02 = 15;
const int Value_Mana_Herb_03 = 40;
const int Mana_Mana_Herb_03 = 20;
const int Value_Health_Herb_01 = 20;
const int HP_Health_Herb_01 = 15;
const int Value_Health_Herb_02 = 40;
const int HP_Health_Herb_02 = 20;
const int Value_Health_Herb_03 = 60;
const int HP_Health_Herb_03 = 25;
const int Value_Dex_Herb_01 = 250;
const int Value_Strength_Herb_01 = 500;
const int Value_Speed_Herb_01 = 100;
const int Speed_Boost = 15000;
const int Value_Mushroom_01 = 15;
const int HP_Mushroom_01 = 10;
const int Value_Mushroom_02 = 35;
const int HP_Mushroom_02 = 20;
const int Value_Forestberry = 10;
const int HP_Forestberry = 15;
const int Value_Blueplant = 10;
const int HP_Blueplant = 10;
const int Mana_Blueplant = 5;
const int Value_Planeberry = 10;
const int HP_Planeberry = 20;
const int Value_Temp_Herb = 20;
const int HP_Temp_Herb = 10;
const int Value_Perm_Herb = 500;
const int HP_Perm_Herb = 15;
const int HP_SUPER_HERB = 50;
const int HP_PERM_STN_HERB = 5;

instance ItPl_Weed(C_Item)
{
	name = " Grass " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Weed;
	visual = "ItPl_Weed_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Weed;
	inv_zbias = 175;
	inv_animate = 0;
};

instance ItPl_UnWeed(C_Item)
{
	name = " Rotten Grass " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItPl_Weed_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	inv_zbias = 175;
	inv_animate = 0;
};

instance ItPl_Beet(C_Item)
{
	name = "Tuřín";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Beet;
	visual = "ItPl_Beet.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Beet;
	scemeName = "FOOD";
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Beet;
	inv_animate = 0;
};

func void Use_Beet()
{
	if(Npc_IsPlayer(self))
	{
		Hero_Hunger = Hero_Hunger + 2;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItPl_SwampHerb(C_Item)
{
	name = " Swamp Grass " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SwampHerb;
	visual = "ItPl_SwampHerb_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_SwampHerb;
	inv_animate = 0;
};

instance ItPl_SwampHerb_Balam_01(C_Item)
{
	name = " Swamp Grass " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SwampHerb;
	visual = "ItPl_SwampHerb_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[ 4 ] = " Large Swamp Grass Plant... " ;
	text[5] = NAME_Value;
	count[5] = Value_SwampHerb;
	inv_animate = 0;
};

instance ItPl_SwampHerb_Balam_02(C_Item)
{
	name = " Swamp Grass " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SwampHerb;
	visual = "ItPl_SwampHerb_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[ 4 ] = " Large Swamp Grass Plant... " ;
	text[5] = NAME_Value;
	count[5] = Value_SwampHerb;
	inv_animate = 0;
};

instance ItPl_SwampHerb_Balam_03(C_Item)
{
	name = " Swamp Grass " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SwampHerb;
	visual = "ItPl_SwampHerb_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[ 4 ] = " Large Swamp Grass Plant... " ;
	text[5] = NAME_Value;
	count[5] = Value_SwampHerb;
	inv_animate = 0;
};

instance ITPL_SWAMPHERB_02(C_Item)
{
	name = " Red Swamp Grass " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SWAMPHERB_02;
	visual = "ItPl_SwampHerb_Red_N.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_SwampHerb;
	inv_animate = 0;
};

instance ItPl_Mana_Herb_01(C_Item)
{
	name = " Fire Nettle " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Mana_Herb_01;
	visual = "ItPl_Mana_Herb_01_New.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Mana_Herb_01;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Mana_Herb_01;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Mana_Herb_01;
	inv_animate = 0;
};


func void Use_Mana_Herb_01()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Mana_Herb_01);
};


instance ItPl_Mana_Herb_02(C_Item)
{
	name = " Fire Herb " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Mana_Herb_02;
	visual = "ItPl_Mana_Herb_02_New.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Mana_Herb_02;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Mana_Herb_02;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Mana_Herb_02;
	inv_animate = 0;
};


func void Use_Mana_Herb_02()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Mana_Herb_02);
};


instance ItPl_Mana_Herb_03(C_Item)
{
	name = " Fire Root " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Mana_Herb_03;
	visual = "ItPl_Mana_Herb_03_New.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Mana_Herb_03;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Mana_Herb_03;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Mana_Herb_03;
	inv_animate = 0;
};

func void Use_Mana_Herb_03()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Mana_Herb_03);
};

instance ItPl_NetbekPlant(C_Item)
{
	name = " Medicinal plant " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Health_Herb_01;
	visual = "ItPl_Health_Herb_01_New.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItPl_NetbekPlant;
	scemeName = "FOOD";
	description = name;
	text[ 3 ] = " Netbek gave me this healing plant... " ;
	text[ 4 ] = " Completely heals any injury... " ;
	text[5] = NAME_Value;
	count[5] = Value_Health_Herb_01;
	inv_animate = 0;
};

func void Use_ItPl_NetbekPlant()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
};

instance ItPl_NetbekPlant_Magic(C_Item)
{
	name = " Magic Plant " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Mana_Herb_01;
	visual = "ItPl_Mana_Herb_01_New.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItPl_NetbekPlant_Magic;
	scemeName = "FOOD";
	description = name;
	text[ 3 ] = " Netbek gave me this magical plant... " ;
	text[ 4 ] = " Fully restores mana... " ;
	text[5] = NAME_Value;
	count[5] = Value_Mana_Herb_01;
	inv_animate = 0;
};

func void Use_ItPl_NetbekPlant_Magic()
{
	Npc_ChangeAttribute(self,ATR_MANA,self.attribute[ATR_MANA_MAX]);
};

instance ItPl_Health_Herb_01(C_Item)
{
	name = " Medicinal plant " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Health_Herb_01;
	visual = "ItPl_Health_Herb_01_New.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Health_Herb_01;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Health_Herb_01;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Health_Herb_01;
	inv_animate = 0;
};


func void Use_Health_Herb_01()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Health_Herb_01);
};


instance ItPl_Health_Herb_02(C_Item)
{
	name = " Medicinal Herb " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Health_Herb_02;
	visual = "ItPl_Health_Herb_02_New.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Health_Herb_02;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Health_Herb_02;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Health_Herb_02;
	inv_animate = 0;
};


func void Use_Health_Herb_02()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Health_Herb_02);
};


instance ItPl_Health_Herb_03(C_Item)
{
	name = " Medicinal Root " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Health_Herb_03;
	visual = "ItPl_Health_Herb_03_New.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Health_Herb_03;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Health_Herb_03;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Health_Herb_03;
	inv_animate = 0;
};


func void Use_Health_Herb_03()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Health_Herb_03);
};

instance ItPl_Dex_Herb_01(C_Item)
{
	name = "Gobliní bobule";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Dex_Herb_01;
	visual = "ItPl_Dex_Herb_01_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Dex_Herb_01;
	inv_animate = 0;
};

instance ItPl_Strength_Herb_01(C_Item)
{
	name = " Dragon Root " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Strength_Herb_01;
	visual = "ItPl_Strength_Herb_01_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Strength_Herb_01;
	inv_animate = 0;
};

instance ItPl_Speed_Herb_01(C_Item)
{
	name = "Chňapavčí býlí";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Speed_Herb_01;
	visual = "ItPl_Speed_Herb_01_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = Value_Speed_Herb_01;
	inv_animate = 0;
};

instance ItPl_Mushroom_01(C_Item)
{
	name = " Dark Mushroom " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Mushroom_01;
	visual = "ITPL_MUSHROOM_01_NW.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Mushroom_01;
	inv_animate = 0;
};

instance ItPl_Mushroom_02(C_Item)
{
	name = " Slave Bread " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Mushroom_02;
	visual = "ItPl_Mushroom_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Mushroom_02;
	inv_animate = 0;
};


instance ItPl_Blueplant(C_Item)
{
	name = " Blue without " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Blueplant;
	visual = "ItPl_Blueplant_New.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Blueplant;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_BONUS_STAPROC;
	count[1] = 15;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Blueplant;
	inv_animate = 0;
};

func void Use_Blueplant()
{
	var int staminamax;

	if(Npc_IsPlayer(self))
	{
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 15) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};
	};
};

instance ItPl_Forestberry(C_Item)
{
	name = " Forest berries " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Forestberry;
	visual = "ItPl_Forestberry_New.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Forestberry;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Forestberry;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Forestberry;
	inv_animate = 0;
};


func void Use_Forestberry()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Forestberry);
		Hero_Hunger = Hero_Hunger + 1;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItPl_Planeberry(C_Item)
{
	name = " Meadow Berry " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Planeberry;
	visual = "ItPl_Planeberry_New.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Planeberry;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Planeberry;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Planeberry;
	inv_animate = 0;
};

func void Use_Planeberry()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Planeberry);
		Hero_Hunger = Hero_Hunger + 1;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItPl_Temp_Herb(C_Item)
{
	name = " Meadow Buckwheat " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Temp_Herb;
	visual = "ItPl_Temp_Herb_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Temp_Herb;
	inv_animate = 0;
};

instance ItPl_Perm_Herb(C_Item)
{
	name = " Royal sorrel " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Perm_Herb;
	visual = "ItPl_Perm_Herb_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Perm_Herb;
	inv_animate = 0;
};

instance ITPL_SUPER_HERB(C_Item)
{
	name = " Troll Berries " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItPl_Troll_Herb_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 0;
};

instance ItPl_CactusFlower(C_Item)
{
	name = " Cactus leaf " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItPl_CactusFlower_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 0;
};

instance ITPL_DesertIll(C_Item)
{
	name = " Desert Thorn " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItPl_CactusFlower_N.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 0;
};

instance ItPl_MagicRoot(C_Item)
{
	name = " Root of Life " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItPl_Mana_Herb_03_N.3DS";
	material = MAT_LEATHER;
	description = name;
	text[ 4 ] = " An extremely rare plant that was created thanks to the magic of the druids... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 0;
};

instance ItPl_DarkClover(C_Item)
{
	name = " Black Clover " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItPl_DarkClover_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[ 4 ] = " A clover flower that absorbed some of the magic of Darkness... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 0;
};
