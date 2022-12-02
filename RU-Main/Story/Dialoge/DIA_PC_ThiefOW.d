

instance DIA_DiegoOw_EXIT(C_Info)
{
	npc = PC_ThiefOW;
	nr = 999;
	condition = DIA_DiegoOw_EXIT_Condition;
	information = DIA_DiegoOw_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_DiegoOw_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DiegoOw_Hello (C_Info)
{
	npc = PC_ThiefOW;
	nr = 1;
	condition = DIA_DiegoOw_Hallo_Condition;
	information = DIA_DiegoOw_Hello_Info;
	important = TRUE;
};


func int DIA_DiegoOw_Hallo_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Hallo_Info()
{
	AI_Output(self,other, " DIA_DiegoOw_Hallo_11_00 " );	// Hey, I thought you were dead.
	AI_Output(other,self, " DIA_DiegoOw_Hallo_15_01 " );	// Yes... it was.
	AI_Output(other,self, " DIA_DiegoOw_Hallo_15_02 " );	// But now I'm back, looking for evidence of dragons.
	AI_Output(self,other, " DIA_DiegoOw_Hallo_11_03 " );	// Who are you doing this for?
	AI_Output(other,self, " DIA_DiegoOw_Hallo_15_04 " );	// I work for Lord Hagen. With the help of paladins, dragons can be stopped.
	AI_Output(self,other, " DIA_DiegoOw_Hallo_11_05 " );	// Paladins? Let me tell you something. After I managed to escape from here, I went to Khorinis.
	AI_Output(self,other, " DIA_DiegoOw_Hallo_11_06 " );	// I wanted to warn paladins about dragons. I don't know why I needed it.
	AI_Output(self,other, " DIA_DiegoOw_Hallo_11_07 " );	// That pompous Lothar didn't even listen to me - and certainly wouldn't let me talk to Lord Hagen.
	AI_Output(self,other, " DIA_DiegoOw_Hallo_11_08 " );	// Instead, they sent me back with an expedition. So don't remind me of paladins...
	AI_Output(other,self, " DIA_DiegoOw_Hallo_15_09 " );	// It's important to stop the dragons while we still have time - no matter who helps us do it.
	AI_Output(self,other, " DIA_DiegoOw_Hallo_11_10 " );	// Stop them? Yes, we need to get our feet out of this valley while we still have time for THAT.
	AI_Output(self,other, " DIA_DiegoOw_Silvestro_11_03 " );	// Tell me - how did you manage to get through the Passage? I thought it was full of orcs.
	AI_Output(other,self, " DIA_DiegoOw_Silvestro_15_04 " );	// There is a path through the abandoned mines, where there are no orcs.
	AI_Output(self,other, " DIA_DiegoOw_Silvestro_11_05 " );	// This is good news. Then I must go to Khorinis as soon as possible - I need to settle accounts with someone there.
};


instance DIA_DiegoOw_Beweis (C_Info)
{
	npc = PC_ThiefOW;
	nr = 2;
	condition = DIA_DiegoOw_Beweis_Condition;
	information = DIA_DiegoOw_Beweis_Info;
	description = " Look, I need proof. " ;
};


func int DIA_DiegoOw_Beweis_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Beweis_Info()
{
	AI_Output(other,self, " DIA_DiegoOw_Hallo_15_11 " );	// Look, I need proof.
	if(MIS_ScoutMine == LOG_Running)
	{
		AI_Output(self,other, " DIA_DiegoOw_Hallo_11_14 " );	// Okay, I'll help you in any way I can. But I won't risk my skin for no reason.
	}
	else
	{
		AI_Output(self,other, " DIA_DiegoOw_Hallo_11_12 " );	// Well, if that's your job, go talk to Commander Garond.
		AI_Output(self,other, " DIA_DiegoOw_Hallo_11_13 " );	// If anyone knows anything about dragon attacks, it's the guys from the castle.
	};
	if(MIS_ScoutMine == LOG_Running)
	{
		AI_Output(other,self, " DIA_DiegoOw_Garond_15_00 " );	// I'm here on behalf of Garond. He wants to know how much ore has been mined so far.
		AI_Output(self,other, " DIA_DiegoOw_Garond_11_01 " );	// And then he will give you evidence?
		AI_Output(other,self, " DIA_DiegoOw_Garond_15_02 " );	// Exactly. So - can you say something about this?
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_DiegoOw_Garond_11_01 " );	// When you're at the castle, you can tell Garond something that will be of great interest to him:
	};
	if(Npc_GetDistToWP(self,"LOCATION_02_05") <= 1000)
	{
		AI_Output(self,other, " DIA_DiegoOw_Silvestro_11_01 " );	// FOUR crates of ore are stored here at the back of the cave. They were obtained by the people of Silvestro.
		AI_Output(self,other, " DIA_DiegoOw_Silvestro_11_02 " );	// Garond may come and take them - but I won't be here by then.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_DiegoOw_Silvestro_11_01 " );	// There are FOUR crates of ore stored in a cave not far from where I hid. They were obtained by the people of Silvestro.
		AI_Output(self,other, " DIA_Addon_DiegoOw_Silvestro_11_02 " );	// Garond can come and get them.
	};
	Silvestro_Ore = TRUE;
	B_LogEntry(TOPIC_ScoutMine, " Diego moved FOUR crates of ore mined by Silvestro's miners to safety. " );
};


instance DIA_DiegoOw_Mine(C_Info)
{
	npc = PC_ThiefOW;
	nr = 3;
	condition = DIA_DiegoOw_Mine_Condition;
	information = DIA_DiegoOw_Mine_Info;
	permanent = FALSE;
	description = " What is your relationship with ore? " ;
};


func int DIA_DiegoOw_Mine_Condition()
{
	if (Npc_KnowsInfo(other,DIA_DiegoOw_Beweise))
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Mine_Info()
{
	AI_Output(other,self, " DIA_DiegoOw_Mine_15_00 " );	// And what do you have to do with ore?
	AI_Output(self,other, " DIA_DiegoOw_Mine_11_01 " );	// I was with Silvestro's group. We had been mining ore for several days when Silvestro suddenly became nervous.
	AI_Output(self,other, " DIA_DiegoOw_Mine_11_02 " );	// He said we should move the ore to safety.
	AI_Output(self,other, " DIA_DiegoOw_Mine_11_03 " );	// Well, since I was going to shed anyway, I volunteered.
	AI_Output(self,other, " DIA_DiegoOw_Mine_11_04 " );	// And in this I was very lucky. Because soon the prospectors were attacked by crawlers. And none of them survived.
};


instance DIA_DiegoOw_Ritter(C_Info)
{
	npc = PC_ThiefOW;
	nr = 4;
	condition = DIA_DiegoOw_Ritter_Condition;
	information = DIA_DiegoOw_Ritter_Info;
	permanent = FALSE;
	description = " What about those two dead knights. " ;
};


func int DIA_DiegoOw_Ritter_Condition()
{
	if ((Npc_HasItems(PAL_Leiche4,ItMi_OldCoin) ==  0 ) || (Npc_HasItems(PAL_Leiche5,ItMi_OldCoin) ==  0 ))
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Ritter_Info()
{
	AI_Output(other,self, " DIA_DiegoOw_Ritter_15_00 " );	// What about those two dead knights in front of your hideout?
	AI_Output(self,other, " DIA_DiegoOw_Ritter_11_01 " );	// They found their destiny while fighting a pack of Snappers.
	AI_Output(self,other, " DIA_DiegoOw_Ritter_11_02 " );	// Yeah, the Valley of Mines has its own rules. I told them this. But they didn't listen to me.
};


instance DIA_DiegoOw_Perm(C_Info)
{
	npc = PC_ThiefOW;
	nr = 5;
	condition = DIA_DiegoOw_Perm_Condition;
	information = DIA_DiegoOw_Perm_Info;
	permanent = FALSE;
	description = " What do I need to know about the valley? " ;
};


func int DIA_DiegoOw_Perm_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Perm_Info()
{
	AI_Output(other,self, " DIA_DiegoOw_Perm_15_00 " );	// What do I need to know about the valley?
	AI_Output(self,other, " DIA_DiegoOw_Perm_11_01 " );	// A lot has changed here since the Barrier fell. Orcs now rule here.
	AI_Output(self,other, " DIA_DiegoOw_Perm_11_02 " );	// And we humans are now nothing more than fodder for the true rulers of this valley: the dragons.
	AI_Output(self,other, " DIA_DiegoOw_Perm_11_03 " );	// Stay away from anyone stronger than you - and avoid anything that looks like a dragon.
};


instance DIA_DiegoOw_Gorn(C_Info)
{
	npc = PC_ThiefOW;
	nr = 6;
	condition = DIA_DiegoOw_Gorn_Condition;
	information = DIA_DiegoOw_Gorn_Info;
	permanent = FALSE;
	description = " I want to buy Gorn's freedom. " ;
};


func int DIA_DiegoOw_Gorn_Condition()
{
	if(MIS_RescueGorn == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Gorn_Info()
{
	AI_Output(other,self, " DIA_DiegoOw_Gorn_15_00 " );	// I want to buy Gorn's freedom, but Garond asks for a thousand gold pieces.
	AI_Output(self,other, " DIA_DiegoOw_Gorn_11_01 " );	// Not a small amount! I have three hundred coins, you can take them. Find the rest yourself!
	B_GiveInvItems(self,other,ItMi_Gold,300);
	B_LogEntry(TOPIC_RescueGorn, " Diego paid three hundred gold pieces to free the Gorn. " );
};


var int Diego_BrandDEX;
var int Diego_BrandSTR;

instance DIA_DiegoOw_Teach(C_Info)
{
	npc = PC_ThiefOW;
	nr = 100;
	condition = DIA_DiegoOw_Teach_Condition;
	information = DIA_DiegoOw_Teach_Info;
	permanent = TRUE;
	description = " Can you teach me something? " ;
};


func int DIA_DiegoOw_Teach_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Teach_Info()
{
	AI_Output(other,self, " DIA_DiegoOw_Teach_15_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_Addon_DiegoOw_Teach_11_01 " );	// Of course. What do you want to know?
	Diego_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Diego_MerkeSTR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(DIA_DiegoOw_Teach);
	Info_AddChoice(DIA_DiegoOw_Teach,Dialog_Back,DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_DiegoOw_TEACHSTR_5);
};

func void DIA_DiegoOw_TEACH_BACK()
{
	if(other.attribute[ATR_DEXTERITY] > Diego_MerkeDEX)
	{
		AI_Output(self,other, " DIA_Addon_DiegoOw_Teach_11_02 " );	// You've already become more dexterous.
	};
	if(other.attribute[ATR_STRENGTH] > Diego_MerkeSTR)
	{
		AI_Output(self,other, " DIA_Addon_DiegoOw_Teach_11_03 " );	// Very good...(assessing) Your strength has increased!
	};
	Info_ClearChoices(DIA_DiegoOw_Teach);
};

func void DIA_DiegoOw_TEACHDEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(DIA_DiegoOw_Teach);
	Info_AddChoice(DIA_DiegoOw_Teach,Dialog_Back,DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_DiegoOw_TEACHSTR_5);
};

func void DIA_DiegoOw_TEACHDEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(DIA_DiegoOw_Teach);
	Info_AddChoice(DIA_DiegoOw_Teach,Dialog_Back,DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_DiegoOw_TEACHSTR_5);
};

func void DIA_DiegoOw_TEACHSTR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_DiegoOw_Teach);
	Info_AddChoice(DIA_DiegoOw_Teach,Dialog_Back,DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_DiegoOw_TEACHSTR_5);
};

func void DIA_DiegoOw_TEACHSTR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_DiegoOw_Teach);
	Info_AddChoice(DIA_DiegoOw_Teach,Dialog_Back,DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_DiegoOw_TEACHSTR_5);
};


instance DIA_ThiefOW_PICKPOCKET(C_Info)
{
	npc = PC_ThiefOW;
	nr = 900;
	condition = DIA_ThiefOW_PICKPOCKET_Condition;
	information = DIA_ThiefOW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_ThiefOW_PICKPOCKET_Condition()
{
	return  C_Robbery ( 120 , 600 );
};

func void DIA_ThiefOW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_ThiefOW_PICKPOCKET);
	Info_AddChoice(DIA_ThiefOW_PICKPOCKET,Dialog_Back,DIA_ThiefOW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_ThiefOW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_ThiefOW_PICKPOCKET_DoIt);
};

func void DIA_ThiefOW_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_ThiefOW_PICKPOCKET);
};

func void DIA_ThiefOW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_ThiefOW_PICKPOCKET);
};


instance DIA_Addon_ThiefOW_Together(C_Info)
{
	npc = PC_ThiefOW;
	nr = 11;
	condition = DIA_Addon_ThiefOW_Together_Condition;
	information = DIA_Addon_ThiefOW_Together_Info;
	description = " Let's go together. " ;
};

func int DIA_Addon_ThiefOW_Together_Condition()
{
	return TRUE;
};

func void DIA_Addon_ThiefOW_Together_Info()
{
	AI_Output(other,self, " DIA_Addon_Diego_Together_15_00 " );	// Let's go together.
	AI_Output(self,other, " DIA_Addon_Diego_Together_11_01 " );	// To the aisle? Why not...
	AI_Output(self,other, " DIA_Addon_Diego_Together_11_02 " );	// Go first! You are new from there.
	AI_Output(self,other, " DIA_Addon_Diego_Together_11_03 " );	// But don't even think about getting too close to the castle or the Orc Wall.
	AI_Output(self,other, " DIA_Addon_Diego_Together_11_04 " );	// Also, we should avoid paladin camps.
	AI_Output(self,other, " DIA_Addon_Diego_Together_11_05 " );	// I managed to escape from such a camp, and I'm not going back to the mines.
	AI_Output(self,other, " DIA_Addon_Diego_Together_11_06 " );	// And of course, we shouldn't get close to the dragons.
	AI_Output(self,other, " DIA_Addon_Diego_Together_11_07 " );	// Tell me when you're ready.
	MIS_DiegoTogether = LOG_Running;
	Log_CreateTopic(TOPIC_DiegoTogether,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DiegoTogether,LOG_Running);
	B_LogEntry(TOPIC_DiegoTogether, " I offered to take Diego to safety. He agreed! But he warned us to stay away from the castle and the ore mines. " );
};


instance DIA_Addon_ThiefOW_ComeOn(C_Info)
{
	npc = PC_ThiefOW;
	nr = 12;
	condition = DIA_Addon_ThiefOW_ComeOn_Condition;
	information = DIA_Addon_ThiefOW_ComeOn_Info;
	permanent = TRUE;
	description = " Come with me. " ;
};


func int DIA_Addon_ThiefOW_ComeOn_Condition()
{
	if ((self.aivar[ AIV_PARTYMEMBERS ] ==  FALSE ) && Npc_KnowsInfo(other,DIA_Addon_ThiefOW_Together) && (Diego_will_arrive ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_ComeOn_Info()
{
	AI_Output(other,self, " DIA_Addon_Diego_ComeOn_15_00 " );	// Come with me.
	if(C_DiegoTooFar(0))
	{
		AI_Output(self,other, " DIA_Addon_Diego_ComeOn_11_01 " );	// We're going the wrong way!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_ComeOn_11_02");	//Хорошо.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	};
};


instance DIA_Addon_ThiefOW_GoHome(C_Info)
{
	npc = PC_ThiefOW;
	nr = 13;
	condition = DIA_Addon_ThiefOW_GoHome_Condition;
	information = DIA_Addon_ThiefOW_GoHome_Info;
	permanent = TRUE;
	description = " Wait here! " ;
};


func int DIA_Addon_ThiefOW_GoHome_Condition()
{
	if (self.aivar[ AIV_PARTYMEMBER ] ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_GoHome_Info()
{
	AI_Output(other,self, " DIA_Addon_Diego_WarteHier_15_00 " );	// Wait here!
	if(Npc_GetDistToWP(self,"LOCATION_02_05") < 2000)
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_01");	//Ладно.
		AI_StopProcessInfos(self);
		self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
		Npc_ExchangeRoutine(self,"START");
	}
	else if(Npc_GetDistToWP(self,"DT_E1_04") < (1500 + 1000))
	{
		AI_Output(self,other, " DIA_Addon_Diego_GoHome_11_02 " );	// I'll wait outside by the tower.
		AI_StopProcessInfos(self);
		self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
		Npc_ExchangeRoutine(self,"XARDAS");
	}
	else if(Npc_GetDistToWP(self,"OW_NEWMINE_11") < (4000 + 1000))
	{
		AI_Output(self,other, " DIA_Addon_Diego_GoHome_11_03 " );	// I'll wait by the mine.
		AI_StopProcessInfos(self);
		self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
		Npc_ExchangeRoutine(self,"FAJETH");
	}
	else if(Npc_GetDistToWP(self,"OW_MINE3_OUT") < (1200 + 1000))
	{
		AI_Output(self,other, " DIA_Addon_Diego_GoHome_11_04 " );	// I'll wait in front of the mine.
		AI_StopProcessInfos(self);
		self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
		Npc_ExchangeRoutine(self,"SILVESTRO");
	}
	else if(Npc_GetDistToWP(self,"OW_PATH_266") < (3000 + 1000))
	{
		AI_Output(self,other, " DIA_Addon_Diego_GoHome_11_05 " );	// I'll wait nearby.
		AI_StopProcessInfos(self);
		self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
		Npc_ExchangeRoutine(self,"GRIMES");
	}
	else if(Npc_GetDistToWP(self,"LOCATION_02_05") < 15000)
	{
		AI_Output(self,other, " DIA_Addon_Diego_GoHome_11_06 " );	// No. I return to the cave.
		AI_Output(self,other, " DIA_Addon_Diego_GoHome_11_07 " );	// When you're done, come see me.
		AI_Output(self,other, " DIA_Addon_Diego_GoHome_11_08 " );	// But don't linger too long or I'll be back alone.
		AI_StopProcessInfos(self);
		self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
		Npc_ExchangeRoutine(self,"START");
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Diego_GoHome_11_09 " );	// You must be joking? Should we split up? Here?
		AI_Output(self,other, " DIA_Addon_Diego_GoHome_11_10 " );	// Only over my dead body!
		AI_Output(self,other, " DIA_Addon_Diego_GoHome_11_11 " );	// We're going to the passage immediately. And together.
	};
};

func void B_Addon_Diego_WillWaitOutside()
{
	AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_00 " );	// Go first and look around. I'll wait outside.
};

func void B_Addon_Diego_PassOtherDirection()
{
	AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_01 " );	// To get to the passage, we have to go in the other direction.
};


var int Diego_TooFarComment;
var int Diego_BurgVariation;
var int Diego_FajethVariation;
var int Diego_SilvestroVariation;
var int Diego_GrimesVariation;
var int Diego_XardasVariation;
var int Diego_IceVariation;

instance DIA_Addon_ThiefOW_TooFar(C_Info)
{
	npc = PC_ThiefOW;
	nr = 14;
	condition = DIA_Addon_ThiefOW_TooFar_Condition;
	information = DIA_Addon_ThiefOW_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_ThiefOW_TooFar_Condition()
{
	if (self.aivar[ AIV_PARTYMEMBER ] ==  TRUE )
	{
		if(C_DiegoTooFar(0))
		{
			if(Diego_TooFarComment == FALSE)
			{
				return TRUE;
			};
		}
		else
		{
			Diego_TooFarComment = FALSE;
		};
	};
	return  FALSE ;
};

func void DIA_Addon_ThiefOW_TooFar_Info()
{
	if ( C_DiegoTooFar ( 1000 ) ==  LOC_ANGAR )
	{
		AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_02 " );	// This old tomb reeks of horror.
		AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_03 " );	// It's better for us to bypass it.
	}
	else if(C_DiegoTooFar(1000) == LOC_ICE)
	{
		if(Diego_IceVariation == 0)
		{
			AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_04 " );	// This is the entrance to the former New Camp.
			AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_05 " );	// I'm sure a dragon has taken up residence there.
			B_Addon_Diego_PassOtherDirection();
			Diego_IceVariation = 1;
		}
		else
		{
			B_Addon_Diego_PassOtherDirection();
		};
	}
	else if(C_DiegoTooFar(1000) == LOC_SWAMP)
	{
		AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_06 " );	// This swamp ends in a dead end.
		AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_07 " );	// I wouldn't be surprised if a dragon might be waiting for us there.
		AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_08 " );	// Don't go there.
	}
	else if(C_DiegoTooFar(1000) == LOC_FIRE)
	{
		AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_09 " );	// If we keep climbing this mountain, we'll definitely run into a dragon.
		AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_10 " );	// But I would still like to get to Khorinis alive.
		AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_11 " );	// Let's go the other way.
	}
	else if(C_DiegoTooFar(1000) == LOC_LAKE)
	{
		AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_12 " );	// This road won't take us anywhere.
		AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_13 " );	// To get to the passage, we have to go in the other direction!
	}
	else  if ( C_DiegoTooFar ( 1000 ) ==  LOC_XARDAS )
	{
		if(Diego_XardasVariation == 0)
		{
			AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_14 " );	// This is the old tower of Xardas. He himself, of course, does not appear in it for a long time.
			AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_15 " );	// I'm sure there are unpleasant surprises waiting for us inside.
			B_Addon_Diego_WillWaitOutside();
			Diego_XardasVariation = 1;
		}
		else
		{
			B_Addon_Diego_WillWaitOutside();
			AI_StopProcessInfos(self);
			self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
			Npc_ExchangeRoutine(self,"XARDAS");
		};
	}
	else  if ( C_DiegoTooFar ( 1000 ) ==  LOC_FAJETHMINE )
	{
		if(Diego_FajethVariation == 0)
		{
			AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_16 " );	// This is Fudget's mine.
			AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_17 " );	// If you want to go there, don't count on me!
			Diego_FajethVariation = 1;
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_18 " );	// I intend to stay away from this mine!
		};
	}
	else if(C_DiegoTooFar(1000) == LOC_SILVESTROMINE)
	{
		if(Diego_SilvestroVariation == 0)
		{
			AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_19 " );	// This is the shaft I was placed in when I returned here with the other prisoners.
			AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_20 " );	// I'm sure there are no survivors left.
			B_Addon_Diego_WillWaitOutside();
			AI_Output(self,other, " DIA_Addon_Diego_TooFar_Add_11_20 " );	// But if you linger, I'll return to my hiding place.
			AI_Output(self,other, " DIA_Addon_Diego_TooFar_Add_11_21 " );	// Unless, of course, you want me to wait here for you.
			Diego_SilvestroVariation = 1;
		}
		else
		{
			B_Addon_Diego_WillWaitOutside();
			AI_StopProcessInfos(self);
			self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
			Npc_ExchangeRoutine(self,"SILVESTRO");
		};
	}
	else if(C_DiegoTooFar(1000) == LOC_GRIMESMINE)
	{
		if(Diego_GrimesVariation == 0)
		{
			AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_21 " );	// This is one of the new paladin mines.
			AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_22 " );	// I've never been there and don't intend to go there.
			Diego_GrimesVariation = 1;
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_23 " );	// Let's walk around it.
		};
	}
	else if(C_DiegoTooFar(1000) == LOC_BURG)
	{
		if(Diego_BurgVariation == 0)
		{
			AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_24 " );	// Are you tired of living? Stay away from the castle.
			Diego_BurgVariation = 1;
		}
		else if(Diego_BurgVariation == 1)
		{
			AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_25 " );	// Hey, are you even listening to me?! Don't go near the castle!
			Diego_BurgVariation = 2;
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_26 " );	// What do you not understand about the phrase 'don't come near the castle'?
			Diego_BurgVariation = 1;
		};
	}
	else if(C_DiegoTooFar(1000) == LOC_ORCBARRIER)
	{
		AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_27 " );	// We can't go there. The Orc Wall is too dangerous.
		AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_28 " );	// I think we'd better go west and move on the other side.
	}
	else if(C_DiegoTooFar(1000) == LOC_ORCBARRIER_FAR)
	{
		AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_29 " );	// If we keep moving in this direction, we'll hit the Orc Wall again.
		AI_Output(self,other, " DIA_Addon_Diego_TooFar_11_30 " );	// Let's go to the aisle!
	};
	Diego_TooFarComment = TRUE;
};

func void B_Diego_WirSindDa()
{
	AI_Output(self,other, " DIA_Addon_Diego_Angekommen_11_02 " );	// I'll do the rest of the way myself.
	AI_Output(self,other, " DIA_Addon_Diego_Angekommen_11_03 " );	// I need to do something before returning to Khorinis.
	AI_Output(self,other, " DIA_Addon_Diego_Angekommen_11_04 " );	// Thank you my friend. See you in the city.
	MIS_DiegoTogether = LOG_Success;
	Log_SetTopicStatus(TOPIC_DiegoTogether,LOG_Success);
	B_LogEntry(TOPIC_DiegoTogether, " I got Diego out! He'll do the rest of the way himself. " );
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"PASS");
	Diego_arrived = TRUE ;
};


instance DIA_Addon_ThiefOW_Arrived (C_Info)
{
	npc = PC_ThiefOW;
	nr = 1;
	condition = DIA_Addon_ThiefOW_Arrived_Condition;
	information = DIA_Addon_ThiefOW_Arrived_Info;
	important = TRUE;
};


func int DIA_Addon_ThiefOW_Arrived_Condition()
{
	if((Npc_GetDistToWP(self,"OW_VM_ENTRANCE") < 800) && (Diego_angekommen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_Arrived_Info()
{
	AI_Output(self,other, " DIA_Addon_Diego_Angekommen_11_01 " );	// This place...
	B_GivePlayerXP(500);
	B_Diego_WirSindDa();
};


instance DIA_Addon_ThiefOW_Nostalgie(C_Info)
{
	npc = PC_ThiefOW;
	nr = 1;
	condition = DIA_Addon_ThiefOW_Nostalgie_Condition;
	information = DIA_Addon_ThiefOW_Nostalgie_Info;
	important = TRUE;
};

func int DIA_Addon_ThiefOW_Nostalgie_Condition()
{
	if((Npc_GetDistToWP(self,"WP_INTRO14") < 2000) && (Diego_angekommen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_Nostalgie_Info()
{
	Snd_Play("LevelUp");
	B_GivePlayerXP(1000);
	NostalgiBonus = TRUE;
	AI_NoticePrint(3000,4098,NAME_Addon_NostalgieBonus);
	AI_Output(self,other, " DIA_Addon_Diego_Nostalgie_11_01 " );	// Remember back then?...
	AI_Output(self,other, " DIA_Addon_Diego_Nostalgie_11_02 " );	// When did we first meet?
	AI_Output(self,other, " DIA_Addon_Diego_Nostalgie_11_03 " );	// Seems like it was hundreds of years ago...
	AI_Output(self,other, " DIA_Addon_Diego_Nostalgie_11_04 " );	// There was something else in this place. Crap! I cant remember.
	AI_Output(self,other, " DIA_Addon_Diego_Nostalgie_11_05 " );	// Okay...
	B_Diego_WirSindDa();
};

instance DIA_Addon_ThiefOW_PERM(C_Info)
{
	npc = PC_ThiefOW;
	nr = 10;
	condition = DIA_Addon_ThiefOW_PERM_Condition;
	information = DIA_Addon_ThiefOW_PERM_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Addon_ThiefOW_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_DiegoOw_Perm) && Npc_KnowsInfo(other,DIA_Addon_ThiefOW_Together))
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Diego_PERM_15_00");	//Как дела?
	if(self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self,other, " DIA_Addon_Diego_PERM_11_01 " );	// I could use a healing potion. Do you have a bottle for me?
	}
	else  if ((DiegoOW.aivar[ AIV_PARTYMEMBER ] ==  FALSE ) && (Diego_arrived ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Addon_Diego_PERM_11_02 " );	// Tell me when you're ready.
	}
	else  if (Diego_arrived ==  TRUE )
	{
		AI_Output(self,other, " DIA_Addon_Diego_PERM_11_03 " );	// Good. I just need to get some rest.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_04");	//Хорошо.
	};
};

