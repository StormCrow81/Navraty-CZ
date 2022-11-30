
instance DIA_Addon_Myxir_CITY_EXIT(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 999;
	condition = DIA_Addon_Myxir_CITY_EXIT_Condition;
	information = DIA_Addon_Myxir_CITY_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Myxir_CITY_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_CITY_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Myxir_CITY_HelloCITY(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 5;
	condition = DIA_Addon_Myxir_CITY_HelloCITY_Condition;
	information = DIA_Addon_Myxir_CITY_HelloCITY_Info;
	permanent = FALSE;
	description = " Will you stay in the city now? " ;
};

func int DIA_Addon_Myxir_CITY_HelloCITY_Condition()
{
	if(MIS_JarCurse != LOG_Running)
	{
		return TRUE;
	};
};


var int DIA_Addon_Myxir_CITY_HelloCITY_OneTime;

func void DIA_Addon_Myxir_CITY_HelloCITY_Info()
{
	AI_Output(other,self, " DIA_Addon_Myxir_CITY_HelloCITY_15_00 " );	// Will you stay in the city?
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_HelloCITY_12_01 " );	// One of us must stay here when Vatras is out of town.
	VatrasAbloeseIstDa = TRUE;

	if((RavenAway == TRUE) && (DIA_Addon_Myxir_CITY_HelloCITY_OneTime == FALSE))
	{
		AI_Output(self,other, " DIA_Addon_Myxir_CITY_HelloCITY_12_02 " );	// I wanted to tell you one more thing.
		AI_Output(self,other, " DIA_Addon_Myxir_CITY_HelloCITY_12_03 " );	// In Yarkendar, you performed a truly heroic deed.
		AI_Output(other,self, " DIA_Addon_Myxir_CITY_HelloCITY_15_04 " );	// Unfortunately, I still have unfinished business in Khorinis.
		AI_Output(self,other, " DIA_Addon_Myxir_CITY_HelloCITY_12_05 " );	// That's true, but I'm sure you can handle them.
		AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_06");	//Увидим.
		DIA_Addon_Myxir_CITY_HelloCITY_OneTime = TRUE;
		B_GivePlayerXP(XP_Ambient);
	};
};

instance DIA_Addon_Myxir_CITY_AncientBookDone(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 10;
	condition = DIA_Addon_Myxir_CITY_AncientBookDone_Condition;
	information = DIA_Addon_Myxir_CITY_AncientBookDone_Info;
	permanent = FALSE;
	description = " Look at this. " ;
};

func int DIA_Addon_Myxir_CITY_AncientBookDone_Condition()
{
	if((MIS_MyxirAncientBook == LOG_Running) && (Npc_HasItems(hero,ItWr_AncientBook_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_CITY_AncientBookDone_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Addon_Myxir_AncientBookDone_01_00 " );	// Here, look.
	B_GiveInvItems(other,self,ItWr_AncientBook_01,1);
	Npc_RemoveInvItems(self,ItWr_AncientBook_01,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Addon_Myxir_AncientBookDone_01_01 " );	// Oh Adanos...(astonished) Where did you find this ancient manuscript?
	AI_Output(other,self, " DIA_Addon_Myxir_AncientBookDone_01_02 " );	// Where you advised me to look - in the Library of Architects.
	AI_Output(self,other, " DIA_Addon_Myxir_AncientBookDone_01_03 " );	// Incredible! So, I was right, and they really kept some of their notes in such books.
	AI_Output(self,other, " DIA_Addon_Myxir_AncientBookDone_01_04 " );	// Need to study these entries as soon as possible!
	AI_Output(self,other, " DIA_Addon_Myxir_AncientBookDone_01_05 " );	// Perhaps this is where the answers to our questions lie.
	MIS_MyxirAncientBook = LOG_Success;
	Log_SetTopicStatus(TOPIC_MyxirAncientBook,LOG_Success);
	B_LogEntry(TOPIC_MyxirAncientBook, " I gave Mixer the Builder's book I found in the ruins of the library. " );
};

var int DIA_Addon_Myxir_CITY_Teach_NoPerm;
var int DIA_Addon_Myxir_CITY_Teach_OneTime;

instance DIA_Addon_Myxir_CITY_Teach(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 90;
	condition = DIA_Addon_Myxir_CITY_Teach_Condition;
	information = DIA_Addon_Myxir_CITY_Teach_Info;
	permanent = TRUE;
	description = " Teach me this language. " ;
};

func int DIA_Addon_Myxir_CITY_Teach_Condition()
{
	if((DIA_Addon_Myxir_CITY_Teach_NoPerm == FALSE) && ((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_CITY_Teach_Info()
{
	AI_Output(other,self, " DIA_Addon_Myxir_TeachRequest_15_00 " );	// Teach me this language.

	if(DIA_Addon_Myxir_CITY_Teach_OneTime == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_MyxirTeach);
		DIA_Addon_Myxir_CITY_Teach_OneTime = TRUE;
	};
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
		Info_AddChoice(DIA_Addon_Myxir_CITY_Teach,Dialog_Back,DIA_Addon_Myxir_CITY_Teach_BACK);

		if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Myxir_CITY_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),DIA_Addon_Myxir_CITY_Teach_LANGUAGE_1);
		};
		if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
		{
			Info_AddChoice(DIA_Addon_Myxir_CITY_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),DIA_Addon_Myxir_CITY_Teach_LANGUAGE_2);
		};
		if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
		{
			Info_AddChoice(DIA_Addon_Myxir_CITY_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),DIA_Addon_Myxir_CITY_Teach_LANGUAGE_3);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Myxir_TeachNoMore_12_00 " );	// I have nothing more to show you. You have learned the language of architects.
		DIA_Addon_Myxir_CITY_Teach_NoPerm = TRUE ;
	};
};

func void DIA_Addon_Myxir_CITY_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
};

func void DIA_Addon_Myxir_CITY_Teach_LANGUAGE_1()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1))
	{
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL1_12_00 " );	// Well, let's start with something simple. Let us first deal with the language of the peasants.
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL1_12_01 " );	// As a rule, texts written in the language of peasants are connected with our world, with such concepts as work, love, food production.
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL1_12_02 " );	// This is the main language of the city. You can read most of the texts you find here if you master it.
	};

	Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
};

func void DIA_Addon_Myxir_CITY_Teach_LANGUAGE_2()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2))
	{
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL2_12_00 " );	// You are already familiar with the language of the peasants. The language of the warriors is a bit more complex.
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL2_12_01 " );	// Texts written in the language of warriors mainly deal with wars and weapons. You will learn something useful.
	};

	Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
};

func void DIA_Addon_Myxir_CITY_Teach_LANGUAGE_3()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3))
	{
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL3_12_00 " );	// The high calm of the priests is hard to understand. But I'll gladly teach it to you.
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL3_12_01 " );	// Among other things, the sacred books that describe the history and magic of the creators are written in the language of the priests.
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL3_12_02 " );	// Each of these texts is a real treasure, if, of course, you can understand it.
	};

	Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
};


instance DIA_ADDON_MYXIR_CITY_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 1;
	condition = dia_addon_myxir_city_prayforgomez_condition;
	information = dia_addon_myxir_city_prayforgomez_info;
	permanent = FALSE;
	description = " I need the blessing of Adanos. " ;
};

func int dia_addon_myxir_city_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_city_prayforgomez_info()
{
	AI_Output(other,self, " DIA_Addon_Myxir_CITY_PrayForGomez_01_01 " );	// I need the blessing of Adanos.
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_PrayForGomez_01_02 " );	// Talk to Saturas about this.
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_PrayForGomez_01_03 " );	// I think he can help you.
	AI_Output(other,self, " DIA_Addon_Myxir_CITY_PrayForGomez_01_04 " );	// Thanks for the tip.
	SENTTOSATURASGOMEZ = TRUE ;
};

instance DIA_ADDON_MYXIR_CITY_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 1;
	condition = dia_addon_myxir_city_runemagicnotwork_condition;
	information = dia_addon_myxir_city_runemagicnotwork_info;
	permanent = FALSE;
	description = " Can you still use your rune magic? " ;
};

func int dia_addon_myxir_city_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (WATERMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_city_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_Myxir_CITY_RuneMagicNotWork_01_00 " );	// Can you still use your rune magic?
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_RuneMagicNotWork_01_01 " );	// I'm afraid to upset you. All of my magical runes have somehow lost their power.
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_RuneMagicNotWork_01_02 " );	// And not only for me, but for other Waterbenders too.
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_RuneMagicNotWork_01_03 " );	// Perhaps something terrible and irreparable happened in this world, if now we all suddenly lost this gift.
	AI_Output(other,self, " DIA_Addon_Myxir_CITY_RuneMagicNotWork_01_04 " );	// Hmmm. All clear.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " It seems the Waterbenders have also lost their ability to use rune magic. " );
	WATERMAGERUNESNOT = TRUE;
};

instance DIA_Addon_Myxir_CITY_JarCurse(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 5;
	condition = DIA_Addon_Myxir_CITY_JarCurse_Condition;
	information = DIA_Addon_Myxir_CITY_JarCurse_Info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Addon_Myxir_CITY_JarCurse_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_JarCurse == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_CITY_JarCurse_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_JarCurse_01_00 " );	// Praise Adanos! You arrived just in time to help us.
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_JarCurse_01_01 " );	// A little more, and these dead would have killed us.
	AI_Output(other,self, " DIA_Addon_Myxir_CITY_JarCurse_01_02 " );	// And what were those creatures?
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_JarCurse_01_03 " );	// I don't know. But this kind of undead I have not yet met.
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_JarCurse_01_04 " );	// My magic does little to no harm to them. All this is so strange.
	AI_Output(other,self, " DIA_Addon_Myxir_CITY_JarCurse_01_05 " );	// Any thoughts on this?
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_JarCurse_01_06 " );	// I can only assume that this has something to do with the portal.
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_JarCurse_01_07 " );	// When we got here, the temple hall where the portal was located was full of dead warriors!
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_JarCurse_01_08 " );	// Mithras and I hid here, hoping they wouldn't find us.
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_JarCurse_01_09 " );	// But only your intervention saved our lives!
	AI_Output(other,self, " DIA_Addon_Myxir_CITY_JarCurse_01_10 " );	// If you're right, the Waterbenders left in the valley might be in mortal danger right now.
	AI_Output(other,self, " DIA_Addon_Myxir_CITY_JarCurse_01_11 " );	// It's probably worse on the other side of the portal.
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_JarCurse_01_12 " );	// Then we need to check it. And I'm asking you to do this.
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_JarCurse_01_13 " );	// I'll go to the city and report everything to Vatras.
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_JarCurse_01_14 " );	// And Mithras will stay here and look after the portal itself.
	AI_Output(other,self, " DIA_Addon_Myxir_CITY_JarCurse_01_15 " );	// Of course. And, as always, I got the easiest job.
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_JarCurse_01_16 " );	// Understand, now there is simply no one to do it except you.
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_JarCurse_01_17 " );	// All the brothers of the Ring of Water are now fighting the undead that attacked Khorinis.
	AI_Output(other,self, " DIA_Addon_Myxir_CITY_JarCurse_01_18 " );	// Come on, don't worry. I'll do everything.
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_JarCurse_01_19 " );	// Adanos bless you... (sighing) Oh, and by the way, before you leave, talk to Mithras.
	AI_Output(self,other, " DIA_Addon_Myxir_CITY_JarCurse_01_20 " );	// Seems like he had some ideas too.
	MyxirSendSaturas = TRUE;
	B_LogEntry(TOPIC_JarCurse, " I arrived just in time. Mixir and Mithras were already struggling to fight off a group of dead warriors that attacked them. For some reason, their magic did not do much harm to these creatures. According to Mixir, most likely, the undead came from the portal, which leads to the Valley of the Ancients. He asked me to go to Yarkendar and check the situation there. " );	
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

// ------------------------------------------------ -Mithras------------------------------------------------ --

instance DIA_KDW_1406_Mitras_EXIT(C_Info)
{
	npc = KDW_1406_Mitras;
	nr = 999;
	condition = DIA_KDW_1406_Mitras_EXIT_Condition;
	information = DIA_KDW_1406_Mitras_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_KDW_1406_Mitras_EXIT_Condition()
{
	return TRUE;
};

func void DIA_KDW_1406_Mitras_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_KDW_1406_Mitras_Hello(C_Info)
{
	npc = KDW_1406_Mitras;
	nr = 1;
	condition = DIA_KDW_1406_Mitras_Hello_condition;
	information = DIA_KDW_1406_Mitras_Hello_info;
	permanent = FALSE;
	description = " Hi! Are you a Waterbender too? " ;
};

func int DIA_KDW_1406_Mitras_Hello_condition()
{
	return TRUE;
};

func void DIA_KDW_1406_Mitras_Hello_info()
{
	AI_Output(other,self, " DIA_KDW_1406_Mitras_Hello_01_00 " );	// Hello! Are you a Waterbender too?
	AI_Output(self,other, " DIA_KDW_1406_Mitras_Hello_01_01 " );	// Yes, as you can see. What bothers you?
	AI_Output(other,self, " DIA_KDW_1406_Mitras_Hello_01_02 " );	// I just don't remember you being in the colony with them.
	AI_Output(self,other, " DIA_KDW_1406_Mitras_Hello_01_03 " );	// So it is. I recently became a mage. Vatras accepted me into the Circle of Water.
	AI_Output(self,other, " DIA_KDW_1406_Mitras_Hello_01_04 " );	// And before that, I helped him as one of the brothers of the Ring.
	AI_Output(other,self, " DIA_KDW_1406_Mitras_Hello_01_05 " );	// Got it.
};

instance DIA_KDW_1406_Mitras_What(C_Info)
{
	npc = KDW_1406_Mitras;
	nr = 1;
	condition = DIA_KDW_1406_Mitras_What_condition;
	information = DIA_KDW_1406_Mitras_What_info;
	permanent = FALSE;
	description = " What are you doing here with Mixer? " ;
};

func int DIA_KDW_1406_Mitras_What_condition()
{
	if(Npc_KnowsInfo(hero,DIA_KDW_1406_Mitras_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_KDW_1406_Mitras_What_info()
{
	AI_Output(other,self, " DIA_KDW_1406_Mitras_What_01_00 " );	// What are you doing here with Mixer?
	AI_Output(self,other, " DIA_KDW_1406_Mitras_What_01_01 " );	// Vatras sent us here to watch over the portal.

	if(MIS_JarCurse == LOG_Running)
	{
		AI_Output(self,other, " DIA_KDW_1406_Mitras_What_01_02 " );	// But as you can see, the situation here is much more complicated than we thought.
		AI_Output(self,other, " DIA_KDW_1406_Mitras_What_01_03 " );	// Only thanks to Adanos are we still alive!
		AI_Output(other,self, " DIA_KDW_1406_Mitras_What_01_04 " );	// Well, yes. (to himself) ...and my sword.
	};		
};

instance DIA_KDW_1406_Mitras_JarCurse(C_Info)
{
	npc = KDW_1406_Mitras;
	nr = 1;
	condition = DIA_KDW_1406_Mitras_JarCurse_condition;
	information = DIA_KDW_1406_Mitras_JarCurse_info;
	permanent = FALSE;
	description = " What do you think of this undead? " ;
};

func int DIA_KDW_1406_Mitras_JarCurse_condition()
{
	if ((Npc_KnowsInfo(hero,DIA_KDW_1406_Mitras_Hello) ==  TRUE ) && (MY_JarCurse == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_KDW_1406_Mitras_JarCurse_info()
{
	AI_Output(other,self, " DIA_KDW_1406_Mitras_JarCurse_01_00 " );	// What do you think of this undead?
	AI_Output(self,other, " DIA_KDW_1406_Mitras_JarCurse_01_01 " );	// Maybe I'm wrong, but it seems to me that they all obey someone's evil will, not otherwise.
	AI_Output(other,self, " DIA_KDW_1406_Mitras_JarCurse_01_02 " );	// Where did you get this from?
	AI_Output(self,other, " DIA_KDW_1406_Mitras_JarCurse_01_03 " );	// You see, at first, when Mixer and I just came here, everything was fine.
	AI_Output(self,other, " DIA_KDW_1406_Mitras_JarCurse_01_04 " );	// But then we constantly began to hear some strange kind of sounds.
	AI_Output(self,other, " DIA_KDW_1406_Mitras_JarCurse_01_05 " );	// Every night they spread under the vaults of this underground temple! I still get goosebumps from them.
	AI_Output(self,other, " DIA_KDW_1406_Mitras_JarCurse_01_06 " );	// In the end, I could not stand it all and decided to rise to the surface so that I would no longer hear this damn sound.
	AI_Output(self,other, " DIA_KDW_1406_Mitras_JarCurse_01_07 " );	// However, it hasn't disappeared! For me - on the contrary, it became even stronger and louder!
	AI_Output(self,other, " DIA_KDW_1406_Mitras_JarCurse_01_08 " );	// The source of this sound came from somewhere above. Most likely, from a small temple on top of a large pyramid.
	AI_Output(self,other, " DIA_KDW_1406_Mitras_JarCurse_01_09 " );	// It looked like some kind of prayer, or like someone was reciting a magic spell.
	AI_Output(self,other, " DIA_KDW_1406_Mitras_JarCurse_01_10 " );	// Only in some very strange language. I've never heard him before.
	AI_Output(other,self, " DIA_KDW_1406_Mitras_JarCurse_01_11 " );	// And you, of course, decided to go up there?
	AI_Output(self,other, " DIA_KDW_1406_Mitras_JarCurse_01_12 " );	// No...(fearful) To tell you the truth, I got a little scared and went back down to the Mixer.
	AI_Output(self,other, " DIA_KDW_1406_Mitras_JarCurse_01_13 " );	// And then, a few days later, the whole temple was overrun by the undead!
	AI_Output(self,other, " DIA_KDW_1406_Mitras_JarCurse_01_14 " );	// So. It seems to me that all this is somehow interconnected. Undead in the temple and that strange sound.
	AI_Output(other,self, " DIA_KDW_1406_Mitras_JarCurse_01_15 " );	// Okay, I'll check out that pyramid myself.
	AI_Output(self,other, " DIA_KDW_1406_Mitras_JarCurse_01_16 " );	// Good. Only it is better to do it at night, because during the day there is definitely no one there. We have already checked this.
	MIS_StrangeUpSound = LOG_Running;
	Log_CreateTopic(TOPIC_StrangeUpSound,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_StrangeUpSound,LOG_Running);
	B_LogEntry(TOPIC_StrangeUpSound, " Mithras told me about a strange sound that preceded the appearance of the undead in the temple at the pyramids. According to him, the source of the sound was most likely somewhere on top of the highest pyramid. I think I should check it out. It's best to do this at night. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(DMT_1296_JARCURSEMAGE,"NW_TROLLAREA_RUINS_JARCURSE");
};

instance DIA_KDW_1406_Mitras_JarCurseDone(C_Info)
{
	npc = KDW_1406_Mitras;
	nr = 1;
	condition = DIA_KDW_1406_Mitras_JarCurseDone_condition;
	information = DIA_KDW_1406_Mitras_JarCurseDone_info;
	permanent = FALSE;
	description = " I've dealt with your nightmare. " ;
};

func int DIA_KDW_1406_Mitras_JarCurseDone_condition()
{
	if((MIS_StrangeUpSound == LOG_Running) && (Npc_IsDead(DMT_1296_JARCURSEMAGE) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_KDW_1406_Mitras_JarCurseDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_KDW_1406_Mitras_JarCurseDone_01_00 " );	// I've dealt with your nightmare.
	AI_Output(self,other, " DIA_KDW_1406_Mitras_JarCurseDone_01_01 " );	// True? And what was that?
	AI_Output(other,self, " DIA_KDW_1406_Mitras_JarCurseDone_01_02 " );	// Some strange kind of undead. In general, it's okay.
	AI_Output(self,other, " DIA_KDW_1406_Mitras_JarCurseDone_01_03 " );	// Okay, you calmed me down.
	MIS_StrangeUpSound = LOG_Success;
	Log_SetTopicStatus(TOPIC_StrangeUpSound,LOG_Success);
	B_LogEntry(TOPIC_StrangeUpSound, " I calmed Mithras by dealing with whoever was causing him concern. " );	
};

// ------------------------------------------------ - Norolas------------------------------------------------ --

instance DIA_KDW_1407_Norolas_EXIT(C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 999;
	condition = DIA_KDW_1407_Norolas_EXIT_Condition;
	information = DIA_KDW_1407_Norolas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_KDW_1407_Norolas_EXIT_Condition()
{
	return TRUE;
};

func void DIA_KDW_1407_Norolas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_KDW_1407_Norolas_Hello(C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 1;
	condition = DIA_KDW_1407_Norolas_Hello_condition;
	information = DIA_KDW_1407_Norolas_Hello_info;
	permanent = FALSE;
	description = " You're a waterbender, aren't you? " ;
};

func int DIA_KDW_1407_Norolas_Hello_condition()
{
	if(MIS_SendNorolas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_KDW_1407_Norolas_Hello_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Hello_01_01 " );	// Are you a waterbender?
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Hello_01_02 " );	// Well, looking at my robe, it's hard not to guess.
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Hello_01_03 " );	// So you are the one Saturas sent on a mission to the swamps?
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Hello_01_04 " );	// Yes, you're right. Although I don't quite understand how you know this.
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Hello_01_05 " );	// The old man sent me to look after you. Still, the place is quite dangerous.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Hello_01_06 " );	// Ah, well, that's clear then. Well, I really can't help!
	) ; _ _ _
};

instance DIA_KDW_1407_Norolas_Progress(C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 1;
	condition = DIA_KDW_1407_Norolas_Progress_condition;
	information = DIA_KDW_1407_Norolas_Progress_info;
	permanent = FALSE;
	description = " And how are things? " ;
};

func int DIA_KDW_1407_Norolas_Progress_condition()
{
	if ((Npc_KnowsInfo(hero,DIA_KDW_1407_Norolas_Hello) ==  TRUE ) && (MY_SendNorolas == LOG_Running) && (UberionBook ==  FALSE ) && (Npc_HasItems(hero,ItWr_UberionBook) ==  0 )) ;
	{
		return TRUE;
	};
};

func void DIA_KDW_1407_Norolas_Progress_info()
{
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Progress_01_01 " );	// And how are things?
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Progress_01_02 " );	// Bad. All swamps are simply teeming with all sorts of undead.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Progress_01_03 " );	// I tried to get in there, but I could barely get my feet out.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Progress_01_04 " );	// So now all day long I just think how I can get to this temple of the Brotherhood.
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Progress_01_05 " );	// So you need to get to the temple itself?
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Progress_01_06 " );	// Well, yes. Most likely, it is there that Saturas needs so much.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Progress_01_07 " );	// But in any case, forget about it for now.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Progress_01_08 " );	// According to rumors, there lives a creature more terrible than just ordinary undead.
	B_LogEntry(TOPIC_SendNorolas, " Norolas said that the swamps are full of undead, and it would be suicidal to go there. Besides, the temple itself is inhabited by something worse than the ordinary dead. " );
};

instances DIA_KDW_1407_Norolas_Idea (C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 1;
	condition = DIA_KDW_1407_Norolas_Idea_condition;
	information = DIA_KDW_1407_Norolas_Idea_info;
	permanent = FALSE;
	description = " So what, no ideas yet? " ;
};

func int DIA_KDW_1407_Norolas_Idea_condition()
{
	if ((Npc_KnowsInfo(hero,DIA_KDW_1407_Norolas_Progress) ==  TRUE ) && (MY_SendNorolas == LOG_Running) && (UberionBook ==  FALSE ) && (Npc_HasItems(hero,ItWr_UberionBook) ==  0 )) ;
	{
		return TRUE;
	};
};

func void DIA_KDW_1407_Norolas_Idea_info()
{
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Idea_01_01 " );	// So what, no ideas yet?
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Idea_01_02 " );	// (thoughtfully) There's one here. But for this I need your help. I can't do it alone.
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Idea_01_03 " );	// Come on, lay it out. What did you think there?
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Idea_01_04 " );	// I want to make a special potion that will give me the ability to pass unhindered through the crowd of undead.
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Idea_01_05 " );	// Umm... how's that?
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Idea_01_06 " );	// When I drink it, they'll just think I'm just as undead as they are.
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Idea_01_07 " );	// Interesting thought. And do you know how to brew such an elixir?
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Idea_01_08 " );	// Unfortunately not. But I know that there is a recipe with a detailed description of the preparation of this elixir.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Idea_01_09 " );	// At least that's how it was written in one of the books that I once managed to read in the library of firebenders.
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Idea_01_10 " );	// I wonder how they let you dig into their notes?
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Idea_01_11 " );	// The thing is, I wasn't always a Waterbender.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Idea_01_12 " );	// At one time I lived in the monastery of the Fire Mages and was one of their novices.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Idea_01_13 " );	// But then he left him, and decided to devote the rest of his life to the service of Adanos.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Idea_01_14 " );	// So this recipe actually exists! It remains only to find him and prepare a potion.
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Idea_01_15 " );	// Okay, I'll try to get it for you. But I do not promise that it will be fast.
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Idea_01_16 " );	// After all, as far as I understand, you have no idea where to look for this recipe.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Idea_01_17 " );	// I'm in no hurry. For while this is the only opportunity to try to get into the temple.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Idea_01_18 " );	// Unless, of course, you want to fight the undead horde.
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Idea_01_19 " );	// Well, who knows.
	B_LogEntry(TOPIC_SendNorolas, " Norolas had an idea how to get into the temple. He told me about a potion that can change the way the undead perceive living things. He doesn't know how to make this elixir, but he heard that there is a recipe for it. Norolas is sure that he is somewhere in the Valley of Mines. " );
};

instances DIA_KDW_1407_Norolas_Rezept (C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 1;
	condition = DIA_KDW_1407_Norolas_Rezept_condition;
	information = DIA_KDW_1407_Norolas_Rezept_info;
	permanent = FALSE;
	description = " Here, look here. " ;
};

func int DIA_KDW_1407_Norolas_Rezept_condition()
{
	if ((Npc_KnowsInfo(hero,DIA_KDW_1407_Norolas_Idea) ==  TRUE ) && (MIS_SendNorolas == LOG_Running) && (Npc_HasItems(hero,ItWr_RezeptMist) >=  1 ) && ( UberionBook ==  FALSE ) && ( Npc_HasBook  ))
	{
		return TRUE;
	};
};

func void DIA_KDW_1407_Norolas_Rezept_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Rezept_01_01 " );	// Here, look here.
	B_GiveInvItems(other,self,ItWr_RezeptMist, 1 );
	Npc_RemoveInvItems(self,ItWr_RezeptMist, 1 );
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_01_02 " );	// Yes, it looks like it is.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_01_03 " );	// However, the recipe for this potion is more complicated than I thought.
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Rezept_01_04 " );	// What do you want to say?
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_01_05 " );	// You'll need some pretty complex ingredients to make it.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_01_06 " );	// And some of them I don't even know where to look.
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Rezept_01_07 " );	// For example?
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_01_08 " );	// For example, the plant referred to in this list as 'Black Clover'.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_01_09 " );	// But this is only a small part of what needs to be found.
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Rezept_01_10 " );	// And I feel like finding them will be my next assignment.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_01_11 " );	// (stammered) Well... I'd do it myself, but then it would take years to make the elixir.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_01_12 " );	// And as you understand, we don't have that much time right now.
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Rezept_01_13 " );	// Okay, you don't have to continue. I got it.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_01_14 " );	// Then take this list. Here are all the necessary ingredients that I will need.
	B_GiveInvItems(self,other,ItWr_RezeptIngridients,1);
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_01_15 " );	// In the meantime, I will prepare the ones I already have.
	B_LogEntry(TOPIC_SendNorolas, " Now I need to get Norolas the ingredients listed in the potion recipe. " );
};

instance DIA_KDW_1407_Norolas_Rezept_Ingr (C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 1;
	condition = DIA_KDW_1407_Norolas_Rezept_Ingr_condition;
	information = DIA_KDW_1407_Norolas_Rezept_Ingr_info;
	permanent = FALSE;
	description = " I've got everything you need. " ;
};

func int DIA_KDW_1407_Norolas_Rezept_Ingr_condition()
{
	if((KnowRezIng == TRUE) && (MIS_SendNorolas == LOG_Running) && (Npc_HasItems(hero,ItPl_DarkClover) >= 1) && (Npc_HasItems(hero,ItAt_SkeletonBone) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ITMI_ZOMBIECORPSE) >= 1) && (Npc_HasItems(hero,ITAT_CRAWLERQUEEN) >= 1) && (Npc_HasItems(hero,ItAt_DemonHeart) >= 1 ) && ( Npc_HasItems ( hero , ItMy_NecrUrn ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_KDW_1407_Norolas_Rezept_Ingr_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Rezept_Ingr_01_01 " );	// I collected everything you needed.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItAt_SkeletonBone,1);
	Npc_RemoveInvItems(other,ItMi_DarkPearl,1);
	Npc_RemoveInvItems(other,ITMI_ZOMBIECORPSE,1);
	Npc_RemoveInvItems(other,ITAT_CRAWLERQUEEN,1);
	Npc_RemoveInvItems(other,ItAt_DemonHeart,1);
	Npc_RemoveInvItems(other,ItMi_NecrUrn,1);
	Npc_RemoveInvItems(other,ItPl_DarkClover,1);
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_Ingr_01_02 " );	// Great! Now I can finally finish that elixir.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_Ingr_01_03 " );	// Wait a minute... (tensely) I've got everything ready, and it won't take a minute to make.
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_Ingr_01_04 " );	// That's it, the elixir is ready.
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Rezept_Ingr_01_05 " );	// And now, as I understand it, it must be tried.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_Ingr_01_06 " );	// I guess so. But you know, I... I'm kind of not ready for this at all.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_Ingr_01_07 " );	// Not that I doubt the correctness of its preparation, but...
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Rezept_Ingr_01_08 " );	// I understand your concerns. Then let me do it for you.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_Ingr_01_09 " );	// (incredulously) Are you sure about that? I can't guarantee that it won't affect your mind in any way.
	AI_Output(other,self, " DIA_KDW_1407_Norolas_Rezept_Ingr_01_10 " );	// Just give it to me. And there you will see.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_Ingr_01_11 " );	// Okay, if you're so sure about it... Here, hold it.
	B_GiveInvItems(self,other,ItPo_UndeadShield,1);
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_Ingr_01_12 " );	// (excitedly) I hope he doesn't... kill you.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_Ingr_01_13 " );	// And one more thing... It would be better if you drink it just before you go to the swamps.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_Rezept_Ingr_01_14 " );	// Its duration is rather limited. But it will be enough to thoroughly search the local area without fear of the undead.
	B_LogEntry(TOPIC_SendNorolas, " I got everything Norolas needed, and he concocted a potion that he said would keep me out of the undead's sight for a while. I volunteered to try the drink. However, Norolas warned me that the effect of the drink was limited, so it would be wiser to try it just before I decide to go to the swamps. " );
	AI_StopProcessInfos(self);
};

instance DIA_KDW_1407_Norolas_UberianBook(C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 1;
	condition = DIA_KDW_1407_Norolas_UberianBook_condition;
	information = DIA_KDW_1407_Norolas_UberianBook_info;
	permanent = FALSE;
	description = " Look what I found in the swamps. " ;
};

func int DIA_KDW_1407_Norolas_UberianBook_condition()
{
	if ((Npc_KnowsInfo(hero,DIA_KDW_1407_Norolas_Hello) ==  TRUE ) && (MY_SendNorolas == LOG_Running) && (Npc_HasItems(hero,ItWr_UberionBook) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_KDW_1407_Norolas_UberianBook_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self, " DIA_KDW_1407_Norolas_UberianBook_01_01 " );	// Look what I found in the swamps.
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_KDW_1407_Norolas_UberianBook_01_02 " );	// (thoughtfully) Hmmm, yes... Looks like this is what you and I were looking for!
	AI_Output(self,other, " DIA_KDW_1407_Norolas_UberianBook_01_03 " );	// But I think it's best if you take these notes to Master Saturas.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_UberianBook_01_04 " );	// I'm sure he'll be delighted with this find, for this book may contain a great many secrets about the Sleeper's magic!
	AI_Output(other,self, " DIA_KDW_1407_Norolas_UberianBook_01_05 " );	// Okay. What about you?
	AI_Output(self,other, " DIA_KDW_1407_Norolas_UberianBook_01_06 " );	// I'll stay here for now.
	AI_Output(other,self, " DIA_KDW_1407_Norolas_UberianBook_01_07 " );	// Why else?
	AI_Output(self,other, " DIA_KDW_1407_Norolas_UberianBook_01_08 " );	// I heard that there is a camp of former novices of the Brotherhood of the Sleeper not far from this place.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_UberianBook_01_09 " );	// I'd be interested in talking to them.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_UberianBook_01_10 " );	// And especially with their leader, who is rumored to be a real druid!
	AI_Output(other,self, " DIA_KDW_1407_Norolas_UberianBook_01_11 " );	// Druid?
	AI_Output(self,other, " DIA_KDW_1407_Norolas_UberianBook_01_12 " );	// Yes, a druid. Or, as they are also called, the magicians of nature.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_UberianBook_01_13 " );	// True, this is the only thing I know about them.
	AI_Output(self,other, " DIA_KDW_1407_Norolas_UberianBook_01_14 " );	// That's why I don't want to miss such a great opportunity to learn a little more about them.
	AI_Output(other,self, " DIA_KDW_1407_Norolas_UberianBook_01_15 " );	// Well, as you know.
	MIS_SendNorolas = LOG_Success;
	Log_SetTopicStatus(TOPIC_SendNorolas,LOG_Success);
	B_LogEntry(TOPIC_SendNorolas, " I showed Norolas the book I found in the swamp camp. He asked me to give it to Saturas while he went to the Brotherhood's former acolyte camp nearby. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"NetbekLager");
};
Footer
