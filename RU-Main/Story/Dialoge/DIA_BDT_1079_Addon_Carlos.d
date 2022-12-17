
instance DIA_Addon_Carlos_EXIT(C_Info)
{
	npc = BDT_1079_Addon_Carlos;
	nr = 999;
	condition = DIA_Addon_Carlos_EXIT_Condition;
	information = DIA_Addon_Carlos_EXIT_Info;
	permanent = TRUE;
	description = " See you later. " ;
};


func int DIA_Addon_Carlos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Carlos_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Carlos_PICKPOCKET(C_Info)
{
	npc = BDT_1079_Addon_Carlos;
	nr = 900;
	condition = DIA_Addon_Carlos_PICKPOCKET_Condition;
	information = DIA_Addon_Carlos_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Carlos_PICKPOCKET_Condition()
{
	return  C_Robbery ( 71 , 85 );
};

func void DIA_Addon_Carlos_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Carlos_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Carlos_PICKPOCKET,Dialog_Back,DIA_Addon_Carlos_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Carlos_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Carlos_PICKPOCKET_DoIt);
};

func void DIA_Addon_Carlos_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Carlos_PICKPOCKET);
};

func void DIA_Addon_Carlos_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Carlos_PICKPOCKET);
};


instance DIA_Addon_Carlos_HI (C_Info)
{
	npc = BDT_1079_Addon_Carlos;
	nr = 1;
	condition = DIA_Addon_Carlos_HI_Condition;
	information = DIA_Addon_Carlos_HI_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Carlos_HI_Condition()
{
	if (Npc_IsDead(Franco))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DAY_Addon_Carlos_HI_Info()
{
	AI_Output(self,other, " DIA_Addon_Carlos_HI_12_00 " );	// Hey, are you the guy that killed Franco?
	Info_ClearChoices(DIA_Addon_Carlos_HI);
	Info_AddChoice(DIA_Addon_Carlos_HI, " What? Me? " ,DIA_Addon_Carlos_HI_No);
	Info_AddChoice(DIA_Addon_Carlos_HI, " Yes, why do you ask? " ,DIA_Addon_Carlos_HI_Yes);
};

func void DIA_Addon_Carlos_HI_Yes()
{
	AI_Output(other,self, " DIA_Addon_Carlos_HI_Yes_15_00 " );	// Yes, why do you ask?
	AI_Output(self,other, " DIA_Addon_Carlos_HI_Yes_12_01 " );	// Because now I have to do his job. Just great, well done! Thanks a lot!
	Info_ClearChoices(DIA_Addon_Carlos_HI);
};

func void DAY_Addon_Carlos_HI_No()
{
	AI_Output(other,self,"DIA_Addon_Carlos_HI_No_15_00");	//What? Me?
	AI_Output(self,other, " DIA_Addon_Carlos_HI_No_12_01 " );	// Ah, nothing personal!
	Info_ClearChoices(DIA_Addon_Carlos_HI);
};


instance DIA_Addon_Carlos_Attentat(C_Info)
{
	npc = BDT_1079_Addon_Carlos;
	nr = 2;
	condition = DIA_Addon_Carlos_Attentat_Condition;
	information = DIA_Addon_Carlos_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Carlos_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Carlos_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other, " DIA_Addon_Carlos_Attentat_12_00 " );	// After the attacker was killed, Thorus ordered me to find a new man for the camp.
	if(Logan_Inside == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Carlos_Attentat_12_01 " );	// And Franco sent Logan.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Carlos_Attentat_12_02 " );	// And Franco sent a new guy.
	};
	AI_Output(self,other, " DIA_Addon_Carlos_Attentat_12_03 " );	// Hey, I'm just doing what Torus told me. I don't know anything about the attack itself.
};


instance DIA_Addon_Carlos_PERM(C_Info)
{
	npc = BDT_1079_Addon_Carlos;
	nr = 3;
	condition = DIA_Addon_Carlos_PERM_Condition;
	information = DIA_Addon_Carlos_PERM_Info;
	permanent = TRUE;
	description = " How do you like being a hunter commander? " ;
};


func int DIA_Addon_Carlos_PERM_Condition()
{
	return TRUE;
};

func void DIA_Addon_Carlos_PERM_Info()
{
	AI_Output(other,self, " DIA_Addon_Carlos_PERM_15_00 " );	// And how do you like being a hunter commander?
	AI_Output(self,other, " DIA_Addon_Carlos_PERM_12_00 " );	// Leave me alone!
	AI_StopProcessInfos(self);
};
