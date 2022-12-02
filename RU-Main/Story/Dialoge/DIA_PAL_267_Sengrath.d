

instance DIA_Sengrath_EXIT(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 999;
	condition = DIA_Sengrath_EXIT_Condition;
	information = DIA_Sengrath_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sengrath_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sengrath_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sengrath_Hello(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 2;
	condition = DIA_Sengrath_Hello_Condition;
	information = DIA_Sengrath_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sengrath_Hello_Condition()
{
	return TRUE;
};

func void DIA_Sengrath_Hello_Info()
{
	AI_Output(self,other, " DIA_Sengrath_Hello_03_00 " );	// I knew! I knew someone could do it!
	AI_Output(self,other, " DIA_Sengrath_Hello_03_01 " );	// Did you pass through the Passage? And our envoy was able to get through?
	if (chapter ==  1 )
	{
		AI_Output(other,self, " DIA_Sengrath_Hello_15_03 " );	// No, your courier didn't.
	}
	else
	{
		AI_Output(other,self, " DIA_Sengrath_Hello_15_02 " );	// No, your envoy couldn't cross the passage. I have come by order of Lord Hagen.
	};
	AI_Output(self,other, " DIA_Sengrath_Hello_03_03 " );	// (growls) Damned orcs...
	AI_Output(self,other, " DIA_Sengrath_Hello_03_04 " );	// Well, Commander Garond will probably want to talk to you. You will find him in this large building guarded by two knights.
};


instance DIA_Sengrath_Equipment(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 2;
	condition = DIA_Sengrath_Equipment_Condition;
	information = DIA_Sengrath_Equipment_Info;
	permanent = FALSE;
	description = " Where can I find gear here? " ;
};


func int DIA_Sengrath_Equipment_Condition()
{
	return TRUE;
};

func void DIA_Sengrath_Equipment_Info()
{
	AI_Output(other,self, " DIA_Sengrath_Equipment_15_00 " );	// Where can I find gear here?
	AI_Output(self,other, " DIA_Sengrath_Equipment_03_01 " );	// Tandor handles weapons. Manager Engor is in charge of everything else.
	AI_Output(other,self, " DIA_Sengrath_Equipment_15_02 " );	// What about magic?
	AI_Output(self,other, " DIA_Sengrath_Equipment_03_03 " );	// We have spell scrolls. If you need one of these, let me know.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC, " Sengrat sells scrolls in the castle. " );
};


instance DIA_Sengrath_Perm(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 2;
	condition = DIA_Sengrath_Perm_Condition;
	information = DIA_Sengrath_Perm_Info;
	permanent = FALSE;
	description = " Who here can teach me something? " ;
};


func int DIA_Sengrath_Perm_Condition()
{
	return TRUE;
};

func void DIA_Sengrath_Perm_Info()
{
	AI_Output(other,self, " DIA_Sengrath_Perm_15_00 " );	// Who here can teach me something?

	if(((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR)) && (Kapitel <= 2))
	{
		AI_Output(self,other, " DIA_Sengrath_Perm_03_01 " );	// Talk to Milten - he's the only mage here.
	}
	else
	{
		AI_Output(self,other, " DIA_Sengrath_Perm_03_02 " );	// Ask Caroloth. He teaches the boys how to use the sword. Maybe he can teach you something too.
		Log_CreateTopic(TOPIC_Teacher_OC,LOG_NOTE);
		B_LogEntry(TOPIC_Teacher_OC, " Caroloth is training swordsmen at the castle. " );
	};
};


instance DIA_Sengrath_Scrolls(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 9;
	condition = DIA_Sengrath_Scrolls_Condition;
	information = DIA_Sengrath_Scrolls_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show me your scrolls. " ;
};


func int DIA_Sengrath_Scrolls_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sengrath_Equipment))
	{
		return TRUE;
	};
};

func void DIA_Sengrath_Scrolls_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	AI_Output(other,self, " DIA_Sengrath_Scrolls_15_00 " );	// Show me your scrolls.
	B_GiveTradeInv(self);
};


instance DIA_Sengrath_PICKPOCKET(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 900;
	condition = DIA_Sengrath_PICKPOCKET_Condition;
	information = DIA_Sengrath_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Sengrath_PICKPOCKET_Condition()
{
	return  C_Robbery ( 32 , 35 );
};

func void DIA_Sengrath_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sengrath_PICKPOCKET);
	Info_AddChoice(DIA_Sengrath_PICKPOCKET,Dialog_Back,DIA_Sengrath_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sengrath_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sengrath_PICKPOCKET_DoIt);
};

func void DIA_Sengrath_PICKPOCKET_DoIt()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Sengrath_PICKPOCKET);
};

func void DIA_Sengrath_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sengrath_PICKPOCKET);
};

