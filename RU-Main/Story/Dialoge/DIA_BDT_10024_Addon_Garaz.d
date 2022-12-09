
instance DIA_Addon_Garaz_EXIT(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 999;
	condition = DIA_Addon_Garaz_EXIT_Condition;
	information = DIA_Addon_Garaz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Garaz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garaz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Addon_Garaz_PICKPOCKET (C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 900;
	condition = DIA_Addon_Garaz_PICKPOCKET_Condition;
	information = DIA_Addon_Garaz_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Garaz_PICKPOCKET_Condition()
{
	return  C_Robbery ( 66 , 80 );
};

func void DIA_Addon_Garaz_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Garaz_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Garaz_PICKPOCKET,Dialog_Back,DIA_Addon_Garaz_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Garaz_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Addon_Garaz_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garaz_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Garaz_PICKPOCKET);
};

func void DIA_Addon_Garaz_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Garaz_PICKPOCKET);
};


instances DIA_Addon_Garaz_Probleme (C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 2;
	condition = DIA_Addon_Garaz_Probleme_Condition;
	information = DIA_Addon_Garaz_Problems_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Garaz_Probleme_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garaz_Probleme_Info()
{
	AI_Output(self,other, " DIA_Addon_Garaz_Probleme_08_00 " );	// Wait a minute.
	AI_Output(other,self, " DIA_Addon_Garaz_Probleme_15_01 " );	// Problems?
	AI_Output(self,other, " DIA_Addon_Garaz_Probleme_08_02 " );	// Crawlers! Lots of crawlers. We tunneled into a fucking nest!
};


instances of DIA_Addon_Garaz_Hi (C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Hi_Condition;
	information = DIA_Addon_Garaz_Hi_Info;
	permanent = FALSE;
	description = " Why can't we attack them? " ;
};


func int DIA_Addon_Garaz_Hi_Condition()
{
	if((BLOODWYNISDEAD == FALSE) && (Minecrawler_Killed < 9))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Hi_Info()
{
	AI_Output(other,self, " DIA_Addon_Garaz_Hi_15_00 " );	// Why can't we attack them?
	AI_Output(self,other, " DIA_Addon_Garaz_Hi_08_01 " );	// I asked about that too. But the guards have 'more important things to do'.
	AI_Output(self,other, " DIA_Addon_Garaz_Hi_08_02 " );	// Bloodwyn assigned me to deal with this problem.
	AI_Output(other,self, " DIA_Addon_Garaz_Hi_15_03 " );	// I assume you're not going to fight them.
	AI_Output(self,other, " DIA_Addon_Garaz_Hi_08_04 " );	// You assume right. Why should I die for other's gold?
	AI_Output(self,other, " DIA_Addon_Garaz_Hi_08_05 " );	// Bloodwyn will take most of it anyway. I don't want to risk my own head for my tiny share.
	AI_Output(self,other, " DIA_Addon_Garaz_Hi_08_06 " );	// If YOU want to fight the crawlers, don't think I'll stop you. Just don't lure them out here, okay?
};


instances of DIA_Addon_Garaz_Bloodwyn (C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 8;
	condition = DIA_Addon_Garaz_Bloodwyn_Condition;
	information = DIA_Addon_Garaz_Bloodwyn_Info;
	permanent = FALSE;
	description = " Can you tell me something about Bloodwyn? " ;
};


func int DIA_Addon_Garaz_Bloodwyn_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Garage_Hi ) && ( Minecrawler_Killed <  9 ) && ( BLOODWYNISDEAD  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Bloodwyn_Info()
{
	AI_Output(other,self, " DIA_Addon_Garaz_Bloodwyn_15_00 " );	// Can you tell me something about Bloodwyn?
	AI_Output(self,other, " DIA_Addon_Garaz_Bloodwyn_08_01 " );	// I can. He's a gold-hungry bastard. He checks every vein and every nugget.
	AI_Output(self,other, " DIA_Addon_Garaz_Bloodwyn_08_02 " );	// He can't control his lust for gold. And he doesn't give a shit about us.
	AI_Output(other,self, " DIA_Addon_Garaz_Bloodwyn_15_03 " );	// What else?
	AI_Output(self,other, " DIA_Addon_Garaz_Bloodwyn_08_04 " );	// He thinks he's the main man and can't stand it if anyone else has more money than him.
	AI_Output(self,other, " DIA_Addon_Garaz_Bloodwyn_08_05 " );	// Don't mess with him tho. The man is a berserker, a mindless beast when angered...
	B_LogEntry(Topic_Addon_Tempel, " If Bloodwin finds out that a new gold vein has been discovered in the mine, he will surely leave the temple. " );
	B_LogEntry(Topic_Addon_Tempel, " When Bloodwyn gets angry, he loses control of himself. That might help me. " );
};


instance DIA_Addon_Garaz_Sieg (C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Sieg_Condition;
	information = DIA_Addon_Garaz_Sieg_Info;
	permanent = FALSE;
	description = " The Crawlers are done with! " ;
};


func int DIA_Addon_Garaz_Sieg_Condition()
{
	if((Minecrawler_Killed >= 9) && (BLOODWYNISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Sieg_Info()
{
	AI_Output(other,self, " DIA_Addon_Garaz_Sieg_15_00 " );	// The crawlers are history.
	AI_Output(self,other, " DIA_Addon_Garaz_Sieg_08_01 " );	// Bloodwyn is on his way here. Is that what you wanted?
	AI_Output(self,other, " DIA_Addon_Garaz_Sieg_08_02 " );	// I mean you killed the crawlers to get Bloodwyn to come here, right? Then whatever you're planning, do it NOW.
	B_StartOtherRoutine(Bloodwyn,"GOLD");
};


instances of DIA_Addon_Garaz_Blood (C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Blood_Condition;
	information = DIA_Addon_Garaz_Blood_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Garaz_Blood_Condition()
{
	if((BLOODWYNISDEAD == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Blood_Info()
{
	AI_Output(self,other, " DIA_Addon_Garaz_Blood_08_00 " );	// You showed that bum! Great job.
	AI_Output(self,other, " DIA_Addon_Garaz_Blood_08_01 " );	// I'll go check out the cave.
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GOLD");
	B_StartOtherRoutine(Thorus,"TALK");
};


instances of DIA_Addon_Garaz_Gold (C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Gold_Condition;
	information = DIA_Addon_Garaz_Gold_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Garaz_Gold_Condition()
{
	if((Npc_GetDistToWP(self,"ADW_MINE_MC_GARAZ") <= 500) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Gold_Info()
{
	AI_Output(self,other, " DIA_Addon_Garaz_Gold_08_00 " );	// Wow, mate! There is obviously a motherlode of gold here!
	AI_Output(self,other, " DIA_Addon_Garaz_Gold_08_01 " );	// To get to these nuggets, we'll need a ladder.
};
