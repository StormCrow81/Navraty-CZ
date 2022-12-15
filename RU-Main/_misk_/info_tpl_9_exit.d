

instance INFO_TPL_9_EXIT(C_Info)
{
	nr = 999;
	condition = INFO_TPL_9_exit_condition;
	information = INFO_TPL_9_exit_info;
	permanent = 1;
	description = Dialog_Ende;
};

func int INFO_TPL_9_exit_condition()
{
	return TRUE;
};

func void INFO_TPL_9_exit_info()
{
	AI_StopProcessInfos(self);
};

instance INFO_TPL_9_DIELAGE(C_Info)
{
	nr = 1;
	condition = INFO_TPL_9_dielage_condition;
	information = INFO_TPL_9_dielage_info;
	permanent = TRUE;
	important = TRUE;
};

func int INFO_TPL_9_dielage_condition()
{
	if((CountDownAssInvasion == FALSE) && (Npc_IsInState(self,ZS_Talk)))
	{
		return TRUE;
	};
};

func void INFO_TPL_9_dielage_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

instance INFO_TPL_9_HOW(C_Info)
{
	nr = 1;
	condition = INFO_TPL_9_HOW_condition;
	information = INFO_TPL_9_HOW_info;
	permanent = TRUE;
	description = " How are things? " ;
};

func int INFO_TPL_9_HOW_condition()
{
	if((CountDownAssInvasion == TRUE) && (AssasinAttackCamp == FALSE))
	{
		return TRUE;
	};
};

func void INFO_TPL_9_HOW_info()
{
	var int question;

	question = Hlp_Random(3);

	AI_Output(other, self, " INFO_TPL_9_HOW_01_00 " );	// How are things?

	if(question == 0)
	{
		AI_Output(self,other, " INFO_TPL_9_HOW_01_01 " );	// All quiet for now, mate.
		AI_StopProcessInfos(self);
	}
	else if(question == 1)
	{
		AI_Output(self,other, " INFO_TPL_9_HOW_01_02 " );	// Everything is under control! They can't get close to the camp without being seen.
		AI_StopProcessInfos(self);
	}
	else if(question == 2)
	{
		AI_Output(self,other, " INFO_TPL_9_HOW_01_03 " );	// As long as we're here, this camp is unlikely to be threatened.
		AI_StopProcessInfos(self);
	}
	else if(question == 3)
	{
		AI_Output(self,other, " INFO_TPL_9_HOW_01_04 " );	// You don't have to worry, boy. We've got this well in hand!
		AI_StopProcessInfos(self);
	};
};


func void b_assignambientinfos_tpl_9(var C_Npc slf)
{
	INFO_TPL_9_exit.npc = Hlp_GetInstanceID(slf);
	INFO_TPL_9_DIELAGE.npc = Hlp_GetInstanceID(slf);
	INFO_TPL_9_HOW.npc = Hlp_GetInstanceID(slf);
};
