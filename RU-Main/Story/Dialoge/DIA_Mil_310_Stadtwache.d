

instance DIA_Mil_310_Stadtwache_EXIT(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 999;
	condition = DIA_Mil_310_Stadtwache_EXIT_Condition;
	information = DIA_Mil_310_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_310_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_310_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Mil_310_Checkpoint = "NW_CITY_ENTRANCE_MAIN";

var int MIL_310_Personal_AbsolutionLevel;

instance DIA_Mil_310_Stadtwache_FirstWarn (C_Info)
{
	npc = Mil_310_City Guard;
	nr = 1;
	condition = DIA_Mil_310_Stadtwache_FirstWarn_Condition;
	information = DIA_Mil_310_Stadtwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Mil_310_Stadtwache_FirstWarn_Condition()
{
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (B_GetCurrentAbsolutionLevel(self) == MIL_310_Personal_AbsolutionLevel))
	{
		self.aivar[ AIV_PASSGATE ] = FALSE ;
	}
	else  if (Mil_310_schonmalreinlett ==  TRUE )
	{
		CITYGATEACCESSGRANTED = TRUE;
		self.aivar[ AIV_PASSGATE ] = TRUE ;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_FirstWarn_Info()
{
	var C_Item itm;

	AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_00");	//СТОЙ!

	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other,self, " DIA_Mil_310_Stadtwache_FirstWarn_15_01 " );	// What else?
		AI_Output(self,other, " DIA_Mil_310_Stadtwache_FirstWarn_07_02 " );	// You know what!
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other, " DIA_Mil_310_Stadtwache_FirstWarn_07_03 " );	// You're wanted for murder in the city!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other, " DIA_Mil_310_Stadtwache_FirstWarn_07_04 " );	// We won't tolerate dirty thieves here!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other, " DIA_Mil_310_Stadtwache_FirstWarn_07_05 " );	// We don't need troublemakers in the city!
		};
		AI_Output(self,other, " DIA_Mil_310_Stadtwache_FirstWarn_07_06 " );	// What makes you think we should let you in?
	}
	else
	{
		itm = Npc_GetEquippedArmor(other);
		if ((hero.guild ==  GIL_NONE ) && ((Npc_HasEquippedArmor(other) ==  FALSE ) || Hlp_IsItem(itm,ITAR_Her_M) || Hlp_IsItem(itm,ITAR_prisonel) || Hlp_IsItem(itm,ITAR_Her_N) || Hlp_IsItem (itm,ITAR_Her_N) ,ITAR_Prisoner) || Hlp_IsItem(itm,itar_sekbed)))
		{
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_07");	//Что?
			AI_Output(self,other, " DIA_Mil_310_Stadtwache_FirstWarn_07_08 " );	// You can't go there!
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_09");	//Почему?
			AI_Output(self,other, " DIA_Mil_310_Stadtwache_FirstWarn_07_10 " );	// From such ragamuffins as you, only problems!
			AI_Output(self,other, " DIA_Mil_310_Stadtwache_FirstWarn_07_11 " );	// There's enough rabble in the city anyway. We don't want people who don't have money.
			Log_CreateTopic(TOPIC_City,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_City,LOG_Running);
			B_LogEntry(TOPIC_City, " For the guards to let me enter the city, I have to look like I have money. Or I have to find some other way. " );
		}
		else  if ((Hlp_IsItem(itm,ITAR_Bau_L) ==  TRUE ) || (Hlp_IsItem(itm,ITAR_Bau_M) ==  TRUE ))
		{
			if (self.aivar[AIV_TalkedToPlayer] ==  TRUE )
			{
				AI_Output(self,other, " DIA_Mil_310_Stadtwache_FirstWarn_07_12 " );	// What do you need this time?
				AI_Output(other,self, " DIA_Mil_310_Stadtwache_FirstWarn_15_13 " );	// The farmer sent me.
				AI_Output(self,other, " DIA_Mil_310_Stadtwache_FirstWarn_07_14 " );	// And? Do you even have a good reason to be in town this time?
			}
			else
			{
				AI_Output(self,other, " DIA_Mil_310_Stadtwache_FirstWarn_07_15 " );	// Are you one of the workers from Lobart's farm? I never saw you!
				AI_Output(other,self, " DIA_Mil_310_Stadtwache_FirstWarn_15_16 " );	// I recently worked for Lobart.
				AI_Output(self,other, " DIA_Mil_310_Stadtwache_FirstWarn_07_17 " );	// What do you need in the city?
			};
		}
		else
		{
			AI_Output(other,self, " DIA_Mil_310_Stadtwache_FirstWarn_15_18 " );	// (Calmly) What?
			if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
			{
				AI_Output(self,other, " DIA_Mil_310_Stadtwache_FirstWarn_07_19 " );	// Please excuse me. I'm just following orders.
				AI_Output(other,self, " DIA_Mil_310_Stadtwache_FirstWarn_15_20 " );	// Do you want to hold me?
				if((hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
				{
					AI_Output(self,other, " DIA_Mil_310_Stadtwache_FirstWarn_07_20A " );	// Of course not!
				}
				else
				{
					AI_Output(self,other, " DIA_Mil_310_Stadtwache_FirstWarn_07_21 " );	// Of course not! Of course, we are glad to see the servants of Innos.
				};
			}
			else
			{
				AI_Output(self,other, " DIA_Mil_310_Stadtwache_FirstWarn_07_22 " );	// I just wanted to see you. Looks like you have money. You can walk.
			};
			CITYGATEACCESSGRANTED = TRUE;
			self.aivar[ AIV_PASSGATE ] = TRUE ;
			Stadtwache_333.aivar[ AIV_PASSGATE ] = TRUE ;
			Mil_310_schonmalreinlett = TRUE ;
			AI_StopProcessInfos(self);
		};
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_310_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Mil_310_Stadtwache_SecondWarn (C_Info)
{
	npc = Mil_310_City Guard;
	nr = 2;
	condition = DIA_Mil_310_Stadtwache_SecondWarn_Condition;
	information = DIA_Mil_310_Stadtwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_310_Stadtwache_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_310_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_SecondWarn_Info()
{
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_SecondWarn_07_00 " );	// Stop kidding. One more step and I'll chop you into a cabbage!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_310_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_Attack (C_Info)
{
	npc = Mil_310_City Guard;
	nr = 3;
	condition = DIA_Mil_310_Stadtwache_Attack_Condition;
	information = DIA_Mil_310_Stadtwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_310_Stadtwache_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_310_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE ;
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Attack_07_00 " );	// You asked for it...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_Mil_310_Stadtwache_Bribe (C_Info)
{
	npc = Mil_310_City Guard;
	nr = 5;
	condition = DIA_Mil_310_Stadtwache_Bribe_Condition;
	information = DIA_Mil_310_Stadtwache_Bribe_Info;
	permanent = TRUE;
	description = " Here's a hundred gold! Let me pass. " ;
};


func int DIA_Mil_310_Stadtwache_Bribe_Condition()
{
	if (self.aivar[ AIV_PASSGATE ] ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Bribe_Info()
{
	AI_Output(other,self, " DIA_Mil_310_Stadtwache_Bribe_15_00 " );	// Here's a hundred gold! Let me pass.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other, " DIA_Mil_310_Stadtwache_Bribe_07_01 " );	// One hundred?! A hundred gold pieces is not bad... (eagerly) Come in, of course!
		if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
		{
			AI_Output(self,other, " DIA_Mil_310_Stadtwache_Bribe_07_02 " );	// And immediately go to Andre! Or I'll charge you a hundred gold again next time!
		};
		CITYGATEACCESSGRANTED = TRUE;
		self.aivar[ AIV_PASSGATE ] = TRUE ;
		Stadtwache_333.aivar[ AIV_PASSGATE ] = TRUE ;
		Mil_310_schonmalreinlett = TRUE ;
		MIL_310_Personal_AbsolutionLevel = B_GetCurrentAbsolutionLevel(self) + 1;
	}
	else
	{
		AI_Output(self,other, " DIA_Mil_310_Stadtwache_Bribe_07_03 " );	// What?! Where?! I don't see gold. Get out!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_Passierschein (C_Info)
{
	npc = Mil_310_City Guard;
	nr = 4;
	condition = DIA_Mil_310_Stadtwache_Passierschein_Condition;
	information = DIA_Mil_310_Stadtwache_Passierschein_Info;
	permanent = FALSE;
	description = " I have a pass! " ;
};


func int DIA_Mil_310_Stadtwache_Passierschein_Condition()
{
	if (Npc_HasItems(other,ItWr_Passierschein) && (Mil_310_schonmalreinLET ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Passierschein_Info()
{
	var C_Item itm;
	AI_Output(other,self, " DIA_Mil_310_Stadtwache_Passierschein_15_00 " );	// I have a pass!

	if((hero.guild == GIL_NONE) && ((Npc_HasEquippedArmor(other) == FALSE) || Hlp_IsItem(itm,ITAR_Her_M) || Hlp_IsItem(itm,ITAR_Her_N) || Hlp_IsItem(itm,ITAR_Prisoner) || Hlp_IsItem(itm,itar_sekbed)))
	{
		AI_Output(self,other, " DIA_Mil_310_Stadtwache_Passierschein_07_01 " );	// huh? And who did you kill for that piece of paper?
		AI_Output(other,self, " DIA_Mil_310_Stadtwache_Passierschein_15_02 " );	// So will you let me pass or not?
		AI_Output(self,other, " DIA_Mil_310_Stadtwache_Passierschein_07_03 " );	// Okay, go before I change my mind!
	}
	else
	{
		AI_Output(self,other, " DIA_Mil_310_Stadtwache_Passierschein_07_04 " );	// Everything is fine. Come on.
	};

	CITYGATEACCESSGRANTED = TRUE;
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	Stadtwache_333.aivar[ AIV_PASSGATE ] = TRUE ;
	Mil_310_schonmalreinlett = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_ZumSchmied (C_Info)
{
	npc = Mil_310_City Guard;
	nr = 3;
	condition = DIA_Mil_310_Stadtwache_ZumSchmied_Condition;
	information = DIA_Mil_310_Stadtwache_ZumSchmied_Info;
	permanent = FALSE;
	description = " I want to see the blacksmith. He needs to fix some utensils. " ;
};


func int DIA_Mil_310_Stadtwache_ZumSchmied_Condition()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);

	if (((Help_IceItem(itm,ITAR_Bau_L) ==  TRUE ) || (Help_IceItem(itm,ITAR_Bau_M) ==  TRUE )) && Npc_KnowsInfo(other,DIA_Maleth_ToTheCity) && (Mil_310_Schedule_Return ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_ZumSchmied_Info()
{
	AI_Output(other,self, " DIA_Mil_310_Stadtwache_ZumSchmied_15_00 " );	// I want to see the blacksmith. He has to fix some utensils.

	if (Mil_310_Scheisse_erzaehlt ==  TRUE )
	{
		AI_Output(self,other, " DIA_Mil_310_Stadtwache_ZumSchmied_07_01 " );	// (evil) Yes? Why didn't you say that right away?
		AI_Output(other,self, " DIA_Mil_310_Stadtwache_ZumSchmied_15_02 " );	// I was just wondering how you would react.
		AI_Output(self,other, " DIA_Mil_310_Stadtwache_ZumSchmied_07_03 " );	// What?! You throw that number again and I'll show you how I react to such antics, you stupid hillbilly!
	}
	else
	{
		AI_Output(self,other, " DIA_Mil_310_Stadtwache_ZumSchmied_07_04 " );	// Okay, you can pass.
	};

	AI_Output(self,other, " DIA_Mil_310_Stadtwache_ZumSchmied_07_05 " );	// And if you see Lobart, tell him to better feed his sheep. We'll be going to him soon!
	CITYGATEACCESSGRANTED = TRUE;
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	Stadtwache_333.aivar[ AIV_PASSGATE ] = TRUE ;
	Mil_310_schonmalreinlett = TRUE ;
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Mil_310_Stadtwache_Constantino (C_Info)
{
	npc = Mil_310_City Guard;
	nr = 2;
	condition = DIA_Addon_Mil_310_Stadtwache_Constantino_Condition;
	information = DIA_Addon_Mil_310_Stadtwache_Constantino_Info;
	permanent = TRUE;
	description = " I brought herbs for the alchemist Constantino. " ;
};


func int DIA_Addon_Mil_310_Stadtwache_Constantino_Condition()
{
	if ((MIS_Addon_Lester_PickForConstantino == LOG_Running) && (Mil_310_schonmalreinLET ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Mil_310_Stadtwache_Constantino_Info()
{
	AI_Output(other,self, " DIA_Addon_Mil_310_Stadtwache_Constantino_15_00 " );	// I brought herbs for the alchemist Constantino.

	if((Npc_HasItems(other,ItPl_Mana_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Mana_Herb_02) > 0) || (Npc_HasItems(other,ItPl_Mana_Herb_03) > 0) || (Npc_HasItems(other,ItPl_Health_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Health_Herb_02) > 0) || (Npc_HasItems(other,ItPl_Health_Herb_03) > 0) || (Npc_HasItems(other,ItPl_Dex_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Strength_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Speed_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Temp_Herb) > 0) || (Npc_HasItems(other,ItPl_Perm_Herb) > 0) || (Npc_HasItems(other,ItPl_Beet) > 0))
	{
		AI_Output(self,other, " DIA_Addon_Mil_310_Stadtwache_Constantino_07_01 " );	// True? You won't mind if I take a look at them, will you?

		if((Npc_HasItems(other,ItPl_Mana_Herb_01) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Mana_Herb_02) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Mana_Herb_03) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Health_Herb_01) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Health_Herb_02) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Health_Herb_03) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Dex_Herb_01) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Strength_Herb_01) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Speed_Herb_01) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Temp_Herb) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Perm_Herb) >= MinimumPassagePlants))
		{
			AI_Output(self,other, " DIA_Addon_Mil_310_Stadtwache_Constantino_07_02 " );	// Hmmm... (approvingly) Looks good! Okay, you can pass. But don't make trouble, you understand?

			if(RhetorikSkillValue[1] < 100)
			{
				RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
				AI_Print( " Rhetoric + 1 " );
			};

			CITYGATEACCESSGRANTED = TRUE;
			self.aivar[ AIV_PASSGATE ] = TRUE ;
			Stadtwache_333.aivar[ AIV_PASSGATE ] = TRUE ;
			Mil_310_schonmalreinlett = TRUE ;
			MIS_Addon_Lester_PickForConstantino = LOG_SUCCESS;
			B_GivePlayerXP(XP_Addon_PickForConstantino);
			CheckTownPlants = TRUE;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Mil_310_Stadtwache_Constantino_07_03 " );	// What? What it is?

			if(Npc_HasItems(other,ItPl_Beet) >= MinimumPassagePlants)
			{
				AI_Output(self,other, " DIA_Addon_Mil_310_Stadtwache_Constantino_07_04 " );	// What, I wonder, will the alchemist do with this stupid turnip? Do you want to laugh at me? Get out!
			}
			else
			{
				AI_Output(self,other, " DIA_Addon_Mil_310_Stadtwache_Constantino_07_05 " );	// I don't understand alchemy, but even I understand that no alchemist will need this bunch of various herbs.
			};
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Mil_310_Stadtwache_Constantino_07_06 " );	// What herbs? You don't have any herbs. Get out!
	};

	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_MilizWerden (C_Info)
{
	npc = Mil_310_City Guard;
	nr = 2;
	condition = DIA_Mil_310_Stadtwache_MilizWerden_Condition;
	information = DIA_Mil_310_Stadtwache_MilizWerden_Info;
	permanent = FALSE;
	description = " I've come to join the militia! " ;
};


func int DIA_Mil_310_Stadtwache_MilizWerden_Condition()
{
	if (Mil_310_schonmalreinlett ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_MilizWerden_Info()
{
	AI_Output(other,self, " DIA_Mil_310_Stadtwache_MilizWerden_15_00 " );	// I've come to join the militia!
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_MilizWerden_07_01 " );	// What are you doing?! Try to tell this tale at the other gates - maybe they will buy it.
	Mil_310_Scheisse_erzaehlt = TRUE ;
};


instance DIA_Mil_310_City Guard_Paladins (C_Info)
{
	npc = Mil_310_City Guard;
	nr = 1;
	condition = DIA_Mil_310_Stadtwache_Paladine_Condition;
	information = DIA_Mil_310_City Guard_Paladine_Info;
	permanent = FALSE;
	description = " I need to see the head of the paladins! " ;
};


func int DIA_Mil_310_Stadtwache_Paladine_Condition()
{
	if (Mil_310_schonmalreinlett ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Mil_310_City Guard_Paladine_Info()
{
	AI_Output(other,self, " DIA_Mil_310_Stadtwache_Paladine_15_00 " );	// I need to see the head of the paladins! I have an important message for him!
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_07_01 " );	// Oh? And what is this important message?
	Mil_310_Scheisse_erzaehlt = TRUE ;
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, " The city is about to be attacked! " ,DIA_Mil_310_Stadtwache_Paladine_AttackSoon);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, " Evil forces gather in the Valley of Khorinis! " ,DIA_Mil_310_Stadtwache_Paladine_EvilArmy);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, " I've come to get the Eye of Innos! " ,DIA_Mil_310_Stadtwache_Paladine_EyeInnos);
};

func void DIA_Mil_310_City Guard_Paladine_EyeInnos()
{
	AI_Output(other,self, " DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_00 " );	// I've come to get the Eye of Innos!
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_01 " );	// What? Never heard of him. And what is it?
	AI_Output(other,self, " DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_02 " );	// This is a very important artifact.
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_03 " );	// You don't look like an important messenger. Do you have any documents?
	if ( ! Npc_HasItems(other,ItWr_Passierschein) >  0 )
	{
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_04");	//Нет!
		AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_05 " );	// Then don't waste my time!
	};
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
};

func void DIA_Mil_310_City Guard_Paladine_EvilArmy()
{
	AI_Output(other,self, " DIA_Mil_310_Stadtwache_Paladine_EvilArmy_15_00 " );	// The forces of evil gather in the Valley of Khorinis!
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_EvilArmy_07_01 " );	// In the Valley of Mines? Did you come from there? Did you see the army there?
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, " No, but someone who saw them sent me. " ,DIA_Mil_310_Stadtwache_Paladine_NoSomeone);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, " No. But I know it's being driven by dragons! " ,DIA_Mil_310_Stadtwache_Paladine_NoDragons);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, " Yes. I was in the valley of Khorinis. I saw giant dragons there! " ,DIA_Mil_310_Stadtwache_Paladine_YesDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_AttackSoon()
{
	AI_Output(other,self, " DIA_Mil_310_Stadtwache_Paladine_AttackSoon_15_00 " );	// The city is about to be attacked!
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_AttackSoon_07_01 " );	// What? Whom? Orcs? have you seen the army?
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, " No, but someone who saw them sent me. " ,DIA_Mil_310_Stadtwache_Paladine_NoSomeone);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, " No. But I know it's being driven by dragons! " ,DIA_Mil_310_Stadtwache_Paladine_NoDragons);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, " Yes. I was in the valley of Khorinis. I saw giant dragons there! " ,DIA_Mil_310_Stadtwache_Paladine_YesDragons);
};

func void DIA_Mil_310_City Guard_Paladine_NoDragons()
{
	AI_Output(other,self, " DIA_Mil_310_Stadtwache_Paladine_NoDragons_15_00 " );	// No. But I know it's being led by dragons!
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_01 " );	// Of course! And my grandmother advises orc generals.
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_02 " );	// I don't think we're going to let you bring this crazy gossip to Lord Hagen's ears!
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_03 " );	// Get lost!
	Player_KnowsLordHagen = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Mil_310_Stadtwache_Paladine_NoSomeone()
{
	AI_Output(other,self, " DIA_Mil_310_Stadtwache_Paladine_NoSomeone_15_00 " );	// No, but I was sent by a man who saw them.
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_NoSomeone_07_01 " );	// WHO sent you?...(incredulously)
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, " I'm not at liberty to tell you about this. " ,DIA_Mil_310_Stadtwache_Paladine_CantTellYou);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, " Паладин. " ,DIA_Mil_310_Stadtwache_Paladine_APaladin);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, " Маг. " ,DIA_Mil_310_Stadtwache_Paladine_AMage);
};

func void DIA_Mil_310_City Guard_Paladine_YesDragons()
{
	AI_Output(other,self, " DIA_Mil_310_Stadtwache_Paladine_YesDragons_15_00 " );	// Yes. I was in the valley of Khorinis. I saw giant dragons there!
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_01 " );	// You're lying! The passage to the valley is closed on both sides. No one will pass there!
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_02 " );	// Get out of here!
	AI_StopProcessInfos(self);
};

func void DIA_Mil_310_City Guard_Paladine_AMage()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_00");	//Маг.
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_AMage_07_01 " );	// Are you bringing news from a mage? Then, of course, you have a seal as proof?!
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_02");	//Нет.
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_AMage_07_03 " );	// What? Mages ALWAYS give their messengers a seal.
	AI_Output(other,self, " DIA_Mil_310_Stadtwache_Paladine_AMage_15_04 " );	// But not this mage.
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_AMage_07_05 " );	// I don't believe you. If you're a real messenger, then go ahead, spread your news or get lost!
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, " I can only give this message to paladins! " ,DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, " The dragons are attacking us with an evil army! " ,DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_APaladin()
{
	AI_Output(other,self, " DIA_Mil_310_Stadtwache_Paladine_APaladin_15_00 " );	// Paladin.
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_APaladin_07_01 " );	// Hmm, it's possible - the paladins are guarding the passage to the Valley of Mines.
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_APaladin_07_02 " );	// Give me your message and I'll report you.
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, " I can only give this message to paladins! " ,DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, " Dragons lead the evil army! " ,DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_CantTellYou()
{
	AI_Output(other,self, " DIA_Mil_310_Stadtwache_Paladine_CantTellYou_15_00 " );	// I have no right to tell you about this.
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_01 " );	// Don't talk like that, my boy! I'm on the city guard.
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_02 " );	// You can tell me EVERYTHING. So who sent you?
};

func void DIA_Mil_310_Stadtwache_Paladine_DepecheDragons()
{
	AI_Output(other,self, " DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_15_00 " );	// The army of evil is led by dragons!
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_01 " );	// What? It can not be true. And I almost let you in!
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_02 " );	// If you told THIS story to Lord Hagen, he would hang me for negligence.
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_03 " );	// Get lost!
	Player_KnowsLordHagen = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins()
{
	AI_Output(other,self, " DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_15_00 " );	// I can only send this message to paladins!
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_01 " );	// That won't work, my boy!
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_02 " );	// There's no way I'll let you approach Lord Hagen until I'm sure you're not wasting his precious time.
	Player_KnowsLordHagen = TRUE;
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, " No. I will ONLY give the message to the paladine. " ,DIA_Mil_310_Stadtwache_Paladine_Only2);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, " The dragons are attacking us with an evil army! " ,DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_City Guard_Paladine_Only2()
{
	AI_Output(other,self, " DIA_Mil_310_Stadtwache_Paladine_Only2_15_00 " );	// No. This message is for paladins ONLY.
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_Paladine_Only2_07_01 " );	// Then your path ends here, outlander.
	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_PERM (C_Info)
{
	npc = Mil_310_City Guard;
	nr = 5;
	condition = DIA_Mil_310_Stadtwache_PERM_Condition;
	information = DIA_Mil_310_Stadtwache_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_310_Stadtwache_PERM_Condition()
{
	if((self.aivar[AIV_PASSGATE] == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_PERM_Info()
{
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_PERM_07_00 " );	// Come on!
	AI_StopProcessInfos(self);
};


instance DIA_MIL_310_STADTWACHE_KILLIGNAZ (C_Info)
{
	npc = Mil_310_City Guard;
	nr = 5;
	condition = dia_mil_310_stadtwache_killignaz_condition;
	information = dia_mil_310_stadtwache_killignaz_info;
	permanent = FALSE;
	description = " Have you noticed anything unusual lately? " ;
};


func int dia_mil_310_stadtwache_killignaz_condition()
{
	if (( MIS_KILLIGNAZ  == LOG_Running) && ( READORTER  ==  FALSE ) && ( HELPKILLIGNAZ  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_killignaz_info()
{
	AI_Output(other,self, " DIA_Mil_310_Stadtwache_KillIgnaz_01_00 " );	// Have you noticed anything unusual lately?
	AI_Output(self,other, " DIA_Mil_310_Stadtwache_KillIgnaz_01_01 " );	// No, it's nothing...(lazy) It's all quiet here!
	AI_StopProcessInfos(self);
};

