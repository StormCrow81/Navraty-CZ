
/* -------------------- CZ CHANGELOG -------------------- */

/*
v1.00:
func void UseBloodMIS - edited listings
func void UseDiofant_Paper - fixed puzzle
*/




instance ItMi_StoneOfKnowlegde_MIS(C_Item)
{
	name = " Stone of Knowledge " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "ItMi_StoneOfKnowlegde_MIS.3DS";
	material = MAT_STONE;
	description = name;
	inv_animate = 1;
};

instance ItMi_ParlanRelic_MIS(C_Item)
{
	name = " Ancient Relic " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_StoneOfKnowlegde_MIS.3DS";
	material = MAT_STONE;
	description = name;
	text[ 4 ] = " This relic apparently belonged to a Fire mage... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_PaladinLetter_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePaladinLetter;
	scemeName = "MAP";
	description = " Dopis lord Hagenov " ;
	text[ 4 ] = " This letter was written by Garond, the commander of the paladin squad... " ;
	inv_animate = 1;
};


func void UsePaladinLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Lorde Hagene!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " The expedition to Mining Valley failed. We suffered heavy losses and those who survived are now trapped in the castle and surrounded by goblins. We were also attacked many times by dragons. They destroyed and burned all the land around the castle. With Innos with help, we can perhaps hold out until reinforcements arrive. We have nothing else to do anyway, as we cannot make any kind of attack. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Garond");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_LetterForGorn_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLetterForGorn;
	scemeName = "MAP";
	description = "Miltenův odkaz";
	inv_animate = 1;
};

func void UseLetterForGorn()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Gorne!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Garond has agreed to release you - for 1000 gold. So if you've got any gold lying around, it's time to get rid of it. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Milten");
	Doc_Show(nDocID);
};

instance ItMi_GornsTreasure_MIS(C_Item)
{
	name = " Month " ;
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 1;
	visual = "ItMi_Pocket_Medium.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = UseGornsTreasure;
	description = " Gorn's Pouch " ;
	text[ 4 ] = " This pouch apparently belonged to the mercenary Gorn... " ;
	inv_animate = 1;
};


func void UseGornsTreasure()
{
	B_PlayerFindItem(ItMi_Gold,250);
	gorns_bag = TRUE ;
};


instance ItWr_Silvestro_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseItwr_Silvestro;
	scemeName = "MAP";
	description = " Message from New Year's Eve " ;
	inv_animate = 1;
};


func void UseItwr_Silvestro()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I have a bad feeling, so I'd better hide all the ore somewhere. Diego is the only one of us here who knows. He'll surely hide the crates somewhere safe. We have to protect the ore at all costs, so I'm sending more two knights. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"		Silvestro");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItAt_ClawLeader(C_Item)
{
	name = " Snapper's Claws " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 150;
	visual = "ItAt_Claw_Sky.3DS";
	material = MAT_LEATHER;
	description = " Snapper's Claws " ;
	text[ 4 ] = " These fearsome claws belonged to the leader of the snapper pack... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_CLAWBLACKSNAPPER(C_Item)
{
	name = " Snapper's Claws " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 200;
	visual = "ItAt_Claw.3DS";
	material = MAT_LEATHER;
	description = " Black Snapper's Claws " ;
	text[ 4 ] = " These fearsome claws belonged to a black snapper... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_VEPRFUR(C_Item)
{
	name = " Boar Skin " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 300;
	visual = "ItAt_VeprFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[ 4 ] = " I took this skin off a wild boar I brought down... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_NIGHTHUNTERFUR(C_Item)
{
	name = " Ghostly Shadow Beast Skin " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItAt_TrollBlackFur_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[ 4 ] = " I skinned this ghostly shadowbeast that I brought down... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_LUKEREGG(C_Item)
{
	name = " Ambush Eggs " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 150;
	visual = "G3_Item_Scavanger_Egg_01.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSe_Olav (C_Item)
{
	name = " Month " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_Pocket_Small.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = UseOlav;
	description = " Olav's pouch " ;
	text[ 4 ] = " Several coins jingle in the purse... " ;
	inv_animate = 1;
};

func void UseOlav()
{
	B_PlayerFindItem(ItMi_Gold,25);
};


instance ItMi_Plate_MISGold(C_Item)
{
	name = " Gold Plate " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldPlate;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


instance ItWr_Bloody_MIS(C_Item)
{
	name = " Note " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseBloodMIS;
	scemeName = "MAP";
	description = " Bloodfly Poison " ;
	inv_animate = 1;
};


func void UseBloodMIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " The sting of a blood fly contains a violent poison, and therefore no one who has all five together will touch it. That is, unless they know the secret of how to reliably remove them. The sting can be opened cleanly if a sharp knife is carefully you cut and peel off the outer skin. Then all you have to do is remove the tissue around the poison glands. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Damarok");
	Doc_Show(nDocID);
	if(Knows_Bloodfly == FALSE)
	{
		Knows_Bloodfly = TRUE;
		AI_Print( " Learned: Extracting secretions from stingers " );
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus, " Now I know how to get healing secretions from blood fly stings. " );
		B_GivePlayerXP(XP_Ambient);
	};
};


instance ItWr_Pfandbrief_MIS(C_Item)
{
	name = " Pledge Agreement " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Ordr.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePfandbrief;
	scemeName = "MAP";
	description = name;
	text[ 4 ] = " Buyer Luter's Pledge Agreement... " ;
	inv_animate = 1;
};


func void UsePfandbrief()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " For the purpose of repaying outstanding claims, an object whose value settles said claims should be accepted as a pledge. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Pledged : " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " - decorated gold chalice from the collection of Blood Chalices " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Lutero, kupec");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Lehmar, věritel");
	Doc_Show(nDocID);
};


instance ITWR_LUTEROLOGY (C_Item);
{
	name = "Dluhopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Ordr.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_luteroloan;
	scemeName = "MAP";
	description = name;
	text[ 4 ] = " Bond of buyer Luter to usurer Lehmar... " ;
	inv_animate = 1;
};


func void use_luteroloan()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I, Luther, borrow five thousand guilders from the usurer Lehmar and undertake to repay this debt, including the appropriate interest, within the agreed period. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Lutero, kupec");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Lehmar, creditor " );
	Doc_Show(nDocID);
};


instance ITWR_MAP_OLDWORLD_OREMINES_MIS_1(C_Item)
{
	name = " Garonda's Map of Mining Valley " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_OldWorld_Oremines;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_OldWorld_Oremines()
{
	var int  Document ;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_OldWorld_Oremines.tga",TRUE);
	Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
	Doc_Show(Document);
};


instance ItWr_Manowar(C_Item)
{
	name = "Svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseManowar;
	scemeName = "MAP";
	description = " Song Lyrics " ;
	inv_animate = 1;
};


func void UseManowar()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Dominic's call " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " We will sing His glory " );
	Doc_PrintLines(nDocID, 0 , " Innos stands by me and my brothers " );
	Doc_PrintLines(nDocID, 0 , " My sword serves only Him alone " );
	Doc_PrintLines(nDocID, 0 , " And today His name will be heard everywhere " );
	Doc_PrintLines(nDocID, 0 , " Anyone who confronts me " );
	Doc_PrintLines(nDocID, 0 , " I write with my own hand " );
	Doc_PrintLines(nDocID, 0 , " For I am a warrior of Innos! " );
	Doc_Show(nDocID);
};


instance ItWr_KDWLetter(C_Item)
{
	name = " Message " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseKDWLetter;
	scemeName = "MAP";
	description = " Message " ;
	inv_animate = 1;
};


func void UseKDWLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " We've left the camp. Now that the barrier has fallen, we'll seek out the place where all this destruction began. Maybe there we'll find the answers we've been searching for for years. Only Adanos knows where the road will lead us. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Adanos accompany us! " );
	Doc_PrintLine(nDocID, 0 , " Saturation " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_GilbertLetter(C_Item)
{
	name = " Note " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseGilbertLetter;
	scemeName = "MAP";
	description = "Poznámka";
	inv_animate = 1;
};


func void UseGilbertLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I'm starting to get really pissed off. I've been hiding here long enough and if I heard correctly, the barrier has finally fallen. Now no one will be looking for me. I'm sick of this hideous cave and damned valley. It's time return home. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Gilbert");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItRi_Tengron(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Hp;
	visual = "ItMi_Ring_Silver_New_Named.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Tengron;
	on_unequip = UnEquip_ItRi_Tengron;
	wear = WEAR_EFFECT;
	description = NAME_ADDON_TengronsRing;
	text[2] = NAME_Bonus_HpMax;
	count[2] = Ri_Hp;
	text[ 4 ] = " This ring belonged to a paladin named Tengron... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD ;
	inv_snot = INVCAM_Z_RING_STANDARD ;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_Hp;
};

func void UnEquip_ItRi_Tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_Hp;
	if(self.attribute[ATR_HITPOINTS] > (Ri_Hp + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_Hp;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};

instance ItWr_Diofant_Paper(C_Item)
{
	name = "Prach Diofantův";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseDiofant_Paper;
	scemeName = "MAP";
	description = " Scroll with notes " ;
	inv_animate = 1;
};


func void UseDiofant_Paper()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Do you want to find out about someone, " );
	Doc_PrintLine(nDocID, 0 , " is his mind sharp, " );
	Doc_PrintLine(nDocID, 0 , " let him solve the puzzle. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Prach Diofantův");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Diophantus rests here; " );
	Doc_PrintLines(nDocID, 0 , " look at the tombstone " );
	Doc_PrintLines(nDocID, 0 , " and he by his wise art " );
	Doc_PrintLines(nDocID, 0 , " the age of the deceased will reveal. " );
	Doc_PrintLines(nDocID, 0 , " Thanks to the will of the gods a sixth " );
	Doc_PrintLines(nDocID, 0 , " his being as a child lived, " );
	Doc_PrintLines(nDocID, 0 , " half a sixth then experienced " );
	Doc_PrintLines(nDocID, 0 , " with a tuft of old age on the cheeks. " );
	Doc_PrintLines(nDocID, 0 , " Seventh more down, " );
	Doc_PrintLines(nDocID, 0 , " than he married mila; " );
	Doc_PrintLines(nDocID, 0 , " the one after five years of marriage " );
	Doc_PrintLines(nDocID, 0 , " the son of the beautiful povila. " );
	Doc_PrintLines(nDocID, 0 , " Only half the years of his father " );
	Doc_PrintLines(nDocID, 0 , " a little boy remained in the world, " );
	Doc_PrintLines(nDocID, 0 , " than from his dear parents " );
	Doc_PrintLines(nDocID, 0 , " separated until eternity was. " );
	Doc_PrintLines(nDocID, 0 , " Two short summers two more " );
	Doc_PrintLines(nDocID,0,"Diofantos ho oplakal,");
	Doc_PrintLines(nDocID, 0 , " than even the great scholar himself " );
	Doc_PrintLines(nDocID, 0 , " he took to his gods. " );
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " (Correct answer - 84 years old.) " );
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " (* Even though it originally read 64. - translation note *) " );
	Doc_PrintLines(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_LukasLetter(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLukasLetter;
	scemeName = "MAP";
	description = " To the Great Prior " ;
	text[ 4 ] = " This letter was written by Luka, Haniar's minion... " ;
	inv_animate = 1;
};

func void UseLukasLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Master Haniar! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I have been following the new murid for some time now at your order. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " He walks around, getting involved in everything and apparently looking for allies. " );
	Doc_PrintLine(nDocID, 0 , " So he doesn't do anything unusual for a newbie... " );
	Doc_PrintLine(nDocID, 0 , " But luck smiled on us anyway. With the last delivery of food, we also got a bunch of junk, " );
	Doc_PrintLine(nDocID, 0 , " among which there is, among other things, a portrait of that murid. " );
	Doc_PrintLine(nDocID, 0 , " Looks like bandits have dropped on him. " );
	Doc_PrintLine(nDocID, 0 , " You yourself know very well that we have not received any new reinforcements from the outside world recently. " );
	Doc_PrintLine(nDocID, 0 , " This means that the person is not an assassin, that is simply out of the question! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " 			Your forever devoted servant " );
	Doc_PrintLine(nDocID,0,"            Luka");
	Doc_Show(nDocID);
};
