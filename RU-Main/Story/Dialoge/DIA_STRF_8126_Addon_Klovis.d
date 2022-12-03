

instance DIA_STRF_8126_Addon_Klovis_EXIT (C_Info)
{
	npc = STRF_8126_Addon_Klovis;
	nr = 999;
	condition = DIA_STRF_8126_Addon_Klovis_EXIT_Condition;
	information = DIA_STRF_8126_Addon_Klovis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_8126_Addon_Klovis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_8126_Addon_Klovis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8126_Addon_Klovis_Hearing (C_Info)
{
	npc = STRF_8126_Addon_Klovis;
	nr = 2;
	condition = DIA_STRF_8126_Addon_Klovis_Hearing_Condition;
	information = DIA_STRF_8126_Addon_Klovis_Hearing_Info;
	permanent = FALSE;
	description = " Not tired of hitting the pick yet? " ;
};

func int DIA_STRF_8126_Addon_Klovis_Hearing_Condition()
{
	return TRUE;
};

func void DIA_STRF_8126_Addon_Klovis_Hearing_Info()
{
	AI_Output(other,self, " DIA_STRF_8126_Addon_Klovis_Hearing_15_00 " );	// Not tired of hitting the pick yet?
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_Hearing_04_01 " );	// What do you think? (chuckling) But I have no other choice.
};

instance DIA_STRF_8126_Addon_Klovis_Ore (C_Info)
{
	npc = STRF_8126_Addon_Klovis;
	nr = 2;
	condition = DIA_STRF_8126_Addon_Klovis_Ore_Condition;
	information = DIA_STRF_8126_Addon_Klovis_Ore_Info;
	permanent = FALSE;
	description = " Maybe you need help? " ;
};

func int DIA_STRF_8126_Addon_Klovis_Ore_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8126_Addon_Klovis_Hearing) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8126_Addon_Klovis_Ore_Info()
{
	AI_Output(other,self, " DIA_STRF_8126_Addon_Klovis_Ore_01_00 " );	// Maybe you need help?
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_Ore_01_01 " );	// (sarcastically) Help? In my opinion, everyone here needs it!
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_Ore_01_02 " );	// But, let's say, if you brought me fifty pieces of iron ore, then I could take a break.
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_Ore_01_03 " );	// And then to work hard at the vein all day, as you yourself understand, the work is not easy.
	AI_Output(other,self, " DIA_STRF_8126_Addon_Klovis_Ore_01_04 " );	// Полсотни?
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_Ore_01_05 " );	// That's how much ore we all have to take Hildur to the smelter every day.
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_Ore_01_06 " );	// If you bring less, then the next day you will have to get this norm and what you did not report on the last one.
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_Ore_01_07 " );	// And so on without a break! Saves only one...
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_Ore_01_08 " );	// An orc who counts ore can sometimes, let's say, not notice the shortage.
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_Ore_01_09 " );	// But only if you have gold nuggets with you.
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_Ore_01_10 " );	// And you will certainly share them with him.

	if(VakurShakNeedGold == TRUE)
	{
		AI_Output(other,self, " DIA_STRF_8126_Addon_Klovis_Ore_01_11 " );	// Let me guess: this orc's name isn't Vakur Shak by any chance?
		AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_Ore_01_12 " );	// He's the best, buddy... (chuckling) I see that you've had to deal with him before.
	};

	AI_Output(other,self, " DIA_STRF_8126_Addon_Klovis_Ore_01_13 " );	// So gold can be mined here as well?
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_Ore_01_14 " );	// No. Just here in the ore rock sometimes there are small gold streaks.
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_Ore_01_15 " );	// (seriously) But about it to nobody, understood?! This is our little secret.
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_Ore_01_16 " );	// For if Ar Dagar finds out about all this, then we will definitely be finished.
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_Ore_01_17 " );	// But something we chatted with you... So, will you bring me the ore?
	AI_Output(other,self, " DIA_STRF_8126_Addon_Klovis_Ore_01_18 " );	// I'll try.
	MIS_KlovisOre = LOG_Running;
	Log_CreateTopic(TOPIC_KlovisOre,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KlovisOre,LOG_Running);
	; _ _ _ _
};

instance DIA_STRF_8126_Addon_Klovis_OreDone (C_Info)
{
	npc = STRF_8126_Addon_Klovis;
	nr = 2;
	condition = DIA_STRF_8126_Addon_Klovis_OreDone_Condition;
	information = DIA_STRF_8126_Addon_Klovis_OreDone_Info;
	permanent = FALSE;
	description = " Here are your fifty pieces. " ;
};

func int DIA_STRF_8126_Addon_Klovis_OreDone_Condition()
{
	if ((MY_ClawOre == LOG_Running) && (Npc_HasItems(other, ITMI_SNUGGED ) >=  50 ))
	{
		return TRUE;
	};
};

func void DIA_STRF_8126_Addon_Klovis_OreDone_Info()
{
	B_GivePlayerXP(450);
	AI_Output(other,self, " DIA_STRF_8126_Addon_Klovis_OreDone_01_00 " );	// Here are your fifty pieces.
	B_GiveInvItems(other,self,ITMI_SNUGGET,50);
	Npc_RemoveInvItems(self,ITMI_SNUGGET,50);
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_OreDone_01_01 " );	// Great, mate. With so much ore, I don't have to shake my ass anymore!
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_OreDone_01_02 " );	// At least you can relax for a day or two.

	if(HERO_HACKCHANCEORE < 100)
	{
		AI_Output(other,self, " DIA_STRF_8126_Addon_Klovis_OreDone_01_03 " );	// At least say thank you!
		AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_OreDone_01_04 " );	// I'd rather show you how to mine the right way. Trust me, I'm a master at this!
		AI_Output(other,self, " DIA_STRF_8126_Addon_Klovis_OreDone_01_05 " );	// Do I look like a miner?
		AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_OreDone_01_06 " );	// No...(puzzled) But what if it comes in handy? Besides, I don't have much more to thank you for.
	};

	AI_Output(other,self, " DIA_STRF_8126_Addon_Klovis_OreDone_01_07 " );	// What about gold nuggets?
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_OreDone_01_08 " );	// Heh... (maliciously) What a sly one! And you are far from simple, as it seems at first glance.
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_OreDone_01_09 " );	// Okay! If you want, I can give you a few.
	RT_Respect = RT_Respect + 1;
	MIS_KlovisOre = LOG_Success;
	Log_SetTopicStatus(TOPIC_KlovisOre,LOG_Success);
	B_LogEntry(TOPIC_KlovisOre, " I brought Clovis fifty pieces of ore. " );
	Info_ClearChoices(DIA_STRF_8126_Addon_Klovis_OreDone);

	if(HERO_HACKCHANCEORE < 100)
	{
		Info_AddChoice(DIA_STRF_8126_Addon_Klovis_OreDone, " Teach me how to mine. " ,DIA_STRF_8126_Addon_Klovis_OreDone_W1);
	};

	Info_AddChoice(DIA_STRF_8126_Addon_Klovis_OreDone, " I don't want to do this. " ,DIA_STRF_8126_Addon_Klovis_OreDone_W2);
};

func void DIA_STRF_8126_Addon_Klovis_OreDone_W1()
{
	if(KNOWHOWPICKORE == FALSE)
	{
		Npc_SetTalentSkill(hero,NPC_TALENT_ERZWORK,1);
		AI_Print(PRINT_LEARNPICKORE);
		HERO_HACKCHANCEORE = HERO_HACKCHANCEORE + 10;

		if(HERO_HACKCHANCEORE > 100)
		{
			HERO_HACKCHANCEORE = 100;
		};

		KNOWHOWPICKORE = TRUE;
		Npc_SetTalentValue(hero,NPC_TALENT_ERZWORK,HERO_HACKCHANCEORE);
		Snd_Play("Levelup");

		if(ORE_TOPIC_EXIST == TRUE)
		{
			B_LogEntry( TOPIC_MAGICORE , " Now I can mine magic ore from rock. " );
		}
		else
		{
			Log_CreateTopic(TOPIC_MAGICORE,LOG_NOTE);
			B_LogEntry( TOPIC_MAGICORE , " Now I can mine magic ore from rock. " );
			ORE_TOPIC_EXIST = TRUE;
		};
	}
	else
	{
		AI_Print(PRINT_LEARNPICKORE);
		HERO_HACKCHANCEORE = HERO_HACKCHANCEORE + 10;

		if(HERO_HACKCHANCEORE > 100)
		{
			HERO_HACKCHANCEORE = 100;
		};
		if(HERO_HACKCHANCEORE >= 90)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_ERZWORK,4);
		}
		else if(HERO_HACKCHANCEORE >= 60)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_ERZWORK,3);
		}
		else if(HERO_HACKCHANCEORE >= 30)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_ERZWORK,2);
		}
		else
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_ERZWORK,1);
		};

		Npc_SetTalentValue(hero,NPC_TALENT_ERZWORK,HERO_HACKCHANCEORE);
		Snd_Play("Levelup");
	};

	AI_Output(other,self, " DIA_STRF_8126_Addon_Klovis_OreDone_W1_01_00 " );	// Teach me how to mine.
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_OreDone_W1_01_01 " );	// Okay, listen carefully. The main thing is to hold the pickaxe correctly.
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_OreDone_W1_01_02 " );	// Grasp its shaft with both hands just below its center.
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_OreDone_W1_01_03 " );	// This will give you an opportunity to hit the vein more strongly!
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_OreDone_W1_01_04 " );	// And then you continue to strike evenly. Remember?
	AI_Output(other,self, " DIA_STRF_8126_Addon_Clovis_OreDone_W1_01_05 " );	// Да, запомнил.
	Info_ClearChoices(DIA_STRF_8126_Addon_Klovis_OreDone);
};

func void DIA_STRF_8126_Addon_Klovis_OreDone_W2()
{
	AI_Output(other,self, " DIA_STRF_8126_Addon_Klovis_OreDone_W2_01_00 " );	// I prefer gold.
	AI_Output(self,other, " DIA_STRF_8126_Addon_Klovis_OreDone_W2_01_01 " );	// Then here - hold. As they say, how rich!
	B_GiveInvItems(self,other,ItMi_Addon_GoldNugget,3);
	Info_ClearChoices(DIA_STRF_8126_Addon_Klovis_OreDone);
};
