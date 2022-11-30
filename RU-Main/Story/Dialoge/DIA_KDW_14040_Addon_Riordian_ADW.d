

instance DIA_Addon_Riordian_ADW_EXIT(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 999;
	condition = DIA_Addon_Riordian_ADW_EXIT_Condition;
	information = DIA_Addon_Riordian_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Riordian_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Riordian_HelloADW(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_HelloADW_Condition;
	information = DIA_Addon_Riordian_HelloADW_Info;
	description = " Did you expect to see THIS here? " ;
};


func int DIA_Addon_Riordian_HelloADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_HelloADW_Info()
{
	AI_Output(other,self, " DIA_Addon_Riordian_HelloADW_15_00 " );	// Did you expect to see THIS here?
	AI_Output(self,other, " DIA_Addon_Riordian_HelloADW_10_01 " );	// No, not at all. I'm amazed at how big this city must have been.
	AI_Output(self,other, " DIA_Addon_Riordian_HelloADW_10_02 " );	// Most of the buildings are buried under stone and earth, but those ruins that escaped this fate are scattered throughout the valley.
	AI_Output(self,other, " DIA_Addon_Riordian_HelloADW_10_03 " );	// Thousands of people must have lived here.
};


instance DIA_Addon_Riordian_WhatToFind(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_WhatToFind_Condition;
	information = DIA_Addon_Riordian_WhatToFind_Info;
	description = " What have you already found here? " ;
};


func int DIA_Addon_Riordian_WhatToFind_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_HelloADW))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Riordian_WhatToFind_Info()
{
	AI_Output(other,self, " DIA_Addon_Riordian_WhatToFind_15_00 " );	// What have you already discovered here?
	AI_Output(self,other, " DIA_Addon_Riordian_WhatToFind_10_01 " );	// To the east is a huge swamp, on which there is a large fortress.
	AI_Output(self,other, " DIA_Addon_Riordian_WhatToFind_10_02 " );	// As far as we understand, bandits settled in it.
	AI_Output(self,other, " DIA_Addon_Riordian_WhatToFind_10_03 " );	// If I were you, I wouldn't go there. There are guard posts and guards everywhere.
	AI_Output(self,other, " DIA_Addon_Riordian_WhatToFind_10_04 " );	// Stay out of the swamp until you gain experience... or find a way to trick the bandits.
	AI_Output(self,other, " DIA_Addon_Riordian_WhatToFind_10_05 " );	// To the west is a pirate camp.
	AI_Output(self,other, " DIA_Addon_Riordian_WhatToFind_10_06 " );	// I'm not exactly sure, but I think the pirates have already noticed us too.
	AI_Output(self,other, " DIA_Addon_Riordian_WhatToFind_10_07 " );	// However, they don't seem to care much about our presence.
};


instance DIA_Addon_Riordian_Area (C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_Gegend_Condition;
	information = DIA_Addon_Riordian_Area_Info;
	permanent = TRUE;
	description = " Tell me more about this area. " ;
};


func int DIA_Addon_Riordian_Gegend_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Riordian_WhatToFind ) && ( Saturation_RicePlan ==  FALSE )) .
	{
		return TRUE;
	};
	return  FALSE ;
};


var int DIA_Addon_Riordian_Gegend_Info_OneTime;

func void DIA_Addon_Riordian_Area_Info()
{
	AI_Output(other,self, " DIA_Addon_Riordian_Gegend_15_00 " );	// Tell me more about this area.
	AI_Output(self,other, " DIA_Addon_Riordian_Gegend_10_01 " );	// What do you want to know?
	Info_ClearChoices(DIA_Addon_Riordian_Gegend);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,Dialog_Back,DIA_Addon_Riordian_Gegend_Back);
	if ((DIA_Addon_Riordian_Gegend_Info_OneTime ==  FALSE ) && (Npc_HasItems(other,itwr_map_addonworld_1) ==  FALSE ))
	{
		Info_AddChoice(DIA_Addon_Riordian_Gegend, " Is there a map for this area? " ,DIA_Addon_Riordian_Gegend_map);
		DIA_Addon_Riordian_Gegend_Info_OneTime = TRUE;
	};
	Info_AddChoice(DIA_Addon_Riordian_Gegend, " Where did you spot the pirates? " ,DIA_Addon_Riordian_Gegend_Piraten);
	Info_AddChoice(DIA_Addon_Riordian_Gegend, " Remind me where the bandits settled? " ,DIA_Addon_Riordian_Gegend_bandits);
	Info_AddChoice(DIA_Addon_Riordian_Gegend, " Have you been to the west yet? " ,DIA_Addon_Riordian_Gegend_west);
	Info_AddChoice(DIA_Addon_Riordian_Gegend, " What will I find in the east? " ,DIA_Addon_Riordian_Gegend_ost);
	Info_AddChoice(DIA_Addon_Riordian_Gegend, " What's in the south? " ,DIA_Addon_Riordian_Gegend_sued);
	Info_AddChoice(DIA_Addon_Riordian_Gegend, " What's up north? " ,DIA_Addon_Riordian_Gegend_nord);
};

func void DIA_Addon_Riordian_Gegend_Back()
{
	Info_ClearChoices(DIA_Addon_Riordian_Gegend);
};

func void DIA_Addon_Riordian_Gegend_map()
{
	AI_Output(other,self, " DIA_Addon_Riordian_Gegend_map_15_00 " );	// Is there a map of this area?
	AI_Output(self,other, " DIA_Addon_Riordian_Gegend_map_10_01 " );	// Yes, Kronos has already drawn the map. Contact him.
};

func void DIA_Addon_Riordian_Area_bandits()
{
	AI_Output(other,self, " DIA_Addon_Riordian_Gegend_bandits_15_00 " );	// Remind me where the bandits settled?
	AI_Output(self,other, " DIA_Addon_Riordian_Gegend_bandits_10_01 " );	// Their stronghold and outposts are to the east.
	AI_Output(self,other, " DIA_Addon_Riordian_Gegend_bandits_10_02 " );	// To get to the fortress, you'll have to cross the swamp.
};

func void DIA_Addon_Riordian_Area_Pirates()
{
	AI_Output(other,self, " DIA_Addon_Riordian_Gegend_Piraten_15_00 " );	// Where did you spot the pirates?
	AI_Output(self,other, " DIA_Addon_Riordian_Gegend_Piraten_10_01 " );	// In the west. Some pirates came quite close to this place.
	AI_Output(self,other, " DIA_Addon_Riordian_Gegend_Piraten_10_02 " );	// I think they were hunting.
};

func void DIA_Addon_Riordian_Region_north()
{
	AI_Output(other,self, " DIA_Addon_Riordian_Gegend_nord_15_00 " );	// What is in the north?
	AI_Output(self,other, " DIA_Addon_Riordian_Gegend_nord_10_01 " );	// According to the records of the Builders, there is a large gorge surrounded by rocks.
	AI_Output(self,other, " DIA_Addon_Riordian_Gegend_nord_10_02 " );	// The landscape there is made up of sand and drought cracked earth.
};

func void DIA_Addon_Riordian_Gegend_sued()
{
	AI_Output(other,self, " DIA_Addon_Riordian_Gegend_sued_15_00 " );	// What is located in the south?
	AI_Output(self,other, " DIA_Addon_Riordian_Gegend_sued_10_01 " );	// The terrain to the south is very difficult.
	AI_Output(self,other, " DIA_Addon_Riordian_Gegend_sued_10_02 " );	// You will find there serpentine paths, waterfalls and rocks of bizarre shapes.
};

func void DIA_Addon_Riordian_Region_East()
{
	AI_Output(other,self, " DIA_Addon_Riordian_Gegend_ost_15_00 " );	// What will I find in the east?
	AI_Output(self,other, " DIA_Addon_Riordian_Gegend_ost_10_01 " );	// Huge swamp. This area is very dangerous.
	AI_Output(self,other, " DIA_Addon_Riordian_Gegend_ost_10_02 " );	// There you can meet not only bandits, but also extremely dangerous animals.
	AI_Output(self,other, " DIA_Addon_Riordian_Gegend_ost_10_03 " );	// Be careful.
};


var int DIA_Addon_Riordian_Gegend_west_OneTime;

func void DIA_Addon_Riordian_Gegend_west()
{
	AI_Output(other,self, " DIA_Addon_Riordian_Gegend_west_15_00 " );	// Have you been to the west yet?
	AI_Output(self,other, " DIA_Addon_Riordian_Gegend_west_10_01 " );	// Not yet. But we know that there is a seashore.
	AI_Output(self,other, " DIA_Addon_Riordian_Gegend_west_10_02 " );	// Apparently, pirates have set up their camp on this shore.
	if((DIA_Addon_Riordian_Gegend_west_OneTime == FALSE) && Npc_HasItems(VLK_4304_Addon_William,ITWr_Addon_William_01))
	{
		AI_Output(self,other, " DIA_Addon_Riordian_Gegend_west_10_03 " );	// To the east, not far from here, we found the body of a fisherman.
		AI_Output(self,other, " DIA_Addon_Riordian_Gegend_west_10_04 " );	// You should take a look at it.
		B_LogEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche);
		DIA_Addon_Riordian_Gegend_west_OneTime = TRUE;
	};
};


instance DIA_Addon_Riordian_HousesOfRulers(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_HousesOfRulers_Condition;
	information = DIA_Addon_Riordian_HousesOfRulers_Info;
	description = " Saturas sent me. " ;
};


func int DIA_Addon_Riordian_HousesOfRulers_Condition()
{
	if(MIS_Saturas_LookingForHousesOfRulers == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Riordian_HousesOfRulers_Info()
{
	AI_Output(other,self, " DIA_Addon_Riordian_HousesOfRulers_15_00 " );	// Saturas sent me. I must investigate the five temples of Yarkendar.
	AI_Output(self,other, " DIA_Addon_Riordian_HousesOfRulers_10_01 " );	// It took me a fair amount of time to find information about their whereabouts in the records of the Builders.
	AI_Output(self,other, " DIA_Addon_Riordian_HousesOfRulers_10_02 " );	// But now I can give you accurate information.
	MIS_Riordian_HousesOfRulers = LOG_Running;
};


instance DIA_Addon_Riordian_WhereAreHouses(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_WhereAreHouses_Condition;
	information = DIA_Addon_Riordian_WhereAreHouses_Info;
	description = " Where are the five temples? " ;
};

func int DIA_Addon_Riordian_WhereAreHouses_Condition()
{
	if (( MIS_Riordian_HousesOfRulers == LOG_Running ) && ( Saturates_SCBroughtAllTokens ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};


var int B_WhreAreHousesOfRulersOneTime;

func void B_WhreAreHousesOfRulers()
{
	AI_Output(self,other, " DIA_Addon_Riordian_WhereAreHouses_10_00 " );	// The Temple of Scholars is a huge library! It is located far to the north.
	AI_Output(self,other, " DIA_Addon_Riordian_WhereAreHouses_10_01 " );	// Temple of warriors is located in the east. It is a fortress surrounded by rocks.
	AI_Output(self,other, " DIA_Addon_Riordian_WhereAreHouses_10_02 " );	// Temples of priests and guardians of the dead are located not far from each other. You will find them in the southwest.
	AI_Output(self,other, " DIA_Addon_Riordian_WhereAreHouses_10_03 " );	// And the temple of healers should be somewhere in the southeast.
	if(B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Riordian_WhereAreHouses_10_04 " );	// If these temples still exist, you will recognize them by their special construction style.
		B_WhreAreHousesOfRulersOneTime = TRUE;
	};
	AI_Output(self,other, " DIA_Addon_Riordian_WhereAreHouses_10_05 " );	// All temples were built on hills. A steep staircase led to the entrance decorated with columns.
	if(B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Riordian_WhereAreHouses_10_06 " );	// Hope this helps you.
	};
	Log_CreateTopic(TOPIC_Addon_HousesOfRulers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers,LOG_Running);
	B_LogEntry(TOPIC_Addon_HousesOfRulers, " The Temple of Scholars is a huge library. It's somewhere to the north. " );
	Log_AddEntry(TOPIC_Addon_HousesOfRulers, " The Temple of the Warriors is a rock-encircled fortress to the east. " );
	Log_AddEntry(TOPIC_Addon_HousesOfRulers, " The temples of the priests and guardians of the dead are not far from each other. I can find them in the southwest. " );
	Log_AddEntry(TOPIC_Addon_HousesOfRulers, " Temple of Healers is in the southeast. " );
};

func void DIA_Addon_Riordian_WhereAreHouses_Info()
{
	AI_Output(other,self, " DIA_Addon_Riordian_WhereAreHouses_15_00 " );	// Where are the five palaces located?
	B_WhreAreHousesOfRulers();
};


instance DIA_Addon_Riordian_FoundHouse(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_FoundHouse_Condition;
	information = DIA_Addon_Riordian_FoundHouse_Info;
	permanent = TRUE;
	description = " About temples... " ;
};


func int DIA_Addon_Riordian_FoundHouse_Condition()
{
	if((MIS_Riordian_HousesOfRulers == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Riordian_WhereAreHouses) && (RiordianHousesFoundCount < 5))
	{
		return TRUE;
	};
	return  FALSE ;
};

var int foundhouseinfo[6];
const int Library = 1;
const  int healer = 2 ;
const int Warrior = 3;
const int Priest = 4;
const int Totenw = 5;
var int RiordianHouseNeuigkeit;
var int RiordianHousesFoundCount;

func void DIA_Addon_Riordian_FoundHouse_Info()
{
	var int RiordianHouseXPs;
	RiordianHouseNeuigkeit = 0;
	AI_Output(other,self, " DIA_Addon_Riordian_FoundHouse_15_00 " );	// About temples...
	AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_01");	//Да?

	if((SC_COMESINTO_CANYONLIBRARY_FUNC_OneTime == TRUE) && (FOUNDHOUSEINFO[1] == FALSE))
	{
		AI_Output(other,self, " DIA_Addon_Riordian_FoundHouse_15_02 " );	// Orcs seem to be interested in the scientists' library.
		AI_Output(self,other, " DIA_Addon_Riordian_FoundHouse_10_03 " );	// Do you think they can read the writings in the ancient language?
		AI_Output(other,self, " DIA_Addon_Riordian_FoundHouse_15_04 " );	// No, I don't think so, but who knows...
		AI_Output(self,other, " DIA_Addon_Riordian_FoundHouse_10_05 " );	// Okay, you'd better get rid of them anyway.
		FOUNDHOUSEINFO[1] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
		Log_CreateTopic(TOPIC_Addon_CanyonOrcs,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_CanyonOrcs,LOG_Running);
		B_LogEntry(TOPIC_Addon_CanyonOrcs, " Water Mage Riordian will be pleased if I clear the canyon of orcs. " );
	};
	if ( ( Npc_IsDead ( Stoneguardian_Heiler ) || Npc_HasItems ( other , ItMy_Addon_Stone_04 ) || _ _ _  
	{
		AI_Output(other,self, " DIA_Addon_Riordian_FoundHouse_15_06 " );	// The temple of the healers is in the middle of the swamp. It is guarded by stone guards.
		AI_Output(self,other, " DIA_Addon_Riordian_FoundHouse_10_07 " );	// So it's still standing?
		AI_Output(other,self, " DIA_Addon_Riordian_FoundHouse_15_08 " );	// Yes, but we don't know how long it will last...
		AI_Output(self,other, " DIA_Addon_Riordian_FoundHouse_10_09 " );	// It pains me to see the destruction of ancient buildings, witnesses of the past...
		FOUNDHOUSEINFO[2] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if((RavenIsInTempel == TRUE) && (FOUNDHOUSEINFO[3] == FALSE))
	{
		AI_Output(other,self, " DIA_Addon_Riordian_FoundHouse_15_10 " );	// A raven settled in the temple of warriors.
		AI_Output(self,other, " DIA_Addon_Riordian_FoundHouse_10_11 " );	// He made a good choice.
		AI_Output(self,other, " DIA_Addon_Riordian_FoundHouse_10_12 " );	// This is the most impregnable fortress in the entire valley.
		FOUNDHOUSEINFO[3] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if ( ( Npc_IsDead ( Minecrawler_Priest ) || Npc_HasItems ( other , ItMy_Addon_Stone_03 ) || _ _ _  
	{
		AI_Output(other,self, " DIA_Addon_Riordian_FoundHouse_15_13 " );	// There were many crawlers in the temple of the priests.
		AI_Output(self,other, " DIA_Addon_Riordian_FoundHouse_10_14 " );	// But these animals are very rare here, right?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_15");	//Да, ты прав.
		AI_Output(self,other, " DIA_Addon_Riordian_FoundHouse_10_16 " );	// Strange things are happening here...
		FOUNDHOUSEINFO[4] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if ((Npc_IsDead(MayaZombie04_Totenw) || Npc_HasItems(other,ItMi_Addon_Stone_02) || (Saturas_SCFound_ItMi_Addon_Stone_02 ==  TRUE )) && ( FOUNDHOUSEINFO [ 5 ] ==  FALSE )) ;
	{
		AI_Output(other,self, " DIA_Addon_Riordian_FoundHouse_15_17 " );	// The Temple of the Guardians of the Dead is protected by the forces of evil.
		AI_Output(other,self, " DIA_Addon_Riordian_FoundHouse_15_18 " );	// I've never seen so many zombies in one place before.
		AI_Output(self,other, " DIA_Addon_Riordian_FoundHouse_10_19 " );	// What a sad fate! The Guardians of the Dead fell victim to their own abilities.
		AI_Output(self,other, " DIA_Addon_Riordian_FoundHouse_10_20 " );	// Their close association with the world of the dead has done them a disservice. I hope you put them out of their misery.
		FOUNDHOUSEINFO[5] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if(RiordianHouseNeuigkeit > 0)
	{
		RiordianHouseXPs = XP_Addon_Riordian_FoundHouse * RiordianHouseNeuigkeit;
		B_GivePlayerXP(RiordianHouseXPs);
		RiordianHousesFoundCount = RiordianHousesFoundCount + RiordianHouseNeuigkeit;
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Riordian_FoundHouse_15_21 " );	// Remind me where they are?
		B_WhreAreHousesOfRulers();
	};
};

instance DIA_Addon_Riordian_OrksWeg(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_OrksWeg_Condition;
	information = DIA_Addon_Riordian_OrksWeg_Info;
	description = " Orcs will soon lose interest in this area. " ;
};

func int DIA_Addon_Riordian_OrksWeg_Condition()
{
	if ( Npc_IsDead ( OrcShaman_Sit_CanyonLibraryKey ) && ( FOUNDHOUSEINFO [ 1 ] ==  TRUE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Riordian_OrksWeg_Info()
{
	AI_Output(other,self, " DIA_Addon_Riordian_OrksWeg_15_00 " );	// Orcs will soon lose interest in this area.
	AI_Output(self,other, " DIA_Addon_Riordian_OrksWeg_10_01 " );	// Why do you think so?
	if(OrcShaman_Sit_CanyonLibraryKey.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output(other,self, " DIA_Addon_Riordian_OrksWeg_15_02 " );	// I killed their commander.
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Riordian_OrksWeg_15_03 " );	// Their leader is dead.
	};
	AI_Output(self,other, " DIA_Addon_Riordian_OrksWeg_10_04 " );	// Let's hope you're right.
	AI_Output(self,other, " DIA_Addon_Riordian_OrksWeg_10_05 " );	// We don't need any extra worries now.
	TOPIC_END_CanyonOrcs = TRUE;
	B_GivePlayerXP(XP_Addon_Riordian_OrksWeg);
};


instance DIA_Addon_Riordian_FoundAllHouses(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_FoundAllHouses_Condition;
	information = DIA_Addon_Riordian_FoundAllHouses_Info;
	description = " I found all the temples. " ;
};


func int DIA_Addon_Riordian_FoundAllHouses_Condition()
{
	if((RiordianHousesFoundCount >= 5) && (MIS_Riordian_HousesOfRulers == LOG_Running))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Riordian_FoundAllHouses_Info()
{
	AI_Output(other,self, " DIA_Addon_Riordian_FoundAllHouses_15_00 " );	// I found all the temples.
	AI_Output(self,other, " DIA_Addon_Riordian_FoundAllHouses_10_01 " );	// Were they all where I indicated?
	AI_Output(other,self, " DIA_Addon_Riordian_FoundAllHouses_15_02 " );	// Well... more or less.
	AI_Output(self,other, " DIA_Addon_Riordian_FoundAllHouses_10_03 " );	// Great! So my work was not in vain.
	AI_Output(self,other, " DIA_Addon_Riordian_FoundAllHouses_10_04 " );	// Thank you.
	MIS_Riordian_HousesOfRulers = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_FoundAllHouses);
};

instance DIA_Addon_Riordian_SpeedPotion(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_SpeedPotion_Condition;
	information = DIA_Addon_Riordian_SpeedPotion_Info;
	description = " Is there anything else I can help you with? " ;
};

func int DIA_Addon_Riordian_SpeedPotion_Condition()
{
	if(MIS_Riordian_HousesOfRulers == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_SpeedPotion_Info()
{
	AI_Output(other,self, " DIA_Addon_Riordian_SpeedPotion_01_00 " );	// Is there anything else I can do to help?
	AI_Output(self,other, " DIA_Addon_Riordian_SpeedPotion_01_01 " );	// Maybe...(thoughtfully) I recently got the idea to make a new elixir of acceleration.
	AI_Output(other,self, " DIA_Addon_Riordian_SpeedPotion_01_02 " );	// Why don't you like the usual one?
	AI_Output(self,other, " DIA_Addon_Riordian_SpeedPotion_01_03 " );	// The fact is that the effect of its action is too short.
	AI_Output(self,other, " DIA_Addon_Riordian_SpeedPotion_01_04 " );	// However, I heard that there is an alchemist in the pirate camp who can brew a special potion of speed.
	AI_Output(self,other, " DIA_Addon_Riordian_SpeedPotion_01_05 " );	// And it's also not as difficult to make as a regular elixir.
	AI_Output(self,other, " DIA_Addon_Riordian_SpeedPotion_01_06 " );	// So I thought it would be nice to somehow get this recipe.
	AI_Output(other,self, " DIA_Addon_Riordian_SpeedPotion_01_07 " );	// Are you suggesting I get it for you?
	AI_Output(self,other, " DIA_Addon_Riordian_SpeedPotion_01_08 " );	// You understood me correctly. And if everything works out, I will not remain in debt.
	AI_Output(other,self, " DIA_Addon_Riordian_SpeedPotion_01_09 " );	// Okay, I'll try.
	MIS_SpeedPotion = LOG_Running;
	Log_CreateTopic(TOPIC_SpeedPotion,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SpeedPotion,LOG_Running);
	B_LogEntry(TOPIC_SpeedPotion, " Riordian wants me to bring him the recipe for a speed potion that the alchemist brews at the pirate camp. " );
};

instance DIA_Addon_Riordian_SpeedPotionDone (C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_SpeedPotionDone_Condition;
	information = DIA_Addon_Riordian_SpeedPotionDone_Info;
	description = " I got the recipe you need. " ;
};

func int DIA_Addon_Riordian_SpeedPotionDone_Condition()
{
	if((MIS_SpeedPotion == LOG_Running) && (Npc_HasItems(hero,ITWr_Addon_Piratentod) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_SpeedPotionDone_Info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self, " DIA_Addon_Riordian_SpeedPotionDone_01_00 " );	// I got the recipe you need.
	B_GiveInvItems(other,self,ITWr_Addon_Piratentod,1);
	Npc_RemoveInvItems(self,ITWr_Addon_Piratentod,1);
	AI_Output(self,other, " DIA_Addon_Riordian_SpeedPotionDone_01_01 " );	// Great! Then let's take a look at it.
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Addon_Riordian_SpeedPotionDone_01_02 " );	// Well, that's exactly what I thought. It's pretty easy to make.
	AI_Output(self,other, " DIA_Addon_Riordian_SpeedPotionDone_01_03 " );	// Good. I thank you. Take these drinks.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItPo_Health_Addon_04,2);
	CreateInvItems(other,ItPo_Mana_Addon_04,2);
	AI_Output(self,other, " DIA_Addon_Riordian_SpeedPotionDone_01_04 " );	// They will surely come in handy on your travels.
	MIS_SpeedPotion = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SpeedPotion,LOG_SUCCESS);
	B_LogEntry(TOPIC_SpeedPotion, " I gave the recipe to Riordian. " );
};

instance DIA_Addon_Riordian_ADW_PreTeach (C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_ADW_PreTeach_Condition;
	information = DIA_Addon_Riordian_ADW_PreTeach_Info;
	permanent = TRUE;
	description = " Can you teach me your skills? " ;
};

func int DIA_Addon_Riordian_ADW_PreTeach_Condition()
{
	if ((Riordian_ADW_ADDON_TeachAlchemy ==  FALSE ) && (Riordian_ADW_ADDON_TeachWisp ==  FALSE ) && Npc_KnowsInfo(other,DIA_Addon_Saturates_ADW_PreTeachCircle));
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_ADW_PreTeach_Info()
{
	AI_Output(other,self, " DIA_Addon_Riordian_ADW_PreTeach_15_00 " );	// Can you teach me?

	if(hero.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_Addon_Riordian_ADW_PreTeach_10_01 " );	// I can teach you the art of alchemy.
		Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_RiordianTeachAlchemy);
		Riordian_ADW_ADDON_TeachAlchemy = TRUE;
		Riordian_ADW_ADDON_TeachWisp = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Riordian_ADW_PreTeach_10_03 " );	// I only teach those in our order. And I see that you are not a Waterbender!
	};
};

var int DIA_Riordian_ADW_TeachAlchemy_permanent;

instance DIA_Riordian_ADW_TeachAlchemy(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 2;
	condition = DIA_Riordian_ADW_TeachAlchemy_Condition;
	information = DIA_Riordian_ADW_TeachAlchemy_Info;
	permanent = TRUE;
	description = " Teach me how to mix potions. " ;
};

func int DIA_Riordian_ADW_TeachAlchemy_Condition()
{
	if((DIA_Riordian_ADW_TeachAlchemy_permanent == FALSE) && (Riordian_ADW_ADDON_TeachAlchemy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Riordian_ADW_TeachAlchemy_Info()
{
	AI_Output(other,self, " DIA_Addon_Riordian_ADW_TeachAlchemy_15_00 " );	// Teach me how to mix potions.

	if(Alchemy_Explain == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Riordian_ADW_TeachAlchemy_10_01 " );	// Magic potions are crafted at the alchemy table. We set up such a table in one of the buildings upstairs.
		AI_Output(self,other, " DIA_Addon_Riordian_ADW_TeachAlchemy_10_02 " );	// You'll need an empty alchemy vessel, ingredients, and of course knowledge of the potion recipe.
		AI_Output(self,other, " DIA_Addon_Riordian_ADW_TeachAlchemy_10_03 " );	// You can learn the recipes from me. Everything else you have to get yourself.
		Alchemy_Explain = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Riordian_ADW_TeachAlchemy_10_04 " );	// What recipe do you want to learn?
	};

	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
	Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,Dialog_Back,DIA_Riordian_ADW_TeachAlchemy_BACK);

	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE))
	{
		if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Лечебная эссенция ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Riordian_ADW_TeachAlchemy_Health_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Лечебный экстракт ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Riordian_ADW_TeachAlchemy_Health_02);
		};
		if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Эссенция маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Riordian_ADW_TeachAlchemy_Mana_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Экстракт маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Riordian_ADW_TeachAlchemy_Mana_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Эликсир маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Riordian_ADW_TeachAlchemy_Mana_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Эликсир духа",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Riordian_ADW_TeachAlchemy_Perm_Mana);
		};
		if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy, b_buildlearnstringforalchemy( " Элсрлавкости " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Perm_DEX)), DIA_Riordian_AlDW_Perm_Teach);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Riordian_ADW_TeachAlchemy_10_05 " );	// I've already taught you everything I knew myself.
		DIA_Riordian_ADW_TeachAlchemy_permanent = TRUE;
	};
};

func void DIA_Riordian_ADW_TeachAlchemy_BACK()
{
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

instance DIA_RIORDIAN_ADW_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 1;
	condition = dia_riordian_adw_prayforgomez_condition;
	information = dia_riordian_adw_prayforgomez_info;
	permanent = FALSE;
	description = " I need the blessing of Adanos. " ;
};

func int dia_riordian_adw_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_riordian_adw_prayforgomez_info()
{
	AI_Output(other,self, " DIA_Riordian_ADW_PrayForGomez_01_01 " );	// I need the blessing of Adanos.
	AI_Output(self,other, " DIA_Riordian_ADW_PrayForGomez_01_02 " );	// Talk to Saturas about this.
	AI_Output(self,other, " DIA_Riordian_ADW_PrayForGomez_01_03 " );	// I think he can help you.
	SENTTOSATURASGOMEZ = TRUE ;
};

instance DIA_ADDON_RIORDIAN_ADW_TEACHPRE (C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = dia_addon_riordian_ADW_teachpre_condition;
	information = dia_addon_riordian_ADW_teachpre_info;
	description = " Vatras gave me this Seeking Wisp Amulet... " ;
};

func int dia_addon_riordian_ADW_teachpre_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_HelloADW) && (Riordian_Addon_TeachPlayer == FALSE) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_ADW_teachpre_info()
{
	AI_Output(other,self, " DIA_Addon_Riordian_TeachPre_15_00 " );	// Vatras gave me this amulet of the Seeking Wisp...
	AI_Output(self,other, " DIA_Addon_Riordian_TeachPre_10_01 " );	// Aha! (interested) It's a rare artifact... Do you know that you can train your Wisp?
	AI_Output(other,self, " DIA_Addon_Riordian_TeachPre_15_02 " );	// Can you teach me this?
	AI_Output(self,other, " DIA_Addon_Riordian_TeachPre_10_03 " );	// Yes, of course. I have been involved in this area of ​​magic for a long time.
	Riordian_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_RiordianTeach);
};

instance DIA_ADDON_RIORDIAN_ADW_TEACH(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 90;
	condition = dia_addon_riordian_ADW_teach_condition;
	information = dia_addon_riordian_ADW_teach_info;
	permanent = TRUE;
	description = " (training the searching wisp) " ;
};

var int dia_addon_riordian_ADW_teach_noperm;

func int dia_addon_riordian_ADW_teach_condition()
{
	if((Riordian_Addon_TeachPlayer == TRUE) && (DIA_ADDON_RIORDIAN_ADW_TEACH_NOPERM == FALSE) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_ADW_teach_info()
{
	B_DIA_Addon_Riordian_Teach_15_00();

	if((player_talent_wispdetector[WISPSKILL_NF] == FALSE) || (player_talent_wispdetector[WISPSKILL_FF] == FALSE) || (player_talent_wispdetector[WISPSKILL_NONE] == FALSE) || (player_talent_wispdetector[WISPSKILL_RUNE] == FALSE) || (player_talent_wispdetector[WISPSKILL_MAGIC] == FALSE) || (player_talent_wispdetector[WISPSKILL_FOOD] == FALSE) || (player_talent_wispdetector[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(dia_addon_riordian_ADW_teach);
		Info_AddChoice(dia_addon_riordian_ADW_teach,Dialog_Back,dia_addon_riordian_ADW_teach_back);
		B_DIA_Addon_Riordian_Teach_10_01();

		if(player_talent_wispdetector[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_ADW_teach, " Search for Ranged Weapons, Arrows and Bolts (Requires: 10 Magic Ore) " ,dia_addon_riordian_ADW_teach_wispskill_ff);
		};
		if(player_talent_wispdetector[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_ADW_teach, " Search for gold and various utensils (Requires: 20 pieces of magic ore) " ,dia_addon_riordian_ADW_teach_wispskill_none);
		};
		if(player_talent_wispdetector[WISPSKILL_RUNE] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_ADW_teach, " Find Magic Scrolls (Requires: 30 Magic Ore) " ,dia_addon_riordian_ADW_teach_wispskill_rune);
		};
		if(player_talent_wispdetector[WISPSKILL_FOOD] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_ADW_teach, " Find Food and Plants (Requires: 50 Magic Ore) " ,dia_addon_riordian_ADW_teach_wispskill_food);
		};
		if(player_talent_wispdetector[WISPSKILL_MAGIC] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_ADW_teach, " Search for Magic Rings and Amulets (Requires: 75 Magic Ore) " ,dia_addon_riordian_ADW_teach_wispskill_magic);
		};
		if(player_talent_wispdetector[WISPSKILL_POTIONS] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_ADW_teach, " Find Magic Potions (Requires: 100 Magic Ore) " ,dia_addon_riordian_ADW_teach_wispskill_potions);
		};
	}
	else
	{
		B_DIA_Addon_Riordian_Teach_10_08();
		DIA_ADDON_RIORDIAN_ADW_TEACH_NOPERM = TRUE;
	};
};

func void dia_addon_riordian_ADW_teach_wispskill_x()
{
	B_DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00();
};

func void dia_addon_riordian_ADW_teach_back()
{
	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

func void dia_addon_riordian_ADW_teach_wispskill_ff()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FF,10))
	{
		dia_addon_riordian_ADW_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

func void dia_addon_riordian_ADW_teach_wispskill_none()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_NONE,20))
	{
		dia_addon_riordian_ADW_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

func void dia_addon_riordian_ADW_teach_wispskill_rune()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_RUNE,30))
	{
		dia_addon_riordian_ADW_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

func void dia_addon_riordian_ADW_teach_wispskill_magic()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_MAGIC,75))
	{
		dia_addon_riordian_ADW_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

func void dia_addon_riordian_ADW_teach_wispskill_food()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FOOD,50))
	{
		dia_addon_riordian_ADW_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

func void dia_addon_riordian_ADW_teach_wispskill_potions()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_POTIONS,100))
	{
		dia_addon_riordian_ADW_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

instance DIA_Addon_Riordian_LostPower(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 1;
	condition = DIA_Addon_Riordian_LostPower_Condition;
	information = DIA_Addon_Riordian_LostPower_Info;
	important = TRUE;
};

func int DIA_Addon_Riordian_LostPower_Condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((MIS_LostPower == LOG_Running) && (SaturasKnowPortalOpenDay > 0) && (SaturasKnowPortalOpenDay < DayNow))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_LostPower_Info()
{
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_01_00 " );	// Hey, wait! I heard that you managed to open a magical portal leading to an unknown area.
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_01_03 " );	// Saturas says that there may be the sacred fiefdom of Adanos himself!
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_01_04 " );	// Based on these considerations, he forbids us to make any attempt to study it.
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_01_05 " );	// But perhaps Saturas' ban doesn't apply to you.
	AI_Output(other,self, " DIA_Addon_Riordian_LostPower_01_06 " );	// What do you mean by that?
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_01_07 " );	// You could explore this area yourself and bring me some documentary evidence that connects the existence of the people of the Architects with that place.
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_01_08 " );	// This would help us better understand how their civilization developed before they settled this valley.
	AI_Output(other,self, " DIA_Addon_Riordian_LostPower_01_09 " );	// But maybe they weren't Architects at all?
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_01_10 " );	// Yes, we don't know that. But I am sure that the portal was built by them. So they must have known where it leads.
	AI_Output(other,self, " DIA_Addon_Riordian_LostPower_01_11 " );	// Okay, I'm going to go there anyway.
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_01_12 " );	// Great! Just don't tell Saturas about it or he'll be furious!
	B_LogEntry(TOPIC_LostPower, " Riordian wants me to search the sacred land of Adanos I found for any documentary evidence of the civilization of the Builders. " );
};

instance DIA_Addon_Riordian_LostPower_Done(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 2;
	condition = DIA_Addon_Riordian_LostPower_Done_Condition;
	information = DIA_Addon_Riordian_LostPower_Done_Info;
	permanent = TRUE;
	description = " About your request... " ;
};

func int DIA_Addon_Riordian_LostPower_Done_Condition()
{
	if ((MY_LostPower == LOG_Running) && (Npc_HasItems(other,ItMy_LP_StonePlate_01) >=  1 ) && (Npc_KnowsInfo(other,DIA_Addon_Riordian_LostPower) ==  TRUE ) && (RiordianDayStory ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_LostPower_Done_Info()
{
	AI_Output(other,self, " DIA_Addon_Riordian_LostPower_Done_01_00 " );	// About your request...
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_Done_01_01 " );	// Yes? Did you manage to find anything interesting?
	Info_ClearChoices(DIA_Addon_Riordian_LostPower_Done);
	Info_AddChoice(DIA_Addon_Riordian_LostPower_Done,Dialog_Back,DIA_Addon_Riordian_LostPower_Done_Back);

	if(Npc_HasItems(other,ItMi_LP_StonePlate_01) >= 1)
	{
		Info_AddChoice(DIA_Addon_Riordian_LostPower_Done, " Give found stone tablets. " ,DIA_Addon_Riordian_LostPower_Done_StnAll);
	};
};

func void DIA_Addon_Riordian_LostPower_Done_Back()
{
	Info_ClearChoices(DIA_Addon_Riordian_LostPower_Done);
};

func void DIA_Addon_Riordian_LostPower_Done_StnAll()
{
	var int TakeStonePlate;

	TakeStonePlate = Npc_HasItems(other,ItMi_LP_StonePlate_01);
	B_GiveInvItems(other,self,ItMi_LP_StonePlate_01,TakeStonePlate);
	Npc_RemoveInvItems(self,ItMi_LP_StonePlate_01,TakeStonePlate);
	B_GivePlayerXP(TakeStonePlate * 100);

	if(TakeStonePlate > 1)
	{
		AI_Output(other,self, " DIA_Addon_Riordian_LostPower_Done_StnAll_01_00 " );	// Hold these stone tablets. Surely you will find something useful in them.
		AI_Output(self,other, " DIA_Addon_Riordian_LostPower_Done_StnAll_01_01 " );	// Good. I will study them carefully.
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Riordian_LostPower_Done_StnAll_01_02 " );	// Hold this stone tablet. Surely you will find something useful in it.
		AI_Output(self,other, " DIA_Addon_Riordian_LostPower_Done_StnAll_01_03 " );	// Good. I will study it carefully.
	};

	AllTakeStonePlate = AllTakeStonePlate + TakeStonePlate;

	if(AllTakeStonePlate >= 15)
	{
		RiordianDayStory = TRUE;
	};
};

instance DIA_Addon_Riordian_LostPower_Know(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 3;
	condition = DIA_Addon_Riordian_LostPower_Know_Condition;
	information = DIA_Addon_Riordian_LostPower_Know_Info;
	permanent = FALSE;
	description = " What did you find out from everything I brought you? " ;
};

func int DIA_Addon_Riordian_LostPower_Know_Condition()
{
	if((MIS_LostPower == LOG_Running) && (RiordianDayStory == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_LostPower_Know_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Addon_Riordian_LostPower_Know_01_00 " );	// What did you manage to figure out from everything I brought you?
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_Know_01_01 " );	// Not much. Most of these stone tablets turned out to be useless junk.
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_Know_01_02 " );	// For example, among them I came across one very strange culinary recipe for preparing a dish of glorch meat.
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_Know_01_03 " );	// And the other sign actually turned out to be a love note. Can you imagine?
	AI_Output(other,self, " DIA_Addon_Riordian_LostPower_Know_01_04 " );	// So everything was in vain?
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_Know_01_05 " );	// Not really. There were those who helped clarify the situation that occurred on the Plateau of the Ancients.
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_Know_01_06 " );	// (thoughtfully) Plateau of the Ancients!.. What an unusual name. That is how the Architects called the area where the portal led.
	AI_Output(other,self, " DIA_Addon_Riordian_LostPower_Know_01_07 " );	// I know. But what happened there anyway?
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_Know_01_08 " );	// Some terrible curse befell this people. True, what caused it is not indicated in the records you found.
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_Know_01_09 " );	// But it is obvious that in a short period of time, all their lands were overrun by terrible monsters and hordes of the undead. People were in a panic and did not know what to do.
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_Know_01_10 " );	// Then Quarhodron, the great warlord of the Builders, gathered a huge army and tried to destroy the evil with one decisive blow.
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_Know_01_11 " );	// The battle took place near a place called Khar Aram. Unfortunately, Quarhodron and his warriors were defeated. Their enemy was too strong.
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_Know_01_12 " );	// With the remnants of the army and other inhabitants of the valley, they took refuge here, in Yarkendar. And the passage leading to the plateau was sealed with strong magic.
	AI_Output(other,self, " DIA_Addon_Riordian_LostPower_Know_01_13 " );	// Interesting story. Just wondering who their enemy was?
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_Know_01_14 " );	// I'm also interested. And most importantly, why didn't Adanos help them? After all, this people worshiped him for centuries.
	AI_Output(other,self, " DIA_Addon_Riordian_LostPower_Know_01_15 " );	// Maybe the curse was sent by Adanos himself?
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_Know_01_16 " );	// No, rather, the mystery lies in something else... In a certain artifact, which is written about in these tablets.
	AI_Output(self,other, " DIA_Addon_Riordian_LostPower_Know_01_17 " );	// Only its name is silent in the records. However, it says that Adanos himself hid it in this valley from the gaze of his brother Beliar.
	AI_Output(other,self, " DIA_Addon_Riordian_LostPower_Know_01_18 " );	// (to himself) Beliar's artifact... Is it a Talon?
	MIS_LostPower = LOG_Success;
	Log_SetTopicStatus(TOPIC_LostPower,LOG_Success);
	B_LogEntry(TOPIC_LostPower, " I brought Riordian enough documentary evidence of the development of the Builders' civilization on the plateau. " );
};
