

var int  APP_CONSTANTINE_TR ;

instance DIA_Constantino_EXIT(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 999;
	condition = DIA_Constantino_EXIT_Condition;
	information = DIA_Constantino_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Constantino_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Constantino_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Constantino_PICKPOCKET(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 900;
	condition = DIA_Constantino_PICKPOCKET_Condition;
	information = DIA_Constantino_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Constantino_PICKPOCKET_Condition()
{
	return  C_Robbery ( 59 , 90 );
};

func void DIA_Constantino_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Constantino_PICKPOCKET);
	Info_AddChoice(DIA_Constantino_PICKPOCKET,Dialog_Back,DIA_Constantino_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Constantino_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Constantino_PICKPOCKET_DoIt);
};

func void DIA_Constantino_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Constantino_PICKPOCKET);
};

func void DIA_Constantino_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Constantino_PICKPOCKET);
};

var int FirstTalkConstantino;

instance DIA_Constantino_NoTalkAtAll(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_NoTalkAtAll_Condition;
	information = DIA_Constantino_NoTalkAtAll_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Constantino_NoTalkAtAll_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_NoTalkAtAll_Info()
{
	if(FirstTalkConstantino == FALSE)
	{
		AI_Output(self,other, " DIA_Constantino_NoTalkAtAll_12_00 " );	// Hey, there's nothing for you to do here.
		AI_Output(self,other,"DIA_Constantino_NoTalkAtAll_12_01");	//Убирайся!
		FirstTalkConstantino = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Constantino_NoTalkAtAll_12_02 " );	// I said get out!
		AI_StopProcessInfos(self);
	};
};

instances DIA_Constantino_Hallo (C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Hallo_Condition;
	information = DIA_Constantino_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Constantino_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (CanTeachTownMaster == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_Hallo_Info()
{
	AI_Output(self,other, " DIA_Addon_Constantino_Hallo_10_00 " );	// What do you need? I don't give charity.
};


instance DIA_Constantino_AboutLehrling(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_AboutLehrling_Condition;
	information = DIA_Constantino_AboutLehrling_Info;
	permanent = FALSE;
	description = " I want to become an apprentice. " ;
};

func int DIA_Constantino_AboutLehrling_Condition()
{
	return TRUE;
};

func void DIA_Constantino_AboutLehrling_Info()
{
	AI_Output(other,self, " DIA_Constantino_AboutLehrling_15_00 " );	// I want to become an apprentice.
	AI_Output(self,other, " DIA_Constantino_AboutLehrling_10_01 " );	// True? And whose student do you want to be?
};

instance DIA_Constantino_Healing (C_Info)
{
	npc = VLK_417_Constantino;
	nr = 5;
	condition = DIA_Constantino_Heilung_Condition;
	information = DIA_Constantino_Healing_Info;
	permanent = FALSE;
	description = " I need treatment. " ;
};

func int DIA_Constantino_Heilung_Condition()
{
	return TRUE;
};

func void DIA_Constantino_Healing_Info()
{
	AI_Output(other,self, " DIA_Constantino_Heilung_15_00 " );	// I need treatment.
	AI_Output(self,other, " DIA_Constantino_Heilung_10_01 " );	// (briefly) Why, are you hurt?
	Info_ClearChoices(DIA_Constantino_Healing);
	Info_AddChoice(DIA_Constantino_Heilung, " No, actually. " ,DIA_Constantino_Heilung_Nein);
	Info_AddChoice(DIA_Constantino_Healing, " Да. " ,DIA_Constantino_Healing_Yes);
};

func void DIA_Constantino_Healing_Yes()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Ja_15_00");	//Да.
	if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other, " DIA_Constantino_Heilung_Ja_10_01 " );	// Then go to Vatras, he will heal you. And stop dripping blood on my floor!
	}
	else
	{
		AI_Output(self,other, " DIA_Constantino_Heilung_Ja_10_02 " );	// You only have a trivial scratch, and I have better things to do than talk to you.
	};
	AI_StopProcessInfos(self);
};

func void DIA_Constantino_Healing_No()
{
	AI_Output(other,self, " DIA_Constantino_Heilung_Nein_15_00 " );	// In general, no.
	AI_Output(self,other, " DIA_Constantino_Heilung_Nein_10_01 " );	// Then get lost or you'll really need medical attention.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Constantino_LestersKraeuter(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 5;
	condition = DIA_Addon_Constantino_LestersKraeuter_Condition;
	information = DIA_Addon_Constantino_LestersKraeuter_Info;
	description = " Do you buy herbs? " ;
};


func int DIA_Addon_Constantino_LestersKraeuter_Condition()
{
	if((MIS_Constantino_BringHerbs == 0) && (MIS_Addon_Lester_PickForConstantino != 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Constantino_LestersKraeuter_Info()
{
	AI_Output(other,self, " DIA_Addon_Constantino_LestersKraeuter_15_00 " );	// Do you buy herbs?
	AI_Output(self,other, " DIA_Addon_Constantino_LestersKraeuter_10_01 " );	// Well, if you have something to offer...
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Constantino_Trade(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 700;
	condition = DIA_Constantino_Trade_Condition;
	information = DIA_Constantino_Trade_Info;
	permanent = TRUE;
	description = " Show me your products. " ;
	trade = TRUE;
};

func int DIA_Constantino_Trade_Condition()
{
	if (Wld_IsTime( 8 , 0 , 13 , 0 ) || Wld_IsTime( 16 , 0 , 22 , 0 ) )
	{
		return TRUE;
	};
};

func void DIA_Constantino_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Constantino_Trade_15_00 " );	// Show me your products.

	if(Constantino_Logpatch1 == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader, " Constantino sells alchemy goods. " );
		Constantino_Logpatch1 = TRUE;
	};
	if((Player_IsApprentice == APP_Constantino) && (APP_CONSTANTINO_TR == FALSE))
	{
		CreateInvItems(self,ItPl_Dex_Herb_01,1);
		CreateInvItems(self,ItPl_Strength_Herb_01,1);
		CreateInvItems(self,ItPl_Speed_Herb_01,10);
		CreateInvItems(self,ItPl_Blueplant,15);
		CreateInvItems(self,ItPl_Perm_Herb,1);
		APP_CONSTANTINO_TR = TRUE;
	};
	if(Npc_HasItems(self,itpo_anpois) >= 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	CreateInvItems(self,ItMi_Flask,5);
	B_GiveTradeInv(self);
};


instances of DIA_Constantino_BeiDir (C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_BeiDir_Condition;
	information = DIA_Constantino_BeiDir_Info;
	permanent = FALSE;
	description = " I want to be your student. " ;
};


func int DIA_Constantino_BeiDir_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_AboutLehrling) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_BeiDir_Info()
{
	AI_Output(other,self, " DIA_Constantino_BeiDir_15_00 " );	// I want to be your student.
	AI_Output(self,other, " DIA_Constantino_BeiDir_10_01 " );	// MY? Not! I've had the dubious pleasure of taking on an apprentice. I've had enough.
	AI_Output(self,other, " DIA_Constantino_BeiDir_10_02 " );	// I spent a few years training him, and then this idiot went and poisoned himself.
	AI_Output(self,other, " DIA_Constantino_BeiDir_10_03 " );	// Better go and ask to be an apprentice to another master!
};


instance DIA_Constantino_CONSENT (C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_SUSTIMMUNG_Condition;
	information = DIA_Constantino_APPROVAL_Info;
	permanent = TRUE;
	description = " I want to become an apprentice of one of the other masters. " ;
};


func int DIA_Constantino_APPROVAL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_AboutLehrling) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_CONSENT_Info()
{
	AI_Output(other,self, " DIA_Constantino_ZUSTIMMUNG_15_00 " );	// I want to become a student of one of the other masters.
	AI_Output(self,other, " DIA_Constantino_ZUSTIMMUNG_10_01 " );	// Did you come to get my approval?

	if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
	{
		AI_Output(self,other, " DIA_Constantino_ZUSTIMMUNG_10_02 " );	// Hmm - in my opinion, you can become a student of any master.
	}
	else
	{
		AI_Output(self,other, " DIA_Constantino_ZUSTIMMUNG_10_03 " );	// You won't get it! What I've heard about you doesn't speak in your favor.
		AI_Output(self,other, " DIA_Constantino_ZUSTIMMUNG_10_04 " );	// I won't vote for a criminal like you to have a respected position in this city.
		AI_Output(self,other, " DIA_Constantino_ZUSTIMMUNG_10_05 " );	// Until you settle this matter with the commander of the city guard, my answer is no!
	};
	if(Constantino_Logpatch2 == FALSE)
	{
		Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
		B_LogEntry(TOPIC_Lehrling, " Constantino will give me his approval if I'm not charged with any crime in the city. " );
		Constantino_Logpatch2 = TRUE;
		B_GivePlayerXP(50);
	};
};


instance DIA_Constantino_BringHerbs(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_BringHerbs_Condition;
	information = DIA_Constantino_BringHerbs_Info;
	permanent = FALSE;
	description = " What do I need to do to become YOUR student? " ;
};


func int DIA_Constantino_BringHerbs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_BeiDir) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_BringHerbs_Info()
{
	AI_Output(other,self, " DIA_Constantino_BringHerbs_15_00 " );	// What do I need to do to become YOUR student?
	AI_Output(self,other, " DIA_Constantino_BringHerbs_10_01 " );	// (sighs) I can't stand it if ONE MORE dilettante is on my conscience.
	AI_Output(self,other, " DIA_Constantino_BringHerbs_10_02 " );	// Many herbs are used in alchemy. In various combinations, they give a variety of effects.
	AI_Output(self,other, " DIA_Constantino_BringHerbs_10_03 " );	// You've probably never even heard of half of these herbs.
	AI_Output(self,other, " DIA_Constantino_BringHerbs_10_04 " );	// (sighs) Here is a list of the most important plants.
	B_GiveInvItems(self,other,ItWr_Kraeuterliste,1);
	AI_Output(self,other, " DIA_Constantino_BringHerbs_10_05 " );	// Bring me one plant of each kind, and maybe I'll change my mind about the student.
	MIS_Constantino_BringHerbs = LOG_Running;
	Log_CreateTopic(TOPIC_ConstantinoPlants,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ConstantinoPlants,LOG_Running);
	B_LogEntry(TOPIC_ConstantinoPlants, " Constantino wants one of each plant or he won't accept me as a student. " );
};

instance DIA_Constantino_LostKey(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_LostKey_Condition;
	information = DIA_Constantino_LostKey_Info;
	permanent = FALSE;
	description = " You look a little upset. " ;
};

func int DIA_Constantino_LostKey_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Constantino_LestersKraeuter ) ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Constantino_LostKey_Info()
{
	AI_Output(other,self, " DIA_Constantino_LostKey_01_01 " );	// You look a little upset.
	AI_Output(self,other, " DIA_Constantino_LostKey_01_02 " );	// Still... (grouchily) There is something!
	AI_Output(other,self, " DIA_Constantino_LostKey_01_03 " );	// What happened?
	AI_Output(self,other, " DIA_Constantino_LostKey_01_04 " );	// Eh... (scratches the back of his head) On my last walk out of town, I somehow managed to lose my chest key. And now I don't even know what to do.
	AI_Output(other,self, " DIA_Constantino_LostKey_01_06 " );	// Well, maybe Torben can help you? He seems to be good at locks.
	AI_Output(self,other, " DIA_Constantino_LostKey_01_07 " );	// I already asked him about it. But he just shook his head and said that he was unlikely to be able to help me.
	AI_Output(other,self, " DIA_Constantino_LostKey_01_08 " );	// Where did you last walk?
	AI_Output(self,other, " DIA_Constantino_LostKey_01_09 " );	// It's none of your business, boy... (grouchily) Especially since I already looked there! But I still couldn't find the key.
	MIS_Constantino_LostKey = LOG_Running;
	Log_CreateTopic(TOPIC_Constantino_LostKey,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Constantino_LostKey,LOG_Running);
	B_LogEntry(TOPIC_Constantino_LostKey, " During his walk outside the city, Constantino lost the key to the chest. However, he did not say where he was then. " );
};

instance DIA_Constantino_LostKeyDone(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_LostKeyDone_Condition;
	information = DIA_Constantino_LostKeyDone_Info;
	permanent = FALSE;
	description = " I found your key. " ;
};

func int DIA_Constantino_LostKeyDone_Condition()
{
	if((MIS_Constantino_LostKey == LOG_Running) && (Npc_HasItems(other,ItKe_Constantino) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Constantino_LostKeyDone_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Constantino_LostKeyDone_01_01 " );	// I found your key.
	AI_Output(self,other,"DIA_Constantino_LostKeyDone_01_02");	//Неужели?!
	AI_Output(other,self, " DIA_Constantino_LostKeyDone_01_03 " );	// Here, look.
	B_GiveInvItems(other,self,ItKe_Constantino,1);
	Npc_RemoveInvItems(self,ItKe_Constantino,1);
	AI_Output(self,other, " DIA_Constantino_LostKeyDone_01_04 " );	// Yes, that's him... (suspiciously) And where did you find him?
	AI_Output(other,self, " DIA_Constantino_LostKeyDone_01_05 " );	// On the edge near the eastern gates of the city.
	AI_Output(self,other, " DIA_Constantino_LostKeyDone_01_06 " );	// (chuckling) Yes, you could have found it there. Well, then I should thank you for your help.
	AI_Output(self,other, " DIA_Constantino_LostKeyDone_01_08 " );	// Here, have this drink. Such things are valued much more than gold. I hope you understand this.

	if((Player_IsApprentice == APP_Constantino) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NDM) || (other.guild == GIL_NDW) || (other.guild == GIL_NOV))
	{
		B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	}
	else
	{
		if(other.attribute[ATR_DEXTERITY] > other.attribute[ATR_STRENGTH])
		{
			B_GiveInvItems(self,other,ItPo_Perm_Dex,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItPo_Perm_Str,1);
		};
	};

	AI_Output(other,self,"DIA_Constantino_LostKeyDone_01_11");	//Конечно.
	MIS_Constantino_LostKey = LOG_Success;
	Log_SetTopicStatus(TOPIC_Constantino_LostKey,LOG_Success);
	B_LogEntry(TOPIC_Constantino_LostKey, " I returned Constantino his key. " );
};

instance DIA_Constantino_HerbsRunning(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_HerbsRunning_Condition;
	information = DIA_Constantino_HerbsRunning_Info;
	permanent = TRUE;
	description = "Насчет растений...";
};

func int DIA_Constantino_HerbsRunning_Condition()
{
	if(MIS_Constantino_BringHerbs == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Constantino_HerbsRunning_Info()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_15_00");	//Насчет растений...
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_10_01");	//Если ты не можешь выполнить это задание самостоятельно, из тебя не получится хорошего алхимика!
	Info_ClearChoices(DIA_Constantino_HerbsRunning);
	Info_AddChoice(DIA_Constantino_HerbsRunning,"Понимаю.",DIA_Constantino_HerbsRunning_Running);
	if((Npc_HasItems(other,ItPl_Mana_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Mana_Herb_02) > 0) && (Npc_HasItems(other,ItPl_Mana_Herb_03) > 0) && (Npc_HasItems(other,ItPl_Health_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Health_Herb_02) > 0) && (Npc_HasItems(other,ItPl_Health_Herb_03) > 0) && (Npc_HasItems(other,ItPl_Dex_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Strength_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Speed_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Temp_Herb) > 0) && (Npc_HasItems(other,ItPl_Perm_Herb) > 0))
	{
		Info_AddChoice(DIA_Constantino_HerbsRunning,"Я принес все растения, что ты просил!",DIA_Constantino_HerbsRunning_Success);
	};
};

func void DIA_Constantino_HerbsRunning_Success()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Success_15_00");	//Я принес все растения, что ты просил!
	AI_Output(self,other, " DIA_Constantino_HerbsRunning_Success_10_01 " );	// What? You're trying to fool me, right?
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_02,1);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_03,1);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_02,1);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_03,1);
	Npc_RemoveInvItems(other,ItPl_Dex_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Strength_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Speed_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Temp_Herb,1);
	Npc_RemoveInvItems(other,ItPl_Perm_Herb,1);
	Npc_RemoveInvItems(other,ItWr_Kraeuterliste,1);
	CreateInvItems(self,ItPl_Perm_Herb,1);
	AI_Output(self,other, " DIA_Constantino_HerbsRunning_Success_10_02 " );	// I swear by Adanos! They are all here, in front of my eyes!
	AI_Output(self,other, " DIA_Constantino_HerbsRunning_Success_10_03 " );	// Who knows, maybe one day you'll actually make a decent alchemist.
	MIS_Constantino_BringHerbs = LOG_SUCCESS;
	B_GivePlayerXP(XP_Constantino_Herbs);
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling, " Constantino will accept me as an apprentice if the other masters don't mind. " );
	Info_ClearChoices(DIA_Constantino_HerbsRunning);
};

func void DIA_Constantino_HerbsRunning_Running()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Running_15_00");	//Понимаю.
	Info_ClearChoices(DIA_Constantino_HerbsRunning);
};


var int Constantino_StartGuild;

instance DIA_Constantino_LEHRLING (C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_LEHRLING_Condition;
	information = DIA_Constantino_LEHRLING_Info;
	permanent = TRUE;
	description = " Can I be your student now? " ;
};

func int DIA_Constantino_LEHRLING_Condition()
{
	if((MIS_Constantino_BringHerbs == LOG_SUCCESS) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_LEHRLING_Info()
{
	var int vote;
	vote = 0 ;
	AI_Output(other,self, " DIA_Constantino_LEHRLING_15_00 " );	// Can I become your student now?

	if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
	{
		AI_Output(self,other, " DIA_Constantino_LEHRLING_10_01 " );	// As for my opinion - yes.
		vote = vote +  1 ;
		if (Harad.aivar[AIV_TalkedToPlayer] ==  TRUE )
		{
			AI_Output(self,other, " DIA_Constantino_LEHRLING_10_02 " );	// Harad only cares that you are able to defend the city in the event of an orc attack.
			if((MIS_Harad_Orc == LOG_SUCCESS) || (MIS_HakonBandits == LOG_SUCCESS))
			{
				AI_Output(self,other, " DIA_Constantino_LEHRLING_10_03 " );	// And it looks like you were able to convince him of this.
				vote = vote +  1 ;
			}
			else
			{
				AI_Output(self,other, " DIA_Constantino_LEHRLING_10_04 " );	// But he thinks you're a coward.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Constantino_LEHRLING_10_05 " );	// But Harad claims he never saw you.
		};
		if (Bosper.aivar[AIV_TalkedToPlayer] ==  TRUE )
		{
			AI_Output(self,other, " DIA_Constantino_LEHRLING_10_06 " );	// Bosper was very reluctant to speak of your abilities.
			AI_Output(self,other, " DIA_Constantino_LEHRLING_10_07 " );	// I suppose he would like to take you on as an apprentice himself.
			if ((MIS_Bosper_Bogen ==  LOG_SUCCESS ) || (MIS_Bosper_WolfFurs ==  LOG_SUCCESS ))
			{
				AI_Output(self,other, " DIA_Constantino_LEHRLING_10_08 " );	// But still, in the end, he agreed.
				vote = vote +  1 ;
			}
			else
			{
				AI_Output(self,other, " DIA_Constantino_LEHRLING_10_09 " );	// Denying someone's approval for this reason is definitely unworthy of a true master!
				AI_Output(self,other, " DIA_Constantino_LEHRLING_10_10 " );	// But if all the other masters agree, you won't need his vote.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Constantino_LEHRLING_10_11 " );	// And Bosper hasn't seen you yet.
		};
		if (Thorben.aivar[AIV_TalkedToPlayer] ==  TRUE )
		{
			AI_Output(self,other, " DIA_Constantino_LEHRLING_10_12 " );	// Torben is a very religious person.
			if(MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self,other, " DIA_Constantino_LEHRLING_10_13 " );	// He gave you his blessing. This is a good sign.
				vote = vote +  1 ;
			}
			else
			{
				AI_Output(self,other, " DIA_Constantino_LEHRLING_10_14 " );	// He will only give his approval with the blessing of the gods.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Constantino_LEHRLING_10_15 " );	// Torben doesn't know who you are.
		};
		if (Matteo.aivar[AIV_TalkedToPlayer] ==  TRUE )
		{
			if(MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self,other, " DIA_Constantino_LEHRLING_10_16 " );	// As for Matteo - he praises you on every corner.
				vote = vote +  1 ;
			}
			else if(MIS_Matteo_Gold == LOG_Running)
			{
				AI_Output(self,other, " DIA_Constantino_LEHRLING_10_17 " );	// Matteo says you owe him something. If you want to get his vote, you'd better solve this little problem with him.
			}
			else
			{
				AI_Output(self,other, " DIA_Constantino_LEHRLING_10_18 " );	// Matteo says he hasn't talked to you about this yet.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Constantino_LEHRLING_10_19 " );	// Matteo says he never saw you in his shop.
		};
		if (vote >=  4 )
		{
			if (vote ==  5 )
			{
				AI_Output(self,other, " DIA_Constantino_LEHRLING_10_20 " );	// This means that you have received the approval of all the masters!
			}
			else
			{
				AI_Output(self,other, " DIA_Constantino_LEHRLING_10_21 " );	// You now have the approval of the four masters. This is enough to be accepted as a student.
			};
			AI_Output(self,other, " DIA_Constantino_LEHRLING_10_22 " );	// Are you ready to start learning from me?
			Info_ClearChoices(DIA_Constantino_LEHRLING);
			Info_AddChoice(DIA_Constantino_LEHRLING, " I need to think first. " ,DIA_Constantino_LEHRLING_Later);
			Info_AddChoice(DIA_Constantino_LEHRLING, " Yes master. " ,DIA_Constantino_LEHRLING_Yes);
		}
		else
		{
			AI_Output(self,other, " DIA_Constantino_LEHRLING_10_23 " );	// To become an apprentice in the lower city, you need to get the approval of at least four masters.
			AI_Output(self,other, " DIA_Constantino_LEHRLING_10_24 " );	// This means you have to talk to everyone who hasn't voted for you yet.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Constantino_LEHRLING_10_25 " );	// (angrily) No way! I have heard rumors that you are accused of a crime here in Khorinis!
		AI_Output(self,other, " DIA_Constantino_LEHRLING_10_26 " );	// I won't take you on as an apprentice until you've settled this matter with the commander of the city guard.
	};
};

func void DIA_Constantino_LEHRLING_Yes()
{
	B_GivePlayerXP(XP_apprentice);
	AI_Output(other,self, " DIA_Constantino_LEHRLING_Yes_15_00 " );	// Yes, master.
	AI_Output(self,other, " DIA_Constantino_LEHRLING_Yes_10_01 " );	// (sighs) Good! I hope I don't regret this decision.
	AI_Output(self,other, " DIA_Constantino_LEHRLING_Yes_10_02 " );	// From now on, you can consider yourself my student.
	AI_Output(self,other, " DIA_Constantino_LEHRLING_Yes_10_05 " );	// Here, take these clothes - my apprentice must look neat.
	B_GiveInvItems(self,other,itar_alchemy_nov,1);
	AI_Output(self,other, " DIA_Constantino_LEHRLING_Yes_10_06 " );	// Better than the rags you're wearing.
	Player_IsApprentice = APP_Constantino;
	TalentCount_Alchemy[0] += 5;
	B_RaiseAttribute_Bonus(other,ATR_MANA_MAX,10);
	Npc_ExchangeRoutine(Lothar,"START");
	Constantino_StartGuild = other.guild;
	Constantino_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("alchemist",GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry_Quiet(Topic_Bonus, " Constantino has taken me on as his apprentice. Now I can get to the uptown. " );
	AI_Output(self,other, " DIA_Constantino_LEHRLING_Yes_10_03 " );	// And one more thing. As a sign that you are now my apprentice, I can teach you how to make some potions for free. But only one.
	AI_Output(self,other, " DIA_Constantino_LEHRLING_Yes_10_04 " );	// So, the choice is yours. What potion should I teach you how to make?
	Info_ClearChoices(DIA_Constantino_LEHRLING);

	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_LEHRLING, " Healing Essence . " ,dia_constantino_lehrling_heal);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_LEHRLING, " Essence of Mana. " ,dia_constantino_lehrling_mana);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_LEHRLING, " Speed ​​Drink. " ,dia_constantino_lehrling_speed);
	};
};

func void dia_constantino_lehrling_heal()
{
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_01 " );	// Good. First the basics.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_02 " );	// All potions are made from plants - they have different strengths.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_03 " );	// Plants use all their power to grow, and alchemy is about changing this power and directing it in the right direction.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_04 " );	// To make a potion on the alchemy table, you will need a laboratory test tube and alcohol.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_05 " );	// You must know the correct formula and have the right ingredients.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_06 " );	// I can teach you many of these formulas.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_07 " );	// Prepare potions that restore your lost strength, and even potions that affect your strength permanently.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_08 " );	// But you can't learn everything at once.
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher, " Constantino can teach me the art of alchemy. " );

	if(b_teachplayertalentalchemy_free(self,other,POTION_Health_01))
	{
		AI_Output(self,other, " DIA_Constantino_LEHRLING_90_00 " );	// Essence of Healing is the simplest of magical potions.
		AI_Output(self,other, " DIA_Constantino_LEHRLING_90_01 " );	// The ingredients for the healing essence are the medicinal plant and the seraphis.
	};
	Info_ClearChoices(DIA_Constantino_LEHRLING);
};

func void dia_constantino_lehrling_mana()
{
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_01 " );	// Good. First the basics.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_02 " );	// All potions are made from plants - they have different strengths.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_03 " );	// Plants use all their power to grow, and alchemy is about changing this power and directing it in the right direction.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_04 " );	// To make a potion on the alchemy table, you will need a laboratory test tube.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_05 " );	// You must know the correct formula and have the right ingredients.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_06 " );	// I can teach you many of these formulas.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_07 " );	// Prepare potions that restore your lost strength, and even potions that affect your strength permanently.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_08 " );	// But you can't learn everything at once.
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher, " Constantino can teach me the art of alchemy. " );

	if(b_teachplayertalentalchemy_free(self,other,POTION_Mana_01))
	{
		AI_Output(self,other, " DIA_Constantino_LEHRLING_90_02 " );	// Magic essence is the simplest of magic drinks.
		AI_Output(self,other, " DIA_Constantino_LEHRLING_90_03 " );	// The ingredients for the magical essence are fire nettle and meadow knotweed.
	};
	Info_ClearChoices(DIA_Constantino_LEHRLING);
};

func void dia_constantino_lehrling_speed()
{
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_01 " );	// Good. First the basics.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_02 " );	// All potions are made from plants - they have different strengths.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_03 " );	// Plants use all their power to grow, and alchemy is about changing this power and directing it in the right direction.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_04 " );	// To make a potion on the alchemy table, you will need a laboratory test tube.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_05 " );	// You must know the correct formula and have the right ingredients.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_06 " );	// I can teach you many of these formulas.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_07 " );	// Prepare potions that restore your lost strength, and even potions that affect your strength permanently.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_08 " );	// But you can't learn everything at once.
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher, " Constantino can teach me the art of alchemy. " );

	if(b_teachplayertalentalchemy_free(self,other,POTION_Speed))
	{
		AI_Output(self,other, " DIA_Constantino_LEHRLING_90_04 " );	// Drink of haste is the simplest of magical drinks.
		AI_Output(self,other, " DIA_Constantino_LEHRLING_90_05 " );	// The ingredients for the boost drink are snapper grass and meadow knotweed.
	};
	Info_ClearChoices(DIA_Constantino_LEHRLING);
};

func void DIA_Constantino_LEHRLING_Later()
{
	AI_Output(other,self, " DIA_Constantino_LEHRLING_Later_15_00 " );	// I need to think first.
	AI_Output(self,other, " DIA_Constantino_LEHRLING_Later_10_01 " );	// Good! If you cannot give your heart to this cause, you better choose another profession.
	Info_ClearChoices(DIA_Constantino_LEHRLING);
};

var int Constantino_MILKomment;
var int Constantino_INNOSComment;
var int Constantino_KDWKommentar;
var int Constantino_SEKComment;
var int Constantino_KDMComment;

instance DIA_Constantino_AlsLehrling(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_AlsLehrling_Condition;
	information = DIA_Constantino_AlsLehrling_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Constantino_AlsLehrling_Condition()
{
	if((Player_IsApprentice == APP_Constantino) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Constantino_AlsLehrling_Info()
{
	if(B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output(self,other, " DIA_Constantino_AlsLehrling_10_00 " );	// (angrily) I refuse to train you while you're accused of a crime in the city.
		AI_Output(self,other, " DIA_Constantino_AlsLehrling_10_01 " );	// Go to Lord Andre and settle this matter with him.
		Constantino_Lehrling_Day = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	else  if ((other.guild ==  GIL_MIL ) && (Constantine_StartGuild !=  GIL_MIL ) && (Constantine_MILComment ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Constantino_AlsLehrling_10_02 " );	// So you joined the militia? I already heard about it.
		AI_Output(self,other, " DIA_Constantino_AlsLehrling_10_03 " );	// You were in such a hurry to become an apprentice, and then just like that, you joined the militia? But I won't give you credit for that.
		AI_Output(self,other, " DIA_Constantino_AlsLehrling_10_04 " );	// I expect you to strictly adhere to our agreement, and bring me plants and mushrooms regularly.
		AI_Output(self,other, " DIA_Constantino_AlsLehrling_10_05 " );	// If it's too hard for you to work two jobs at the same time, you'll just have to sleep less!
		Constantino_MILKommentar = TRUE ;
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	else  if (((other.guild ==  GIL_NOV ) || (other.guild ==  GIL_KDF ) || (other.guild ==  GIL_PAL )) && (Constantine_StartGuild !=  GIL_NOV ) && (Constantine_StartGuild !=  GIL_KDF ) && (Constantine_StartGuild !=  GIL_PAL ) && (Constantino_INNOSCcomment ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Constantino_AlsLehrling_10_06 " );	// I see you entered the service of Innos. I guess that means you won't be able to devote much attention to gathering herbs for the old man from now on.
		AI_Output(self,other, " DIA_Constantino_AlsLehrling_10_07 " );	// Still, I would be honored to support you on your path.
		AI_Output(self,other, " DIA_Constantino_AlsLehrling_10_08 " );	// And if, despite your new responsibilities, you find time to practice alchemy, you can always count on a warm welcome here.
		Constantino_INNOSKommentar = TRUE;
	}
	else  if ((other.guild ==  GIL_KDW ) && (Constantine_KDWComment ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Constantino_AlsLehrling_10_13 " );	// The circle of followers of Adanos is very narrow, at least on Khorinis. I think that the magicians who enter it have rare and valuable knowledge, including in the field of alchemy (thoughtfully).
		AI_Output(self,other, " DIA_Constantino_AlsLehrling_10_14 " );	// (hardening) But don't forget that you are still MY student. Even if now you are the lord of the water element, you should not shy away from the search for mushrooms.
		AI_Output(self,other, " DIA_Constantino_AlsLehrling_10_15 " );	// And yes, forest hummocks and protruding roots are rumored to be easily overcome by a magician, one has only to lift the hem of the mantle.

		Constantino_KDWKommentar = TRUE;
	}
	else if((Constantino_SEKKommentar == FALSE) && ((other.guild == GIL_TPL) || (other.guild == GIL_GUR) || (other.guild == GIL_SEK)))
	{
		AI_Output(self,other, " DIA_Constantino_AlsLehrling_10_16 " );	// You joined this sect. I can't believe! I thought that my student is an example of sanity. I thought...

		if(other.guild == GIL_TPL)
		{
			AI_Output(self,other, " DIA_Constantino_AlsLehrling_10_17 " );	// Cultists are said to train their guards rigorously. See that the head is not beaten off. Although, you should only have enough brains for two things: to drag mushrooms here, and not to drag swamp grass here!
		};

		Constantino_SEKKommentar = TRUE;
	}
	else  if ((Constantine_KDMComment ==  FALSE ) && ((other.guild ==  GIL_KDM ) || (other.guild ==  GIL_NDM )))
	{
		AI_Output(self,other, " DIA_Constantino_AlsLehrling_10_18 " );	// Every alchemist once dabbled in necromancy. Played around, do you hear? Don't go too far. And it’s better not to walk around in a mantle, otherwise you never know. Society does not honor such people.
		AI_Output(self,other, " DIA_Constantino_AlsLehrling_10_19 " );	// I, as before, need mushrooms and it doesn't matter to me who brings them, a necromancer or a port courtesan. So keep looking.
		Constantino_KDMKommentar = TRUE;
	}
	else  if ((Constantino_Lehrling_Day <= (Wld_GetDay() -  4 )) && (Constantino_INNOSKComment ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Constantino_AlsLehrling_10_09 " );	// Where have you been?
		AI_Output(self,other, " DIA_Constantino_AlsLehrling_10_10 " );	// I expect more diligence from my student. It's no good that you show up here once a month!
		AI_Output(self,other, " DIA_Constantino_AlsLehrling_10_11 " );	// Did you at least bring me some mushrooms?
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_12");	//Опять ты...
		Constantino_Lehrling_Day = Wld_GetDay();
	};
};


instance DIA_Constantino_Tasks (C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Aufgaben_Condition;
	information = DIA_Constantino_Tasks_Info;
	permanent = FALSE;
	description = " What are my tasks? " ;
};


func int DIA_Constantino_Aufgaben_Condition()
{
	if(Player_IsApprentice == APP_Constantino)
	{
		return TRUE;
	};
};

func void DIA_Constantino_Tasks_Info()
{
	AI_Output(other,self, " DIA_Constantino_Aufgaben_15_00 " );	// What are my tasks?
	AI_Output(self,other, " DIA_Constantino_Aufgaben_10_01 " );	// I understand that I cannot expect from a young man that he will spend days on end with me in this closet.
	AI_Output(self,other, " DIA_Constantino_Aufgaben_10_02 " );	// From time to time you should bring plants that I need. In return, I will teach you the art of alchemy.
	AI_Output(self,other, " DIA_Constantino_Aufgaben_10_03 " );	// You can buy vials from me. But most of the ingredients, however, you have to get yourself.
	AI_Output(self,other, " DIA_Constantino_Aufgaben_10_04 " );	// And I expect you to act like a good citizen of this city.
};


instance DIA_Constantino_Mushrooms(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Mushrooms_Condition;
	information = DIA_Constantino_Mushrooms_Info;
	permanent = FALSE;
	description = " What plants should I bring? " ;
};


func int DIA_Constantino_Mushrooms_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Constantino_Delivery ))
	{
		return TRUE;
	};
};

func void DIA_Constantino_Mushrooms_Info()
{
	AI_Output(other,self, " DIA_Constantino_Mushrooms_15_00 " );	// What plants should I bring?
	AI_Output(self,other, " DIA_Constantino_Mushrooms_10_01 " );	// I'll buy whatever you bring me - and I'll pay the regular price.
	AI_Output(self,other, " DIA_Constantino_Mushrooms_10_02 " );	// But as for mushrooms, herbs, and some hunting trophies, I have a special price for them.
	MIS_Constantino_Mushrooms = LOG_Running;
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus, " I can sell mushrooms, herbs, wings, stingers, claws, and Constantino's mandibles for a very good price. " );
};


instance DIA_Constantino_MushroomsRunning(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_MushroomsRunning_Condition;
	information = DIA_Constantino_MushroomsRunning_Info;
	permanent = TRUE;
	description = " About the things you are interested in... " ;
};

func int DIA_Constantino_MushroomsRunning_Condition()
{
	if(MIS_Constantino_Mushrooms == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Constantino_MushroomsRunning_Info()
{
	AI_Output(other,self, " DIA_Constantino_MushroomsRunning_15_00 " );	// About things that interest you...
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	Info_AddChoice(DIA_Constantino_MushroomsRunning,"Позже...",DIA_Constantino_MushroomsRunning_Later);

	if(Player_IsApprentice == APP_Constantino)
	{
		if((Npc_HasItems(other,ItPo_Perm_Stamina) > 0) || (Npc_HasItems(other,ItPo_Perm_Mana) > 0) || (Npc_HasItems(other,ItPo_Perm_Health) > 0) || (Npc_HasItems(other,ItPo_Perm_Dex) > 0) || (Npc_HasItems(other,ItPo_Perm_STR) > 0))
		{
			Info_AddChoice(DIA_Constantino_MushroomsRunning, " I brought magic elixirs. " ,dia_constantino_mushroomsrunning_sell_perm_potion);
		};
		if((Npc_HasItems(other,ItPl_Mana_Herb_03) > 0) || (Npc_HasItems(other,ItPl_Health_Herb_03) > 0) || (Npc_HasItems(other,ItPl_Dex_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Strength_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Speed_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Temp_Herb) > 0) || (Npc_HasItems(other,ItPl_Perm_Herb) > 0) || (Npc_HasItems(other,ITPL_SUPER_HERB) > 0))
		{
			Info_AddChoice(DIA_Constantino_MushroomsRunning, " I brought rare herbs. " ,dia_constantino_mushroomsrunning_sell_rare_plants);
		};
	};
	if((Npc_HasItems(other,ItPl_Health_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Health_Herb_02) > 0))
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " I brought medicinal herbs and plants. " ,dia_constantino_mushroomsrunning_sell_herb);
	};
	if((Npc_HasItems(other,ItPl_Mana_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Mana_Herb_02) > 0))
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " I brought fire grass and nettles. " ,dia_constantino_mushroomsrunning_sell_mana);
	};
	if((Npc_HasItems(other,ItAt_BugMandibles) > 0) || (Npc_HasItems(other,ItAt_CrawlerMandibles) > 0) || (Npc_HasItems(other,ItAt_SpiderMandibles) > 0))
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " I brought the mandibles. " ,dia_constantino_mushroomsrunning_sell_mand);
	};
	if(Npc_HasItems(other,ItAt_OreBugClaw) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " I brought the claws. " ,dia_constantino_mushroomsrunning_sell_claz);
	};
	if(Npc_HasItems(other,ItAt_Wing) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " I brought hornet wings. " ,dia_constantino_mushroomsrunning_sell_w);
	};
	if(Npc_HasItems(other,ItAt_Sting) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " I brought hornet stingers. " ,dia_constantino_mushroomsrunning_sell_st);
	};
	if((Npc_HasItems(other,ItPl_Mushroom_01) > 0) || (Npc_HasItems(other,ItPl_Mushroom_02) > 0))
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " I brought some mushrooms. " ,dia_constantino_mushroomsrunning_sell_1);
	};
	if((Npc_HasItems(other,ItAt_StoneGolemHeart) > 0) || (Npc_HasItems(other,ItAt_FireGolemHeart) > 0) || (Npc_HasItems(other,ItAt_IceGolemHeart) > 0) || (Npc_HasItems(other,ITAT_SWAMPGOLEMHEART) > 0))
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " I brought some golem hearts. " ,dia_constantino_mushroomsrunning_sell_heart);
	};
	if(Player_KnowsDunkelpilzBonus == FALSE)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Why are these mushrooms so important? " ,DIA_Constantino_MushroomsRunning_Why);
	};
};

func void dia_constantino_mushroomsrunning_sell_perm_potion()
{
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	Info_AddChoice(DIA_Constantino_MushroomsRunning, " I'm going to bring you some... " ,DIA_Constantino_MushroomsRunning_Later);

	if(Npc_HasItems(other,ItPo_Perm_STR) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Elixir of Strength (Cost: 750 gold) " ,dia_constantino_mushroomsrunning_sell_STR);
	};
	if(Npc_HasItems(other,ItPo_Perm_Dex) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Elixir of Agility (Cost: 750 gold) " ,dia_constantino_mushroomsrunning_sell_DEX);
	};
	if(Npc_HasItems(other,ItPo_Perm_Health) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Elixir of Life (Cost: 1000 gold) " ,dia_constantino_mushroomsrunning_sell_Health);
	};
	if(Npc_HasItems(other,ItPo_Perm_Mana) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Spirit Elixir (Cost: 1000 gold) " ,dia_constantino_mushroomsrunning_sell_Mans);
	};
	if(Npc_HasItems(other,ItPo_Perm_Stamina) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Elixir of Endurance (Price: 500 gold) " ,dia_constantino_mushroomsrunning_sell_STA);
	};
};

func void dia_constantino_mushroomsrunning_sell_STR()
{
	B_GiveInvItems(self,other,ItMi_Gold,750);
	Npc_RemoveInvItems(other,ItPo_Perm_STR,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_DEX()
{
	B_GiveInvItems(self,other,ItMi_Gold,750);
	Npc_RemoveInvItems(other,ItPo_Perm_Dex,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_Health()
{
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	Npc_RemoveInvItems(other,ItPo_Perm_Health,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_Mans()
{
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	Npc_RemoveInvItems(other,ItPo_Perm_Mana,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_STA()
{
	B_GiveInvItems(self,other,ItMi_Gold,500);
	Npc_RemoveInvItems(other,ItPo_Perm_Stamina,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_rare_plants()
{
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	Info_AddChoice(DIA_Constantino_MushroomsRunning, " I'm going to bring you some... " ,DIA_Constantino_MushroomsRunning_Later);

	if(Npc_HasItems(other,ItPl_Mana_Herb_03) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Fireroot (Cost: 20 gold) " ,dia_constantino_mushroomsrunning_sell_ManaRoot);
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_03) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Healing Root (Cost: 30 gold) " ,dia_constantino_mushroomsrunning_sell_HealthRoot);
	};
	if(Npc_HasItems(other,ItPl_Dex_Herb_01) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Goblin Berry (Price: 125 gold) " ,dia_constantino_mushroomsrunning_sell_DexHerb);
	};
	if(Npc_HasItems(other,ItPl_Strength_Herb_01) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Dragon Root (Price: 250 gold) " ,dia_constantino_mushroomsrunning_sell_StrHerb);
	};
	if(Npc_HasItems(other,ItPl_Speed_Herb_01) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Glorcha Herb (Price: 50 gold) " ,dia_constantino_mushroomsrunning_sell_SpeedHerb);
	};
	if(Npc_HasItems(other,ItPl_Temp_Herb) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Meadow Mountaineer (Cost: 10 gold) " ,dia_constantino_mushroomsrunning_sell_TempHerb);
	};
	if(Npc_HasItems(other,ItPl_Perm_Herb) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Royal Sorrel (Price: 250 gold) " ,dia_constantino_mushroomsrunning_sell_PermHerb);
	};
	if(Npc_HasItems(other,ITPL_SUPER_HERB) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Troll Cherries (Price: 250 gold) " ,dia_constantino_mushroomsrunning_sell_StaHerb);
	};
};

func void dia_constantino_mushroomsrunning_sell_ManaRoot()
{
	B_GiveInvItems(self,other,ItMi_Gold,20);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_03,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_HealthRoot()
{
	B_GiveInvItems(self,other,ItMi_Gold,30);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_03,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_DexHerb()
{
	B_GiveInvItems(self,other,ItMi_Gold,125);
	Npc_RemoveInvItems(other,ItPl_Dex_Herb_01,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_StrHerb()
{
	B_GiveInvItems(self,other,ItMi_Gold,250);
	Npc_RemoveInvItems(other,ItPl_Strength_Herb_01,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_SpeedHerb()
{
	B_GiveInvItems(self,other,ItMi_Gold,50);
	Npc_RemoveInvItems(other,ItPl_Speed_Herb_01,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_TempHerb()
{
	B_GiveInvItems(self,other,ItMi_Gold,10);
	Npc_RemoveInvItems(other,ItPl_Temp_Herb,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_PermHerb()
{
	B_GiveInvItems(self,other,ItMi_Gold,250);
	Npc_RemoveInvItems(other,ItPl_Perm_Herb,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_StaHerb()
{
	B_GiveInvItems(self,other,ItMi_Gold,250);
	Npc_RemoveInvItems(other,ITPL_SUPER_HERB,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_herb()
{
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	Info_AddChoice(DIA_Constantino_MushroomsRunning, " I'm going to bring you some... " ,DIA_Constantino_MushroomsRunning_Later);

	if(Npc_HasItems(other,ItPl_Health_Herb_02) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Healing Herb x1 (Price: 30 gold) " ,dia_constantino_mushroomsrunning_sell_herb_2);
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_02) >= 10)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Medicinal Herbs - 10 pcs (Price: 300 gold) " ,dia_constantino_mushroomsrunning_sell_herb_20);
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_02) >= 50)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Healing Herbs - 50 pcs (Price: 1500 gold) " ,dia_constantino_mushroomsrunning_sell_herb_50);
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_01) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Healing plants - 1 pcs. (Price: 15 gold) " ,dia_constantino_mushroomsrunning_sell_herb_1);
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_01) >= 10)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Healing plants - 10 pcs. (Price: 150 gold) " ,dia_constantino_mushroomsrunning_sell_herb_10);
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_01) >= 50)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Healing plants - 50 pcs (Price: 750 gold) " ,dia_constantino_mushroomsrunning_sell_herb_150);
	};
};

func void dia_constantino_mushroomsrunning_sell_herb_1()
{
	B_GiveInvItems(self,other,ItMi_Gold,15);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_01,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_herb_10()
{
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_01,10);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_herb_150()
{
	B_GiveInvItems(self,other,ItMi_Gold,750);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_01,50);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_herb_2()
{
	B_GiveInvItems(self,other,ItMi_Gold,30);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_02,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_herb_20()
{
	B_GiveInvItems(self,other,ItMi_Gold,300);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_02,10);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_herb_50()
{
	B_GiveInvItems(self,other,ItMi_Gold,1500);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_02,50);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_heart()
{
	was int man;

	mand = (Value_StoneGolemHeart * Npc_HasItems(other,ItAt_StoneGolemHeart)) + (VALUE_SWAMPGOLEMHEART * Npc_HasItems(other,ITAT_SWAMPGOLEMHEART)) + (Value_IceGolemHeart * Npc_HasItems(other,ItAt_IceGolemHeart)) + (Value_FireGolemHeart * Npc_HasItems(other,ItAt_FireGolemHeart));
	B_GiveInvItems(self,other,ItMi_Gold,mand);
	Npc_RemoveInvItems(other,ItAt_StoneGolemHeart,Npc_HasItems(other,ItAt_StoneGolemHeart));
	Npc_RemoveInvItems(other,ITAT_SWAMPGOLEMHEART,Npc_HasItems(other,ITAT_SWAMPGOLEMHEART));
	Npc_RemoveInvItems(other,ItAt_IceGolemHeart,Npc_HasItems(other,ItAt_IceGolemHeart));
	Npc_RemoveInvItems(other,ItAt_FireGolemHeart,Npc_HasItems(other,ItAt_FireGolemHeart));
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mand()
{
	was int man;
	var int mansp;
	be int hummand;

	mand = Npc_HasItems(other,ItAt_BugMandibles) + Npc_HasItems(other,ItAt_CrawlerMandibles);
	mandsp = Npc_HasItems(other,ItAt_SpiderMandibles);
	summman = (man *  12 ) + (mansp *  25 );
	B_GiveInvItems(self,other,ItMi_Gold,summmand);
	Npc_RemoveInvItems(other,ItAt_BugMandibles,Npc_HasItems(other,ItAt_BugMandibles));
	Npc_RemoveInvItems(other,ItAt_CrawlerMandibles,Npc_HasItems(other,ItAt_CrawlerMandibles));
	Npc_RemoveInvItems(other,ItAt_SpiderMandibles,Npc_HasItems(other,ItAt_SpiderMandibles));
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_w()
{
	B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_Wing) * 15);
	Npc_RemoveInvItems(other,ItAt_Wing,Npc_HasItems(other,ItAt_Wing));
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_claz()
{
	B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_OreBugClaw) * 10);
	Npc_RemoveInvItems(other,ItAt_OreBugClaw,Npc_HasItems(other,ItAt_OreBugClaw));
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_st()
{
	B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_Sting) * 20);
	Npc_RemoveInvItems(other,ItAt_Sting,Npc_HasItems(other,ItAt_Sting));
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mana()
{
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	Info_AddChoice(DIA_Constantino_MushroomsRunning, " I'm going to bring you some... " ,DIA_Constantino_MushroomsRunning_Later);
	if(Npc_HasItems(other,ItPl_Mana_Herb_02) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Fiery grass - 1 pcs (Price: 15 gold) " ,dia_constantino_mushroomsrunning_sell_mana_2);
	};
	if(Npc_HasItems(other,ItPl_Mana_Herb_02) >= 10)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Fiery grass - 10 pcs (Price: 150 gold) " ,dia_constantino_mushroomsrunning_sell_mana_20);
	};
	if(Npc_HasItems(other,ItPl_Mana_Herb_02) >= 50)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Fiery grass - 50 pcs (Price: 750 gold) " ,dia_constantino_mushroomsrunning_sell_mana_60);
	};
	if(Npc_HasItems(other,ItPl_Mana_Herb_01) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Fire Nettle x1 (Price: 7 gold) " ,dia_constantino_mushroomsrunning_sell_mana_1);
	};
	if(Npc_HasItems(other,ItPl_Mana_Herb_01) >= 10)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Fire Nettle x10 (Price: 70 gold) " ,dia_constantino_mushroomsrunning_sell_mana_10);
	};
	if(Npc_HasItems(other,ItPl_Mana_Herb_01) >= 50)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, " Fire Nettle x50 (Price: 350 gold) " ,dia_constantino_mushroomsrunning_sell_mana_50);
	};
};

func void dia_constantino_mushroomsrunning_sell_mana_1()
{
	B_GiveInvItems(self,other,ItMi_Gold,7);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_01,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mana_10()
{
	B_GiveInvItems(self,other,ItMi_Gold,70);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_01,10);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mana_50()
{
	B_GiveInvItems(self,other,ItMi_Gold,350);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_01,50);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mana_2()
{
	B_GiveInvItems(self,other,ItMi_Gold,15);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_02,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mana_20()
{
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_02,10);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mana_60()
{
	B_GiveInvItems(self,other,ItMi_Gold,750);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_02,50);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_1()
{
	var int Dark Mushroom_on;
	Dark Mushroom_included = FALSE ;
	if(Npc_HasItems(other,ItPl_Mushroom_01) > 0)
	{
		AI_Output(other,self, " DIA_Constantino_MushroomsRunning_Sell_15_00 " );	// I brought some black mushrooms...
		AI_Output(self,other, " DIA_Constantino_MushroomsRunning_Sell_10_01 " );	// Ah! These are the best mushrooms! Excellent! Here is your gold!
		Dark Mushroom_included = TRUE ;
		Constantino_DunkelpilzCounter = Constantino_DunkelpilzCounter + Npc_HasItems(other,ItPl_Mushroom_01);
		B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItPl_Mushroom_01) * 5);
		B_GiveInvItems(other,self,ItPl_Mushroom_01,Npc_HasItems(other,ItPl_Mushroom_01));
		Npc_RemoveInvItems(self,ItPl_Mushroom_01,Npc_HasItems(self,ItPl_Mushroom_01));
	};
	if(Npc_HasItems(other,ItPl_Mushroom_02) > 0)
	{
		if (dark mushroom_involved ==  TRUE )
		{
			AI_Output(other,self, " DIA_Constantino_MushroomsRunning_Sell_15_02 " );	// Here are some more...
		}
		else
		{
			AI_Output(other,self, " DIA_Constantino_MushroomsRunning_Sell_15_03 " );	// I have some mushrooms here!
		};
		AI_Output(self,other, " DIA_Constantino_MushroomsRunning_Sell_10_04 " );	// These aren't as good as black mushrooms, but I'll take them anyway.
		B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItPl_Mushroom_02) * 10);
		B_GiveInvItems(other,self,ItPl_Mushroom_02,Npc_HasItems(other,ItPl_Mushroom_02));
		Npc_RemoveInvItems(self,ItPl_Mushroom_02,Npc_HasItems(self,ItPl_Mushroom_02));
	};
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void DIA_Constantino_MushroomsRunning_Why()
{
	AI_Output(other,self, " DIA_Constantino_MushroomsRunning_Why_15_00 " );	// Why are these mushrooms so important?

	if(Constantino_DunkelpilzCounter == 0)
	{
		AI_Output(self,other, " DIA_Constantino_MushroomsRunning_Why_10_01 " );	// Even though you're my student, I can't tell you everything.
	}
	else if(Constantino_DunkelpilzCounter >= 50)
	{
		AI_Output(self,other, " DIA_Constantino_MushroomsRunning_Why_10_02 " );	// Okay, I'll tell you anyway. But you must keep it a secret!
		AI_Output(self,other, " DIA_Constantino_MushroomsRunning_Why_10_03 " );	// Black mushrooms are full of magical energy. And every time you eat such a mushroom, a little of this energy is accumulated in your body.
		AI_Output(self,other, " DIA_Constantino_MushroomsRunning_Why_10_04 " );	// And when you eat enough of these mushrooms, your magical energy will increase.
		AI_Output(self,other, " DIA_Constantino_MushroomsRunning_Why_10_05 " );	// And if I had told you this before, you would have eaten all those mushrooms yourself. Is not it so?
		AI_Output(self,other, " DIA_Constantino_MushroomsRunning_Why_10_06 " );	// It is because of this that these mushrooms are of such great value to me. Are you happy with the answer?
		Player_KnowsDunkelpilzBonus = TRUE;
		Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	}
	else
	{
		AI_Output(self,other, " DIA_Constantino_MushroomsRunning_Why_10_08 " );   // You already asked me this!
	};
};

func void DIA_Constantino_MushroomsRunning_Later()
{
	AI_Output(other,self, " DIA_Constantino_MushroomsRunning_Later_15_00 " );	// I'm going to bring them to you...
	AI_Output(self,other, " DIA_Constantino_MushroomsRunning_Later_10_01 " );	// Great! Bring me everything you can find...
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

instance DIA_Constantino_Alchemy(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Alchemy_Condition;
	information = DIA_Constantino_Alchemy_Info;
	permanent = FALSE;
	description = " Teach me the art of alchemy! " ;
};

func int DIA_Constantino_Alchemy_Condition()
{
	if(Player_IsApprentice == APP_Constantino)
	{
		if(Constantino_TeachAlchemy == TRUE)
		{
			return  FALSE ;
		};

		return TRUE;
	};
};

func void DIA_Constantino_Alchemy_Info()
{
	AI_Output(other,self, " DIA_Constantino_Alchemy_15_00 " );	// Teach me the art of alchemy!
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_01 " );	// Good. First the basics.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_02 " );	// All potions are made from plants - they have different strengths.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_03 " );	// They do nothing but grow at full strength, and the art of alchemy is to change that strength.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_04 " );	// To make a potion on the alchemy table, you will need a laboratory test tube.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_05 " );	// You must know the correct recipe and what ingredients are needed.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_06 " );	// There are a number of recipes I can teach you.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_07 " );	// Sources that will restore your lost power and forever change your current power.
	AI_Output(self,other, " DIA_Constantino_Alchemy_10_08 " );	// You can't learn everything at once. So think carefully about what you want to learn.

	if((MIS_MyBrew == FALSE) && (MIS_Serpentes_BringSalandril_SLD != LOG_SUCCESS))
	{
		AI_Output(self,other, " DIA_Constantino_Alchemy_10_09 " );	// However, before we get started, I want you to do something for me.
		AI_Output(other,self, " DIA_Constantino_Alchemy_10_10 " );	// What exactly?
		AI_Output(self,other, " DIA_Constantino_Alchemy_10_11 " );	// You will have to prepare one easy magic potion for me.
		AI_Output(self,other, " DIA_Constantino_Alchemy_10_12 " );	// Its composition is quite simple. But the elixir itself has one very interesting effect. Here, take this recipe.
		B_GiveInvItems(self,other,ItWr_ConstRecept,1);
		AI_Output(self,other, " DIA_Constantino_Alchemy_10_14 " );	// Once you've brewed it, return to me and we'll begin your training in the art of alchemy right away.
		MIS_MyBrew = LOG_Running;
		Log_CreateTopic(TOPIC_MyBrew,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MyBrew,LOG_Running);
		B_LogEntry(TOPIC_MyBrew, " Constantino will teach me the art of alchemy, but first he wants me to try brewing one potion myself. He gave me a detailed recipe. " );
	}
	else
	{
		Constantino_TeachAlchemy = TRUE;
	};
};

instance DIA_Constantino_NewRecipes(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_NewRecipes_Condition;
	information = DIA_Constantino_NewRecipes_Info;
	permanent = FALSE;
	description = " I want to learn new potion recipes. " ;
};

func int DIA_Constantino_NewRecipes_Condition()
{
	if((Player_IsApprentice != APP_Constantino) && (Player_IsApprentice > APP_NONE) && (Npc_GetTalentSkill(other,NPC_TALENT_ALCHEMY) > 0))
	{
		return TRUE;
	};
};

func void DIA_Constantino_NewRecipes_Info()
{
	AI_Output(other,self, " DIA_Constantino_NewRecipes_15_00 " );	// I want to learn new potion recipes.
	AI_Output(self,other, " DIA_Constantino_NewRecipes_10_01 " );	// Do you have any experience with alchemy?
	AI_Output(other, self, " DIA_Constantino_NewRecipes_15_02 " );	// Yes, there is.
	AI_Output(self,other, " DIA_Constantino_NewRecipes_10_03 " );	// And you're still alive... that's not a bad sign.
	AI_Output(self,other, " DIA_Constantino_NewRecipes_10_04 " );	// I think I can show you some recipes. But it depends, of course, on what you want to know.

	if((MIS_MyBrew == FALSE) && (MIS_Serpentes_BringSalandril_SLD != LOG_SUCCESS))
	{
		AI_Output(self,other, " DIA_Constantino_NewRecipes_10_05 " );	// However, before we get started, I want you to do something for me.
		AI_Output(other,self, " DIA_Constantino_NewRecipes_10_06 " );	// What exactly?
		AI_Output(self,other, " DIA_Constantino_NewRecipes_10_07 " );	// You will have to prepare one easy magic potion for me.
		AI_Output(self,other, " DIA_Constantino_NewRecipes_10_08 " );	// Its composition is quite simple. But the elixir itself has one very interesting effect. Here, take this recipe.
		B_GiveInvItems(self,other,ItWr_ConstRecept,1);
		AI_Output(self,other, " DIA_Constantino_NewRecipes_10_10 " );	// Once you've brewed it, return to me and we'll begin your training in the art of alchemy right away.
		MIS_MyBrew = LOG_Running;
		Log_CreateTopic(TOPIC_MyBrew,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MyBrew,LOG_Running);
		B_LogEntry(TOPIC_MyBrew, " Constantino will teach me the art of alchemy, but first he wants me to try brewing one potion myself. He gave me a detailed recipe. " );
	}
	else
	{
		Constantino_TeachAlchemy = TRUE;
	};
};

instance DIA_Constantino_TEACH(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_TEACH_Condition;
	information = DIA_Constantino_TEACH_Info;
	permanent = TRUE;
	description = " What recipes can you teach me? " ;
};

func int DIA_Constantino_TEACH_Condition()
{
	if(Constantino_TeachAlchemy == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Constantino_TEACH_Info()
{
	AI_Output(other,self, " DIA_Constantino_TEACH_15_00 " );	// What recipes can you teach me?

	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE) && (PLAYER_TALENT_ALCHEMY[17] == TRUE) && (PLAYER_TALENT_ALCHEMY[18] == TRUE))
	{
		AI_Output(self,other, " DIA_Constantino_TEACH_10_01 " );	// Sorry! There's nothing more I can teach you.
	}
	else
	{
		AI_Output(self,other, " DIA_Constantino_TEACH_10_02 " );	// There are several - choose.
		Info_ClearChoices(DIA_Constantino_TEACH);
		Info_AddChoice(DIA_Constantino_TEACH,Dialog_Back,DIA_Constantino_Teach_BACK);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Лечебная эссенция ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Constantino_TEACH_Health01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Лечебный экстракт ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Constantino_TEACH_Health02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Лечебный эликсир",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),DIA_Constantino_TEACH_Health03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Эликсир жизни ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),DIA_Constantino_TEACH_PermHealth);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Эссенция маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Constantino_TEACH_Mana01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Экстракт маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Constantino_TEACH_Mana02);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Эликсир силы ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_STR)),DIA_Constantino_TEACH_PermSTR);
	};
	if(PLAYER_TALENT_ALCHEMY[17] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy( " Stamina Drink " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY , POTION_STAMINA )),dia_constantino_teach_stamina);
	};
	if((PLAYER_TALENT_ALCHEMY[18] == FALSE) && (PLAYER_TALENT_ALCHEMY[17] == TRUE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy( " Stamina Elixir " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY , POTION_PERM_STAMINA )),dia_constantino_teach_perm_stamina);
	};
};

func void DIA_Constantino_Teach_BACK()
{
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Health01()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01))
	{
		AI_Output(self,other, " DIA_Constantino_TEACH_Health01_10_00 " );	// Ingredients for Healing Essence - Medicinal Plants and Seraphis.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Health02()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02))
	{
		AI_Output(self,other, " DIA_Constantino_TEACH_Health02_10_00 " );	// To make a healing extract, you'll need healing herbs and seraphis.
		AI_Output(self,other, " DIA_Constantino_TEACH_Health02_10_01 " );	// Boil this extract very carefully.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Health03()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03))
	{
		AI_Output(self,other, " DIA_Constantino_TEACH_Health03_10_00 " );	// Crafting a healing elixir requires a little more experience.
		AI_Output(self,other, " DIA_Constantino_TEACH_Health03_10_01 " );	// You'll need healing roots and seraphis. When boiling this potion, you need to be especially careful.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_PermHealth()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health))
	{
		AI_Output(self,other, " DIA_Constantino_TEACH_PermHealth_10_00 " );	// Elixir of Life! Rare brew. But not because of the difficulty of making - this potion is not that difficult to make.
	};

	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Mana01()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01))
	{
		AI_Output(self,other, " DIA_Constantino_TEACH_Mana01_10_00 " );	// Magic essence is the simplest of magic drinks.
		AI_Output(self,other, " DIA_Constantino_TEACH_Mana01_10_01 " );	// Take the fire nettle and seraphis and boil them over low heat.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void dia_constantino_teach_speed()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Speed))
	{
		AI_Output(self,other, " DIA_Constantino_TEACH_Speed_10_00 " );	// Drink of haste is the simplest of magical drinks.
		AI_Output(self,other, " DIA_Constantino_TEACH_Speed_10_01 " );	// Take the snapper grass and heat it up slowly.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Mana02()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02))
	{
		AI_Output(self,other, " DIA_Constantino_TEACH_Mana02_10_00 " );	// Since you already know how to cook mana essence, if you practice a little, you can cook extract as well.
		AI_Output(self,other, " DIA_Constantino_TEACH_Mana02_10_01 " );	// The only thing you need to pay special attention to is the process of evaporating this potion. It uses fire herb and seraph as ingredients.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_PermSTR()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR))
	{
		AI_Output(self,other, " DIA_Constantino_TEACH_PermSTR_10_00 " );	// Elixir of Strength! Superior potion. For it, you will need a rare dragon root and royal sorrel.
		AI_Output(self,other, " DIA_Constantino_TEACH_PermSTR_10_01 " );	// When boiling this potion, make sure the bubbles don't get too big or you'll be in for a nasty surprise!
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void dia_constantino_teach_stamina()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_STAMINA))
	{
		AI_Output(self,other, " DIA_Constantino_TEACH_Stamina_10_00 " );	// Drink of Stamina! He will help you relieve your fatigue and restore strength.
		AI_Output(self,other, " DIA_Constantino_TEACH_Stamina_10_02 " );	// Bring the composition you have obtained to a boil and cool it to the desired temperature. That's the whole secret!
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void dia_constantino_teach_perm_stamina()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_PERM_STAMINA))
	{
		AI_Output(self,other, " DIA_Constantino_TEACH_Perm_Stamina_10_00 " );	// Elixir of Stamina is a very useful potion. However, it will not be easy to prepare it.
		AI_Output(self,other, " DIA_Constantino_TEACH_Perm_Stamina_10_02 " );	// The main secret of creating this elixir is the right moment when you need to remove the solution from the fire.
		AI_Output(self,other, " DIA_Constantino_TEACH_Perm_Stamina_10_03 " );	// Miss it - and you can start all over again.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};


instance DIA_CONSTANTINO_RECEPTFORTYON(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = dia_constantino_receptfortyon_condition;
	information = dia_constantino_receptfortyon_info;
	permanent = FALSE;
	description = " I'm looking for a recipe for a single potion. " ;
};


func int dia_constantino_receptfortyon_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && (KNOWABOUTRECEPTFORTYON == FALSE) && (Npc_HasItems(other,itwr_tyonrecept) < 1))
	{
		return TRUE;
	};
};

func void dia_constantino_receptfortyon_info()
{
	AI_Output(other,self, " DIA_Constantino_ReceptForTyon_01_00 " );	// I heard that there is a potion that can affect a person's mind in some way.
	AI_Output(other,self, " DIA_Constantino_ReceptForTyon_01_03 " );	// Do you know anything about him?
	if(Player_IsApprentice == APP_Constantino)
	{
		AI_Output(self,other, " DIA_Constantino_ReceptForTyon_01_04 " );	// Why is my student interested in this kind of stuff?
		AI_Output(other,self, " DIA_Constantino_ReceptForTyon_01_06 " );	// As a beginner alchemist, I am very interested in unusual elixirs.
		AI_Output(self,other, " DIA_Constantino_ReceptForTyon_01_07 " );	// (laughs) Well, your passion for learning the secrets of alchemy makes me happy.
		AI_Output(other,self, " DIA_Constantino_ReceptForTyon_01_08 " );	// Can you tell me about this potion?
		AI_Output(self,other, " DIA_Constantino_ReceptForTyon_01_09 " );	// Good. Yes, I have heard about this elixir, and it does have a number of truly unusual alchemical properties.
		AI_Output(self,other, " DIA_Constantino_ReceptForTyon_01_10 " );	// Impact on the mind is just one of them. Moreover, each of these properties can change from time to time in an unpredictable way.
		AI_Output(self,other, " DIA_Constantino_ReceptForTyon_01_11 " );	// It should also be noted that the preparation of this potion is a rather complicated process, and only a very experienced alchemist can handle it.
		AI_Output(self,other, " DIA_Constantino_ReceptForTyon_01_12 " );	// In addition, its composition includes very rare ingredients.
		AI_Output(other,self, " DIA_Constantino_ReceptForTyon_01_13 " );	// Do you have this composition?
		AI_Output(self,other, " DIA_Constantino_ReceptForTyon_01_14 " );	// No. I said that I heard about this elixir, but I did not say that I had its secret.
		AI_Output(other,self, " DIA_Constantino_ReceptForTyon_01_15 " );	// And who can know how to make this potion?
		AI_Output(self,other, " DIA_Constantino_ReceptForTyon_01_16 " );	// Rumor has it that Firebenders hold the secret to making this elixir.
		AI_Output(self,other, " DIA_Constantino_ReceptForTyon_01_17 " );	// However, as you know, these are just rumors. And it is unlikely that magicians will agree to share this secret with you.
		AI_Output(self,other, " DIA_Constantino_ReceptForTyon_01_20 " );	// If you happen to be able to get the recipe for this elixir, let me take a look at it.
		AI_Output(self,other, " DIA_Constantino_ReceptForTyon_01_21 " );	// Naturally, I won't be indebted to you for this. Well, in general, you understand.
		KNOWABOUTRECEPTFORTYON = TRUE;
		CONSTANTINOWANTSRECEPTFORTYON = TRUE;
		B_LogEntry( TOPIC_RECEPTFORTYON , "The alchemist Constantino told me that the recipe for this elixir might be in the possession of the Firebenders. On top of that, he himself would like to look at this recipe. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Constantino_ReceptForTyon_01_23 " );	// I have no idea what you mean.
		AI_Output(self,other, " DIA_Constantino_ReceptForTyon_01_24 " );	// Instead of pestering me with weird questions, I'd better go and do something useful!
	};
};


instance DIA_CONSTANTINO_GOTRECEPTFORTYON(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = dia_constantino_gotreceptfortyon_condition;
	information = dia_constantino_gotreceptfortyon_info;
	permanent = FALSE;
	description = " I have that recipe. " ;
};


func int dia_constantino_gotreceptfortyon_condition()
{
	if((Npc_HasItems(other,itwr_tyonrecept) >= 1) && (CONSTANTINOWANTSRECEPTFORTYON == TRUE))
	{
		return TRUE;
	};
};

func void dia_constantino_gotreceptfortyon_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Constantino_GotReceptForTyon_01_01 " );	// I have the same recipe.
	AI_Output(self,other, " DIA_Constantino_GotReceptForTyon_01_02 " );	// Really? Show me.
	B_GiveInvItems(other,self,itwr_tyonrecept,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Constantino_GotReceptForTyon_01_03 " );	// Awesome! Never thought I'd ever be able to get it!
	AI_Output(self,other, " DIA_Constantino_GotReceptForTyon_01_07 " );	// Here - take this as a reward for your efforts. I think this is enough.
	B_GiveInvItems(self,other,ItPl_Perm_Herb,2);
	AI_Output(other,self, " DIA_Constantino_GotReceptForTyon_01_08 " );	// And my recipe?
	AI_Output(self,other, " DIA_Constantino_GotReceptForTyon_01_09 " );	// I'm sorry, but it's better to keep it with me. You still won't be able to use the knowledge that is in it.
	AI_Output(self,other, " DIA_Constantino_GotReceptForTyon_01_10 " );	// Especially since you've already received your reward. (nervously) So what else do you want?
	AI_Output(other,self, " DIA_Constantino_GotReceptForTyon_01_11 " );	// Give me my recipe!
	AI_Output(self,other, " DIA_Constantino_GotReceptForTyon_01_12 " );	// Forget it. Go brew healing essences!
	AI_StopProcessInfos(self);
};


instance DIA_CONSTANTINO_POISONNEED(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = dia_constantino_poisonneed_condition;
	information = dia_constantino_poisonneed_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_constantino_poisonneed_condition()
{
	if (Chapter >=  2 )
	{
		return TRUE;
	};
};

func void dia_constantino_poisonneed_info()
{
	AI_Output(self,other, " DIA_Constantino_PoisonNeed_01_01 " );	// Hey, you, wait. (Busily) I have a conversation with you.
	AI_Output(self,other, " DIA_Constantino_PoisonNeed_01_03 " );	// I see you are a seasoned person and like to travel to different places.
	AI_Output(self,other, " DIA_Constantino_PoisonNeed_01_04 " );	// Probably never mind earning a few extra gold coins. I'm right?
	AI_Output(other,self, " DIA_Constantino_PoisonNeed_01_05 " );	// Of course. Extra gold never hurts me.
	AI_Output(self,other, " DIA_Constantino_PoisonNeed_01_06 " );	// That's great. Then I would like to offer you one very interesting business.
	AI_Output(self,other, " DIA_Constantino_PoisonNeed_01_07 " );	// And be sure - I will not remain in debt.
	AI_Output(other,self, " DIA_Constantino_PoisonNeed_01_08 " );	// Let's get down to business. What do you need?
	AI_Output(self,other, " DIA_Constantino_PoisonNeed_01_09 " );	// You see, my experiments require one rather rare ingredient.
	AI_Output(self,other, " DIA_Constantino_PoisonNeed_01_10 " );	// So rare that getting it is sometimes extremely problematic.
	AI_Output(self,other, " DIA_Constantino_PoisonNeed_01_13 " );	// This sounds a bit unusual, but I need the essence of some very strong poison.
	AI_Output(other,self, " DIA_Constantino_PoisonNeed_01_14 " );	// Do you want to poison someone?
	AI_Output(self,other, " DIA_Constantino_PoisonNeed_01_15 " );	// Oh, Innos. No, what are you! (nervously) I had no idea!
	AI_Output(self,other, " DIA_Constantino_PoisonNeed_01_16 " );	// It just so happens that I happened to have a recipe in my hands that requires this particular item to make.
	AI_Output(self,other, " DIA_Constantino_PoisonNeed_01_17 " );	// I myself have no idea where to look for it. But I'm sure you can do it.
	AI_Output(self,other, " DIA_Constantino_PoisonNeed_01_18 " );	// Well, are you willing to get it for me?
	Info_ClearChoices(dia_constantino_poisonneed);
	Info_AddChoice(dia_constantino_poisonneed, " No, I disagree! " ,dia_constantino_poisonneed_no);
	Info_AddChoice(dia_constantino_poisonneed, " It's okay, cheers. " ,dia_constantino_poisonneed_ok);
};

func void dia_constantino_poisonneed_ok()
{
	AI_Output(other,self, " DIA_Constantino_PoisonNeed_Ok_01_01 " );	// Okay, consider that we have agreed.
	AI_Output(self,other, " DIA_Constantino_PoisonNeed_Ok_01_02 " );	// Great! This is exactly what I wanted to hear.
	AI_Output(self,other, " DIA_Constantino_PoisonNeed_Ok_01_03 " );	// Just bring me this poison and you'll see your pockets quickly fill with hard cash.
	MIS_POISONNEED = LOG_Running;
	Log_CreateTopic(TOPIC_POISONNEED,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_POISONNEED,LOG_Running);
	B_LogEntry( TOPIC_POISONNEED , "The alchemist Constantino asked me to get the essence of a strong poison for him, and I agreed to help him with this. " );
	Info_ClearChoices(dia_constantino_poisonneed);
};

func void dia_constantino_poisonneed_no()
{
	AI_Output(other,self, " DIA_Constantino_PoisonNeed_No_01_01 " );	// I disagree.
	AI_Output(other,self, " DIA_Constantino_PoisonNeed_No_01_02 " );	// Look for someone else for this kind of business.
	AI_Output(self,other, " DIA_Constantino_PoisonNeed_No_01_03 " );	// Well, whatever you say.
	AI_StopProcessInfos(self);
};


instance DIA_CONSTANTINO_POISONNEEDOK(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = dia_constantino_poisonneedok_condition;
	information = dia_constantino_poisonneedok_info;
	permanent = FALSE;
	description = " I have the poison you need. " ;
};


func int dia_constantino_poisonneedok_condition()
{
	if((Npc_HasItems(hero,itpo_bloodflypoison) >= 1) && (MIS_POISONNEED == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_constantino_poisonneedok_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Constantino_PoisonNeedOk_01_01 " );	// I have the poison you need.
	AI_Output(self,other, " DIA_Constantino_PoisonNeedOk_01_02 " );	// True? (with interest) Let me take a look at it.
	AI_Output(other,self, " DIA_Constantino_PoisonNeedOk_01_03 " );	// Here, take this.
	B_GiveInvItems(other,self,itpo_bloodflypoison,1);
	Npc_RemoveInvItems(self,itpo_bloodflypoison,1);
	AI_Output(self,other, " DIA_Constantino_PoisonNeedOk_01_04 " );	// Well, great! I think this is just right for me to finish that... shall we say, experiment.
	AI_Output(self,other, " DIA_Constantino_PoisonNeedOk_01_06 " );	// Here, take this. I'm sure that should be enough to compensate for your troubles in this matter.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	MIS_POISONNEED = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_POISONNEED,LOG_SUCCESS);
	B_LogEntry( TOPIC_POISONNEED , " I brought Constantino the poison he needed. He was pleased. " );
	AI_StopProcessInfos(self);
	KILLHAPPENS = Wld_GetDay();
};


instance DIA_CONSTANTINO_ABOUTKILLIGNAZ(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = dia_constantino_aboutkillignaz_condition;
	information = dia_constantino_aboutkillignaz_info;
	permanent = FALSE;
	description = " Do you know anything about the murder of the alchemist Ignaz? " ;
};


func int dia_constantino_aboutkillignaz_condition()
{
	if(MIS_KILLIGNAZ == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_constantino_aboutkillignaz_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Constantino_AboutKillIgnaz_01_00 " );	// Do you know anything about the murder of the alchemist Ignaz?
	AI_Output(self,other, " DIA_Constantino_AboutKillIgnaz_01_01 " );	// I'm afraid not. (regretfully) I have no idea who could have done this. Why are you asking?
	AI_Output(other,self, " DIA_Constantino_AboutKillIgnaz_01_02 " );	// Lord Andre told me the poor fellow was poisoned.
	AI_Output(other,self, " DIA_Constantino_AboutKillIgnaz_01_03 " );	// And all this leads me to certain thoughts.
	AI_Output(self,other, " DIA_Constantino_AboutKillIgnaz_01_04 " );	// What are you implying?
	AI_Output(other,self, " DIA_Constantino_AboutKillIgnaz_01_05 " );	// To the fact that recently you asked me to get you a potent poison for some of your experiments.
	AI_Output(self,other, " DIA_Constantino_AboutKillIgnaz_01_07 " );	// Oh, I swear by Innos, it's not me. (nervously) I never thought of that!
	AI_Output(self,other, " DIA_Constantino_AboutKillIgnaz_01_08 " );	// I've always been quite friendly with Ignaz, and I'm very upset about everything that happened.
	AI_Output(self,other, " DIA_Constantino_AboutKillIgnaz_01_11 " );	// I have nothing to do with it!
	B_LogEntry( TOPIC_KILLIGNAZ , " Constantino knows nothing about this murder. Although the fact that I brought him poison for his experiments a few days ago cannot but arouse suspicion... " );
	ASKKILLFIRST = TRUE;
};

instance DIA_CONSTANTINO_FOUNDBOTTLE(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = dia_constantino_foundbottle_condition;
	information = dia_constantino_foundbottle_info;
	permanent = FALSE;
	description = " Here, look what I found. " ;
};

func int dia_constantino_foundbottle_condition()
{
	if((MIS_KILLIGNAZ == LOG_Running) && Npc_HasItems(hero,itmi_poisonbottle))
	{
		return TRUE;
	};
};

func void dia_constantino_foundbottle_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Constantino_FoundBottle_01_00 " );	// Here, look what I found.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_01_01");	//Эээ...(непонимающе) И что это?
	AI_Output(other,self, " DIA_Constantino_FoundBottle_01_02 " );	// I'm sure you can guess this yourself. And, as it seems to me, before this little thing belonged to you!
	AI_Output(self,other, " DIA_Constantino_FoundBottle_01_03 " );	// What? (nervously) Oh no! It just can't be!
	AI_Output(other,self, " DIA_Constantino_FoundBottle_01_04 " );	// But it seems to me that everything is just the opposite. So it's useless to deny now.
	AI_Output(self,other, " DIA_Constantino_FoundBottle_01_05 " );	// (nervously) But... Do you really think that it was I who poisoned Ignaz?
	AI_Output(other,self, " DIA_Constantino_FoundBottle_01_06 " );	// I'm sure it was you! And at the first opportunity, I will report this to the militia.
	AI_Output(self,other, " DIA_Constantino_FoundBottle_01_07 " );	// No! Please don't do this! (in a panic) I have absolutely nothing to do with it!
	Info_ClearChoices(dia_constantino_foundbottle);
	Info_AddChoice(dia_constantino_foundbottle, " You will explain this to Lord Andre himself. " ,dia_constantino_foundbottle_prison);
	Info_AddChoice(dia_constantino_foundbottle, " How can you prove it? " ,dia_constantino_foundbottle_tellme);
};

func void dia_constantino_foundbottle_prison()
{
	AI_Output(other,self, " DIA_Constantino_FoundBottle_Prison_01_01 " );	// You will explain this to Lord Andre himself.
	AI_Output(self,other, " DIA_Constantino_FoundBottle_Prison_01_02 " );	// Well, well... (doomedly) Do what you want! But know that you are making a big mistake.
	CONSTANTINOFUCKOFF = TRUE;
	B_LogEntry( TOPIC_KILLIGNAZ , " It looks like Constantino is the man who poisoned the alchemist Ignaz. I think it's time to report this to Lord Andre. " );
	AI_StopProcessInfos(self);
};

func void dia_constantino_foundbottle_tellme()
{
	AI_Output(other,self, " DIA_Constantino_FoundBottle_TellMe_01_01 " );	// And how can you prove it?
	AI_Output(other,self, " DIA_Constantino_FoundBottle_TellMe_01_02 " );	// How did this thing end up in the alchemist's house?
	AI_Output(self,other, " DIA_Constantino_FoundBottle_TellMe_01_03 " );	// Trust me, I have no idea how. Apparently, this bottle was simply stolen from me!
	AI_Output(self,other, " DIA_Constantino_FoundBottle_TellMe_01_04 " );	// And then they threw him into Ignaz's house.
	AI_Output(other,self, " DIA_Constantino_FoundBottle_TellMe_01_07 " );	// Your excuses don't sound very convincing.
	AI_Output(self,other, " DIA_Constantino_FoundBottle_TellMe_01_08 " );	// But I really have nothing more to say to you! I don't know how this could happen.
	Info_ClearChoices(dia_constantino_foundbottle);
	Info_AddChoice(dia_constantino_foundbottle, " Then you leave me no choice. " ,dia_constantino_foundbottle_no);
	Info_AddChoice(dia_constantino_foundbottle,"Думай лучше!",dia_constantino_foundbottle_yes);
};

func void dia_constantino_foundbottle_no()
{
	AI_Output(other,self, " DIA_Constantino_FoundBottle_No_01_01 " );	// Then you leave me no choice! We'll have to hand you over to the city militia.
	AI_Output(self,other, " DIA_Constantino_FoundBottle_No_01_02 " );	// Well, well... (doomedly) Do what you want! But know that you are making a big mistake.
	CONSTANTINOFUCKOFF = TRUE;
	B_LogEntry( TOPIC_KILLIGNAZ , " It looks like Constantino is the man who poisoned the alchemist Ignaz. I think it's time to report this to Lord Andre. " );
	AI_StopProcessInfos(self);
};

func void dia_constantino_foundbottle_yes()
{
	AI_Output(other,self, " DIA_Constantino_FoundBottle_Yes_01_01 " );	// Think better! Your future destiny depends on it.
	AI_Output(self,other, " DIA_Constantino_FoundBottle_Yes_01_02 " );	// Believe me, I'm trying... (he hesitates) But nothing else comes to my mind.
	AI_Output(other,self, " DIA_Constantino_FoundBottle_Yes_01_03 " );	// Maybe something strange has happened in recent days?
	AI_Output(self,other, " DIA_Constantino_FoundBottle_Yes_01_04 " );	// No. I didn't seem to notice anything of the sort. Although, if only...
	AI_Output(self,other, " DIA_Constantino_FoundBottle_Yes_01_06 " );	// Yes... (thoughtfully) A rather strange guy actually came to see me the other day.
	AI_Output(self,other, " DIA_Constantino_FoundBottle_Yes_01_10 " );	// He was interested in one of my rare potions, and naturally wanted to buy it from me.
	AI_Output(self,other, " DIA_Constantino_FoundBottle_Yes_01_12 " );	// I don't usually keep these kinds of drinks in my lab.
	AI_Output(self,other, " DIA_Constantino_FoundBottle_Yes_01_13 " );	// This is too dangerous since some of them are very expensive. And this potion was just one of them.
	AI_Output(self,other, " DIA_Constantino_FoundBottle_Yes_01_14 " );	// So I went to the warehouse to fetch him, and when I came back, the guy was gone!
	Info_ClearChoices(dia_constantino_foundbottle);
	Info_AddChoice(dia_constantino_foundbottle, " I don't think I'm really interested. " ,dia_constantino_foundbottle_nohelp);
	Info_AddChoice(dia_constantino_foundbottle, " I'll try to help you. " ,dia_constantino_foundbottle_yeshelp);
};

func void dia_constantino_foundbottle_nohelp()
{
	AI_Output(other,self, " DIA_Constantino_FoundBottle_NoHelp_01_01 " );	// I don't think I'm really interested.
	AI_Output(self,other, " DIA_Constantino_FoundBottle_NoHelp_01_02 " );	// Well, well... (doomedly) Do what you want! But know that you are making a big mistake.
	CONSTANTINOFUCKOFF = TRUE;
	B_LogEntry( TOPIC_KILLIGNAZ , " It looks like Constantino is the man who poisoned the alchemist Ignaz. I think it's time to report this to Lord Andre. " );
	AI_StopProcessInfos(self);
};

func void dia_constantino_foundbottle_yeshelp()
{
	AI_Output(other,self, " DIA_Constantino_FoundBottle_YesHelp_01_01 " );	// I'll try to help you.
	AI_Output(self,other, " DIA_Constantino_FoundBottle_YesHelp_01_02 " );	// Oh, Adanos. I really hope you succeed.
	HELPKILLIGNAZ = TRUE;
	Info_ClearChoices(dia_constantino_foundbottle);
	B_LogEntry( TOPIC_KILLIGNAZ , " I've decided to help Constantino with this complicated case. I guess I should start looking for that mysterious man the alchemist was talking about. Perhaps someone from the city guards remembered him... " );
};

instance DIA_CONSTANTINO_MakePoison(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = dia_constantino_MakePoison_condition;
	information = dia_constantino_MakePoison_info;
	permanent = FALSE;
	description = " So you can make poisons? " ;
};

func int dia_constantino_MakePoison_condition()
{
	if(HELPKILLIGNAZ == TRUE)
	{
		return TRUE;
	};
};

func void dia_constantino_MakePoison_info()
{
	AI_Output(other,self, " DIA_Constantino_MakePoison_01_01 " );	// So you can make poisons?
	AI_Output(self,other, " DIA_Constantino_MakePoison_01_02 " );	// Mmm... (reluctantly) Yes. This is, so to speak, my side occupation, except for the preparation of magical potions.
	AI_Output(self,other, " DIA_Constantino_MakePoison_01_03 " );	// But I don't tell anyone about this, and I advise you to talk less.
	AI_Output(self,other, " DIA_Constantino_MakePoison_01_04 " );	// If the city militia finds out about this, they will close this shop immediately!
	AI_Output(other,self, " DIA_Constantino_MakePoison_01_05 " );	// I understand. Aren't you afraid that someday you'll poison yourself?
	AI_Output(self,other, " DIA_Constantino_MakePoison_01_06 " );	// Don't worry...(chuckles) I always have an antidote with me for that.
	AI_Output(self,other, " DIA_Constantino_MakePoison_01_07 " );	// I do them too, because without them my practice would be impossible.
	AI_Output(self,other, " DIA_Constantino_MakePoison_01_08 " );	// In addition, over the years of my experiments, I have learned to tolerate certain types of poisons.
	AI_Output(self,other, " DIA_Constantino_MakePoison_01_09 " );	// Now they cause only minor side effects in the form of a rash on the skin or face.
	AI_Output(self,other, " DIA_Constantino_MakePoison_01_10 " );	// But there is no poisoning as such.
};

instance DIA_CONSTANTINO_MakePoisonTeachMe(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = dia_constantino_MakePoisonTeachMe_condition;
	information = dia_constantino_MakePoisonTeachMe_info;
	permanent = FALSE;
	description = " Will you show me how to handle poisons? " ;
};

func int dia_constantino_MakePoisonTeachMe_condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_MakePoison) == TRUE)
	{
		return TRUE;
	};
};

func void dia_constantino_MakePoisonTeachMe_info()
{
	AI_Output(other,self, " DIA_Constantino_MakePoisonTeachMe_01_01 " );	// Maybe you could show me how to handle poisons?

	if(ConstForgiven == TRUE)
	{
		AI_Output(self,other, " DIA_Constantino_MakePoisonTeachMe_01_02 " );	// Hmmm... (thoughtfully) Well, okay. After all, you helped me deal with Ignaz's problem.
		AI_Output(self,other, " DIA_Constantino_MakePoisonTeachMe_01_03 " );	// And I'd be an ungrateful pig if I didn't thank you for it.
		AI_Output(self,other, " DIA_Constantino_MakePoisonTeachMe_01_04 " );	// However, my knowledge will require some experience from you.
		AI_Output(self,other, " DIA_Constantino_MakePoisonTeachMe_01_05 " );	// Well, a small amount of gold will not hurt - as compensation for the costs of your education.
		ConsTeachPoison = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Constantino_MakePoisonTeachMe_01_07 " );	// (sharply) No. I won't tell you this! Do not even think.
		AI_Output(other,self, " DIA_Constantino_MakePoisonTeachMe_01_08 " );	// Well, as you know.
	};
};

instance DIA_CONSTANTINO_MakePoisonTeachMeAgain(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = dia_constantino_MakePoisonTeachMeAgain_condition;
	information = dia_constantino_MakePoisonTeachMeAgain_info;
	permanent = FALSE;
	description = " Can you show me how to handle poisons after all? " ;
};

func int dia_constantino_MakePoisonTeachMeAgain_condition()
{
	if((Npc_KnowsInfo(other,DIA_Constantino_MakePoisonTeachMe) == TRUE) && (ConstForgiven == TRUE) && (ConsTeachPoison == FALSE))
	{
		return TRUE;
	};
};

func void dia_constantino_MakePoisonTeachMeAgain_info()
{
	AI_Output(other,self, " DIA_Constantino_MakePoisonTeachMeAgain_01_01 " );	// Can you show me how to handle poisons after all?
	AI_Output(self,other, " DIA_Constantino_MakePoisonTeachMeAgain_01_02 " );	// Hmmm... (thoughtfully) Well, okay. After all, you helped me deal with Ignaz's problem.
	AI_Output(self,other, " DIA_Constantino_MakePoisonTeachMeAgain_01_03 " );	// And I'd be an ungrateful pig if I didn't thank you for it.
	AI_Output(self,other, " DIA_Constantino_MakePoisonTeachMeAgain_01_04 " );	// However, my knowledge will require some experience from you.
	AI_Output(self,other, " DIA_Constantino_MakePoisonTeachMeAgain_01_05 " );	// Well, a small amount of gold will not hurt - as compensation for the costs of your education.
	ConsTeachPoison = TRUE;
};

instance DIA_CONSTANTINO_TeachPoison(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 800;
	condition = dia_constantino_TeachPoison_condition;
	information = dia_constantino_TeachPoison_info;
	permanent = TRUE;
	description = " Teach me how to handle poison. " ;
};

func int dia_constantino_TeachPoison_condition()
{
	if((ConsTeachPoison == TRUE) && ((AnPoisonKnow == FALSE) || (ResistPoisonKnow == FALSE)))
	{
		return TRUE;
	};
};

func void dia_constantino_TeachPoison_info()
{
	AI_Output(other,self, " DIA_Constantino_TeachPoison_01_01 " );	// Teach me how to handle poisons.
	AI_Output(self,other, " DIA_Constantino_TeachPoison_01_02 " );	// What do you want to know?
	Info_ClearChoices(DIA_Constantino_TeachPoison);
	Info_AddChoice(DIA_Constantino_TeachPoison,Dialog_Back,DIA_Constantino_TeachPoison_BACK);
	
	if(AnPoisonKnow == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TeachPoison, " Teach me how to make an antidote (Teach Points: 1, Cost: 500 coins) " ,DIA_Constantino_TeachPoison_AnPoison);
	};

	if(ResistPoisonKnow == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TeachPoison, " Teach me Poison Resistance (Teach Points: 10, Cost: 3000 coins) " ,DIA_Constantino_TeachPoison_Resist);
	};
};

func void DIA_Constantino_TeachPoison_BACK()
{
	Info_ClearChoices(DIA_Constantino_TeachPoison);
};

func void DIA_Constantino_TeachPoison_AnPoison()
{
	var int cost;
	var int money;

	AI_Output(other,self, " DIA_Constantino_TeachPoison_AnPoison_01_00 " );	// Teach me how to make an antidote.

	cost = 1 ;
	money = 500;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other, " DIA_Constantino_TeachPoison_AnPoison_01_01 " );	// Sorry, but you don't have enough experience for this yet!
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other, " DIA_Constantino_TeachPoison_AnPoison_01_02 " );	// Sorry, but I won't do it for free!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other, " DIA_Constantino_TeachPoison_AnPoison_01_03 " );	// Good. Listen carefully.
		AI_Output(self,other, " DIA_Constantino_TeachPoison_AnPoison_01_04 " );	// You'll need a bottle of water, sulfur, and charcoal.
		AI_Output(self,other, " DIA_Constantino_TeachPoison_AnPoison_01_05 " );	// Pound the sulfur and charcoal to a powder. Then add your mixture to boiling water.
		AI_Output(self,other, " DIA_Constantino_TeachPoison_AnPoison_01_06 " );	// Boil it for about a couple of minutes, and then cool. That's the whole point!
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		AI_Print( " Learned : making antidote " );
		AnPoisonKnow = TRUE;
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for the antidote: bottle of water, sulfur, salt and charcoal. " );

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
};

func void DIA_Constantino_TeachPoison_Resist()
{
	var int cost;
	var int money;

	AI_Output(other,self, " DIA_Constantino_TeachPoison_Resist_01_00 " );	// Teach me how to resist poison.

	cost = 10 ;
	money = 3000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other, " DIA_Constantino_TeachPoison_Resist_01_01 " );	// Sorry, but you don't have enough experience for this yet!
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other, " DIA_Constantino_TeachPoison_Resist_01_02 " );	// Sorry, but I won't do it for free!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other, " DIA_Constantino_TeachPoison_Resist_01_03 " );	// Poison is a bad thing. Especially if it got into your body.
		AI_Output(self,other, " DIA_Constantino_TeachPoison_Resist_01_04 " );	// You must make sure that your body decomposes the poison as quickly as possible.
		AI_Output(self,other, " DIA_Constantino_TeachPoison_Resist_01_05 " );	// Keep moving and sweat more! Then poisoning will not harm you.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		AI_Print( " Studied : Poison Resistance " );
		ResistPoisonKnow = TRUE;
		Snd_Play("LevelUP");
	};
};

instance DIA_CONSTANTINO_FUCKOFF(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 10;
	condition = dia_constantino_fuckoff_condition;
	information = dia_constantino_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_constantino_fuckoff_condition()
{
	if((CONSTANTINOFUCKOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_constantino_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

instance DIA_Constantino_LOKIPOTION(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_LOKIPOTION_Condition;
	information = DIA_Constantino_LOKIPOTION_Info;
	permanent = FALSE;
	description = " I needed one very rare plant. " ;
};


func int DIA_Constantino_LOKIPOTION_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (SeekCactus == TRUE) && (FindCactus == FALSE) && (TradeCactus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_LOKIPOTION_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Constantino_LOKIPOTION_01_00 " );	// I needed one very rare plant.
	AI_Output(self,other, " DIA_Constantino_LOKIPOTION_01_01 " );	// Which one exactly?
	AI_Output(other,self, " DIA_Constantino_LOKIPOTION_01_02 " );	// They call it the cactus flower.
	AI_Output(self,other, " DIA_Constantino_LOKIPOTION_01_03 " );	// Hmmm... (with interest) Well, yes, I've heard a bit about him. A very rare specimen indeed.
	AI_Output(other,self, " DIA_Constantino_LOKIPOTION_01_04 " );	// Do you happen to know where to find it?
	AI_Output(self,other, " DIA_Constantino_LOKIPOTION_01_05 " );	// I'm afraid you won't find it in Khorinis.
	AI_Output(self,other, " DIA_Constantino_LOKIPOTION_01_06 " );	// As far as I know, this plant likes a dry climate and a lot of sunshine. It's too cold for him in here!
	AI_Output(self,other, " DIA_Constantino_LOKIPOTION_01_07 " );	// If I were you, I'd better ask the local merchants.
	AI_Output(self,other, " DIA_Constantino_LOKIPOTION_01_08 " );	// If anyone on the island has this plant, it's only them.
	TradeCactus = TRUE ;
	B_LogEntry(TOPIC_PrioratStart, "The alchemist Constantino advised me to talk to the merchants. If the island has this plant, it's theirs. " );
};

instance DIA_Constantino_MyBrew(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_MyBrew_Condition;
	information = DIA_Constantino_MyBrew_Info;
	permanent = FALSE;
	description = " I'm talking about your potion. " ;
};

func int DIA_Constantino_MyBrew_Condition()
{
	if((MIS_MyBrew == LOG_Running) && (KnowFakeRecept == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_MyBrew_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Constantino_MyBrew_01_00 " );	// I'm talking about your potion.
	AI_Output(self,other, " DIA_Constantino_MyBrew_01_01 " );	// (with interest) Have you cooked it yet?
	AI_Output(other,self, " DIA_Constantino_MyBrew_01_02 " );	// No! And it is unlikely that something sensible will come out of this venture.
	AI_Output(other,self, " DIA_Constantino_MyBrew_01_03 " );	// All the ingredients in your recipe are completely incompatible with each other.
	AI_Output(other,self, " DIA_Constantino_MyBrew_01_04 " );	// And some are not used in alchemy at all!
	AI_Output(self,other, " DIA_Constantino_MyBrew_01_05 " );	// (respectfully) I didn't think you'd be able to solve this secret.
	AI_Output(self,other, " DIA_Constantino_MyBrew_01_06 " );	// You'll probably make a pretty good alchemist.
	AI_Output(self,other, " DIA_Constantino_MyBrew_01_07 " );	// Good. I will help you to know the true greatness of this art!
	MIS_MyBrew = LOG_Success;
	Log_SetTopicStatus(TOPIC_MyBrew,LOG_Success);
	B_LogEntry(TOPIC_MyBrew, " I told Constantino everything that Salandril told me. He was surprised by my clairvoyance and, it seems, even respected me. But most importantly, now he will teach me the art of alchemy. " );
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry_Quiet(TOPIC_CityTeacher, " Constantino can teach me the art of alchemy. " );
};
