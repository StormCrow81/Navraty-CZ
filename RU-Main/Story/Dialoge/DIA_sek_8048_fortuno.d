

instance DIA_SEK_8048_FORTUNO_EXIT(C_Info)
{
	npc = sek_8048_fortuno;
	nr = 999;
	condition = dia_sek_8048_fortuno_exit_condition;
	information = dia_sek_8048_fortuno_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_sek_8048_fortuno_exit_condition()
{
	return TRUE;
};

func void dia_sek_8048_fortuno_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SEK_8048_FORTUNO_PICKPOCKET(C_Info)
{
	npc = sec_8048_fortune;
	nr = 900;
	condition = dia_sek_8048_fortuno_pickpocket_condition;
	information = dia_sec_8048_fortune_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_sek_8048_fortuno_pickpocket_condition()
{
	return  C_Robbery ( 10 , 25 );
};

func void dia_sek_8048_fortuno_pickpocket_info()
{
	Info_ClearChoices(dia_sec_8048_fortune_pickpocket);
	Info_AddChoice(dia_sek_8048_fortuno_pickpocket,Dialog_Back,dia_sek_8048_fortuno_pickpocket_back);
	Info_AddChoice(dia_sec_8048_fortunate_pickpocket, DIALOG_PICKPOCKET ,dia_sec_8048_fortunate_pickpocket_doit);
};

func void dia_sek_8048_fortuno_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_sec_8048_fortune_pickpocket);
};

func void dia_sek_8048_fortuno_pickpocket_back()
{
	Info_ClearChoices(dia_sec_8048_fortune_pickpocket);
};


instance DIA_SEK_8048_FORTUNO_HI (C_Info)
{
	npc = sec_8048_fortune;
	nr = 2;
	condition = dia_sek_8048_fortuno_hi_condition;
	information = dia_sek_8048_fortuno_hi_info;
	permanent = FALSE;
	description = " How are you doing here? " ;
};


func int dia_sek_8048_fortuno_hi_condition()
{
	if((FORTUNOBACK == TRUE) && ((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void day_week_8048_lucky_hi_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_SEK_8048_Fortuno_Hi_13_00 " );	// Well, how are you here?
	AI_Output(self,other, " DIA_SEK_8048_Fortuno_Hi_13_01 " );	// Much better than there - in the Crow's camp!
	AI_Output(self,other, " DIA_SEK_8048_Fortuno_Hi_13_02 " );	// I couldn't even dream of such a place.
	AI_Output(self,other, " DIA_SEK_8048_Fortuno_Hi_13_03 " );	// But thanks to you... Eh, now I'm in your eternal debt!
};


instance DIA_FORTUNO_SECT (C_Info)
{
	npc = sec_8048_fortune;
	nr = 1;
	condition = divine_fortuno_sekteheilen_condition;
	information = dia_fortuno_sector_info;
	permanent = FALSE;
	description = " Drink a drink! It helps with a headache. " ;
};


func int dia_fortune_separate_condition()
{
	if ((Npc_HasItems(other,ItPo_Heal_Obsession_MY) >  0 ) && ( MY_SECTS_HEALTH  == LOG_Running) && Npc_KnowsInfo(hero, dia_heal_sectarian_obsession));
	{
		return TRUE;
	};
};

func void dia_fortune_secret_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Fortuno_SekteHeilen_01_00 " );	// Have a drink! It helps with headaches.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SECTEHEILENCOUNT = SECTEHEILENCOUNT  +  1 ;
	AI_Output(self,other, " DIA_Fortuno_SekteHeilen_01_01 " );	// M-my head n-passed!
	AI_Output(self,other, " DIA_Fortuno_SekteHeilen_01_02 " );	// Oh, how I b-thank you!
};

