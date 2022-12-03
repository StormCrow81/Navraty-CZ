

instance DIA_BALOR_EXIT(C_Info)
{
	npc = sek_8038_balor;
	nr = 999;
	condition = dia_balor_exit_condition;
	information = dia_balor_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_balor_exit_condition()
{
	return TRUE;
};

func void dia_balor_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_balor_PICKPOCKET(C_Info)
{
	npc = sek_8038_balor;
	nr = 900;
	condition = dia_balor_PICKPOCKET_Condition;
	information = dia_balor_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_balor_PICKPOCKET_Condition()
{
	return C_Beklauen(20,43);
};

func void dia_balor_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_balor_PICKPOCKET);
	Info_AddChoice(dia_balor_PICKPOCKET,Dialog_Back,dia_balor_PICKPOCKET_BACK);
	Info_AddChoice(dia_balor_PICKPOCKET,DIALOG_PICKPOCKET,dia_balor_PICKPOCKET_DoIt);
};

func void dia_balor_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_balor_PICKPOCKET);
};

func void dia_balor_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_balor_PICKPOCKET);
};

instance DIA_BALOR_HALLO(C_Info)
{
	npc = sek_8038_balor;
	nr = 1;
	condition = dia_balor_hallo_condition;
	information = dia_balor_hallo_info;
	permanent = FALSE;
	description = "Привет! Я здесь новенький.";
};


func int dia_balor_hallo_condition()
{
	return TRUE;
};

func void dia_balor_hallo_info()
{
	AI_Output(other,self, " DIA_Balor_Hallo_15_00 " );	// Hello! I'm new here!
	AI_Output(self,other, " DIA_Balor_Hallo_13_01 " );	// I... I... I am Balor, disciple of the Idol of Tion. You've heard of him, haven't you?
	Info_ClearChoices(dia_balor_hallo);
	Info_AddChoice(dia_balor_hallo,"Нет.",dia_balor_hallo_nein);
	Info_AddChoice(dia_balor_hallo, " Да. " ,dia_balor_hallo_ja);
};

func void dia_balor_hallo_ja()
{
	AI_Output(other,self,"DIA_Balor_Hallo_Ja_15_00");	//А-га.
	AI_Output(self,other, " DIA_Balor_Hallo_Ja_13_01 " );	// Then you know that he is the second person in this Camp... t-after the Idol of Oran.
	Info_ClearChoices(dia_balor_hallo);
};

func void dia_balor_hello_no()
{
	AI_Output(other,self,"DIA_Balor_Hallo_Nein_15_00");	//Нет.
	AI_Output(self,other, " DIA_Balor_Hallo_Nein_13_01 " );	// No?! You're new here, right?
	AI_Output(self,other, " DIA_Balor_Hallo_Nein_13_02 " );	// The Idol of Tion in this Camp is the second person after the Idol of Oran.
	AI_Output(self,other, " DIA_Balor_Hallo_Nein_13_03 " );	// His voice decides a lot, especially in questions - who to accept to us and who not.
	Info_ClearChoices(dia_balor_hallo);
};


instance DIA_BALOR_JOB(C_Info)
{
	npc = sek_8038_balor;
	nr = 2;
	condition = dia_balor_job_condition;
	information = dia_balor_job_info;
	permanent = FALSE;
	description = " What do you do? " ;
};


func int dia_balor_job_condition()
{
	if(Npc_KnowsInfo(hero,dia_balor_hallo))
	{
		return TRUE;
	};
};

func void dia_balor_job_info()
{
	AI_Output(other,self, " DIA_Balor_Job_15_00 " );	// What are you doing?
	AI_Output(self,other, " DIA_Balor_Job_13_01 " );	// I... I... I help him prepare the potions.
	AI_Output(self,other, " DIA_Balor_Job_13_02 " );	// Basically b-swamp.
};


instance DIA_BALOR_ADDINFOKALOM(C_Info)
{
	npc = sek_8038_balor;
	nr = 2;
	condition = dia_balor_addinfokalom_condition;
	information = dia_balor_addinfokalom_info;
	permanent = TRUE;
	description = " What else can you say about your master? " ;
};


func int dia_balor_addinfokalom_condition()
{
	if(Npc_KnowsInfo(hero,dia_balor_job))
	{
		return TRUE;
	};
};

func void dia_balor_addinfokalom_info()
{
	AI_Output(other,self, " DIA_Balor_AddInfoKalom_15_00 " );	// What else can you say about your master?
	AI_Output(self,other, " DIA_Balor_AddInfoKalom_13_01 " );	// He... he is not like... like all Gurus. NO ONE is allowed to waste his precious time.
};


DIA_BALOR_SEKTEHEILEN (C_Info) instances
{
	npc = sek_8038_balor;
	nr = 1;
	condition = dia_balor_sekteheilen_condition;
	information = dia_balor_sekteheilen_info;
	permanent = FALSE;
	description = " Drink a drink! It helps with a headache. " ;
};


func int dia_balor_sekteheilen_condition()
{
	if ((Npc_HasItems(other,ItPo_Heal_Obsession_MY) >  0 ) && ( MY_SECTS_HEALTH  == LOG_Running) && Npc_KnowsInfo(hero, dia_heal_sectarian_obsession));
	{
		return TRUE;
	};
};

func void dia_balor_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Balor_SekteHeilen_01_00 " );	// Have a drink! It helps with headaches.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SECTEHEILENCOUNT = SECTEHEILENCOUNT  +  1 ;
	AI_Output(self,other, " DIA_Balor_SekteHeilen_01_01 " );	// M-my head n-passed!
	AI_Output(self,other, " DIA_Balor_SekteHeilen_01_02 " );	// Oh, how I b-thank you!
};

