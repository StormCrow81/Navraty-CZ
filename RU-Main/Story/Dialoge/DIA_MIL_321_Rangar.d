

instance DIA_Rangar_EXIT(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 999;
	condition = DIA_Rangar_EXIT_Condition;
	information = DIA_Rangar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rangar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rangar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rangar_PICKPOCKET(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 900;
	condition = DIA_Rangar_PICKPOCKET_Condition;
	info = DIA_Rangar_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};


func int DIA_Rangar_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_02) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Rangar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rangar_PICKPOCKET);
	Info_AddChoice(DIA_Rangar_PICKPOCKET,Dialog_Back,DIA_Rangar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rangar_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Rangar_PICKPOCKET_DoIt);
};

func void DIA_Rangar_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,ItKe_City_Tower_02,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Rangar_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Rangar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rangar_PICKPOCKET);
};


instance DIA_Rangar_Hello (C_Info)
{
	npc = MIL_321_Rangar;
	nr = 2;
	condition = DIA_Rangar_Hallo_Condition;
	information = DIA_Rangar_Hello_Info;
	permanent = FALSE;
	description = " Hey, what are you doing here? " ;
};


func int DIA_Rangar_Hallo_Condition()
{
	if(((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rangar_Hallo_Info()
{
	AI_Output(other,self, " DIA_Rangar_Hallo_15_00 " );	// Hey, how are you?
	AI_Output(self,other, " DIA_Rangar_Hallo_07_01 " );	// As long as the paladins don't have any tasks for me, I can relax and have a beer. What else to do? (chuckles)
	AI_Output(other, self, " DIA_Rangar_Hallo_15_02 " );	// Do you work for paladins?
	AI_Output(self,other, " DIA_Rangar_Hallo_07_03 " );	// Yes, I report to them about the situation in the city. At the moment everything is calm.
};


instance DIA_Rangar_Ork(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 3;
	condition = DIA_Rangar_Ork_Condition;
	info = DIA_Rangar_Ork_Info;
	permanent = FALSE;
	description = " What about the orcs? " ;
};


func int DIA_Rangar_Ork_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rangar_Hallo) && ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rangar_Ork_Info()
{
	AI_Output(other,self, " DIA_Rangar_Ork_15_00 " );	// How about the orc situation?
	AI_Output(self,other, " DIA_Rangar_Ork_07_01 " );	// No reason to worry - the city guard and paladins have the situation under control.
	AI_Output(self,other, " DIA_Rangar_Ork_07_02 " );	// Go home quietly and leave our work to us. We are responsible for the city and its citizens. -IR-
};


instances of DIA_Rangar_Bier (C_Info)
{
	npc = MIL_321_Rangar;
	nr = 4;
	condition = DIA_Rangar_Bier_Condition;
	information = DIA_Rangar_Beer_Info;
	permanent = TRUE;
	description = " Do you want another beer? " ;
};


func int DIA_Rangar_Bier_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rangar_Hallo) && ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rangar_Bier_Info()
{
	AI_Output(other,self, " DIA_Rangar_Bier_15_00 " );	// Would you like some more beer?

	if(B_GiveInvItems(other,self,ItFo_Beer,1))
	{
		if(Knows_Paladins == FALSE)
		{
			AI_Output(self,other, " DIA_Rangar_Bier_07_01 " );	// Ah, there's nothing better than a cold ale.
			CreateInvItems(self,ItFo_Booze,1);
			B_UseItem(self,ItFo_Booze);
			AI_Output(other,self, " DIA_Rangar_Bier_15_02 " );	// You wanted to say something about orcs...
			AI_Output(self,other, " DIA_Rangar_Bier_07_03 " );	// Oh, yes, exactly. Orcs do not pose a threat to the city.
			AI_Output(self,other, " DIA_Rangar_Bier_07_04 " );	// They're stuck in Mining Valley. And the Pass is guarded by paladins.
			AI_Output(self,other, " DIA_Rangar_Bier_07_05 " );	// Even a meat bug won't seep in there.
			Knows_Paladins = 1;
			Info_ClearChoices(DIA_Rangar_Bier);
		}
		else if((Knows_Paladins == 1) && (Knows_Ork == TRUE))
		{
			AI_Output(self,other, " DIA_Rangar_Bier_07_06 " );	// I wouldn't mind another pint.
			CreateInvItems(self,ItFo_Booze,1);
			B_UseItem(self,ItFo_Booze);
			AI_Output(other,self, " DIA_Rangar_Bier_15_07 " );	// They say that orcs were seen near the city itself.
			AI_Output(self,other, " DIA_Rangar_Bier_07_08 " );	// Yes, that's right, a dangerous orc near the city. This orc is a real monster. He will soon attack the city.
			AI_Output(self,other, " DIA_Rangar_Bier_07_09 " );	// Look, we'll tear this orc up like a piece of rag if he gets close to the city. Understood?
			AI_Output(other,self,"DIA_Rangar_Bier_15_10");	//Понял.
			Knows_Paladins = 2;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
				AI_Print( " Rhetoric + 1 " );
			};

			Info_ClearChoices(DIA_Rangar_Bier);
		}
		else
		{
			AI_Output(self,other, " DIA_Rangar_Bier_07_11 " );	// Bitter ale is by far the best.
			CreateInvItems(self,ItFo_Booze,1);
			B_UseItem(self,ItFo_Booze);
			AI_Output(self,other, " DIA_Rangar_Bier_07_12 " );	// You know, it's not often you see a guy willing to buy you a beer. You are our man.
			Info_ClearChoices(DIA_Rangar_Bier);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Rangar_Bier_07_13 " );	// I want more beer.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Rangar_Caught (C_Info)
{
	npc = MIL_321_Rangar;
	nr = 5;
	condition = DIA_Addon_Rangar_Caught_Condition;
	information = DIA_Addon_Rangar_Caught_Info;
	description = " What are you doing here? " ;
};


var int DIA_Addon_Rangar_Caught_OneTime;

func int DIA_Addon_Rangar_Caught_Condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) && (DIA_Addon_Rangar_Erwischt_OneTime == FALSE) && (MIS_Addon_Martin_GetRangar == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rangar_Caught_Info()
{
	AI_Output(other,self, " DIA_Addon_Rangar_Erwischt_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Addon_Rangar_Erwischt_07_01 " );	// Uh...(frightened) I... It's none of your business! Get out!
	AI_Output(other,self, " DIA_Addon_Rangar_Erwischt_15_02 " );	// Martin will be just happy when I tell who's digging into things while he's gone.
	AI_Output(self,other, " DIA_Addon_Rangar_Erwischt_07_03 " );	// Do what you want! I'm leaving here.
	B_GivePlayerXP(XP_Addon_Martin_GotRangar);
	AI_StopProcessInfos(self);

	if(MIS_CoragonFixBeer == LOG_Success)
	{
		Npc_ExchangeRoutine(self,"Coragon");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Start");
	};
	SC_GotRangar = TRUE;
};


instance DIA_Addon_Failed (C_Info)
{
	npc = MIL_321_Rangar;
	nr = 2;
	condition = DIA_Addon_Rangar_nachhaken_Condition;
	information = DIA_Addon_Rangar_nachhaken_Info;
	permanent = TRUE;
	description = " Do you really think you can get away with this? " ;
};


func int DIA_Addon_Color_Failed_Condition()
{
	if((SC_GotRangar == TRUE) && (MIS_Addon_Martin_GetRangar == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Color_missing_Info()
{
	AI_Output(other,self, " DIA_Addon_Rangar_nachhaken_15_00 " );	// Do you really think you can get away with this?
	AI_Output(self,other, " DIA_Addon_Rangar_nachhaken_07_01 " );	// (indifferent) Don't make so much noise over a pathetic pile of junk.
};

