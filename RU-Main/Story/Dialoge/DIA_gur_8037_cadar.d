

instance DIA_BAALCADAR_EXIT(C_Info)
{
	npc = gur_8037_cadar;
	nr = 999;
	condition = dia_baalcadar_exit_condition;
	information = dia_baalcadar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_baalcadar_exit_condition()
{
	return TRUE;
};

func void dia_baalcadar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_baalcadar_PICKPOCKET(C_Info)
{
	npc = gur_8037_cadar;
	nr = 900;
	condition = dia_baalcadar_PICKPOCKET_Condition;
	information = dia_baalcadar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_baalcadar_PICKPOCKET_Condition()
{
	return C_Beklauen(15,35);
};

func void dia_baalcadar_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_baalcadar_PICKPOCKET);
	Info_AddChoice(dia_baalcadar_PICKPOCKET, Dialog_Back, dia_baalcadar_PICKPOCKET_BACK);
	Info_AddChoice(dia_baalcadar_PICKPOCKET,DIALOG_PICKPOCKET,dia_baalcadar_PICKPOCKET_DoIt);
};

func void dia_baalcadar_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(dia_baalcadar_PICKPOCKET);
};

func void dia_baalcadar_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_baalcadar_PICKPOCKET);
};

instance DIA_BAALCADAR_NO_TALK(C_Info)
{
	npc = gur_8037_cadar;
	nr = 1;
	condition = dia_baalcadar_no_talk_condition;
	information = dia_baalcadar_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_baalcadar_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_baalcadar_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	B_Attack(self,other,AR_GuardCalledToKill,1);
	AI_StopProcessInfos(self);
};


instance DIA_BAALCADAR_NOTALK_SLEEPER(C_Info)
{
	npc = gur_8037_cadar;
	nr = 1;
	condition = dia_baalcadar_notalk_sleeper_condition;
	information = dia_baalcadar_notalk_sleeper_info;
	permanent = FALSE;
	important = FALSE;
	description = " May the Sleeper be with you! " ;
};


func int dia_baalcadar_notalk_sleeper_condition()
{
	if((IDOLTYON_YES == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_baalcadar_notalk_sleeper_info()
{
	AI_Output(other,self, " DIA_BaalCadar_NoTalk_Sleeper_01_00 " );	// May the Sleeper be with you!
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Sleeper_01_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALCADAR_NOTALK_IMP(C_Info)
{
	npc = gur_8037_cadar;
	nr = 2;
	condition = dia_baalcadar_notalk_imp_condition;
	information = dia_baalcadar_notalk_imp_info;
	permanent = TRUE;
	important = FALSE;
	description = " Is everything all right, buddy? " ;
};


func int dia_baalcadar_notalk_imp_condition()
{
	if((IDOLCADAR_YES == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_baalcadar_notalk_imp_info()
{
	AI_Output(other,self, " DIA_BaalCadar_NoTalk_Imp_01_00 " );	// Are you all right, mate?
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Sleeper_01_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALCADAR_TASK (C_Info)
{
	npc = gur_8037_cadar;
	nr = 1;
	condition = dia_baalcadar_task_condition;
	information = dia_baalcadar_task_info;
	permanent = FALSE;
	description = " (give away the swamp) " ;
};


func int dia_baalcadar_task_condition()
{
	if (( MY_CAINSENTTOCADAR  == LOG_Running) && ( IDOLCADAR_YES  ==  FALSE ) && (other.guild ==  GIL_SEK ) && ( PSI_TALK  ==  TRUE ) && (Npc_HasItems(other,ItPl_SwampHerb) >=  50 ) && Wld_IsTime( 8 , 0 , 8 . 21 , 0 ))
	{
		return TRUE;
	};
};

func void dia_baalcadar_task_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_BaalCadar_Aufgabe_01_00 " );	// I've brought a day's bogweed harvest!
	B_GiveInvItems(other,self,ItPl_SwampHerb,50);
	Npc_RemoveInvItems(self,ItPl_SwampHerb,50);
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Sleeper_01_01");	//(вздох)
	IDOLCADAR_YES = TRUE;
	Log_SetTopicStatus(TOPIC_CAINSENTTOCADAR,LOG_SUCCESS);
	B_LogEntry( TOPIC_CAINSENTTOCADAR , " I gave the bog to Idol Kadar. " );
	MIS_CAINSENTTOCADAR = LOG_SUCCESS;
};


instance DIA_BAALCADAR_HELPME(C_Info)
{
	npc = gur_8037_cadar;
	nr = 1;
	condition = dia_baalcadar_helpme_condition;
	information = dia_baalcadar_helpme_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalcadar_helpme_condition()
{
	if((MIS_CAINSENTTOCADAR == LOG_SUCCESS) && (CANBEGURU == TRUE) && (other.guild == GIL_SEK) && (PSI_TALK == TRUE) && (IDOLCADAR_YES == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalcadar_helpme_info()
{
	AI_Output(self,other, " DIA_BaalCadar_HelpMe_01_00 " );	// Wait, novice!
	AI_Output(self,other, " DIA_BaalCadar_HelpMe_01_01 " );	// You did a little favor for our assemblers.
	AI_Output(other,self, " DIA_BaalCadar_HelpMe_01_02 " );	// What can I do for you, sir?
	AI_Output(self,other, " DIA_BaalCadar_HelpMe_01_03 " );	// As you probably already knew, one of the fundamental properties of our life is the burning of marsh grass.
	AI_Output(self,other, " DIA_BaalCadar_HelpMe_01_04 " );	// Unfortunately, this wonderful plant does not grow everywhere here.
	AI_Output(self,other, " DIA_BaalCadar_HelpMe_01_05 " );	// And that swamp that Cain and his novices get here, not far from the camp, is not enough.
	AI_Output(self,other, " DIA_BaalCadar_HelpMe_01_06 " );	// Therefore, in addition to them, there are other groups of collectors. I need you to deliver another collection of swamp grass from them.
	AI_Output(other,self, " DIA_BaalCadar_HelpMe_01_07 " );	// Where can I find these pickers?
	AI_Output(self,other, " DIA_BaalCadar_HelpMe_01_08 " );	// You'll have to find them yourself. There was no news from them for a long time.
	AI_Output(other,self, " DIA_BaalCadar_HelpMe_01_09 " );	// And how will the assemblers know that it was you who sent me?
	AI_Output(self,other, " DIA_BaalCadar_HelpMe_01_10 " );	// Idol Oran said you have a Brotherhood loincloth.
	AI_Output(self,other, " DIA_BaalCadar_HelpMe_01_11 " );	// I think if you look like our acolytes, they'll believe you.
	AI_Output(self,other, " DIA_BaalCadar_HelpMe_01_12 " );	// Now go, and only come to me when you've got the entire collection of the bogweed.
	Log_CreateTopic(TOPIC_PLANTSFORBAALCADAR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PLANTSFORBAALCADAR,LOG_Running);
	B_LogEntry( TOPIC_PLANTSFORBAALCADAR , " Idol Kadar asks me to bring him a bog from other gathering groups. I'll have to look for them myself. " );
	MIS_PLANTSFORBAALCADAR = LOG_Running;
};


instance DIA_BAALCADAR_APPROVAL (C_Info)
{
	npc = gur_8037_cadar;
	nr = 2;
	condition = dia_baalcadar_approval_condition;
	information = dia_baalcadar_approval_info;
	permanent = TRUE;
	description = " I brought a bog from the pickers. " ;
};


func int dia_baalcadar_approval_condition()
{
	if((other.guild == GIL_SEK) && (MIS_PLANTSFORBAALCADAR == LOG_Running) && ((FIRSTGROUPSEK == TRUE) || (SEKONGROUPSEK == TRUE) || (THIRDGROUPSEK == TRUE)))
	{
		return TRUE;
	};
};

func void dia_baalcadar_approval_info()
{
	AI_Output(other,self, " DIA_BaalCadar_Zustimmung_01_00 " );	// I brought a swamp from the pickers.

	if((FIRSTGROUPSEK == TRUE) && (SEKONGROUPSEK == TRUE) && (THIRDGROUPSEK == TRUE) && (Npc_HasItems(other,ItPl_SwampHerb) >= 200))
	{
		B_GivePlayerXP(200);
		AI_Output(self,other, " DIA_BaalCadar_Zustimmung_01_01 " );	// Great! Give it here. Well, let's see...
		B_GiveInvItems(other,self,ItPl_SwampHerb,200);
		Npc_RemoveInvItems(self,ItPl_SwampHerb,200);
		AI_Output(self,other, " DIA_BaalCadar_Zustimmung_01_02 " );	// Yes! Our assemblers have done a great job.
		AI_Output(self,other, " DIA_BaalCadar_Zustimmung_01_04 " );	// And you did a great job with my task!
		AI_Output(self,other, " DIA_BaalCadar_Zustimmung_01_07 " );	// Your faith in the Brotherhood can by no means be questioned, for your deeds speak for themselves.
		AI_Output(self,other, " DIA_BaalCadar_Zustimmung_01_08 " );	// Go to Idol Oran and tell him that I consider you a true believer!
		Log_SetTopicStatus(TOPIC_PLANTSFORBAALCADAR,LOG_SUCCESS);
		B_LogEntry( TOPIC_PLANTSFORBAALCADAR , " I've brought all the bog harvest from the pickers to Idol Kadar. " );
		B_LogEntry_Quiet( TOPIC_PSICAMPJOIN , " Idol Kadar believes that my faith in the Brotherhood cannot be questioned. " );
		MIS_PLANTSFORBAALCADAR = LOG_SUCCESS;
		CADARAGREED = TRUE;
	}
	else if((FIRSTGROUPSEK == TRUE) && (SEKONGROUPSEK == TRUE) && (THIRDGROUPSEK == TRUE))
	{
		AI_Output(self,other, " DIA_BaalCadar_Zustimmung_01_09 " );	// But you don't have it! I think you are trying to deceive me.
		AI_Output(self,other, " DIA_BaalCadar_Zustimmung_01_10 " );	// You must have taken the bogweed from our pickers and decided to take it for yourself!
		AI_Output(self,other, " DIA_BaalCadar_Zustimmung_01_13 " );	// And you think you can get away with it?!
		AI_Output(self,other, " DIA_BaalCadar_Zustimmung_01_14 " );	// (angrily) You are deeply mistaken!
		AI_StopProcessInfos(self);
		B_LogEntry_Failed(TOPIC_PLANTSFORBAALCADAR);
		MIS_PLANTSFORBAALCADAR = LOG_FAILED;
		IDOLCADAR_YES = FALSE;
		IDOLCADAR_NOFOREVER = TRUE;
		B_Attack(self,other,AR_GuardCalledToKill,1);
	}
	else
	{
		AI_Output(self,other, " DIA_BaalCadar_Zustimmung_01_15 " );	// I don't think this is the whole swamp collection. Surely you have not yet visited the other collectors.
	};
};


instance DIA_BAALCADAR_NOFOREVER(C_Info)
{
	npc = gur_8037_cadar;
	nr = 5;
	condition = dia_baalcadar_noforever_condition;
	information = dia_baalcadar_noforever_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_baalcadar_noforever_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (IDOLCADAR_NOFOREVER == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalcadar_noforever_info()
{
	AI_Output(self,other, " DIA_BaalCadar_NoForever_01_00 " );	// Get out of my sight!
	IDOLCADAR_NOFOREVER = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_BAALCADAR_PERM(C_Info)
{
	npc = gur_8037_cadar;
	nr = 2;
	condition = dia_baalcadar_perm_condition;
	information = dia_baalcadar_perm_info;
	permanent = TRUE;
	description = " How's the bog bog harvest going? " ;
};


func int dia_baalcadar_perm_condition()
{
	if((MIS_PLANTSFORBAALCADAR == LOG_SUCCESS) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_baalcadar_perm_info()
{
	AI_Output(other,self, " DIA_BaalCadar_Perm_01_00 " );	// How's the bog harvest progressing?
	AI_Output(self,other, " DIA_BaalCadar_Perm_01_01 " );	// Each of us works to the limit of our strength, and as a result we have enough bogweed not only for our own needs - we even put it on sale.
};


instance DIA_BAALCADAR_PRETEACH (C_Info)
{
	npc = gur_8037_cadar;
	nr = 23;
	condition = dia_baalcadar_preteach_condition;
	information = dia_baalcadar_preteach_info;
	permanent = FALSE;
	description = "The Idol of Oran sent me... " ;
};


func int dia_baalcadar_preteach_condition()
{
	if((BAALCADAR_TEACHMANA == TRUE) && (other.guild == GIL_GUR))
	{
		return TRUE;
	};
};

func void dia_baalcadar_preteach_info()
{
	AI_Output(other,self, " DIA_BaalCadar_PreTeach_15_00 " );	// Idol Oran sent me...
	AI_Output(other,self, " DIA_BaalCadar_PreTeach_05_01 " );	// He said that you could help me increase my magic power.
	AI_Output(self,other, " DIA_BaalCadar_PreTeach_05_02 " );	// You're one of us now, so I'll gladly teach you that.
	AI_Output(self,other, " DIA_BaalCadar_PreTeach_05_03 " );	// Magical energy is a fundamental skill for any mage.
	AI_Output(self,other, " DIA_BaalCadar_PreTeach_05_04 " );	// We use it to cast magical spells using the power of runes.
	AI_Output(self,other, " DIA_BaalCadar_PreTeach_05_05 " );	// But you must learn how to use magical energy wisely.
	AI_Output(self,other, " DIA_BaalCadar_PreTeach_05_06 " );	// Only then can you become a truly great mage!
	AI_Output(self,other, " DIA_BaalCadar_PreTeach_05_07 " );	// As you have already noticed, many of the novices are sitting at the hookah.
	AI_Output(self,other, " DIA_BaalCadar_PreTeach_05_08 " );	// For the Guru, this is the main way of knowing this world and replenishing magical energy.
	AI_Output(self,other, " DIA_BaalCadar_PreTeach_05_09 " );	// Good grass in a hookah, measured puffs - what could be better than this way of knowing the world?
};


instances DIA_BAALCADAR_TEACH_MANA (C_Info)
{
	npc = gur_8037_cadar;
	nr = 10;
	condition = dia_baalcadar_teach_mana_condition;
	information = dia_baalcadar_teach_mana_info;
	permanent = TRUE;
	description = " I want to increase my magical energy. " ;
};


func int dia_baalcadar_teach_mana_condition()
{
	if ((other.guild ==  GIL_GUR ) && ( BAALORUN_TEACHMANA  ==  FALSE ) && ( BAALORUN_TEACHMANA  ==  TRUE ) && Npc_KnowsInfo(other,dia_baalcadar_preteach))
	{
		return TRUE;
	};
};

func void dia_baalcadar_teach_mana_info()
{
	AI_Output(other,self, " DIA_BaalCadar_TEACH_MANA_15_00 " );	// I want to increase my magical energy.
	Info_ClearChoices(dia_baalcadar_teach_mana);
	Info_AddChoice(dia_baalcadar_teach_mana,Dialog_Back,dia_baalcadar_teach_mana_back);
	Info_AddChoice(dia_baalcadar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_baalcadar_teach_mana_1);
	Info_AddChoice(dia_baalcadar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_baalcadar_teach_mana_5);
};

func void dia_baalcadar_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_EVER)
	{
		AI_Output(self,other, " DIA_BaalCadar_TEACH_MANA_05_00 " );	// Your magic power has grown! I can no longer help you with this.
		AI_Output(self,other, " DIA_BaalCadar_TEACH_MANA_05_01 " );	// If you want to know more, contact Idol Oran. He will help you.
		BAALORUN_TEACHMANA = TRUE;
	};
	Info_ClearChoices(dia_baalcadar_teach_mana);
};

func void dia_baalcadar_teach_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_EVER);
	Info_ClearChoices(dia_baalcadar_teach_mana);
	Info_AddChoice(dia_baalcadar_teach_mana,Dialog_Back,dia_baalcadar_teach_mana_back);
	Info_AddChoice(dia_baalcadar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_baalcadar_teach_mana_1);
	Info_AddChoice(dia_baalcadar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_baalcadar_teach_mana_5);
};

func void dia_baalcadar_teach_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_EVER);
	Info_ClearChoices(dia_baalcadar_teach_mana);
	Info_AddChoice(dia_baalcadar_teach_mana,Dialog_Back,dia_baalcadar_teach_mana_back);
	Info_AddChoice(dia_baalcadar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_baalcadar_teach_mana_1);
	Info_AddChoice(dia_baalcadar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_baalcadar_teach_mana_5);
};


instance DIA_BAALCADAR_BRINGCALOMRECEIPTE(C_Info)
{
	npc = gur_8037_cadar;
	nr = 2;
	condition = dia_baalcadar_bringcalomreceipte_condition;
	information = dia_baalcadar_bringcalomreceipte_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalcadar_bringcalomreceipte_condition()
{
	if((Kapitel >= 2) && ((other.guild == GIL_TPL) || (other.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_baalcadar_bringcalomreceipte_info()
{
	AI_Output(self,other, " DIA_BaalCadar_BringCalomReceipte_01_00 " );	// Wait, brother!
	AI_Output(self,other, " DIA_BaalCadar_BringCalomReceipte_01_01 " );	// I've heard rumors that you're going to the Valley of Mines.
	AI_Output(other,self, " DIA_BaalCadar_BringCalomReceipte_01_02 " );	// Yes, it really is.
	AI_Output(self,other, " DIA_BaalCadar_BringCalomReceipte_01_03 " );	// Then I would like to ask you for a favor. This is very important for the Brotherhood!
	AI_Output(self,other, " DIA_BaalCadar_BringCalomReceipte_01_04 " );	// It is necessary that you visit our old camp in the swamps on occasion and look for one thing there.
	AI_Output(self,other, " DIA_BaalCadar_BringCalomReceipte_01_05 " );	// I need a recipe for a special bogweed smoking herb. It was then opened by one of our former gurus - Cor Galom.
	AI_Output(other,self, " DIA_BaalCadar_BringCalomReceipte_01_06 " );	// Cor Galom?
	AI_Output(self,other, " DIA_BaalCadar_BringCalomReceipte_01_08 " );	// Yes. And, as far as I know, when he left our camp in search of the Sleeper, he left this recipe in his chest.
	AI_Output(self,other, " DIA_BaalCadar_BringCalomReceipte_01_09 " );	// And it's probably still there.
	AI_Output(self,other, " DIA_BaalCadar_BringCalomReceipte_01_10 " );	// I want you to take this recipe out of there and bring it to me.
	AI_Output(other,self, " DIA_BaalCadar_BringCalomReceipte_01_11 " );	// I'll try to do it.
	MIS_RECIPTFORBAALCADAR = LOG_Running;
	Log_CreateTopic(TOPIC_REZEPTFORBAALCADAR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REZEPTFORBAALCADAR,LOG_Running);
	; _ _ _ _ _ _
	AI_StopProcessInfos(self);
};


instance DIA_BAALCADAR_BRINGCALOMRECEIPTEDONE(C_Info)
{
	npc = gur_8037_cadar;
	nr = 2;
	condition = dia_baalcadar_bringcalomreceiptedone_condition;
	information = dia_baalcadar_bringcalomreceiptedone_info;
	permanent = FALSE;
	description = " I brought the recipe for Cor Galom. " ;
};


func int dia_baalcadar_bringcalomreceiptedone_condition()
{
	if((MIS_REZEPTFORBAALCADAR == LOG_Running) && (Npc_HasItems(other,itwr_kalomsrecipe) >= 1))
	{
		return TRUE;
	};
};

func void dia_baalcadar_bringcalomreceiptedone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_BaalCadar_BringCalomReceipteDone_01_00 " );	// I brought the recipe for Cor Galom.
	B_GiveInvItems(other,self,itwr_kalomsrecipe,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_BaalCadar_BringCalomReceipteDone_01_04 " );	// (joyfully) Yes, that's him. This is exactly the recipe I was looking for!
	AI_Output(self,other, " DIA_BaalCadar_BringCalomReceipteDone_01_05 " );	// Thank you brother! You have done a good job for the benefit of the Brotherhood.
	AI_Output(self,other, " DIA_BaalCadar_BringCalomReceipteDone_01_09 " );	// Now leave me. I need to learn the bog bog recipe from the Cor Galom recipe.
	AI_Output(self,other, " DIA_BaalCadar_BringCalomReceipteDone_01_10 " );	// I think this will take a decent amount of time.
	MIS_RECIPTFORBAALCADAR = LOG_SUCCESS ;
	Log_SetTopicStatus(TOPIC_REZEPTFORBAALCADAR,LOG_SUCCESS);
	B_LogEntry( TOPIC_REZEPTFORBAALCADAR , " I brought the recipe for Kor Galom to Idol Kadar. " );
	AI_StopProcessInfos(self);
};


instance DIA_BAALCADAR_RUNEMAGICNOTWORK(C_Info)
{
	npc = gur_8037_cadar;
	nr = 1;
	condition = dia_baalcadar_runemagicnotwork_condition;
	information = dia_baalcadar_runemagicnotwork_info;
	permanent = FALSE;
	description = " How is your magic doing? " ;
};


func int dia_baalcadar_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (GURUMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalcadar_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_BaalCadar_RuneMagicNotWork_01_00 " );	// How's your magic doing?
	AI_Output(self,other, " DIA_BaalCadar_RuneMagicNotWork_01_01 " );	// Our magic runes have weakened and are no longer able to cast spells!
	AI_Output(self,other, " DIA_BaalCadar_RuneMagicNotWork_01_02 " );	// We're all surprised by this, but there's nothing we can do.
	AI_Output(self,other, " DIA_BaalCadar_RuneMagicNotWork_01_03 " );	// This is all pretty weird.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , "The Gurus of the Brotherhood have also lost their power over rune magic! " );
	GURUMAGERUNESNOT = TRUE;
};
