

instance DIA_PAL_2510_ORIC_EXIT(C_Info)
{
	npc = pal_2510_oric;
	nr = 999;
	condition = dia_pal_2510_oric_exit_condition;
	information = dia_pal_2510_oric_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2510_oric_exit_condition()
{
	return TRUE;
};

func void dia_pal_2510_oric_exit_info()
{
	AI_StopProcessInfos(self);
};


var int oricnewsnw;

instance DIA_PAL_2510_ORIC_PERM(C_Info)
{
	npc = pal_2510_oric;
	nr = 9;
	condition = dia_pal_2510_oric_perm_condition;
	information = dia_pal_2510_oric_perm_info;
	permanent = TRUE;
	description = " Any news? " ;
};


func int dia_pal_2510_oric_perm_condition()
{
	return TRUE;
};

func void dia_pal_2510_oric_perm_info()
{
	if(ORICNEWSNW == FALSE)
	{
		AI_Output(other,self, " DIA_PAL_2510_Oric_Perm_01_00 " );	// Any news?
		AI_Output(self,other, " DIA_PAL_2510_Oric_Perm_01_01 " );	// Eh, boy... (smiles) So far, the only good news is that we're still alive!
		AI_Output(self,other, " DIA_PAL_2510_Oric_Perm_01_02 " );	// To be honest, I didn't think we'd be able to get out of that valley.
		AI_Output(other,self, " DIA_PAL_2510_Oric_Perm_01_03 " );	// But as you can see, it happened.
		AI_Output(self,other, " DIA_PAL_2510_Oric_Perm_01_04 " );	// Well, yes, so far we're lucky! Let's hope that luck will not leave us in the future.
		AI_Output(other,self,"DIA_PAL_2510_Oric_Perm_01_05");	//Само собой.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_2510_Oric_Perm_01_06");	//Пока нет.
	};
};

