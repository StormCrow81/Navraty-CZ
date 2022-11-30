
instance DIA_Addon_Paul_EXIT(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 999;
	condition = DIA_Addon_Paul_EXIT_Condition;
	information = DIA_Addon_Paul_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Paul_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Paul_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Paul_PICKPOCKET(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 900;
	condition = DIA_Addon_Paul_PICKPOCKET_Condition;
	information = DIA_Addon_Paul_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Paul_PICKPOCKET_Condition()
{
	return  C_Robbery ( 22 , 19 );
};

func void DIA_Addon_Paul_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Paul_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Paul_PICKPOCKET,Dialog_Back,DIA_Addon_Paul_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Paul_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Paul_PICKPOCKET_DoIt);
};

func void DIA_Addon_Paul_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Paul_PICKPOCKET);
};

func void DIA_Addon_Paul_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Paul_PICKPOCKET);
};


instance DIA_Addon_Paul_Hi(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 1;
	condition = DIA_Addon_Paul_Hi_Condition;
	information = DIA_Addon_Paul_Hi_Info;
	permanent = FALSE;
	description = " Do you have any of the blacksmith's tools? " ;
};


func int DIA_Addon_Paul_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Paul_Hi_Info()
{
	AI_Output(other,self, " DIA_Addon_Paul_Hi_15_00 " );	// Do you have any blacksmith tools?
	AI_Output(self,other, " DIA_Addon_Paul_Hi_03_01 " );	// Huno has steel. I only have a few pieces of ore.
	AI_Output(self,other, " DIA_Addon_Paul_Hi_03_02 " );	// But I won't give them up. It's the only thing I have left of value.
};


instance DIA_Addon_Paul_Huno(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 2;
	condition = DIA_Addon_Paul_Huno_Condition;
	information = DIA_Addon_Paul_Huno_Info;
	permanent = FALSE;
	description = " Do you work for Huno? " ;
};


func int DIA_Addon_Paul_Huno_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_Hi))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Paul_Huno_Info()
{
	AI_Output(other,self, " DIA_Addon_Paul_Huno_15_00 " );	// Do you work for Huno?
	AI_Output(self,other, " DIA_Addon_Paul_Huno_03_01 " );	// I wanted to earn some gold, so I started working with it. But Esteban hasn't given me anything since.
	AI_Output(self,other, " DIA_Addon_Paul_Huno_03_02 " );	// He said I wouldn't be of any use to him anymore.
	AI_Output(self,other, " DIA_Addon_Paul_Huno_03_03 " );	// What else can I do besides keep working with Huno?
};


instance DIA_Addon_Paul_Attentat(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 3;
	condition = DIA_Addon_Paul_Attentat_Condition;
	information = DIA_Addon_Paul_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Paul_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Paul_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other, " DIA_Addon_Paul_Attentat_03_00 " );	// Nothing, mate. And there's nothing you can do about it! What do you want from me?
};


instance DIA_Addon_Paul_HunoVerdacht (C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 4;
	condition = DIA_Addon_Paul_HunoVerdacht_Condition;
	information = DIA_Addon_Paul_HunoVerdacht_Info;
	permanent = FALSE;
	description = " Huno is suspected of involvement in the attack... " ;
};


func int DIA_Addon_Paul_HunoVerdacht_Condition()
{
	if(((Finn_TellAll == TRUE) || (Emilio_TellAll == TRUE)) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Paul_HunoVerdacht_Info()
{
	AI_Output(other,self, " DIA_Addon_Paul_HunoVerdacht_15_00 " );	// Huno is suspected of being involved in the attack...
	AI_Output(self,other, " DIA_Addon_Paul_HunoVerdacht_03_01 " );	// I don't know anything about this!
};


instance DIA_Addon_Paul_HunoArbeit(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 5;
	condition = DIA_Addon_Paul_HunoArbeit_Condition;
	information = DIA_Addon_Paul_HunoArbeit_Info;
	permanent = FALSE;
	description = " But you work for Huno! So you should know something! " ;
};


func int DIA_Addon_Paul_HunoArbeit_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Paul_Huno ) && Npc_KnowsInfo ( other , DIA_Addon_Paul_HunoSupplied ) && ( MY_Judas == LOG_Running )) .
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Paul_HunoArbeit_Info()
{
	AI_Output(other,self, " DIA_Addon_Paul_HunoArbeit_15_00 " );	// But you work for Huno! So you must know something!
	AI_Output(self,other, " DIA_Addon_Paul_HunoArbeit_03_01 " );	// (in desperation) I don't know anything - honestly! I have to go!
	Npc_ExchangeRoutine(self,"AWAY");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Paul_FearEsteban(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 5;
	condition = DIA_Addon_Paul_FearEsteban_Condition;
	information = DIA_Addon_Paul_FearEsteban_Info;
	permanent = FALSE;
	description = " Do you know what Esteban will do to you? " ;
};


func int DIA_Addon_Paul_FearEsteban_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Paul_Who_Works ) && ( MY_Judas == LOG_Running )) .
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Paul_FearEsteban_Info()
{
	AI_Output(other,self, " DIA_Addon_Paul_FearEsteban_15_00 " );	// Do you know what Esteban will do to you if he finds out you're covering for Huno?
	AI_Output(self,other, " DIA_Addon_Paul_FearEsteban_03_01 " );	// Guy! Leave me alone. I have nothing to do with this.
	Npc_ExchangeRoutine(self,"PRESTART");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Paul_MaulPaul(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 5;
	condition = DIA_Addon_Paul_MaulPaul_Condition;
	information = DIA_Addon_Paul_MaulPaul_Info;
	permanent = FALSE;
	description = " Tell me what you know! " ;
};


func int DIA_Addon_Paul_MaulPaul_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Paul_FearStephen ) && ( MIS_Judas == LOG_Running )) .
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Paul_MaulPaul_Info()
{
	AI_Output(other,self, " DIA_Addon_Paul_MaulPaul_15_00 " );	// (friendly) Paul, tell me what you know or I'll smash you all over this wall!
	AI_Output(self,other, " DIA_Addon_Paul_MaulPaul_03_01 " );	// You can't beat me up just because you work for the boss.
	AI_Output(other,self, " DIA_Addon_Paul_MaulPaul_15_02 " );	// (kindly) I can!
	AI_Output(self,other, " DIA_Addon_Paul_MaulPaul_03_03 " );	// Don't talk nonsense!
	AI_Output(other,self, " DIA_Addon_Paul_MaulPaul_15_04 " );	// (impatiently) Paul...
	AI_Output(self,other, " DIA_Addon_Paul_MaulPaul_03_05 " );	// (feverishly) All I know is that Huno and Esteban have some kind of disagreement.
	AI_Output(self,other, " DIA_Addon_Paul_MaulPaul_03_06 " );	// (feverishly) In front of me, he constantly swears at Esteban. That he messed up his business and all that...
	AI_Output(self,other, " DIA_Addon_Paul_MaulPaul_03_07 " );	// I only listened and never said anything.
	AI_Output(other,self, " DIA_Addon_Paul_MaulPaul_15_08 " );	// Great! See, it wasn't that hard.
	Npc_ExchangeRoutine(self,"START");
	Paul_TellAll = TRUE;
	B_LogEntry(Topic_Addon_Esteban, " Paul said that Huno hates Esteban because he does his business. " );
};


instance DIA_Addon_BDT_1070_Paul_Mine(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 2;
	condition = DIA_Addon_Paul_Mine_Condition;
	information = DIA_Addon_Paul_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Paul_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Paul_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other, " DIA_Addon_BDT_1070_Paul_Mine_03_00 " );	// Finally! Here, I want you to take my ore for this.
	B_GiveInvItems(self,other,ItMi_Nugget,2);
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Paul_PERM(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 99;
	condition = DIA_Addon_Paul_PERM_Condition;
	information = DIA_Addon_Paul_PERM_Info;
	permanent = TRUE;
	description = " Are you all right? " ;
};


func int DIA_Addon_Paul_PERM_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Paul_Knows ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Paul_PERM_Info()
{
	AI_Output(other,self, " DIA_Addon_Paul_PERM_15_00 " );	// Are you all right?
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_07") <= 500)
	{
		AI_Output(self,other, " DIA_Addon_Paul_PERM_03_01 " );	// Yes, I will get a lot of gold from this rock!
	}
	else  if ((Paul_TellAll ==  TRUE ) && (I_got_Snaf ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Addon_Paul_PERM_03_02 " );	// I've told you everything I know!
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Paul_PERM_03_03 " );	// I just want to do my job, mate!
	};
};
