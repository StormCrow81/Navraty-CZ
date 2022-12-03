

instance DIA_CLOCKGUARD_EXIT (C_Info) .
{
	npc = tpl_8016_templer;
	nr = 999;
	condition = dia_kalomsguard_exit_condition;
	information = dia_kalomsguard_exit_info;
	permanent = TRUE;
	important = FALSE;
	description = Dialog_Ende;
};


func int dia_kalomsguard_exit_condition()
{
	return TRUE;
};

func void dia_kalomsguard_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KALOMSGUARD_PERM(C_Info)
{
	npc = tpl_8016_templer;
	nr = 1;
	condition = dia_kalomsguard_perm_condition;
	information = dia_kalomsguard_perm_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_kalomsguard_perm_condition()
{
	if((STARTBIGBATTLE == FALSE) && (BIGBATTLEBACKPOSITION == FALSE))
	{
		return TRUE;
	};
};

func void dia_kalomsguard_perm_info()
{
	AI_Output(self,other, " DIA_KalomsGuard_PERM_13_00 " );	// STOP! What are you doing?
	AI_Output(other,self, " DIA_KalomsGuard_PERM_15_00 " );	// Think you won't mind if I drop by?
	AI_Output(self,other, " DIA_KalomsGuard_PERM_13_01 " );	// If you disrespect my lord, I will kill you.
	AI_StopProcessInfos(self);
};

