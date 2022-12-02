

instance DIA_Marcos_EXIT(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 999;
	condition = DIA_Marcos_EXIT_Condition;
	information = DIA_Marcos_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marcos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Marcos_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marcos_Hallo (C_Info)
{
	npc = PAL_217_Marcos;
	nr = 2;
	condition = DIA_Marcos_Hallo_Condition;
	information = DIA_Marcos_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Marcos_Hallo_Condition()
{
	if (chapter ==  2 )
	{
		return TRUE;
	};
};

func void DAY_Marcos_Hallo_Info()
{
	AI_Output(self,other, " DIA_Marcos_Hallo_04_00 " );	// STOP - in the name of Innos! I am Marcos, paladin of the king. Say what you need and tell the truth!

	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self, " DIA_Marcos_Hallo_15_01 " );	// The Chosen One of Innos always speaks the truth.
		AI_Output(self,other, " DIA_Marcos_Hallo_04_02 " );	// Please forgive me, oh reverend magician. I did not immediately understand who I was talking to.
		AI_Output(other,self, " DIA_Marcos_Hallo_15_03 " );	// Yes, nothing, everything is fine.
		AI_Output(self,other, " DIA_Marcos_Hallo_04_04 " );	// If I may ask, what brings you here?
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(other,self, " DIA_Marcos_Hallo_15_05 " );	// Relax, I'm in the service of Lord Hagen.
		AI_Output(self,other, " DIA_Marcos_Hallo_04_06 " );	// You are one of his people. What tasks brought you here?
	}
	else if(other.guild == GIL_SLD)
	{
		AI_Output(other,self, " DIA_Marcos_Hallo_15_07 " );	// Relax, we work for the same master - Lord Hagen.
		AI_Output(self,other, " DIA_Marcos_Hallo_04_08 " );	// Since when did Lord Hagen start hiring mercenaries? Say what you need here!
	}
	else
	{
		AI_Output(other,self, " DIA_Marcos_Hallo_15_07 " );	// Relax, we work for the same master - Lord Hagen.
		AI_Output(self,other, " DIA_Marcos_Hallo_04_08 " );	// Since when did Lord Hagen start hiring mercenaries? Say what you need here!
	};
};


instance DIA_Marcos_Hagen (C_Info)
{
	npc = PAL_217_Marcos;
	nr = 2;
	condition = DIA_Marcos_Hagen_Condition;
	information = DIA_Marcos_Hagen_Info;
	permanent = FALSE;
	description = " I must deliver proof of dragons to Lord Hagen. " ;
};


func int DIA_Marcos_Hagen_Condition()
{
	if ((Kapitel ==  2 ) && (Garond.aivar[AIV_TalkedToPlayer] ==  FALSE ))
	{
		return TRUE;
	};
};

func void DAY_Marcos_Hagen_Info()
{
	AI_Output(other,self, " DIA_Marcos_Hagen_15_00 " );	// I have to deliver proof of dragons to Lord Hagen.
	AI_Output(self,other, " DIA_Marcos_Hagen_04_01 " );	// Then you shouldn't waste your time risking your life for nothing.
	AI_Output(self,other, " DIA_Marcos_Hagen_04_02 " );	// Do you think you can find a dragon scale here and take it to him?
	AI_Output(self,other, " DIA_Marcos_Hagen_04_03 " );	// Try to get to the castle and talk to Commander Garond.
	AI_Output(self,other, " DIA_Marcos_Hagen_04_04 " );	// He needs to know you're on a mission for Lord Hagen! He will find a way to help you.
};


instance DIA_Marcos_Garond (C_Info)
{
	npc = PAL_217_Marcos;
	nr = 2;
	condition = DIA_Marcos_Garond_Condition;
	information = DIA_Marcos_Garond_Info;
	permanent = FALSE;
	description = " I come from Garond. " ;
};


func int DIA_Marcos_Garond_Condition()
{
	if ((Chapter ==  2 ) && ( MY_OLDWORLD  == LOG_Running))
	{
		return TRUE;
	};
};

func void DAY_Marcos_Garond_Info()
{
	AI_Output(other,self, " DIA_Marcos_Garond_15_00 " );	// I've come from Garond - he wants to know how much ore is ready for transport.
	AI_Output(self,other, " DIA_Marcos_Garond_04_01 " );	// Tell Garond I had to leave the mine because the orc attacks became too frequent.
	AI_Output(self,other, " DIA_Marcos_Garond_04_02 " );	// I tried to get to the castle with the remaining people, but in the end I was the only one left alive.
	AI_Output(self,other, " DIA_Marcos_Garond_04_03 " );	// I hid the ore in a safe place. There are FOUR boxes. Go to Garond and report to him about it.
	AI_Output(self,other, " DIA_Marcos_Garond_04_04 " );	// Tell him I'll guard the ore as long as I live. But I don't know how long it will be before the orcs find me here.
	AI_Output(self,other, " DIA_Marcos_Garond_04_05 " );	// Tell him to send reinforcements.
	AI_Output(other,self, " DIA_Marcos_Garond_15_06 " );	// I'll let him know.
	B_LogEntry(TOPIC_ScoutMine, " Paladin Marcos is guarding FOUR crates in a small valley. " );
	Log_CreateTopic(Topic_MarcosJungs,LOG_MISSION);
	Log_SetTopicStatus(Topic_MarcosJungs,LOG_Running);
	B_LogEntry_Quiet(Topic_MarcosJungs, " Marcos wants Garond to send help. " );
	MIS_Marcos_Jungs = LOG_Running;
	Marcos_Ore = TRUE;
	self.flags = 0;
};


instance DIA_Marcos_Perm(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 9;
	condition = DIA_Marcos_Perm_Condition;
	information = DIA_Marcos_Perm_Info;
	permanent = TRUE;
	description = " How are things? " ;
};


func int DIA_Marcos_Perm_Condition()
{
	if ((Capital >=  2 ) && (Npc_KnowsInfo(other, DIA_Marcos_Hagen) || Npc_KnowsInfo(other, DIA_Marcos_Garond)))
	{
		return TRUE;
	};
};

func void DIA_Marcos_Perm_Info()
{
	AI_Output(other,self, " DIA_Marcos_Perm_15_00 " );	// How are things?
	if ( KAPITELORCATC  ==  TRUE )
	{
		AI_Output(self,other, " DIA_Marcos_Perm_04_04 " );	// I will survive, because Innos is with me!
		AI_StopProcessInfos(self);
	};
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self,other, " DIA_Marcos_Perm_04_01 " );	// I really need healing potions!
		B_UseItem(self,ItPo_Health_03);
	}
	else if(MIS_Marcos_Jungs == LOG_Running)
	{
		AI_Output(self,other, " DIA_Marcos_Perm_04_02 " );	// I'll hold out, and I hope Garond sends reinforcements soon.
	}
	else if(MIS_Marcos_Jungs == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Marcos_Perm_04_03 " );	// Thank you for your help. Innos will give us strength and help us to hold out.
		if (Marcos_unique ==  FALSE )
		{
			B_GivePlayerXP(XP_Marcos_Jungs);
			Marcos_unique = TRUE ;
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Marcos_Perm_04_04 " );	// I will survive, because Innos is with me!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Marcos_PICKPOCKET(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 900;
	condition = DIA_Marcos_PICKPOCKET_Condition;
	information = DIA_Marcos_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Marcos_PICKPOCKET_Condition()
{
	return  C_Robbery ( 65 , 380 );
};

func void DIA_Marcos_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Marcos_PICKPOCKET);
	Info_AddChoice(DIA_Marcos_PICKPOCKET,Dialog_Back,DIA_Marcos_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Marcos_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Marcos_PICKPOCKET_DoIt);
};

func void DIA_Marcos_PICKPOCKET_DoIt()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Marcos_PICKPOCKET);
};

func void DIA_Marcos_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Marcos_PICKPOCKET);
};


instance DIA_MARCOS_LEADER(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 3;
	condition = dia_marcos_leader_condition;
	information = dia_marcos_leader_info;
	permanent = FALSE;
	description = " Who is in charge now? " ;
};


func int dia_marcos_leader_condition()
{
	if (( CAPITELORCATC  ==  TRUE ) && ( PALADINCASTELFREE  ==  FALSE ) && ( COMMANDPALOW  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_marcos_leader_info()
{
	AI_Output(other,self, " DIA_Marcos_Leader_01_00 " );	// Who is in charge now?
	AI_Output(self,other, " DIA_Marcos_Leader_01_01 " );	// Our squad is now led by the paladin Nathan, since he is the most senior of us in rank.
	AI_Output(self,other, " DIA_Marcos_Leader_01_02 " );	// So, if anything - all questions to him!
	AI_Output(other,self,"DIA_Marcos_Leader_01_03");	//Ясно.
	COMMANDPALOW = TRUE;
};

