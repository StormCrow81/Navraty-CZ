

instance DIA_Mil_333_Stadtwache_EXIT (C_Info)
{
	npc = Mil_333_City Guard;
	nr = 999;
	condition = DIA_Mil_333_Stadtwache_EXIT_Condition;
	information = DIA_Mil_333_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_333_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_333_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Mil_333_Checkpoint = "NW_CITY_MERCHANT_PATH_29";

var int MIL_333_Personal_AbsolutionLevel;

instance DIA_Mil_333_Stadtwache_FirstWarn (C_Info)
{
	npc = Mil_333_City Guard;
	nr = 1;
	condition = DIA_Mil_333_Stadtwache_FirstWarn_Condition;
	information = DIA_Mil_333_Stadtwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_333_Stadtwache_FirstWarn_Condition()
{
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (B_GetCurrentAbsolutionLevel(self) == MIL_333_Personal_AbsolutionLevel))
	{
		self.aivar[ AIV_PASSGATE ] = FALSE ;
	}
	else  if (Mil_333_schonmalreinlett ==  TRUE )
	{
		CITYGATEACCESSGRANTED = TRUE;
		self.aivar[ AIV_PASSGATE ] = TRUE ;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_FirstWarn_Info()
{
	var C_Item itm;
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_00");	//СТОЙ!

	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other,self, " DIA_Mil_333_Stadtwache_FirstWarn_15_01 " );	// (sighs) What else?
		AI_Output(self,other, " DIA_Mil_333_Stadtwache_FirstWarn_06_02 " );	// You know very well that!

		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other, " DIA_Mil_333_Stadtwache_FirstWarn_06_03 " );	// You're wanted for murder in the city!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other, " DIA_Mil_333_Stadtwache_FirstWarn_06_04 " );	// We won't tolerate dirty thieves here!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other, " DIA_Mil_333_Stadtwache_FirstWarn_06_05 " );	// We don't need troublemakers in the city!
		};

		AI_Output(self,other, " DIA_Mil_333_Stadtwache_FirstWarn_06_06 " );	// What makes you think we should let you in?
	}
	else
	{
		itm = Npc_GetEquippedArmor(other);

		if ((hero.guild ==  GIL_NONE ) && ((Npc_HasEquippedArmor(other) ==  FALSE ) || Hlp_IsItem(itm,ITAR_Her_M) || Hlp_IsItem(itm,ITAR_prisonel) || Hlp_IsItem(itm,ITAR_Her_N) || Hlp_IsItem (itm,ITAR_Her_N) ,ITAR_Prisoner) || Hlp_IsItem(itm,itar_sekbed)))
		{
			AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_07");	//Да?
			AI_Output(self,other, " DIA_Mil_333_Stadtwache_FirstWarn_06_08 " );	// You look like a beggar! In this city, we don't need people who don't have money.

			if (Npc_HasItems(other,ItWr_Passierschein))
			{
				AI_Output(other,self, " DIA_Mil_333_Stadtwache_FirstWarn_15_09 " );	// But I have a pass!
				AI_Output(self,other, " DIA_Mil_333_Stadtwache_FirstWarn_06_10 " );	// It's only good for other gates!
			};
			if (Npc_KnowsInfo(other,DIA_Mil_310_Stadtwache_MilizWerden))
			{
				AI_Output(other,self, " DIA_Mil_333_Stadtwache_FirstWarn_15_11 " );	// But I want to join the city guard!
				AI_Output(self,other, " DIA_Mil_333_Stadtwache_FirstWarn_06_12 " );	// Ha! Do not make me laugh! Go to another gate and try to tell it there.
				AI_Output(other,self, " DIA_Mil_333_Stadtwache_FirstWarn_15_13 " );	// I was already there, they sent me here.
				AI_Output(self,other, " DIA_Mil_333_Stadtwache_FirstWarn_06_14 " );	// (dirty laughter) Oh man! They always send us the cream of society...
			};
		}
		else
		{
			AI_Output(other,self, " DIA_Mil_333_Stadtwache_FirstWarn_15_15 " );	// (Calmly) What?
			AI_Output(self,other, " DIA_Mil_333_Stadtwache_FirstWarn_06_16 " );	// Just wanted to see you. Well, it looks like you have money. Come on!
			CITYGATEACCESSGRANTED = TRUE;
			self.aivar[ AIV_PASSGATE ] = TRUE ;
			Stadtwache_310.aivar[ AIV_PASSGATE ] = TRUE ;
			Mil_333_schonmalreinlett = TRUE ;
			AI_StopProcessInfos(self);
		};
	};

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Mil_333_Stadtwache_SecondWarn (C_Info)
{
	npc = Mil_333_City Guard;
	nr = 2;
	condition = DIA_Mil_333_Stadtwache_SecondWarn_Condition;
	information = DIA_Mil_333_Stadtwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_333_Stadtwache_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_333_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_SecondWarn_Info()
{
	AI_Output(self,other, " DIA_Mil_333_Stadtwache_SecondWarn_06_00 " );	// Are your hearing okay? One more step and you will meet my sword!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};

instance DIA_Mil_333_Stadtwache_Attack (C_Info)
{
	npc = Mil_333_City Guard;
	nr = 3;
	condition = DIA_Mil_333_Stadtwache_Attack_Condition;
	information = DIA_Mil_333_Stadtwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Mil_333_Stadtwache_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_333_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE ;
	AI_Output(self,other, " DIA_Mil_333_Stadtwache_Attack_06_00 " );	// You asked for it...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

instance DIA_Mil_333_Stadtwache_PERM (C_Info)
{
	npc = Mil_333_City Guard;
	nr = 5;
	condition = DIA_Mil_333_Stadtwache_PERM_Condition;
	information = DIA_Mil_333_Stadtwache_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Mil_333_Stadtwache_PERM_Condition()
{
	if (( self . aivar [ AIV_PASSGATE ] ==  TRUE ) && ( MIS_KILLIGNAZ  != LOG_Running ) && Npc_IsInState ( self , ZS_Talk ) ) ;
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_PERM_Info()
{
	AI_Output(self,other, " DIA_Mil_333_Stadtwache_PERM_06_00 " );	// Come on!
	AI_StopProcessInfos(self);
};

instance DIA_MIL_333_STADTWACHE_KILLIGNAZ (C_Info)
{
	npc = Mil_333_City Guard;
	nr = 5;
	condition = dia_mil_333_stadtwache_killignaz_condition;
	information = dia_mil_333_stadtwache_killignaz_info;
	permanent = FALSE;
	description = " Do you notice everything here? " ;
};

func int dia_mil_333_stadtwache_killignaz_condition()
{
	if (( MIS_KILLIGNAZ  == LOG_Running) && ( READORTER  ==  FALSE ) && ( HELPKILLIGNAZ  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_mil_333_stadtwache_killignaz_info()
{
	AI_Output(other,self, " DIA_Mil_333_Stadtwache_KillIgnaz_01_00 " );	// Do you notice everything here?
	AI_Output(self,other, " DIA_Mil_333_Stadtwache_KillIgnaz_01_01 " );	// Are you asking me? Boy, I'm here to keep track of everything.
	AI_Output(self,other, " DIA_Mil_333_Stadtwache_KillIgnaz_01_02 " );	// Although, in truth, there is very little work now. There is nothing special to follow.
	AI_Output(other,self,"DIA_Mil_333_Stadtwache_KillIgnaz_01_03");	//Почему?
	AI_Output(self,other, " DIA_Mil_333_Stadtwache_KillIgnaz_01_04 " );	// Because, lately, no one is particularly in a hurry to leave the city.
	AI_Output(self,other, " DIA_Mil_333_Stadtwache_KillIgnaz_01_05 " );	// It's too dangerous outside today! Although, sometimes, daredevils come across ... (grinning)
	AI_Output(other,self, " DIA_Mil_333_Stadtwache_KillIgnaz_01_06 " );	// Who do you mean?
	AI_Output(self,other, " DIA_Mil_333_Stadtwache_KillIgnaz_01_07 " );	// Yes, a guy passed here recently. I left the city and went straight over there, towards the lighthouse.
	AI_Output(self,other, " DIA_Mil_333_Stadtwache_KillIgnaz_01_08 " );	// By the way, they say that bandits have settled there today. I won't envy him if he stumbles upon them!
	AI_StopProcessInfos(self);
	Wld_InsertNpc(vlk_6150_ortego,"NW_CITY_SMFOREST_BANDIT_02");
};
