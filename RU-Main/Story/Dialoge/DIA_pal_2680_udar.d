

instance DIA_PAL_2680_UDAR_EXIT(C_Info)
{
	npc = pal_2680_udar;
	nr = 999;
	condition = dia_pal_2680_udar_exit_condition;
	information = dia_pal_2680_udar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2680_udar_exit_condition()
{
	return TRUE;
};

func void pal_day_2680_udar_exit_info()
{
	AI_StopProcessInfos(self);
};


instances DIA_PAL_2680_UDAR_TEACH (C_Info)
{
	npc = pal_2680_udr;
	nr = 3;
	condition = dia_pal_2680_udar_teach_condition;
	information = dia_pal_2680_udar_teach_info;
	permanent = TRUE;
	description = " I want to learn from you. " ;
};


func int dia_pal_2680_udar_teach_condition()
{
	if(Udar_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_2680_udar_teach_info()
{
	AI_Output(other,self, " DIA_Udar_Teach_15_00 " );	// I want to learn from you.
	AI_Output(self,other, " DIA_Udar_Teach_09_01 " );	// Okay, learn!
	Info_ClearChoices(DIA_PAL_2680_UDAR_TEACH);
	Info_AddChoice(dia_pal_2680_udar_teach,Dialog_Back,dia_pal_2680_udar_teach_back);
	Info_AddChoice(dia_pal_2680_udar_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_pal_2680_udar_teach_crossbow_1);
	Info_AddChoice(dia_pal_2680_udar_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_pal_2680_udar_teach_crossbow_5);
};

func void dia_pal_2680_udar_teach_back()
{
	Info_ClearChoices(DIA_PAL_2680_UDAR_TEACH);
};

func void dia_pal_2680_udar_teachnomore1()
{
	AI_Output(self,other, " B_Udar_TeachNoMore1_09_00 " );	// You already know the basics - we don't have time for more.
};

func void dia_pal_2680_udar_teachnomore2()
{
	AI_Output(self,other, " B_Udar_TeachNoMore2_09_00 " );	// To improve your skill with this weapon, you'd better look for a more suitable teacher.
};

func void dia_pal_2680_udar_teach_crossbow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,60);
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		dia_pal_2680_udar_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			dia_pal_2680_udar_teachnomore2();
		};
	};
	Info_AddChoice(dia_pal_2680_udar_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_pal_2680_udar_teach_crossbow_1);
};

func void dia_pal_2680_udar_teach_crossbow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,60);
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		dia_pal_2680_udar_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			dia_pal_2680_udar_teachnomore2();
		};
	};
	Info_AddChoice(dia_pal_2680_udar_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_pal_2680_udar_teach_crossbow_5);
};


instances DIA_PAL_2680_UDAR_PERM (C_Info)
{
	npc = pal_2680_udr;
	nr = 1;
	condition = dia_pal_2680_udar_perm_condition;
	information = dia_pal_2680_udar_perm_info;
	permanent = FALSE;
	description = " You look a little tired. " ;
};


func int dia_pal_2680_udar_perm_condition()
{
	return TRUE;
};

func void pal_day_2680_udar_perm_info()
{
	AI_Output(other,self, " DIA_PAL_2680_Udar_Perm_01_00 " );	// You look a little tired.
	AI_Output(self,other, " DIA_PAL_2680_Udar_Perm_01_01 " );	// Yes, there are some. The last skirmishes with the orcs completely exhausted me.
	AI_Output(self,other, " DIA_PAL_2680_Udar_Perm_01_02 " );	// But I try not to think about it, because we won't have a chance to take a break for a while.
};


instance DIA_PAL_2680_UDAR_NATAN (C_Info) .
{
	npc = pal_2680_udr;
	nr = 2;
	condition = dia_pal_2680_udar_natan_condition;
	information = dia_pal_2680_udar_natan_info;
	permanent = FALSE;
	description = " Have you spoken to Nathan yet? " ;
};


func int dia_pal_2680_previous_condition() .
{
	if(MIS_NATANDOLG == LOG_Running)
	{
		return TRUE;
	};
};

func void pal_day_2680_udar_natan_info()
{
	AI_Output(other,self, " DIA_PAL_2680_Udar_Natan_01_00 " );	// Have you spoken to Nathan yet?
	if (Npc_IsDead(pal_91680_natan))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_PAL_2680_Udar_Natan_01_01 " );	// As you can see, unfortunately I didn't have time to do it.
		AI_Output(self,other, " DIA_PAL_2680_Udar_Natan_01_02 " );	// Now he's dead, all because of this stupid debt of honor he swore to repay me at any cost.
		AI_Output(self,other, " DIA_PAL_2680_Udar_Natan_01_08 " );	// He did what he wanted. But the price was too high for him.
		AI_Output(self,other, " DIA_PAL_2680_Udar_Natan_01_09 " );	// (frustrated) And, unfortunately, I can't change anything anymore.
		AI_Output(other,self, " DIA_PAL_2680_Udar_Natan_01_10 " );	// I understand.
		MIS_NATANDOLG = LOG_FAILED ;
		B_LogEntry_Failed(TOPIC_NATANDOLG);
	}
	else
	{
		B_GivePlayerXP(200);
		AI_Output(self,other, " DIA_PAL_2680_Udar_Natan_01_11 " );	// As you can see, I haven't been up to it yet. (smiles) But don't worry, I'll definitely talk to him.
		AI_Output(self,other, " DIA_PAL_2680_Udar_Natan_01_12 " );	// He still managed to return his debt of honor to me. (chuckles)
		AI_Output(other,self, " DIA_PAL_2680_Udar_Natan_01_14 " );	// Yes, it is, but I don't think he thinks so himself.
		AI_Output(self,other, " DIA_PAL_2680_Udar_Natan_01_15 " );	// Eh...(frustrated) Does he really think he has to kill an orc army for me?
		AI_Output(other,self, " DIA_PAL_2680_Udar_Natan_01_17 " );	// Maybe I can help you convince him?
		AI_Output(self,other, " DIA_PAL_2680_Udar_Natan_01_18 " );	// Hmmm...(thoughtfully) I may have a really good idea here.
		AI_Output(other,self, " DIA_PAL_2680_Udar_Natan_01_20 " );	// And what did you think?
		AI_Output(self,other, " DIA_PAL_2680_Udar_Natan_01_21 " );	// I'm thinking of arranging things so that Nathan has an opportunity to save my life. And you could just help me with this.
		AI_Output(other,self, " DIA_PAL_2680_Udar_Natan_01_22 " );	// How?
		AI_Output(self,other, " DIA_PAL_2680_Udar_Natan_01_23 " );	// Hmmm...(thinking) I'll ambush a small group of orcs. And just to begin with, I will enter into battle with them.
		AI_Output(self,other, " DIA_PAL_2680_Udar_Natan_01_24 " );	// However, from the outside, everything will look a little different! It will seem that they themselves have driven me into a trap.
		AI_Output(self,other, " DIA_PAL_2680_Udar_Natan_01_25 " );	// At this point, you will have to appear with Nathan to help me.
		AI_Output(other,self, " DIA_PAL_2680_Udar_Natan_01_26 " );	// But that's dangerous as hell! Aren't you afraid that by the time we get to your rescue, it might be too late?
		AI_Output(self,other, " DIA_PAL_2680_Udar_Natan_01_27 " );	// Don't worry... (smiles) A ​​few orcs are not a problem for me at all.
		AI_Output(other,self, " DIA_PAL_2680_Udar_Natan_01_29 " );	// And you want eh to kill Nathan?
		AI_Output(self,other, " DIA_PAL_2680_Udar_Natan_01_30 " );	// That's right! This is my plan. So will you help me?
		AI_Output(other,self, " DIA_PAL_2680_Udar_Natan_01_31 " );	// Okay, agreed! Just mark the exact spot where you're going to set up this ambush.
		AI_Output(other,self, " DIA_PAL_2680_Udar_Natan_01_32 " );	// I won't run all over Khorinis looking for you.
		AI_Output(self,other, " DIA_PAL_2680_Udar_Natan_01_33 " );	// Hmmm, good question. I believe that a small woodland to the east of Orlan's tavern is quite suitable for this.
		AI_Output(self,other, " DIA_PAL_2680_Udar_Natan_01_34 " );	// There seems to be one small cave where you can hide. And the road that runs along this place is probably now occupied by orcs.
		AI_Output(self,other, " DIA_PAL_2680_Udar_Natan_01_37 " );	// I'll go there right now and wait for some small band of orcs to show up.
		AI_Output(self,other, " DIA_PAL_2680_Udar_Natan_01_38 " );	// And you, accordingly, try to distract Nathan with a conversation to give me the opportunity to prepare.
		AI_Output(other,self, " DIA_PAL_2680_Udar_Natan_01_39 " );	// Okay, I got it.
		B_LogEntry( TOPIC_NATANDOLG , " Strike has an idea how to help the paladin Nathan fulfill his oath, although not entirely honest. Impact wants to ambush a small group of orcs and engage in an 'unequal' battle with them. After which I will have to arrive in time together with Nathan to help him. According to Udar, this is enough to convince Nathan later that from now on he is not bound by his vow of honor. " );
		Log_AddEntry( TOPIC_NATANDOLG , " Now I need to talk to Nathan himself and let Udar prepare for an ambush. He will be waiting for us near Orlan's tavern, in a small forest opposite one of the caves. " );
		AI_StopProcessInfos(self);
		UDARORCSTRAP = TRUE;
		self.aivar[ 93 ] = TRUE ;
		Npc_ExchangeRoutine(self,"OrcsTrap");
	};
};


instance DIA_PAL_2680_UDAR_NATANDOLGDONE (C_Info)
{
	npc = pal_2680_udr;
	nr = 1;
	condition = dia_pal_2680_udar_natandolgdone_condition;
	information = dia_pal_2680_developed_info;
	permanent = FALSE;
	description = " What do you say? " ;
};


func int dia_pal_2680_udar_natandolgdone_condition()
{
	if ( MIS_NATANDOLG  ==  LOG_SUCCESS )
	{
		return TRUE;
	};
};

func void dia_pal_2680_udar_natandolgdone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_PAL_2680_Udar_NatanDolgDone_01_00 " );	// What do you say?
	AI_Output(self,other, " DIA_PAL_2680_Udar_NatanDolgDone_01_01 " );	// (smiles) Our trick was quite successful.
	AI_Output(self,other, " DIA_PAL_2680_Udar_NatanDolgDone_01_02 " );	// Now Nathan will not be constantly pressed by the need to save my life.
	AI_Output(self,other, " DIA_PAL_2680_Udar_NatanDolgDone_01_05 " );	// Thanks for helping me with this.
	AI_Output(self,other, " DIA_PAL_2680_Udar_NatanDolgDone_01_06 " );	// Here - accept this thing from me as a thank you. I think you will need it!
	B_GiveInvItems(self,other,itri_udargift,1);
	AI_Output(other,self, " DIA_PAL_2680_Udar_NatanDolgDone_01_07 " );	// Thank you.
	AI_StopProcessInfos(self);
	self.aivar[ 93 ] = FALSE ;
	Npc_ExchangeRoutine(self,"Start");
	Npc_ExchangeRoutine(pal_2500_garond,"Start");
	Npc_ExchangeRoutine(pal_2510_oric,"Start");
	Npc_ExchangeRoutine(pal_2520_parcival,"Start");
	Npc_ExchangeRoutine(pal_2170_marcos,"Start");
	Npc_ExchangeRoutine(pal_75230_albert,"Start");
	Npc_ExchangeRoutine(pal_75180_ritter,"Start");
	Npc_ExchangeRoutine(pal_75190_ritter,"Start");
	Npc_ExchangeRoutine(pal_75200_ritter,"Start");
	Npc_ExchangeRoutine(pal_75210_ritter,"Start");
	Npc_ExchangeRoutine(pal_75220_ritter,"Start");
	Npc_ExchangeRoutine(pal_75240_ritter,"Start");
	Npc_ExchangeRoutine(pal_2530_wache,"Start");
	Npc_ExchangeRoutine(pal_2570_ritter,"Start");
	Npc_ExchangeRoutine(pal_91650_ritter,"Start");
	Npc_ExchangeRoutine(pal_91660_ritter,"Start");
	Npc_ExchangeRoutine(pal_91670_ritter,"Start");
};

