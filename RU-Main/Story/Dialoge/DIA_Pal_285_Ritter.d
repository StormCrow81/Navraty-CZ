

instance DIA_PAL_285_EXIT(C_Info)
{
	npc = Pal_285_Ritter;
	nr = 999;
	condition = dia_pal_285_exit_condition;
	information = dia_pal_285_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_285_exit_condition()
{
	return TRUE;
};

func void dia_pal_285_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_285_PASS(C_Info)
{
	npc = Pal_285_Ritter;
	nr = 2;
	condition = dia_pal_285_pass_condition;
	information = dia_pal_285_pass_info;
	permanent = TRUE;
	description = " Working out? " ;
};


func int dia_pal_285_pass_condition()
{
	if (chapter <  4 )
	{
		return TRUE;
	};
};

func void dia_pal_285_pass_info()
{
	AI_Output(other,self, " DIA_PAL_285_Pass_15_00 " );	// Working out?
	AI_Output(self,other, " DIA_PAL_285_Pass_09_01 " );	// Of course! And you make me feel bad about it!
	AI_StopProcessInfos(self);
};


instance DIA_PAL_285_PERM(C_Info)
{
	npc = Pal_285_Ritter;
	nr = 3;
	condition = dia_pal_285_perm_condition;
	information = dia_pal_285_perm_info;
	permanent = TRUE;
	description = " How are things? " ;
};


func int dia_pal_285_perm_condition()
{
	if (Chapter >=  4 )
	{
		return TRUE;
	};
};

func void dia_pal_285_perm_info()
{
	AI_Output(other,self, " DIA_PAL_298_Perm2_15_00 " );	// How are things?
	AI_Output(self,other, " DIA_PAL_298_Perm2_09_01 " );	// Everything is calm.
};

