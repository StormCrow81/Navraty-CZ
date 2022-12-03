

instance DIA_PAL_2170_MARCOS_EXIT(C_Info)
{
	npc = pal_2170_marcos;
	nr = 999;
	condition = dia_pal_2170_marcos_exit_condition;
	information = dia_pal_2170_marcos_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2170_marcos_exit_condition()
{
	return TRUE;
};

func void dia_pal_2170_marcos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2170_MARCOS_PERM(C_Info)
{
	npc = pal_2170_marcos;
	nr = 9;
	condition = dia_pal_2170_marcos_perm_condition;
	information = dia_pal_2170_marcos_perm_info;
	permanent = TRUE;
	description = " How are things? " ;
};


func int dia_pal_2170_marcos_perm_condition()
{
	return TRUE;
};

func void dia_pal_2170_marcos_perm_info()
{
	AI_Output(other,self, " DIA_PAL_2170_Marcos_Perm_01_00 " );	// How are things going?
	AI_Output(self,other, " DIA_PAL_2170_Marcos_Perm_01_01 " );	// You yourself see everything. To be honest, I never imagined that the orcs would get here so quickly.
	AI_Output(other,self, " DIA_PAL_2170_Marcos_Perm_01_02 " );	// Yeah. It's even more dangerous here now than in the Valley of Mines.
	AI_Output(self,other, " DIA_PAL_2170_Marcos_Perm_01_03 " );	// It just doesn't scare me that much. I'm used to looking death in the face. Innos is a witness!
	AI_Output(self,other, " DIA_PAL_2170_Marcos_Perm_01_04 " );	// (belligerently) Well, nothing! We'll show these vile creatures. In the end, victory will be ours!
	AI_Output(other,self, " DIA_PAL_2170_Marcos_Perm_01_05 " );	// Well, yes, of course.
};

