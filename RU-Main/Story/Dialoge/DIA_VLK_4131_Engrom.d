

instance DIA_Engrom_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_EXIT_Condition;
	information = DIA_Engrom_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Engrom_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_HELLO (C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 5;
	condition = DIA_Engrom_HALLO_Condition;
	information = DIA_Engrom_HELLO_Info;
	description = " How are you? " ;
};


func int DIA_Engrom_HALLO_Condition()
{
	if (chapter <=  3 )
	{
		return TRUE;
	};
};

func void DIA_Engrom_HALLO_Info()
{
	AI_Output(other,self, " DIA_Engrom_HALLO_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Engrom_HALLO_12_01 " );	// Bad!
	AI_Output(other,self,"DIA_Engrom_HALLO_15_02");	//Ммм!
	AI_Output(self,other, " DIA_Engrom_HALLO_12_03 " );	// What else can I say? Day after day, all I see is this damn river.
	AI_Output(self,other, " DIA_Engrom_HALLO_12_04 " );	/ / Orcs dart on the left bank, bandits on the right, and every day I eat only sniff meat. I can't take it anymore!
};


instance DIA_Engrom_WhatAboutLeaving(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_WhatAboutLeaving_Condition;
	information = DIA_Engrom_WhatAboutLeaving_Info;
	description = " Have you thought about getting out of here? " ;
};


func int DIA_Engrom_WhatAboutLeaving_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Engrom_HELLO ) && ( Capital <=  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Engrom_WhatAboutLeaving_Info()
{
	AI_Output(other,self, " DIA_Engrom_WhatAboutLeaving_15_00 " );	// Have you thought about getting out of here?
	AI_Output(self,other, " DIA_Engrom_WhatAboutLeaving_12_01 " );	// Yes, of course. There are no problems with this.
	AI_Output(self,other, " DIA_Engrom_WhatAboutLeaving_12_02 " );	// First I need to cut my way through the hordes of orcs, greet all the other monsters, of which there are also many, and then sneak through the Passage!
	AI_Output(self,other, " DIA_Engrom_WhatAboutLeaving_12_03 " );	// What could be easier!
	AI_Output(other,self, " DIA_Engrom_WhatAboutLeaving_15_04 " );	// I came here.
	AI_Output(self,other, " DIA_Engrom_WhatAboutLeaving_12_05 " );	// Are you trying to tell me that you just walked through the Passage?
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_06");	//Ну, в общем да!
	AI_Output(self,other, " DIA_Engrom_WhatAboutLeaving_12_07 " );	// So you're in luck. While such a mess is going on around, I will not budge.
};


instance DIA_Engrom_Jagd (C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_Jagd_Condition;
	information = DIA_Engrom_Jagd_Info;
	permanent = TRUE;
	description = " How are you hunting? " ;
};

func int DIA_Engrom_Jagd_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Engrom_HELLO ) && ( Capital <=  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Engrom_Hunting_Info()
{
	B_WasMachtJagd();
	AI_Output(self,other, " DIA_Engrom_Jagd_12_01 " );	// Hunting is my only consolation. But I would like to see a normal target at least once in a while, and not these disgusting sniffs.
};


instance DIA_Engrom_KAP3_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP3_EXIT_Condition;
	information = DIA_Engrom_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_KAP4_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP4_EXIT_Condition;
	information = DIA_Engrom_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP4_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_B_NpcObsessedByDMT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 32;
	condition = DIA_Engrom_B_NpcObsessedByDMT_Condition;
	information = DIA_Engrom_B_NpcObsessedByDMT_Info;
	description = " Is everything okay? " ;
};


func int DIA_Engrom_B_NpcObsessedByDMT_Condition()
{
	if((NpcObsessedByDMT_Engrom == FALSE) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Engrom_B_NpcObsessedByDMT_Info()
{
	MIS_Tabin_LookForEngrom = LOG_SUCCESS;
	B_NpcObsessedByDMT(self);
};


instance DIA_Engrom_BESSEN(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 55;
	condition = DIA_Engrom_BESSEN_Condition;
	information = DIA_Engrom_BESSEN_Info;
	permanent = TRUE;
	description = " You are possessed by Evil. " ;
};


func int DIA_Engrom_BESSEN_Condition()
{
	if((NpcObsessedByDMT_Engrom == TRUE) && (NpcObsessedByDMT == FALSE) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Engrom_BESSEN_Info()
{
	AI_Output(other,self, " DIA_Engrom_BESSEN_15_00 " );	// You are possessed by Evil.
	AI_Output(other,self, " DIA_Engrom_BESSEN_15_01 " );	// Come on, I'll help you.
	AI_Output(self,other, " DIA_Engrom_BESSEN_12_02 " );	// (yells) Don't touch me!
	B_NpcClearObsessionByDMT(self);
	Npc_SetTarget(self,other);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	AI_StartState(self,ZS_Flee,0,"");
};


instance DIA_Engrom_KAP5_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP5_EXIT_Condition;
	information = DIA_Engrom_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_KAP6_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP6_EXIT_Condition;
	information = DIA_Engrom_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP6_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_PICKPOCKET(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 900;
	condition = DIA_Engrom_PICKPOCKET_Condition;
	information = DIA_Engrom_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Engrom_PICKPOCKET_Condition()
{
	return  C_Robbery ( 10 , 5 );
};

func void DIA_Engrom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Engrom_PICKPOCKET);
	Info_AddChoice(DIA_Engrom_PICKPOCKET,Dialog_Back,DIA_Engrom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Engrom_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Engrom_PICKPOCKET_DoIt);
};

func void DIA_Engrom_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Engrom_PICKPOCKET);
};

func void DIA_Engrom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Engrom_PICKPOCKET);
};

instance DIA_Engrom_Goblins(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_Goblins_Condition;
	information = DIA_Engrom_Goblins_Info;
	permanent = FALSE;
	description = " Something seems to be bothering you. " ;
};

func int DIA_Engrom_Goblins_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Engrom_HELLO ) && ( Capital <=  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Engrom_Goblins_Info()
{
	AI_Output(other,self, " DIA_Engrom_Goblins_01_01 " );	// Something seems to be bothering you.
	AI_Output(self,other, " DIA_Engrom_Goblins_01_02 " );	// It's all goblins! (nervously) Those damn goblins.
	AI_Output(other,self, " DIA_Engrom_Goblins_01_03 " );	// What are you talking about?
	AI_Output(self,other, " DIA_Engrom_Goblins_01_04 " );	// Buddy, I'm talking about those goblins that have taken up residence in the cave below us.
	AI_Output(self,other, " DIA_Engrom_Goblins_01_05 " );	// They drive me crazy more than all those crowds of orcs surrounding the castle!
	AI_Output(other,self, " DIA_Engrom_Goblins_01_06 " );	// And of course you would like to get rid of them?
	AI_Output(self,other, " DIA_Engrom_Goblins_01_07 " );	// Oh, that would be great! But...
	AI_Output(other,self, " DIA_Engrom_Goblins_01_08 " );	// What's the problem?!
	AI_Output(self,other, " DIA_Engrom_Goblins_01_09 " );	// Problem is, I just can't get to them!
	AI_Output(self,other, " DIA_Engrom_Goblins_01_10 " );	// I'm too afraid of heights to jump down, and going around is pure suicide.
	AI_Output(other,self, " DIA_Engrom_Goblins_01_11 " );	// I understand! That's why you prefer to just sit here and quietly go crazy.
	AI_Output(self,other, " DIA_Engrom_Goblins_01_12 " );	// Very funny. (sullenly) You just don't know how terrible screams come from that cave at night.
	AI_Output(self,other, " DIA_Engrom_Goblins_01_13 " );	// Otherwise, I wouldn't say that.
	AI_Output(other,self, " DIA_Engrom_Goblins_01_14 " );	// Okay! If I'm around, I'll be sure to meet your goblins.
	AI_Output(self,other, " DIA_Engrom_Goblins_01_15 " );	// Do yourself a favor! Believe me, I will not remain in debt ...
	MIS_EngromGoblins = LOG_Running;
	Log_CreateTopic(TOPIC_EngromGoblins,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_EngromGoblins,LOG_Running);
	B_LogEntry(TOPIC_EngromGoblins, " Hunter Engrom is driven mad by the goblins who have taken up residence in a nearby cave. He would appreciate it if I could remove the source of his annoyance... " );
};


instance DIA_Engrom_Goblins_Done(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_Goblins_Done_Condition;
	information = DIA_Engrom_Goblins_Done_Info;
	permanent = FALSE;
	description = " Your goblins won't bother you anymore. " ;
};

func int DIA_Engrom_Goblins_Done_Condition()
{
	if((MIS_EngromGoblins == LOG_Running) && (Npc_IsDead(Engrom_Goblin_01) == TRUE) && (Npc_IsDead(Engrom_Goblin_02) == TRUE) && (Npc_IsDead(Engrom_Goblin_03) == TRUE) && (Npc_IsDead(Engrom_Goblin_04) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Engrom_Goblins_Done_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Engrom_Goblins_Done_01_01 " );	// The goblins won't bother you anymore.
	AI_Output(self,other, " DIA_Engrom_Goblins_Done_01_02 " );	// Thank you, buddy. Finally, I can sleep peacefully!
	AI_Output(self,other, " DIA_Engrom_Goblins_Done_01_03 " );	// Here, take this mrakoris skin.
	B_GiveInvItems(self,other,ItAt_ShadowFur,1);
	AI_Output(self,other, " DIA_Engrom_Goblins_Done_01_04 " );	// That's all I can offer you as a reward.
	AI_Output(other,self, " DIA_Engrom_Goblins_Done_01_05 " );	// Everything is fine. This is enough.
	MIS_EngromGoblins = LOG_Success;
	Log_SetTopicStatus(TOPIC_EngromGoblins,LOG_Success);
	B_LogEntry(TOPIC_EngromGoblins, " I informed Engrom that the goblins were done for. As a thank you, he gave me an obscurant hide. " );
};
