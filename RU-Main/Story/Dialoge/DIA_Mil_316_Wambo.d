

instance DIA_Wambo_EXIT(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 999;
	condition = DIA_Wambo_EXIT_Condition;
	information = DIA_Wambo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wambo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wambo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Wambo_PICKPOCKET(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 900;
	condition = DIA_Wambo_PICKPOCKET_Condition;
	information = DIA_Wambo_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};

func int DIA_Wambo_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_04) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Wambo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wambo_PICKPOCKET);
	Info_AddChoice(DIA_Wambo_PICKPOCKET,Dialog_Back,DIA_Wambo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wambo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wambo_PICKPOCKET_DoIt);
};

func void DIA_Wambo_PICKPOCKET_DoIt()
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

		B_GiveInvItems(self,other,ItKe_City_Tower_04,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Wambo_PICKPOCKET);
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

func void DIA_Wambo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wambo_PICKPOCKET);
};


instance DIA_Wambo_Job(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 5;
	condition = DIA_Wambo_Job_Condition;
	information = DIA_Wambo_Job_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Wambo_Job_Condition()
{
	return TRUE;
};

func void DIA_Wambo_Job_Info()
{
	AI_Output(other,self, " DIA_Wambo_Job_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Wambo_Job_03_01 " );	// I make sure no one enters the houses.
	AI_Output(self,other, " DIA_Wambo_Job_03_02 " );	// Lord Hagen personally gave this order. And don't even think about breaking it!
};


instance DIA_Wambo_Situation(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 10;
	condition = DIA_Wambo_Situation_Condition;
	information = DIA_Wambo_Situation_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Wambo_Situation_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Wambo_Job ) )
	{
		return TRUE;
	};
};

func void DIA_Wambo_Situation_Info()
{
	AI_Output(other,self, " DIA_Wambo_Situation_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Wambo_Situation_03_01 " );	// Everything is quiet now.
};


instance DIA_Wambo_Ramirez(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 5;
	condition = DIA_Wambo_Ramirez_Condition;
	information = DIA_Wambo_Ramirez_Info;
	permanent = FALSE;
	description = " I came from our mutual friend, Ramirez. " ;
};


func int DIA_Wambo_Ramirez_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Ramirez_Quarter))
	{
		return TRUE;
	};
};

func void DIA_Wambo_Ramirez_Info()
{
	AI_Output(other,self, " DIA_Wambo_Ramirez_15_00 " );	// I came from our mutual friend, Ramirez.
	AI_Output(self,other, " DIA_Wambo_Ramirez_03_01 " );	// Oh? This Ramirez is still a scoundrel. And he's not my friend. Come on. Did you bring me something?
	AI_Output(other,self, " DIA_Wambo_Ramirez_15_02 " );	// It depends on what you want.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_Wambo_Ramirez_03_03 " );	// Okay, let's do this - you pay me two hundred and fifty gold coins. And I won't be here all night.
	AI_Output(self,other, " DIA_Wambo_Ramirez_03_04 " );	// And, if you're so suspicious, let's agree that if I show up here, then our deal can be considered terminated.
};


instance DIA_Wambo_Deal(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 5;
	condition = DIA_Wambo_Deal_Condition;
	information = DIA_Wambo_Deal_Info;
	permanent = TRUE;
	description = " I have money. " ;
};


var int DIA_Wambo_Deal_permanent;

func int DIA_Wambo_Deal_Condition()
{
	if ( Npc_KnowsInfo ( other , Npc_Knows_Info ) && ( Npc_KnowsInfo ( other , Npc_Knows_Info  ) )
	{
		return TRUE;
	};
};

func void DIA_Wambo_Deal_Info()
{
	AI_Output(other,self, " DIA_Wambo_Deal_15_00 " );	// I have money...

	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		AI_Output(self,other, " DIA_Wambo_Deal_03_01 " );	// Okay, then I'll disappear for the night.
		AI_Output(self,other, " DIA_Wambo_Deal_03_02 " );	// And remember, if you're in trouble, I don't know you.
		DIA_Wambo_Deal_permanent = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"DRINK");
	}
	else
	{
		AI_Output(other,self, " DIA_Wambo_Deal_15_03 " );	// ...but didn't take them with me.
		AI_Output(self,other, " DIA_Wambo_Deal_03_04 " );	// I can't stand it when someone tries to fool me. So get the gold here.
		AI_StopProcessInfos(self);
	};
};


instance DIA_WAMBO_KILL(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 5;
	condition = dia_wambo_kill_condition;
	information = dia_wambo_kill_info;
	permanent = FALSE;
	description = " You seem to be in big trouble. " ;
};


func int dia_wambo_kill_condition()
{
	if(MIS_KILLWAMBO == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_wambo_kill_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Wambo_Kill_01_00 " );	// You seem to be in big trouble.
	AI_Output(self,other, " DIA_Wambo_Kill_01_01 " );	// Me? Problems?...(laughs)
	AI_Output(other,self, " DIA_Wambo_Kill_01_03 " );	// They say you're robbing local merchants, extorting gold from them. Many complain about you!
	AI_Output(self,other, " DIA_Wambo_Kill_01_04 " );	// (arrogantly) So what?
	AI_Output(other,self, " DIA_Wambo_Kill_01_07 " );	// I decided to tell you that your actions will not go unpunished, and I will personally take care of it.
	AI_Output(self,other, " DIA_Wambo_Kill_01_08 " );	// huh? And what will you do? Will you run to cry to Lord Andre?
	AI_ReadyMeleeWeapon(other);
	AI_Output(other,self, " DIA_Wambo_Kill_01_09 " );	// No! Just now you will feel my blade in your body.
	AI_Output(self,other, " DIA_Wambo_Kill_01_10 " );	// WHAT?! Are you threatening me? Oh you bastard!
	AI_Output(self,other, " DIA_Wambo_Kill_01_11 " );	// Wait a minute, now I'll teach you something!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

