

instance DIA_Tengron_EXIT(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 999;
	condition = DIA_Tengron_EXIT_Condition;
	information = DIA_Tengron_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tengron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Tengron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tengron_First(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 2;
	condition = DIA_Tengron_First_Condition;
	information = DIA_Tengron_First_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Tengron_First_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ScoutMine != LOG_Running) && (MIS_ScoutMine != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Tengron_First_Info()
{
	AI_Output(self,other, " DIA_Tengron_First_07_00 " );	// What are you doing here?
	AI_Output(other,self, " DIA_Tengron_First_15_01 " );	// I'm here on Lord Hagen's orders.
	AI_Output(self,other, " DIA_Tengron_First_07_02 " );	// You absolutely need to get to the castle and talk to Commander Garond.
};


instance DIA_Tengron_HALLO (C_Info)
{
	npc = PAL_280_Tengron;
	nr = 2;
	condition = DIA_Tengron_HELLO_Condition;
	info = DIA_Tengron_HELLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Tengron_HELLO_Condition()
{
	if((Npc_IsInState(self,ZS_Talk) && (MIS_ScoutMine == LOG_Running)) || (MIS_ScoutMine == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DAY_Tengron_HALLO_Info()
{
	AI_Output(self,other, " DIA_Tengron_HALLO_07_00 " );	// May Innos be with you! Have you brought me news from the castle? Will reinforcements arrive soon?
	if (Npc_IsDead(Fajeth) ==  FALSE )
	{
		AI_Output(other,self, " DIA_Tengron_HALLO_15_01 " );	// I didn't come to bring news, but to receive it.
		AI_Output(self,other, " DIA_Tengron_HALLO_07_02 " );	// Then talk to Fudget. He is in command here. But if you have news from the castle, let me know.
	};
};


instance DIA_Tengron_News(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 7;
	condition = DIA_Tengron_News_Condition;
	information = DIA_Tengron_News_Info;
	permanent = FALSE;
	description = " About the news... " ;
};


func int DIA_Tengron_News_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Tengron_News_Info()
{
	AI_Output(other,self, " DIA_Tengron_News_15_00 " );	// About the news...
	AI_Output(self,other, " DIA_Tengron_News_07_01 " );	// Yes, how is it in the castle?
	AI_Output(other,self, " DIA_Tengron_News_15_02 " );	// Still besieged by orcs and still open to dragon attacks.
	AI_Output(self,other, " DIA_Tengron_News_07_03 " );	// Damn, I hope the guys still hold out.
	AI_Output(self,other, " DIA_Tengron_News_07_04 " );	// Look, I have a friend in the castle. His name is Beat. We have known each other for a long time and have been through a lot hand in hand.
	AI_Output(self,other, " DIA_Tengron_News_07_05 " );	// I want you to give him this ring. Let him keep it for me. Tell him I'll pick up the ring when I get back.
	Info_ClearChoices(DIA_Tengron_News);
	Info_AddChoice(DIA_Tengron_News, " I don't have time for this. " ,DIA_Tengron_News_No);
	Info_AddChoice(DIA_Tengron_News, " No problem. " ,DIA_Tengron_News_Yes);
};

func void DIA_Tengron_News_No()
{
	AI_Output(other,self, " DIA_Tengron_News_No_15_00 " );	// I don't have time for this.
	AI_Output(self,other, " DIA_Tengron_News_No_07_01 " );	// I understand.
	Info_ClearChoices(DIA_Tengron_News);
};

func void DIA_Tengron_News_Yes()
{
	AI_Output(other,self, " DIA_Tengron_News_Yes_15_00 " );	// No problem. When I'm in the castle, I'll give this ring to Strike.
	AI_Output(self,other, " DIA_Tengron_News_Yes_07_01 " );	// Good. The magic of this ring will give the Strike power. And don't forget to tell him I'll pick him up later.
	B_GiveInvItems(self,other,ItRi_Tengron,1);
	Info_ClearChoices(DIA_Tengron_News);
	Log_CreateTopic(Topic_TengronRing,LOG_MISSION);
	Log_SetTopicStatus(Topic_TengronRing,LOG_Running);
	B_LogEntry(Topic_TengronRing, " Tengron has given me a ring that I must give to Kick in the castle. " );
};


instance DIA_Tengron_Situation(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 70;
	condition = DIA_Tengron_Situation_Condition;
	info = DIA_Tengron_Situation_Info;
	permanent = TRUE;
	description = " How are things? " ;
};


func int DIA_Tengron_Situation_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Tengron_Situation_Info()
{
	AI_Output(other,self, " DIA_Tengron_Situation_15_00 " );	// How are things?
	AI_Output(self,other, " DIA_Tengron_Situation_07_01 " );	// We're surrounded by monsters, and we've managed to mine very little ore. In addition, we have lost a lot of good people.
	AI_Output(self,other, " DIA_Tengron_Situation_07_02 " );	// I don't know how long we'll hold on, but we won't just give up!
};


instance DIA_Tengron_HELP(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 9;
	condition = DIA_Tengron_HELP_Condition;
	info = DIA_Tengron_HELP_Info;
	permanent = FALSE;
	description = " I need your help. " ;
};


func int DIA_Tengron_HELP_Condition()
{
	if((MIS_Fajeth_Kill_Snapper == LOG_Running) && Npc_KnowsInfo(other,DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Tengron_HELP_Info()
{
	AI_Output(other,self, " DIA_Tengron_HELP_15_00 " );	// I need your help. Fudget wants me to kill the Snappers and...
	AI_Output(self,other, " DIA_Tengron_HELP_07_01 " );	// I ONLY follow Fudge's orders. And I've been ordered to guard the mine. This is exactly what I do.
	AI_Output(self,other, " DIA_Tengron_HELP_07_02 " );	// Maybe someone else can help you.
};


instance DIA_Tengron_PICKPOCKET(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 900;
	condition = DIA_Tengron_PICKPOCKET_Condition;
	info = DIA_Tengron_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Tengron_PICKPOCKET_Condition()
{
	return  C_Robbery ( 32 , 50 );
};

func void DIA_Tengron_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Tengron_PICKPOCKET);
	Info_AddChoice(DIA_Tengron_PICKPOCKET,Dialog_Back,DIA_Tengron_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Tengron_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Tengron_PICKPOCKET_DoIt);
};

func void DIA_Tengron_PICKPOCKET_DoIt()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Tengron_PICKPOCKET);
};

func void DIA_Tengron_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Tengron_PICKPOCKET);
};

