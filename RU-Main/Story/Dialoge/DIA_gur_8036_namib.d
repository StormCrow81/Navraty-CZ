

instance DIA_BAALNAMIB_EXIT(C_Info)
{
	npc = gur_8036_namib;
	nr = 999;
	condition = dia_baalnamib_exit_condition;
	information = dia_baalnamib_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_baalnamib_exit_condition()
{
	return TRUE;
};

func void dia_baalnamib_exit_info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};

instance DIA_BAALNAMIB_PICKPOCKET(C_Info)
{
	npc = gur_8036_namib;
	nr = 900;
	condition = DIA_BAALNAMIB_PICKPOCKET_Condition;
	information = DIA_BAALNAMIB_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_BAALNAMIB_PICKPOCKET_Condition()
{
	return  C_Robbery ( 49 , 35 );
};

func void DIA_BAALNAMIB_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_BAALNAMIB_PICKPOCKET);
	Info_AddChoice(DIA_BAALNAMIB_PICKPOCKET,Dialog_Back,DIA_BAALNAMIB_PICKPOCKET_BACK);
	Info_AddChoice(DIA_BAALNAMIB_PICKPOCKET,DIALOG_PICKPOCKET,DIA_BAALNAMIB_PICKPOCKET_DoIt);
};

func void DIA_BAALNAMIB_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_BAALNAMIB_PICKPOCKET);
};

func void DIA_BAALNAMIB_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_BAALNAMIB_PICKPOCKET);
};


instance DIA_BAALNAMIB_NOTALK_SLEEPER(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_notalk_sleeper_condition;
	information = dia_baalnamib_notalk_sleeper_info;
	permanent = FALSE;
	important = FALSE;
	description = " May the Sleeper be with you! " ;
};


func int dia_baalnamib_notalk_sleeper_condition()
{
	if((IDOLNAMIB_YES == FALSE) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baalnamib_notalk_sleeper_info()
{
	AI_Output(other,self, " DIA_BaalNamib_NoTalk_Sleeper_01_00 " );	// May the Sleeper be with you!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Sleeper_01_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALNAMIB_NOTALK_IMP(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_notalk_imp_condition;
	information = dia_baalnamib_notalk_imp_info;
	permanent = TRUE;
	important = FALSE;
	description = " Is everything all right, buddy? " ;
};


func int dia_baalnamib_notalk_imp_condition()
{
	if((IDOLNAMIB_YES == FALSE) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baalnamib_notalk_imp_info()
{
	AI_Output(other,self, " DIA_BaalNamib_NoTalk_Imp_01_00 " );	// Are you all right, mate?
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Sleeper_01_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALNAMIB_SLEEPSPELL(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_sleepspell_condition;
	information = dia_baalnamib_sleepspell_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalnamib_sleepspell_condition()
{
	var C_Npc sek8022;
	var C_Npc sek8023;
	var C_Npc sek8024;

	sek8022 = Hlp_GetNpc(sek_8022_novize);
	sek8023 = Hlp_GetNpc(sek_8023_novize);
	sek8024 = Hlp_GetNpc(sek_8024_novize);

	if((Npc_IsInState(sek8022,ZS_MagicSleep) || Npc_IsInState(sek8023,ZS_MagicSleep) || Npc_IsInState(sek8024,ZS_MagicSleep)) && (IDOLNAMIB_YES == FALSE) && (other.guild == GIL_SEK) && (PSI_TALK == TRUE) && (CANBEGURU == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_sleepspell_info()
{
	B_GivePlayerXP(200);
	 AI_Output(self,other, " DIA_BaalNamib_SleepSpell_01_00 " ); // Do not distract me from the reflections to which I and my wards indulged.
	 AI_Output(self,other, " DIA_BaalNamib_SleepSpell_01_01 " ); // Sleeper Magic! How do you know this art?
	 AI_Output(other,self, " DIA_BaalNamib_SleepSpell_01_02 " ); // Is there anything complicated in it?
	 AI_Output(self,other, " DIA_BaalNamib_SleepSpell_01_03 " ); // Yes, this is a gift and nothing else. I am ready to help you develop it.
	 AI_Output(self,other, " DIA_BaalNamib_SleepSpell_01_04 " ); // Become one of us, and new heights of knowledge will open to you!
	IDOLNAMIB_YES = TRUE;
};


instance DIA_BAALNAMIB_TASK (C_Info)
{
	npc = gur_8036_namib;
	nr = 800;
	condition = dia_baalnamib_task_condition;
	information = dia_baalnamib_task_info;
	permanent = FALSE;
	important = FALSE;
	description = " I want to become one of the Gurus. " ;
};


func int dia_baalnamib_task_condition()
{
	if((IDOLNAMIB_YES == TRUE) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void dia_baalnamib_task_info()
{
	AI_Output(other,self, " DIA_BaalNamib_Aufgabe_01_00 " );	// I want to become one of the Gurus.
	AI_Output(self,other, " DIA_BaalNamib_Aufgabe_01_01 " );	// Do you want to be one of us?

	if(other.attribute[ATR_MANA_MAX] >= 60)
	{
		B_GivePlayerXP(400);
		AI_Output(self,other, " DIA_BaalNamib_Aufgabe_01_02 " );	// Let me see you... mmmm... (looks closely)
		AI_Output(self,other, " DIA_BaalNamib_Aufgabe_01_03 " );	// You don't look like a person who is weak in spirit...
		AI_Output(self,other, " DIA_BaalNamib_Aufgabe_01_04 " );	// I sense great spiritual power in you!
		AI_Output(other,self, " DIA_BaalNamib_Aufgabe_01_05 " );	// Does this mean, sir, that you give your consent to my acceptance into the Circle of the Guru?
		AI_Output(self,other, " DIA_BaalNamib_Aufgabe_01_06 " );	// You got it right. Go to the Idol Oran.
		Log_SetTopicStatus(TOPIC_NAMIBWORK,LOG_SUCCESS);
		B_LogEntry( TOPIC_NAMIBWORK , " According to the Namib Idol, my spirit is strong enough. He agreed to my acceptance into the Guru Circle. " );
		MIS_NAMIBWORK = LOG_SUCCESS;
		NAMIBAGREED = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_BaalNamib_Aufgabe_01_07 " );	// Let me see you... mmmm... (looks closely)
		AI_Output(self,other, " DIA_BaalNamib_Aufgabe_01_08 " );	// You are not yet ready to accept our faith. Your spirit is still too weak for that!
		AI_Output(self,other, " DIA_BaalNamib_Aufgabe_01_09 " );	// Come back to me when your spiritual power grows and becomes stronger.
		AI_Output(self,other, " DIA_BaalNamib_Aufgabe_01_10 " );	// Only then will we talk about your entry into the Brotherhood.
		Log_CreateTopic(TOPIC_NAMIBWORK,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_NAMIBWORK,LOG_Running);
		B_LogEntry( TOPIC_NAMIBWORK , "The Namib Idol doesn't think I'm strong enough yet to be ready to enter the faith of the Brotherhood. " );
		B_LogEntry( TOPIC_NAMIBWORK , " He told me to come back when my Reiatsu is up and strong (requires at least 60 Magical Energy). " );
		MIS_NAMIBWORK = LOG_Running;
	};
};


instance DIA_BAALNAMIB_CONSENT (C_Info)
{
	npc = gur_8036_namib;
	nr = 2;
	condition = dia_baalnamib_approval_condition;
	information = dia_baalnamib_approval_info;
	permanent = TRUE;
	description = " Is my spirit strong enough, lord? " ;
};


func int dia_baalnamib_approval_condition()
{
	if((MIS_NAMIBWORK == LOG_Running) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baalnamib_approval_info()
{
	AI_Output(other,self, " DIA_BaalNamib_Zustimmung_01_00 " );	// Is my spirit strong enough, lord?
	AI_Output(self,other, " DIA_BaalNamib_Zustimmung_01_01 " );	// Let me see you... mmmm... (looks closely)

	if(other.attribute[ATR_MANA_MAX] >= 60)
	{
		B_GivePlayerXP(150);
		AI_Output(self,other, " DIA_BaalNamib_Aufgabe_01_04 " );	// I sense great spiritual power in you!
		AI_Output(other,self, " DIA_BaalNamib_Zustimmung_01_03 " );	// Does this mean, sir, that you give your consent to my acceptance into the Circle of the Guru?
		AI_Output(self,other, " DIA_BaalNamib_Zustimmung_01_04 " );	// You got it right. Go to the Idol Oran.
		Log_SetTopicStatus(TOPIC_NAMIBWORK,LOG_SUCCESS);
		B_LogEntry( TOPIC_NAMIBWORK , " According to the Namib Idol, my spirit is strong enough. He agreed to my acceptance into the Guru Circle. " );
		MIS_NAMIBWORK = LOG_SUCCESS;
		NAMIBAGREED = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_BaalNamib_Zustimmung_01_05 " );	// No - you're still weak!
		AI_Output(self,other, " DIA_BaalNamib_Zustimmung_01_06 " );	// Don't waste my time. Come back to me only when your spiritual power grows even stronger and stronger.
	};
};


instance DIA_BAALNAMIB_PRETEACH(C_Info)
{
	npc = gur_8036_namib;
	nr = 99;
	condition = dia_baalnamib_preteach_condition;
	information = dia_baalnamib_preteach_info;
	description = " Idol Oran said you could teach me how to make runes. " ;
};


func int dia_baalnamib_preteach_condition()
{
	if((hero.guild == GIL_GUR) && (BAALNAMIB_TEACHRUNES == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_preteach_info()
{
	AI_Output(other,self, " DIA_BaalNamib_PreTeach_15_00 " );	// Idol Oran said you could teach me how to make runes of Sleeper magic.
	AI_Output(self,other, " DIA_BaalNamib_PreTeach_05_01 " );	// Of course I can help you master this art!
	AI_Output(self,other, " DIA_BaalNamib_PreTeach_05_02 " );	// With the comprehension of each new magic Circle, more and more powerful spells will become available to you.
	AI_Output(self,other, " DIA_BaalNamib_PreTeach_05_03 " );	// In addition, you will need magical spell scrolls to create some runes. Idol Tion will be able to sell them to you.
	AI_Output(self,other, " DIA_BaalNamib_PreTeach_05_04 " );	// He also always has rune books with him in case you want to know more about the Sleeper's magic.
	Log_CreateTopic(TOPIC_ADDON_GURTEACHER,LOG_NOTE);
	B_LogEntry( TOPIC_ADDON_GURTEACHER , "The Namib Idol can teach me how to create sleeper magic runes. " );
};


instance DIA_BAALNAMIB_RUNEN (C_Info)
{
	npc = gur_8036_namib;
	nr = 99;
	condition = dia_baalnamib_runen_condition;
	information = dia_baalnamib_runen_info;
	permanent = TRUE;
	description = " Teach me how to make runes. " ;
};


func int dia_baalnamib_runen_condition()
{
	if ((hero.guild ==  GIL_GUR ) && ( BAALNAMIB_TEACHRUNES  ==  TRUE ) && Npc_KnowsInfo(other,dia_baalnamib_preteach))
	{
		return TRUE;
	};
};

func void dia_baalnamib_runen_info()
{
	AI_Output(other,self, " DIA_Parlan_TEACH_15_00 " );	// Train me!
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(dia_baalnamib_runen, " 6 Circle of Magic " ,dia_baalnamib_runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(dia_baalnamib_runen, " 5 Circle of Magic " ,dia_baalnamib_runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(dia_baalnamib_runen, " 4 Circle of Magic " ,dia_baalnamib_runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(dia_baalnamib_runen, " 3 Circle of Magic " ,dia_baalnamib_runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(dia_baalnamib_runen, " 2 Circle of Magic " ,dia_baalnamib_runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(dia_baalnamib_runen, " 1 Circle of Magic " ,dia_baalnamib_runen_1);
	};
};

func void dia_baalnamib_runen_back()
{
	Info_ClearChoices(dia_baalnamib_runen);
};

func void dia_baalnamib_runen_1()
{
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Sleep] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Sleep,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Sleep)),dia_baalnamib_runen_circle_1_spl_sleep);
	};
	if(PLAYER_TALENT_RUNES[SPL_BERZERK] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_BERZERK,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_BERZERK)),dia_baalnamib_runen_circle_3_spl_berzerk);
	};
};

func void dia_baalnamib_runen_2()
{
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_GreenTentacle] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_GreenTentacle,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_GreenTentacle)),dia_baalnamib_runen_circle_2_spl_greententacle);
	};
	if(PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),dia_baalnamib_runen_circle_2_spl_windfist);
	};
};

func void dia_baalnamib_runen_3()
{
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Fear] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Fear,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Fear)),dia_baalnamib_runen_circle_3_spl_fear);
	};
	if(PLAYER_TALENT_RUNES[SPL_Charm] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Charm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Charm)),dia_baalnamib_runen_circle_1_spl_charm);
	};
	if(PLAYER_TALENT_RUNES[SPL_Extricate] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Extricate,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Extricate)),dia_baalnamib_runen_circle_3_spl_Extricate);
	};
};

func void dia_baalnamib_runen_4()
{
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_SUMMONSWAMPGOLEM] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_SUMMONSWAMPGOLEM,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONSWAMPGOLEM)),dia_baalnamib_runen_circle_5_spl_summonswampgolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_Acid] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Acid,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Acid)),dia_baalnamib_runen_circle_5_spl_Acid);
	};
	if((PLAYER_TALENT_RUNES[SPL_Elevate] == FALSE) && (LegoSpellElevate == TRUE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Elevate,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Elevate)),dia_baalnamib_runen_circle_4_spl_Elevate);
	};
};

func void dia_baalnamib_runen_5()
{
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_SEVEREFETIDITY] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_SEVEREFETIDITY,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SEVEREFETIDITY)),dia_baalnamib_runen_circle_4_spl_severefetidity);
	};
	if(PLAYER_TALENT_RUNES[SPL_Whirlwind] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Whirlwind,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Whirlwind)),dia_baalnamib_runen_circle_4_spl_whirlwind);
	};
};

func void dia_baalnamib_runen_6()
{
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_GuruWrath] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_GuruWrath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_GuruWrath)),dia_baalnamib_runen_circle_6_spl_GuruWrath);
	};
	if(PLAYER_TALENT_RUNES[SPL_Quake] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Quake,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Quake)),dia_baalnamib_runen_circle_6_spl_Quake);
	};
};

func void dia_baalnamib_runen_circle_1_spl_sleep()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Sleep);
};

func void dia_baalnamib_runen_circle_1_spl_charm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Charm);
};

func void dia_baalnamib_runen_circle_2_spl_greententacle()
{
	B_TeachPlayerTalentRunes(self,other,SPL_GreenTentacle);
};

func void dia_baalnamib_runen_circle_2_spl_windfist()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WindFist);
};

func void dia_baalnamib_runen_circle_3_spl_fear()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Fear);
};

func void dia_baalnamib_runen_circle_3_spl_berzerk()
{
	B_TeachPlayerTalentRunes(self,other,SPL_BERZERK);
};

func void dia_baalnamib_runen_circle_3_spl_Extricate()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Extricate);
};

func void dia_baalnamib_runen_circle_4_spl_Elevate()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Elevate);
};

func void dia_baalnamib_runen_circle_5_spl_Acid()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Acid);
};

func void dia_baalnamib_runen_circle_6_spl_Quake()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Quake);
};

func void dia_baalnamib_runen_circle_4_spl_severefetidity()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SEVEREFETIDITY);
};

func void dia_baalnamib_runen_circle_4_spl_whirlwind()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Whirlwind);
};

func void dia_baalnamib_runen_circle_5_spl_summonswampgolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SUMMONSWAMPGOLEM);
};

func void dia_baalnamib_runen_circle_6_spl_GuruWrath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_GuruWrath);
};

instance DIA_BAALNAMIB_RUNEMAGICNOTWORK(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_runemagicnotwork_condition;
	information = dia_baalnamib_runemagicnotwork_info;
	permanent = FALSE;
	description = " How is your magic doing? " ;
};


func int dia_baalnamib_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (GURUMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_BaalNamib_RuneMagicNotWork_01_00 " );	// How's your magic doing?
	AI_Output(self,other, " DIA_BaalNamib_RuneMagicNotWork_01_01 " );	// Our magic runes are weak and unable to cast spells anymore!
	AI_Output(self,other, " DIA_BaalNamib_RuneMagicNotWork_01_03 " );	// All this is very strange.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , "The Gurus of the Brotherhood have also lost their power over rune magic! " );
	GURUMAGERUNESNOT = TRUE;
};

// -----------------PRIORITY--------------------

instance DIA_BAALNAMIB_PrioratStart (C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_PrioratStart_condition;
	information = dia_baalnamib_PrioratStart_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalnamib_PrioratStart_condition()
{
	if(PrioratPreStart == TRUE)
	{
		return TRUE;
	};
};

func void dia_baalnamib_PrioratStart_info()
{
	if((hero.guild == GIL_SEK) || (hero.guild == GIL_GUR) || (hero.guild == GIL_TPL))
	{
		if(hero.guild == GIL_SEK)
		{
			AI_Output(self,other, " DIA_BaalNamib_PrioratStart_01_01 " );	// It's good that you came, novice.
		}
		else  if (hero.guild ==  GIL_GUR )
		{
			AI_Output(self,other, " DIA_BaalNamib_PrioratStart_01_02 " );	// It's good that you came.
		}
		else if(hero.guild == GIL_TPL)
		{
			AI_Output(self,other, " DIA_BaalNamib_PrioratStart_01_03 " );	// It's good that you came, guard.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_BaalNamib_PrioratStart_01_04 " );	// It's good that you came, stranger.
	};


	AI_Output(other,self, " DIA_BaalNamib_PrioratStart_01_05 " );	// You wanted to see me?
	AI_Output(self,other, " DIA_BaalNamib_PrioratStart_01_06 " );	// Yes, that's right. I have an urgent matter for you.
	AI_Output(self,other, " DIA_BaalNamib_PrioratStart_01_07 " );	// Recently, acolytes of the Brotherhood have been disappearing from the camp.
	AI_Output(self,other, " DIA_BaalNamib_PrioratStart_01_08 " );	// And no one knows whether they themselves decided to leave, or something happened to them.
	AI_Output(self,other, " DIA_BaalNamib_PrioratStart_01_09 " );	// We do not keep anyone in the camp by force. However, this trend can lead to sad consequences for our community.
	AI_Output(other,self, " DIA_BaalNamib_PrioratStart_01_10 " );	// What do you want from me?
	AI_Output(self,other, " DIA_BaalNamib_PrioratStart_01_11 " );	// I need you to find out the reason that forced these acolytes to leave the ranks of our Brotherhood.
	AI_Output(self,other, " DIA_BaalNamib_PrioratStart_01_12 " );	// Or find out what happened to them.
	AI_Output(other,self, " DIA_BaalNamib_PrioratStart_01_13 " );	// All this is very interesting, but why me?
	AI_Output(self,other, " DIA_BaalNamib_PrioratStart_01_14 " );	// You see, this question is rather delicate.
	AI_Output(self,other, " DIA_BaalNamib_PrioratStart_01_15 " );	// If I trust this to someone else, various rumors may spread, which is highly undesirable for us in the current situation.

	if((hero.guild == GIL_SEK) || (hero.guild == GIL_GUR) || (hero.guild == GIL_TPL))
	{
		AI_Output(self,other, " DIA_BaalNamib_PrioratStart_01_16 " );	// And you are a new person here and, besides, you have proven yourself well in the eyes of our brothers.
	}
	else
	{
		AI_Output(self,other, " DIA_BaalNamib_PrioratStart_01_17 " );	// And you, as I heard, are a reliable person, although you are not a member of our Brotherhood.
	};

	AI_Output(self,other, " DIA_BaalNamib_PrioratStart_01_18 " );	// This explains my choice. So can I count on your help?
	Info_ClearChoices(DIA_BaalNamib_PrioratStart);
	Info_AddChoice(DIA_BaalNamib_PrioratStart, " Ok. Where should I start? " ,DIA_BaalNamib_PrioratStart_yes);
	Info_AddChoice(DIA_BaalNamib_PrioratStart, " I don't have time for this. " ,DIA_BaalNamib_PrioratStart_no);
};

func void DIA_BaalNamib_PrioratStart_no()
{
	AI_Output(other,self, " DIA_BaalNamib_PrioratStart_no_01_01 " );	// Unfortunately, I don't have time for that.
	AI_Output(self,other, " DIA_BaalNamib_PrioratStart_no_01_02 " );	// Well, you really disappointed me with your answer.
	AI_Output(self,other, " DIA_BaalNamib_PrioratStart_no_01_03 " );	// I hope that you really have more important things to do than help our Brotherhood.
	AI_Output(other,self, " DIA_BaalNamib_PrioratStart_no_01_04 " );	// I'm sorry.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_no_01_05");	//(вздох)
	AI_StopProcessInfos(self);
};

func void DIA_BaalNamib_PrioratStart_yes()
{
	Wld_SendTrigger("NW_ASS_BLOOD_01");
	B_StartOtherRoutine( SEK_8039_NOVIZE , " TOT " );
	B_StartOtherRoutine( SEK_8040_NOVIZE , " TOT " );
	B_StartOtherRoutine(tpl_8045_hanis,"Death");
	AI_Output(other,self, " DIA_BaalNamib_PrioratStart_yes_01_01 " );	// Good. Where should I start my search?
	AI_Output(self,other, " DIA_BaalNamib_PrioratStart_yes_01_02 " );	// I think you should check out our bog harvester camps first.
	AI_Output(self,other, " DIA_BaalNamib_PrioratStart_yes_01_03 " );	// We haven't heard from them in a long time.
	AI_Output(self,other, " DIA_BaalNamib_PrioratStart_yes_01_04 " );	// I'm very worried about their fate. The local area is not very friendly.
	AI_Output(self,other, " DIA_BaalNamib_PrioratStart_yes_01_05 " );	// At the same time, you will find out what they know about the missing acolytes. Any information will be useful to us.
	AI_Output(self,other, " DIA_BaalNamib_PrioratStart_yes_01_06 " );	// After you visit the pickers, go to the city to the Parvez Idol.
	AI_Output(self,other, " DIA_BaalNamib_PrioratStart_yes_01_07 " );	// See if he has any news on this case. That's all for now.
	AI_Output(other,self, " DIA_BaalNamib_PrioratStart_yes_01_08 " );	// Okay, I got it.
	AI_Output(self,other, " DIA_BaalNamib_PrioratStart_yes_01_09 " );	// Waiting for news from you. And hopefully good ones.
	Log_CreateTopic(TOPIC_PrioratStart,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PrioratStart,LOG_Running);
	B_LogEntry(TOPIC_PrioratStart, " The Namib Idol is very concerned about the mysterious disappearance of Brotherhood acolytes from the camp. He asked me to help him in this complicated matter. First, I should visit the camps of the swamp collectors and question them about these strange disappearances, and after - look at the Idol Parvez in Khorinis. " );
	MIS_PrioratStart = LOG_Running;
	AI_StopProcessInfos(self);
};

var int MissKillerHanis;

instance DIA_BAALNAMIB_PrioratNews(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_PrioratNews_condition;
	information = dia_baalnamib_PrioratNews_info;
	permanent = TRUE;
	description = " I have news for you. " ;
};


func int dia_baalnamib_PrioratNews_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BladePrioratSeekInProgress == FALSE) && ((PsiCamp_01_Ok == TRUE) || (PsiCamp_02_Ok == TRUE) || (PsiCamp_03_Ok == TRUE) || (PsiCamp_04_Ok == TRUE)))
	{
		return TRUE;
	};
};

func void dia_baalnamib_PrioratNews_info()
{
	var int ExpAll;

	ExpAll = FALSE ;

	AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_01 " );	// I have news for you.
	AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_02 " );	// I'm listening to you carefully.

	if((PsiCamp_01_Ok == TRUE) && (PsiCamp_01_Done == FALSE))
	{
		ExpAll = ExpAll + 100;
		AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_03 " );	// Everything is calm in Balam's gathering camp - a new batch of bogweed will be delivered on time.
		AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_04 " );	// What about the missing acolytes?
		AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_05 " );	// They haven't heard anything about it.
		AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_06 " );	// Good. Anything else?
		PsiCamp_01_Done = TRUE;
	};

	if((PsiCamp_02_Ok == TRUE) && (PsiCamp_02_Done == FALSE))
	{
		ExpAll = ExpAll + 100;
		AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_07 " );	// Shrat and his bog harvesters are doing just fine.
		AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_08 " );	// This pleases. Do they know anything about the missing brothers?
		AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_09");	//Нет.
		AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_10 " );	// Well, - no, no. Any other news?
		PsiCamp_02_Done = TRUE;
	};

	if((PsiCamp_04_Ok == TRUE) && (PsiCamp_04_Done == FALSE))
	{
		ExpAll = ExpAll + 100;
		AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_11 " );	// I've spoken to Idol Parvez.
		AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_12 " );	// And what did he say?
		AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_13 " );	// According to him, in the city no one saw novices from the camp.
		AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_14 " );	// Is he sure?
		AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_15 " );	// Absolutely. The city guard wouldn't let this go unnoticed.
		AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_16 " );	// Good. Any more news?
		PsiCamp_04_Done = TRUE;
	};
	if((PsiCamp_03_Ok == TRUE) && (PsiCamp_03_Done == FALSE))
	{
		if (MissKillerHanis ==  FALSE )
		{
			AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_17 " );	// I guess you won't like them very much. The camp of Hanis's guard was attacked.
			AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_18 " );	// What?! But who could do it and, most importantly, why?
			AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_19 " );	// I don't know this.
			AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_20 " );	// Oh, gods... And what about Hanis himself?
			AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_21 " );	// He fought bravely and even managed to wound one of the attackers, but was mortally wounded. There was nothing I could do to help him.
			AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_23 " );	// True, before he died, he told me that the attackers took all the bog harvesters with them.
		}
		else
		{
			AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_53 " );	// Regarding the attack on Khanis's camp...
		};

		if(FirstAssas == TRUE)
		{
			if(Npc_HasItems(other,ItMw_1H_AssBlade) >= 1)
			{
				ExpAll = ExpAll + 500;
			};

			if (MissKillerHanis ==  FALSE )
			{
				AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_24 " );	// And what did you do?
				AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_25 " );	// According to Hanis, one of the killers was bleeding heavily. It helped me track him down and kill him.
				AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_26 " );	// However, who he is and where he came from, it was not possible to find out. He carried only a strange-looking blade.
				AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_27 " );	// Let me take a look at it.
			}
			else
			{
				AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_54 " );	// I'm listening to you.
				AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_55 " );	// I managed to track down and kill one of the attackers.
				AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_56 " );	// However, who he is and where he came from, it was not possible to find out. He carried only a strange-looking blade.
				AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_57 " );	// Let me take a look at it.
			};

			if(Npc_HasItems(other,ItMw_1H_AssBlade) >= 1)
			{
				AI_UnequipWeapons(self);
				CreateInvItems(other,ItMw_1H_AssBlade_View,1);
				AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_28 " );	// Here, take this.
				B_GiveInvItems(other,self,ItMw_1H_AssBlade_View,1);
				AI_EquipBestMeleeWeapon(self);
				AI_ReadyMeleeWeapon(self);
				AI_PlayAni(self,"T_1HSINSPECT");
				AI_RemoveWeapon(self);
				AI_UnequipWeapons(self);
				AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_29 " );	// Yes, a very strange blade. I have never seen such a weapon.
				AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_30 " );	// Take it back and try to find out something about it.
				AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_31 " );	// Find out who might own such a blade.
				AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_32 " );	// This won't be easy. Do you have any thoughts on this?
				AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_33 " );	// Try talking to experienced blacksmiths. Who, if not they, are best versed in weapons.
				AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_34 " );	// Maybe we'll get lucky and one of them knows where it came from.
				AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_35 " );	// Do you have any more news?
				BladePrioratSeek = TRUE;
				B_LogEntry(TOPIC_PrioratStart, " I told Namib Idol about the attack on the gathering camp and showed him a mysterious blade that I found on one of the attackers. Guru asked me to find out more about it. You should first ask the local blacksmiths about it. " );
			}
			else
			{
				AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_36 " );	// Unfortunately, I don't have it with me.
				AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_37 " );	// Then bring it to me so I can have a look at it.
				AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_39 " );	// Any other news?
				B_LogEntry(TOPIC_PrioratStart, " I told Namib Idol about the attack on the gathering camp and about the mysterious blade I found on one of the attackers. Guru asked me to show him the sword and then find out more about it. First, ask the local blacksmiths about it. " );
				MissAssBlade = TRUE;
			};

			PsiCamp_03_Done = TRUE;
		}
		else
		{
			if(ExpAll > 0)
			{
				B_GivePlayerXP(ExpAll);
			};

			AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_40 " );	// And what did you do?
			AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_41 " );	// According to Hanis, one of the killers was bleeding heavily.
			AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_42 " );	// But I haven't found it yet.
			AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_43 " );	// Then hunt him down! We need to know who these people are.
			MissKillerHanis = TRUE;
			AI_StopProcessInfos(self);
		};
	};

	if(ExpAll > 0)
	{
		B_GivePlayerXP(ExpAll);
	};

	if((PsiCamp_01_Done == TRUE) && (PsiCamp_02_Done == TRUE) && (PsiCamp_03_Done == TRUE) && (PsiCamp_04_Done == TRUE) && (BladePrioratSeek == TRUE))
	{
		AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_45 " );	// I guess that's all the news I could get about the missing acolytes.
		AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_46 " );	// You did a good job! Now we need to decide what to do next.
		AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_47 " );	// And while I think about it, try to find out something about the blade.
		AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_48 " );	// Perhaps this is the only thread that can lead us to the truth.
		BladePrioratSeekInProgress = TRUE;
	}
	else
	{
		AI_Output(other,self, " DIA_BaalNamib_PrioratNews_01_50 " );	// That's all news for now.
		AI_Output(self,other, " DIA_BaalNamib_PrioratNews_01_51 " );	// Okay, but that's not enough! Try to find out more.
	};
};


instance DIA_BAALNAMIB_PrioratNews_Blade(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_PrioratNews_Blade_condition;
	information = dia_baalnamib_PrioratNews_Blade_info;
	permanent = FALSE;
	description = " I have that blade with me. " ;
};


func int dia_baalnamib_PrioratNews_Blade_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BladePrioratSeek == FALSE) && (MissAssBlade == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void dia_baalnamib_PrioratNews_Blade_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_BaalNamib_PrioratNews_Blade_01_01 " );	// I have that blade with me.
	AI_Output(self,other, " DIA_BaalNamib_PrioratNews_Blade_01_02 " );	// Good. Let me take a look at it.
	AI_Output(other,self, " DIA_BaalNamib_PrioratNews_Blade_01_03 " );	// Here, take this.
	CreateInvItems(self,ItMw_1H_AssBlade_View,1);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other, " DIA_BaalNamib_PrioratNews_Blade_01_04 " );	// Yes, a very strange blade. I have never seen such a weapon!
	AI_Output(self,other, " DIA_BaalNamib_PrioratNews_Blade_01_05 " );	// Take it back and try to find out something about it.
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_EquipBestMeleeWeapon(self);
	AI_Output(self,other, " DIA_BaalNamib_PrioratNews_Blade_01_06 " );	// Find out who might own such a blade.
	AI_Output(other,self, " DIA_BaalNamib_PrioratNews_Blade_01_07 " );	// This won't be easy. Do you have any thoughts on this?
	AI_Output(self,other, " DIA_BaalNamib_PrioratNews_Blade_01_08 " );	// Try talking to experienced blacksmiths. Who, if not they, are best versed in weapons!
	AI_Output(self,other, " DIA_BaalNamib_PrioratNews_Blade_01_09 " );	// Maybe we'll get lucky and one of them knows where it came from.
	BladePrioratSeek = TRUE;
	B_LogEntry(TOPIC_PrioratStart, " I brought the Namib Idol a mysterious blade that I found from one of the attackers. The Guru was very interested in it and asked me to find out more about it. You should first ask the local blacksmiths. " );


	if((PsiCamp_01_Done == TRUE) && (PsiCamp_02_Done == TRUE) && (PsiCamp_03_Done == TRUE) && (PsiCamp_04_Done == TRUE) && (BladePrioratSeek == TRUE))
	{
		AI_Output(self,other, " DIA_BaalNamib_PrioratNews_Blade_01_10 " );	// Perhaps this is the only thread that can lead us to the truth.
		BladePrioratSeekInProgress = TRUE;
	};
};

instance DIA_BAALNAMIB_ShadowKnown(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_ShadowKnown_condition;
	information = dia_baalnamib_ShadowKnown_info;
	permanent = FALSE;
	description = " I was able to find out who attacked the swamp harvester camp. " ;
};


func int dia_baalnamib_ShadowKnown_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (AssBlaseHistory == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_ShadowKnown_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_BaalNamib_ShadowKnown_01_01 " );	// I was able to find out who attacked the bog harvester's camp.
	AI_Output(self,other, " DIA_BaalNamib_ShadowKnown_01_02 " );	// Really?
	AI_Output(other,self, " DIA_BaalNamib_ShadowKnown_01_03 " );	// These were the fighters of an ancient order of assassins who call themselves the Shadows of Masyaf!
	AI_Output(self,other, " DIA_BaalNamib_ShadowKnown_01_04 " );	// Hmmm... I think I can guess who you're talking about.
	AI_Output(self,other, " DIA_BaalNamib_ShadowKnown_01_05 " );	// But, as far as I know, their Brotherhood has always been located in the lands of the assassins in Varant.
	AI_Output(other,self, " DIA_BaalNamib_ShadowKnown_01_06 " );	// You're right - that's how it was until recently.
	AI_Output(other,self, " DIA_BaalNamib_ShadowKnown_01_07 " );	// But the blade I found on one of the assassins says otherwise.
	AI_Output(self,other, " DIA_BaalNamib_ShadowKnown_01_08 " );	// If so, then we are all in great danger!
	AI_Output(self,other, " DIA_BaalNamib_ShadowKnown_01_09 " );	// And especially those brothers who are now outside of our camp.
	AI_Output(other,self, " DIA_BaalNamib_ShadowKnown_01_10 " );	// And what are we going to do?
	AI_Output(self,other, " DIA_BaalNamib_ShadowKnown_01_11 " );	// First, go to Gor Na Tofu and tell them I've ordered that the harvesters be kept safe.
	AI_Output(self,other, " DIA_BaalNamib_ShadowKnown_01_12 " );	// Have him send some of his Guardians to them.
	AI_Output(other,self, " DIA_BaalNamib_ShadowKnown_01_13 " );	// Good. What should I do?
	AI_Output(self,other, " DIA_BaalNamib_ShadowKnown_01_14 " );	// Guess I don't have any errands for you right now.
	AI_Output(self,other, " DIA_BaalNamib_ShadowKnown_01_15 " );	// But if you still want to help, go with the guards to one of the camps.
	AI_Output(self,other, " DIA_BaalNamib_ShadowKnown_01_16 " );	// I'm sure that an extra person will not interfere with them there.
	NamibSendTempler = TRUE;
	B_LogEntry(TOPIC_PrioratStart, " I told the Namib Idol everything I could about the attackers. The Namib sent me to the Master Guard of the Mountains on Tofu to instruct him to secure the remaining bog harvester camps. I can help the guards with this as well. " );
};


instance DIA_BAALNAMIB_WhereToGo(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_WhereToGo_condition;
	information = dia_baalnamib_WhereToGo_info;
	permanent = FALSE;
	description = " Which gathering camp should I go to? " ;
};


func int dia_baalnamib_WhereToGo_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (NamibSendTempler == TRUE) && (AssInvationBegin == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_WhereToGo_info()
{
	AI_Output(other,self, " DIA_BaalNamib_WhereToGo_01_01 " );	// Which gathering camp should I go to?
	AI_Output(self,other, " DIA_BaalNamib_WhereToGo_01_02 " );	// I'm guessing the one to the north, near the pyramids. I'm sure you'll be needed there.
	AI_Output(other,self, " DIA_BaalNamib_WhereToGo_01_03 " );	// And where does such confidence come from?
	AI_Output(self,other, " DIA_BaalNamib_WhereToGo_01_04 " );	// It is unlikely that Masyaf will dare to attack the camp near the city. It's too risky for them.
	AI_Output(self,other, " DIA_BaalNamib_WhereToGo_01_05 " );	// After all, they have already revealed their presence on this island.
	B_LogEntry(TOPIC_PrioratStart, "The Namib idol advised me to go to the camp located in the north of Khorinis, near the pyramids. " );
};

instance DIA_BAALNAMIB_AssStopAttack(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_AssStopAttack_condition;
	information = dia_baalnamib_AssStopAttack_info;
	permanent = FALSE;
	description = " The gathering camp is under attack! " ;
};

func int dia_baalnamib_AssStopAttack_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (AssInvasionStop == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_AssStopAttack_info()
{
	AI_Output(other,self, " DIA_BaalNamib_AssStopAttack_01_01 " );	// The gathering camp in northern Khorinis is under attack!
	AI_Output(self,other, " DIA_BaalNamib_AssStopAttack_01_02 " );	// (seriously) As I foresaw. I assume the Shadows were behind this?
	AI_Output(other,self, " DIA_BaalNamib_AssStopAttack_01_03 " );	// Yes, they are.

	if(TPLBalamDead == TRUE)
	{
		AI_Output(self,other, " DIA_BaalNamib_AssStopAttack_01_04 " );	// And you managed to fight off the attack?
		AI_Output(other,self, " DIA_BaalNamib_AssStopAttack_01_05 " );	// Of course, though not without loss.
		AI_Output(self,other, " DIA_BaalNamib_AssStopAttack_01_06 " );	// Alas, but with such a dangerous enemy, this is indispensable.
		AI_Output(other,self, " DIA_BaalNamib_AssStopAttack_01_07 " );	// I'm sure the guardians of the Na Tofa Mountains were well aware of what they were getting into.
		AI_Output(other,self, " DIA_BaalNamib_AssStopAttack_01_08 " );	// They all fought to the last! Gor Na Tof would be proud of them.
		AI_Output(self,other, " DIA_BaalNamib_AssStopAttack_01_09 " );	// No doubt. But let's get back to the attack itself.
	};

	AI_Output(self,other, " DIA_BaalNamib_AssStopAttack_01_10 " );	// Did you manage to find out anything else about these people?

	if (Npc_HasItems(other,ItAm_MasiafKey) >=  1 )
	{
		NamibAmuletResearch = TRUE;
		NamibAmuletResearchDayEnd = Wld_GetDay();

		AI_Output(other,self, " DIA_BaalNamib_AssStopAttack_01_11 " );	// I found this strange amulet on one of the attackers.
		AI_Output(self,other, " DIA_BaalNamib_AssStopAttack_01_12 " );	// Let me take a look at it.
		AI_Output(other,self, " DIA_BaalNamib_AssStopAttack_01_13 " );	// Here, take this.
		B_GiveInvItems(other,self,ItAm_MasiafKey,1);
		AI_Output(self,other, " DIA_BaalNamib_AssStopAttack_01_14 " );	// Yes... (thoughtfully) A strange little thing.
		AI_Output(self,other, " DIA_BaalNamib_AssStopAttack_01_15 " );	// I hope you don't mind if I keep her for now.
		AI_Output(self,other, " DIA_BaalNamib_AssStopAttack_01_16 " );	// Perhaps I can find out in more detail what it is.

		if(PlayerKnowsMasiafKey == TRUE)
		{
			B_GivePlayerXP(1000);
			AI_Output(other,self, " DIA_BaalNamib_AssStopAttack_01_17 " );	// I can already tell you what it is. You have a kind of key in your hands.
			AI_Output(self,other, " DIA_BaalNamib_AssStopAttack_01_18 " );	// How did you know this?
			AI_Output(other,self, " DIA_BaalNamib_AssStopAttack_01_19 " );	// One person in Khorinis recognized this amulet.
			AI_Output(self,other, " DIA_BaalNamib_AssStopAttack_01_20 " );	// Are you sure about this?
			AI_Output(other,self, " DIA_BaalNamib_AssStopAttack_01_21 " );	// You can be sure of that. I trust him.
			AI_Output(self,other, " DIA_BaalNamib_AssStopAttack_01_22 " );	// Good. Then we only have to find what it reveals.
			AI_Output(other,self, " DIA_BaalNamib_AssStopAttack_01_23 " );	// Unfortunately, he didn't tell me that. So we'll have to find out for ourselves.
			AI_Output(self,other, " DIA_BaalNamib_AssStopAttack_01_24 " );	// I don't even know where to start looking.
			AI_Output(self,other, " DIA_BaalNamib_AssStopAttack_01_25 " );	// I need to think... It might take me a couple of days.
			AI_Output(self,other, " DIA_BaalNamib_AssStopAttack_01_26 " );	// Come back later and we'll decide what to do next.
			B_LogEntry(TOPIC_PrioratStart, "The Namib Idol is interested in an amulet key that I found on the body of one of the attackers. It remains to find out what exactly it opens. " );
		}
		else
		{
			B_GivePlayerXP(500);
			AI_Output(self,other, " DIA_BaalNamib_AssStopAttack_01_28 " );	// I think if you stop by in a couple of days, I can say more about this subject.
			; _ _ _ _
		};
	}
	else
	{
		B_GivePlayerXP(250);
		NamibAmuletSearch = TRUE;
		AI_Output(other,self, " DIA_BaalNamib_AssStopAttack_01_30 " );	// Nothing yet.
		AI_Output(self,other, " DIA_BaalNamib_AssStopAttack_01_31 " );	// This is very bad. We need more information about these attacks.
		AI_Output(self,other, " DIA_BaalNamib_AssStopAttack_01_32 " );	// Okay, you're free for now. But if you find something, let me know immediately!
	};
};

instance DIA_BAALNAMIB_MasiafAmulet(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_MasiafAmulet_condition;
	information = dia_baalnamib_MasiafAmulet_info;
	permanent = FALSE;
	description = " I have something for you. " ;
};

func int dia_baalnamib_MasiafAmulet_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (NamibAmuletSearch == TRUE) && (Npc_HasItems(other,ItAm_MasiafKey) >= 1))
	{
		return TRUE;
	};
};

func void dia_baalnamib_MasiafAmulet_info()
{
	AI_Output(other,self, " DIA_BaalNamib_MasiafAmulet_01_01 " );	// I have something for you.
	AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_01_02 " );	// What exactly?
	AI_Output(other,self, " DIA_BaalNamib_MasiafAmulet_01_03 " );	// Strange-looking amulet I found on one of the attackers.
	AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_01_04 " );	// Hmmm... Let me take a look at it.
	AI_Output(other,self, " DIA_BaalNamib_MasiafAmulet_01_05 " );	// Вот, держи.
	B_GiveInvItems(other,self,ItAm_MasiafKey,1);
	Npc_RemoveInvItems(self,ItAm_MasiafKey,Npc_HasItems(self,ItAm_MasiafKey));
	AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_01_06 " );	// Yes... (thoughtfully) A strange little thing.
	AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_01_07 " );	// I hope you don't mind if I keep her for now.
	AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_01_08 " );	// Perhaps I can find out in more detail what it is.

	if(PlayerKnowsMasiafKey == TRUE)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self, " DIA_BaalNamib_MasiafAmulet_01_09 " );	// I can already tell you what it is. You have a kind of key in your hands.
		AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_01_10 " );	// How did you know this?
		AI_Output(other,self, " DIA_BaalNamib_MasiafAmulet_01_11 " );	// One person in Khorinis recognized this amulet.
		AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_01_12 " );	// Are you sure about this?
		AI_Output(other,self, " DIA_BaalNamib_MasiafAmulet_01_13 " );	// You can be sure of that. I trust him.
		AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_01_14 " );	// Good. Then we only have to find what it reveals.
		AI_Output(other,self, " DIA_BaalNamib_MasiafAmulet_01_15 " );	// Unfortunately, he didn't tell me that. So we'll have to find out for ourselves.
		AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_01_16 " );	// I don't even know where to start looking.
		AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_01_17 " );	// I need to think... It might take me a couple of days.
		AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_01_18 " );	// Come back later and we'll decide what to do next.
		B_LogEntry(TOPIC_PrioratStart, "The Namib Idol is interested in an amulet key that I found on the body of one of the attackers. It remains to find out what exactly it opens. " );
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_01_20 " );	// I think if you stop by in a couple of days, I can say more about this subject.
		; _ _ _ _
	};

	NamibAmuletResearch = TRUE;
	NamibAmuletResearchDayEnd = Wld_GetDay();
};


instance DIA_BAALNAMIB_MasiafAmulet_News(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_MasiafAmulet_News_condition;
	information = dia_baalnamib_MasiafAmulet_News_info;
	permanent = FALSE;
	description = " Any news? " ;
};

func int dia_baalnamib_MasiafAmulet_News_condition()
{
	where int daynow;

	daynow = Wld_GetDay();

	if (( MIS_PriorityStart == LOG_Running ) && ( NamibAmuletResearch ==  TRUE ) && ( NamibAmuletResearchDayEnd <= ( daynow --  1 ))) ;
	{
		return TRUE;
	};
};

func void dia_baalnamib_MasiafAmulet_News_info()
{
	AI_Output(other,self, " DIA_BaalNamib_MasiafAmulet_News_01_01 " );	// Any news?
	AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_News_01_02 " );	// It's good that you came. I really managed to find out something.
	AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_News_01_03 " );	// This applies to the symbol that is depicted in the center of the amulet.
	AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_News_01_04 " );	// The fact is that recently a new attack was made on our novices.
	AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_News_01_05 " );	// However, this time one of them still managed to survive and escape from the attackers.
	AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_News_01_06 " );	// When he returned to the camp and told about what had happened, I immediately decided to ask him more.
	AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_News_01_07 " );	// True, he was very frightened and barely picked his words, trying to tell me how everything happened.
	AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_News_01_08 " );	// Then I showed him this amulet. He looked at him for a long time, but didn't really say anything.
	AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_News_01_09 " );	// But by his look, I realized that he was still familiar to him.
	AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_News_01_10 " );	// I think you should talk to him about this.
	AI_Output(other,self, " DIA_BaalNamib_MasiafAmulet_News_01_11 " );	// What is the name of this acolyte?
	AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_News_01_12 " );	// His name is Loki. Now he is in the city, along with the idol Parvez.
	AI_Output(self,other, " DIA_BaalNamib_MasiafAmulet_News_01_13 " );	// Spiritual meditation and peace - this is exactly what a person who has been in such a mess needs.
	B_LogEntry(TOPIC_PrioratStart, "The Namib Idol informed me that the acolytes were recently attacked again. This time, one of them managed to escape from the attackers. The surviving acolyte is called Loki and, according to the guru, he knows something about the amulet. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(SEK_8049_LOKI,"NW_CITY_LOKI");
};


instance DIA_BAALNAMIB_Assasins_Door_Found(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_Assasins_Door_Found_condition;
	information = dia_baalnamib_Assasins_Door_Found_info;
	permanent = FALSE;
	description = " I need that amulet. " ;
};

func int dia_baalnamib_Assasins_Door_Found_condition()
{
	where int daynow;

	daynow = Wld_GetDay();

	if((MIS_PrioratStart == LOG_Running) && (Assasins_Door_Found_OneTime == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_Assasins_Door_Found_info()
{
	AI_Output(other,self, " DIA_BaalNamib_Assasins_Door_Found_01_00 " );	// I need that amulet.
	AI_Output(self,other, " DIA_BaalNamib_Assasins_Door_Found_01_01 " );	// So, did you manage to learn something?
	AI_Output(other,self, " DIA_BaalNamib_Assasins_Door_Found_01_02 " );	// Loki's acolyte took me to the place where he saw the symbol depicted on the amulet.
	AI_Output(other,self, " DIA_BaalNamib_Assasins_Door_Found_01_03 " );	// There I found a strange stone slab and a pedestal with an embossed connector with the same image.
	AI_Output(self,other, " DIA_BaalNamib_Assasins_Door_Found_01_04 " );	// (thoughtfully) I think I understand what you're thinking now.
	AI_Output(self,other, " DIA_BaalNamib_Assasins_Door_Found_01_05 " );	// Okay, hold the amulet. I hope everything works out for you.
	B_GiveInvItems(self,other,ItKe_Masiaf_Open,1);
	NamibSendToMasiaf = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_BAALNAMIB_Assasins_Door_Found_Ok(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_Assasins_Door_Found_Ok_condition;
	information = dia_baalnamib_Assasins_Door_Found_Ok_info;
	permanent = FALSE;
	description = " I found a secret passage hidden in the mountain. " ;
};

func int dia_baalnamib_Assasins_Door_Found_Ok_condition()
{
	where int daynow;

	daynow = Wld_GetDay();

	if((MIS_PrioratStart == LOG_Running) && (ReadyGoForMasiafLair == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_Assasins_Door_Found_Ok_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_BaalNamib_Assasins_Door_Found_Ok_01_00 " );	// I found a secret passage hidden in the mountain.
	AI_Output(self,other, " DIA_BaalNamib_Assasins_Door_Found_Ok_01_01 " );	// How interesting! And what are you going to do now?
	AI_Output(other,self, " DIA_BaalNamib_Assasins_Door_Found_Ok_01_02 " );	// We need to search this cave. There are definitely answers to our questions.
	AI_Output(self,other, " DIA_BaalNamib_Assasins_Door_Found_Ok_01_03 " );	// Okay, I'm counting on you. But be careful, because it is not known exactly what awaits you there.
	AI_Output(self,other, " DIA_BaalNamib_Assasins_Door_Found_Ok_01_04 " );	// Here, take this elixir. He will help you in your search.
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
};

instance DIA_BAALNAMIB_Assasins_DoneAll(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_Assasins_DoneAll_condition;
	information = dia_baalnamib_Assasins_DoneAll_info;
	permanent = FALSE;
	description = " The Brotherhood is now safe. " ;
};

func int dia_baalnamib_Assasins_DoneAll_condition()
{
	if(MIS_PrioratStart == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_baalnamib_Assasins_DoneAll_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self, " DIA_BaalNamib_Assasins_DoneAll_01_00 " );	// The Brotherhood is now safe.
	AI_Output(self,other, " DIA_BaalNamib_Assasins_DoneAll_01_01 " );	// Are you sure about this?
	AI_Output(other,self, " DIA_BaalNamib_Assasins_DoneAll_01_02 " );	// Absolutely. There is no more threat.
	AI_Output(self,other, " DIA_BaalNamib_Assasins_DoneAll_01_03 " );	// Okay, I believe you. And who was behind all this?
	AI_Output(other,self, " DIA_BaalNamib_Assasins_DoneAll_01_04 " );	// It was Kor-Gal! Only in the form of a powerful demon.
	AI_Output(self,other, " DIA_BaalNamib_Assasins_DoneAll_01_05 " );	// Kor-Galom? Then that explains a lot.
	AI_Output(self,other, " DIA_BaalNamib_Assasins_DoneAll_01_06 " );	// But anyway, we're all grateful for your help. We wouldn't have made it without you!
	AI_Output(self,other, " DIA_BaalNamib_Assasins_DoneAll_01_08 " );	// Here, take these elixirs. I'm sure they will come in handy for you.
	B_GiveInvItems(self,other,ItPo_Perm_Health,2);
};

instance DIA_BAALNAMIB_Assasins_DoneHram(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_Assasins_DoneHram_condition;
	information = dia_baalnamib_Assasins_DoneHram_info;
	permanent = FALSE;
	description = " That's not all. " ;
};

func int dia_baalnamib_Assasins_DoneHram_condition()
{
	if(Npc_KnowsInfo(other,DIA_BaalNamib_Assasins_DoneAll) == TRUE)
	{
		return TRUE;
	};
};

func void dia_baalnamib_Assasins_DoneHram_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_BaalNamib_Assasins_DoneHram_01_00 " );	// That's not all. Do you remember I told you about the secret passage hidden in the mountain?
	AI_Output(self,other, " DIA_BaalNamib_Assasins_DoneHram_01_01 " );	// Of course. I remember that.
	AI_Output(other,self, " DIA_BaalNamib_Assasins_DoneHram_01_02 " );	// So, on the other side of this passage is a small valley. It was there that the temple of Kor-Galom and the Brotherhood of Masyaf was located.
	AI_Output(other,self, " DIA_BaalNamib_Assasins_DoneHram_01_03 " );	// And that's where they kept the people they kidnapped. Including your followers.
	AI_Output(self,other, " DIA_BaalNamib_Assasins_DoneHram_01_04 " );	// What do you mean by that?
	AI_Output(other,self, " DIA_BaalNamib_Assasins_DoneHram_01_05 " );	// Now the passage is littered with stones, and many of those who were captured by them still remain in that valley.
	AI_Output(other,self, " DIA_BaalNamib_Assasins_DoneHram_01_06 " );	// Without your help, they won't be able to get out of there.
	AI_Output(self,other, " DIA_BaalNamib_Assasins_DoneHram_01_07 " );	// I understand you... (seriously) I will immediately send guards there to clear the rubble.
	AI_Output(self,other, " DIA_BaalNamib_Assasins_DoneHram_01_08 " );	// We will help our brothers and will not leave them to their fate!
};
