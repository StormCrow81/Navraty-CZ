

instance DIA_Mil_332_Stadtwache_EXIT (C_Info)
{
	npc = Mil_332_City Guard;
	nr = 999;
	condition = DIA_Mil_332_Stadtwache_EXIT_Condition;
	information = DIA_Mil_332_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_332_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_332_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_332_STADTWACHE_TOARMSCITYGATE (C_Info)
{
	npc = Mil_332_City Guard;
	nr = 1;
	condition = dia_mil_332_stadtwache_toarmscitygate_condition;
	information = dia_mil_332_stadtwache_toarmscitygate_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_332_stadtwache_toarmscitygate_condition()
{
	if((TOARMSCITYGATE == TRUE) && (CITYGATEACCESSGRANTED == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_332_stadtwache_toarmscitygate_info()
{
	B_Say(self,other,"$ALARM");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
	TOARMSCITYGATE = FALSE;
};


instance DIA_Mil_332_Stadtwache_PERM (C_Info)
{
	npc = Mil_332_City Guard;
	nr = 1;
	condition = DIA_Mil_332_Stadtwache_PERM_Condition;
	information = DIA_Mil_332_Stadtwache_PERM_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Mil_332_Stadtwache_PERM_Condition()
{
	return TRUE;
};

func void DIA_Mil_332_Stadtwache_PERM_Info()
{
	AI_Output(other,self, " DIA_Mil_332_Stadtwache_PERM_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Mil_332_Stadtwache_PERM_04_01 " );	// Come on! I'm on duty!
	AI_StopProcessInfos(self);
};


// ---------------------------------------- deserters------- ----------------------------------------


instance DIA_Mil_3320_Stadtwache_EXIT (C_Info)
{
	npc = Mil_3320_City Guard;
	nr = 999;
	condition = DIA_Mil_3320_Stadtwache_EXIT_Condition;
	information = DIA_Mil_3320_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_3320_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_3320_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mil_3321_Stadtwache_EXIT (C_Info)
{
	npc = Mil_3321_City Guard;
	nr = 999;
	condition = DIA_Mil_3321_Stadtwache_EXIT_Condition;
	information = DIA_Mil_3321_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_3321_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_3321_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mil_3322_Stadtwache_EXIT (C_Info)
{
	npc = Mil_3322_City Guard;
	nr = 999;
	condition = DIA_Mil_3322_Stadtwache_EXIT_Condition;
	information = DIA_Mil_3322_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_3322_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_3322_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mil_3321_Stadtwache_FUCKOFF (C_Info)
{
	npc = Mil_3321_City Guard;
	nr = 10;
	condition = DIA_Mil_3321_Stadtwache_FUCKOFF_condition;
	information = DIA_Mil_3321_Stadtwache_FUCKOFF_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Mil_3321_Stadtwache_FUCKOFF_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mil_3321_Stadtwache_FUCKOFF_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_Mil_3322_Stadtwache_FUCKOFF (C_Info)
{
	npc = Mil_3322_City Guard;
	nr = 10;
	condition = DIA_Mil_3322_Stadtwache_FUCKOFF_condition;
	information = DIA_Mil_3322_Stadtwache_FUCKOFF_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Mil_3322_Stadtwache_FUCKOFF_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mil_3322_Stadtwache_FUCKOFF_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_Mil_3320_Stadtwache_Run (C_Info)
{
	npc = Mil_3320_City Guard;
	nr = 1;
	condition = DIA_Mil_3320_Stadtwache_Run_condition;
	information = DIA_Mil_3320_Stadtwache_Run_info;
	permanent = FALSE;
	description = " Hey, what are you doing here? " ;
};

func int DIA_Mil_3320_Stadtwache_Run_condition()
{
	if(MIS_DeadHead == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Mil_3320_Stadtwache_Run_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Mil_3320_Stadtwache_Run_01_00 " );	// Hey, what are you doing here?
	AI_Output(self,other, " DIA_Mil_3320_Stadtwache_Run_01_01 " );	// Umm...(stammered) It's just that we have an order to return back to Khorinis.
	AI_Output(other,self, " DIA_Mil_3320_Stadtwache_Run_01_02 " );	// Whose order?
	AI_Output(self,other, " DIA_Mil_3320_Stadtwache_Run_01_03 " );	// Well... (thinking) It was given to us by... Lord Andre. Yes, he is the one.
	AI_Output(other,self, " DIA_Mil_3320_Stadtwache_Run_01_04 " );	// But Lord Andre is in Khorinis now. Are you taking me for a fool?
	AI_Output(self,other, " DIA_Mil_3320_Stadtwache_Run_01_05 " );	// No, what are you... I... just mixed up... of course, it was not Lord Andre!
	AI_Output(other,self, " DIA_Mil_3320_Stadtwache_Run_01_06 " );	// You know, usually such orders must be accompanied by written documents. Do you have them?
	AI_Output(self,other, " DIA_Mil_3320_Stadtwache_Run_01_08 " );	// Listen, buddy... (nervously) You should go your own way, and don't get into other people's business.
	AI_Output(other,self, " DIA_Mil_3320_Stadtwache_Run_01_09 " );	// Then I'll have to report you to the paladins.
	AI_Output(other,self, " DIA_Mil_3320_Stadtwache_Run_01_10 " );	// And then all of a sudden you are actually ordinary deserters.
	AI_Output(self,other, " DIA_Mil_3320_Stadtwache_Run_01_11 " );	// Oh boy! But I asked you not to climb on the rampage.
	AI_Output(self,other, " DIA_Mil_3320_Stadtwache_Run_01_12 " );	// Sorry, but you asked for it!
	B_LogEntry(TOPIC_DeadHead, " I met three militiamen near the entrance to Khorinis. It looks like they are deserters. However, they are unlikely to let me go alive now, otherwise I will be able to report them to the paladins. " );
	Info_ClearChoices(DIA_Mil_3320_Stadtwache_Run);
	Info_AddChoice(DIA_Mil_3320_Stadtwache_Run,Dialog_Ende,DIA_Mil_3320_Stadtwache_Run_End);
};

func void DIA_Mil_3320_City Guard_Run_End()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Mil_3321_Stadtwache.aivar[AIV_EnemyOverride] = FALSE ;
	Mil_3322_Stadtwache.aivar[AIV_EnemyOverride] = FALSE ;
	B_Attack(self,other,AR_KILL,0);
};
