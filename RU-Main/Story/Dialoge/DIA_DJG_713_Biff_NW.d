
instance DIA_Biff_NW_EXIT(C_Info)
{
	npc = DJG_713_Biff_NW;
	nr = 999;
	condition = DIA_Biff_NW_EXIT_Condition;
	information = DIA_Biff_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Biff_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Biff_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Biff_NW_HAfen (C_Info)
{
	npc = DJG_713_Biff_NW;
	nr = 5;
	condition = DIA_Biff_NW_HAfen_Condition;
	information = DIA_Biff_NW_HAfen_Info;
	permanent = TRUE;
	description = " Good. Not long left. " ;
};


func int DIA_Biff_NW_HAfen_Condition()
{
	if(CAPITANORDERDIAWAY == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Biff_NW_HAfen_Info()
{
	AI_Output(other,self, " DIA_Biff_NW_HAfen_15_00 " );	// Good. Not long left.
	AI_Output(self,other, " DIA_Biff_NW_HAfen_07_01 " );	// I can't wait.
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Biff_NW_PICKPOCKET(C_Info)
{
	npc = DJG_713_Biff_NW;
	nr = 900;
	condition = DIA_Biff_NW_PICKPOCKET_Condition;
	information = DIA_Biff_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Biff_NW_PICKPOCKET_Condition()
{
	return  C_Robbery ( 92 , 250 );
};

func void DIA_Biff_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Biff_NW_PICKPOCKET);
	Info_AddChoice(DIA_Biff_NW_PICKPOCKET,Dialog_Back,DIA_Biff_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Biff_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Biff_NW_PICKPOCKET_DoIt);
};

func void DIA_Biff_NW_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Biff_NW_PICKPOCKET);
};

func void DIA_Biff_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Biff_NW_PICKPOCKET);
};


instance DIA_BIFF_NW_KAPITELORCATTACK(C_Info)
{
	npc = DJG_713_Biff_NW;
	nr = 1;
	condition = dia_biff_nw_kapitelorcattack_condition;
	information = dia_biff_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = " What are your plans? " ;
};


func int dia_biff_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (BIFFBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_biff_nw_kapitelorcattack_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Biff_NW_KapitelOrcAttack_01_00 " );	// What are your plans?
	AI_Output(self,other, " DIA_Biff_NW_KapitelOrcAttack_01_01 " );	// I can't say for sure yet. But I think that I will stay with those who decide to cut their way out of the city with an axe.
	AI_Output(other,self, " DIA_Biff_NW_KapitelOrcAttack_01_02 " );	// And it doesn't scare you?
	AI_Output(self,other, " DIA_Biff_NW_KapitelOrcAttack_01_03 " );	// If I was afraid, I wouldn't be a dragon hunter! And these creatures will be much more terrible than some orcs.
	AI_Output(other,self, " DIA_Biff_NW_KapitelOrcAttack_01_04 " );	// Okay, it's up to you. Then our paths diverge here for the time being.
	AI_Output(other,self, " DIA_Biff_NW_KapitelOrcAttack_01_05 " );	// But I hope we don't see each other for the last time.
	AI_Output(self,other, " DIA_Biff_NW_KapitelOrcAttack_01_06 " );	// It will be visible there.
	B_LogEntry( TOPIC_HELPCREW , " Biff stays with those who will break out of the city with a fight. I think he has a chance to stay alive. " );
	BIFFBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};
