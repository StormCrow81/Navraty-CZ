

instance DIA_Mil_304_Torwache_EXIT(C_Info)
{
	npc = Mil_304_Torwache;
	nr = 999;
	condition = DIA_Mil_304_Torwache_EXIT_Condition;
	information = DIA_Mil_304_Torwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_304_Torwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_304_Torwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_304_TORWACHE_TOARMSCITYGATE(C_Info)
{
	npc = Mil_304_Torwache;
	nr = 1;
	condition = dia_mil_304_torwache_toarmscitygate_condition;
	information = dia_mil_304_torwache_toarmscitygate_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_304_torwache_toarmscitygate_condition()
{
	if((TOARMSHIGHCITYGATE == TRUE) && (CITYGATEACCESSGRANTED == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_304_torwache_toarmscitygate_info()
{
	B_Say(self,other,"$ALARM");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
	TOARMSHIGHCITYGATE = FALSE;
};


instance DIA_Mil_304_Torwache_WASMACHSTDU (C_Info)
{
	npc = Mil_304_Torwache;
	nr = 3;
	condition = DIA_Mil_304_Torwache_WASMACHSTDU_Condition;
	information = DIA_Mil_304_Torwache_WASMACHSTDU_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Mil_304_Torwache_WASMACHSTDU_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mil_304_Torwache_WASMACHSTDU_Info()
{
	AI_Output(other,self, " DIA_Mil_304_Torwache_WASMACHSTDU_15_00 " );	// Как дела?
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other, " DIA_Mil_304_Torwache_WASMACHSTDU_08_01 " );	// I have nothing to complain about. I carry out my duties as Innos wishes.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Mil_304_Torwache_WASMACHSTDU_08_02 " );	// Hey, stop talking nonsense like 'how are you?'! Get out of my sight, okay?
	}
	else if((hero.guild == GIL_NDW) || (hero.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Mil_304_Torwache_WASMACHSTDU_08_03 " );	// Nothing to complain about. Adanos with you!
	}
	else
	{
		AI_Output(self,other, " DIA_Mil_304_Torwache_WASMACHSTDU_08_04 " );	// All is well.
	};
	AI_StopProcessInfos(self);
};

