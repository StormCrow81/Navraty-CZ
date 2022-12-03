

instance DIA_PAL_2520_PARCIVAL_EXIT(C_Info)
{
	npc = pal_2520_parcival;
	nr = 999;
	condition = dia_pal_2520_parcival_exit_condition;
	information = dia_pal_2520_parcival_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2520_parcival_exit_condition()
{
	return TRUE;
};

func void dia_pal_2520_parcival_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2520_PARCIVAL_PERM(C_Info)
{
	npc = pal_2520_parcival;
	nr = 9;
	condition = dia_pal_2520_parcival_perm_condition;
	information = dia_pal_2520_parcival_perm_info;
	permanent = TRUE;
	description = " What do you say? " ;
};


func int dia_pal_2520_parcival_perm_condition()
{
	return TRUE;
};

func void dia_pal_2520_parcival_perm_info()
{
	AI_Output(other,self, " DIA_PAL_2520_Parcival_Perm_01_00 " );	// What do you say?
	AI_Output(self,other, " DIA_PAL_2520_Parcival_Perm_01_01 " );	// What can I say?! It would be much better if there weren't so many orcs scurrying around.
	AI_Output(self,other, " DIA_PAL_2520_Parcival_Perm_01_02 " );	// Otherwise, they are already starting to get on my nerves... (viciously) No matter how much you kill them, more and more new creatures appear in the place of the dead!
	AI_Output(other,self, " DIA_PAL_2520_Parcival_Perm_01_03 " );	// What, the fighter's hand is tired of stabbing?
	AI_Output(self,other, " DIA_PAL_2520_Parcival_Perm_01_04 " );	// Ha...(maliciously) And you, then, are very smart here, right?
	AI_Output(self,other, " DIA_PAL_2520_Parcival_Perm_01_05 " );	// Don't worry, there's plenty of orcs for you too. Then let's see how your long tongue will help you!
	AI_Output(other,self, " DIA_PAL_2520_Parcival_Perm_01_06 " );	// I think I'll manage somehow.
	AI_Output(self,other,"DIA_PAL_2520_Parcival_Perm_01_07");	//Ну да, ну да...
	PERCIVALNWPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2520_PARCIVAL_FUCKOFF(C_Info)
{
	npc = pal_2520_parcival;
	nr = 10;
	condition = dia_pal_2520_parcival_fuckoff_condition;
	information = dia_pal_2520_parcival_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_2520_parcival_fuckoff_condition()
{
	if((PERCIVALNWPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_pal_2520_parcival_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

