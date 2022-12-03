

instance DIA_Nadja_EXIT(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 999;
	condition = DIA_Nadja_EXIT_Condition;
	information = DIA_Nadja_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Nadja_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Nadja_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Nadja_PICKPOCKET (C_Info)
{
	npc = VLK_435_Nadja;
	nr = 900;
	condition = DIA_Nadja_PICKPOCKET_Condition;
	information = DIA_Nadja_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Nadja_PICKPOCKET_Condition()
{
	return  C_Robbery ( 40 , 40 );
};

func void DIA_Nadja_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Nadja_PICKPOCKET);
	Info_AddChoice(DIA_Nadja_PICKPOCKET,Dialog_Back,DIA_Nadja_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Nadja_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Nadja_PICKPOCKET_DoIt);
};

func void DIA_Nadja_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Nadja_PICKPOCKET);
};

func void DIA_Nadja_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Nadja_PICKPOCKET);
};


instance DIA_Nadja_STANDARD (C_Info)
{
	npc = VLK_435_Nadja;
	nr = 3;
	condition = DIA_Nadja_STANDARD_Condition;
	information = DIA_Nadja_STANDARD_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Nadja_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Bromor_Pay == FALSE))
	{
		return TRUE;
	};
};

var int Nadja_LuciaInfo;

func void DIA_Nadja_STANDARD_Info()
{
	if(Nadja_LuciaInfo == TRUE)
	{
		AI_Output(self,other, " DIA_ADDON_Nadja_STANDARD_16_00 " );	// I will only speak to you after you have spoken to Bromor.
	}
	else
	{
		AI_Output(self,other, " DIA_Nadja_STANDARD_16_00 " );	// Hey, I can't take care of you right now, baby. If you want some fun, talk to Bromor.
	};
	if((SC_HearedAboutMissingPeople == TRUE) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE) && (Nadja_LuciaInfo == FALSE))
	{
		AI_Output(other,self, " DIA_ADDON_Nadja_STANDARD_15_01 " );	// I just wanted to ask you a couple of questions about missing people.
		AI_Output(self,other, " DIA_ADDON_Nadja_STANDARD_16_02 " );	// I could tell you something, honey, but not here.
		AI_Output(other,self, " DIA_ADDON_Nadja_STANDARD_15_03 " );	// Let's go upstairs then.
		AI_Output(self,other, " DIA_ADDON_Nadja_STANDARD_16_04 " );	// Good. But first you must negotiate with Bromor. I don't want trouble.
		Nadja_LuciaInfo = TRUE ;
	};

	AI_StopProcessInfos(self);
};


instance DIA_Nadja_After (C_Info)
{
	npc = VLK_435_Nadja;
	nr = 2;
	condition = DIA_Nadja_After_Condition;
	information = DIA_Nadja_After_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Nadja_After_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Bromor_Pay == FALSE) && (Nadja_Nacht == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Nadja_After_Info()
{
	AI_Output(self,other, " DIA_Nadja_Danach_16_00 " );	// Come back another time.
	Nadja_Night = FALSE ;
	AI_StopProcessInfos(self);
};

instance DIA_Nadja_hochgehen (C_Info)
{
	npc = VLK_435_Nadja;
	nr = 3;
	condition = DIA_Nadja_hochgehen_Condition;
	information = DIA_Nadja_hochgehen_Info;
	important = FALSE;
	permanent = TRUE;
	description = " Let's go upstairs. " ;
};

func int DIA_Nadja_hochgehen_Condition()
{
	if ((Bromor_Pay ==  TRUE ) && (IsUp ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Nadja_hochgehen_Info()
{
	AI_Output(other,self, " DIA_Nadja_hochgehen_15_00 " );	// Let's go upstairs.
	AI_Output(self,other, " DIA_Nadja_hochgehen_16_01 " );	// You got your lucky ticket today, baby! Let's go to.
	NadjaIsUp = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DANCE");
};


instances DIA_Addon_Nadja_LuciaInfo (C_Info)
{
	npc = VLK_435_Nadja;
	nr = 5;
	condition = DIA_Addon_Nadja_LuciaInfo_Condition;
	information = DIA_Addon_Nadja_LuciaInfo_Info;
	description = " Now can we talk? " ;
};

func int DIA_Addon_Nadja_LuciaInfo_Condition()
{
	if((Bromor_Pay == TRUE) && (NadjaIsUp == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 300) && (Nadja_LuciaInfo == TRUE))
	{
		return TRUE;
	};
};


var int Nadja_GaveLuciaInfo;

func void DIA_Addon_Nadja_LuciaInfo_Info()
{
	AI_Output(other,self, " DIA_Addon_Nadja_LuciaInfo_15_00 " );	// Well, now can we talk?
	AI_Output(self,other, " DIA_Addon_Nadja_LuciaInfo_16_01 " );	// Yes, we won't be overheard here.
	AI_Output(self,other, " DIA_Addon_Nadja_LuciaInfo_16_02 " );	// Bromor doesn't like it when we talk to guests during work if he doesn't benefit from it.
	AI_Output(self,other, " DIA_Addon_Nadja_LuciaInfo_16_03 " );	// So, you want to know more about the people who disappeared at the port, don't you?
	AI_Output(self,other, " DIA_Addon_Nadja_LuciaInfo_16_04 " );	// I don't know if I can help you, but at least I can tell you what happened to Lucia.
	Nadja_GaveLuciaInfo = TRUE ;
	Info_ClearChoices(DIA_Addon_Nadja_LuciaInfo);
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo, " Where did she disappear to? " ,DIA_Addon_Nadja_LuciaInfo_wo);
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo, " Tell me. " ,DIA_Addon_Nadja_LuciaInfo_lucia);
};

func void DIA_Addon_Nadja_LuciaInfo_lucia()
{
	AI_Output(other,self, " DIA_Addon_Nadja_LuciaInfo_lucia_15_00 " );	// Tell me.
	AI_Output(self,other, " DIA_Addon_Nadja_LuciaInfo_lucia_16_01 " );	// No one here really regrets that she disappeared.
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_lucia_15_02");	//Почему?
	AI_Output(self,other, " DIA_Addon_Nadja_LuciaInfo_lucia_16_03 " );	// There isn't a single person here that she hasn't tried to take advantage of.
	AI_Output(self,other, " DIA_Addon_Nadja_LuciaInfo_lucia_16_04 " );	// She was a real bitch!
};

func void DIA_Addon_Nadja_LuciaInfo_wo()
{
	AI_Output(other,self, " DIA_Addon_Nadja_LuciaInfo_wo_15_00 " );	// Where did she disappear to?
	AI_Output(self,other, " DIA_Addon_Nadja_LuciaInfo_wo_16_01 " );	// She often met with Elvrich, an apprentice carpenter Torben from the lower part of the city.
	AI_Output(self,other, " DIA_Addon_Nadja_LuciaInfo_wo_16_02 " );	// I bet she left with this guy.
	Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
	; _ _ _ _
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo, " Where could they have gone? " ,DIA_Addon_Nadja_LuciaInfo_Elvrich);
};

func void DIA_Addon_Nadja_LuciaInfo_Elvrich()
{
	AI_Output(other,self, " DIA_Addon_Nadja_LuciaInfo_Elvrich_15_00 " );	// Where could they have gone?
	AI_Output(self,other, " DIA_Addon_Nadja_LuciaInfo_Elvrich_16_01 " );	// If they haven't been eaten by wolves, I'm guessing they live with the farmers.
	AI_Output(self,other, " DIA_Addon_Nadja_LuciaInfo_Elvrich_16_02 " );	// Where else would they go?
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo, " What else do you know? " ,DIA_Addon_Nadja_LuciaInfo_sonst);
};

func void DIA_Addon_Nadja_LuciaInfo_others()
{
	AI_Output(other,self, " DIA_Addon_Nadja_LuciaInfo_sonst_15_00 " );	// What else do you know?
	AI_Output(self,other, " DIA_Addon_Nadja_LuciaInfo_sonst_16_01 " );	// I've heard strange stories about people disappearing.
	AI_Output(self,other, " DIA_Addon_Nadja_LuciaInfo_sonst_16_02 " );	// But I doubt these stories are worth believing.
	AI_Output(self,other, " DIA_Addon_Nadja_LuciaInfo_sonst_16_03 " );	// You should talk to the merchants.
	AI_Output(self,other, " DIA_Addon_Nadja_LuciaInfo_sonst_16_04 " );	// Unfortunately, that's all I can say.
	AI_Output(self,other, " DIA_Addon_Nadja_LuciaInfo_sonst_16_05 " );	// Well, now what are we going to do, dear? After all, you paid the money.
	AI_Output(self,other, " DIA_Addon_Nadja_LuciaInfo_sonst_16_06 " );	// Want to have some fun before you leave?
	Info_ClearChoices(DIA_Addon_Nadja_LuciaInfo);

	if((MIS_Andre_REDLIGHT == LOG_Running) && (Knows_Borka_Dealer == FALSE))
	{
		Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,PRINT_Addon_NadjaWait,DIA_Addon_Nadja_WAIT);
	};
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo, " Thanks, but I have to go. " ,DIA_Addon_Nadja_LuciaInfo_weiter);
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo, " Why not! " ,DIA_Nadja_Poppen_Start);
};

func void DIA_Addon_Nadja_LuciaInfo_weiter()
{
	AI_Output(other,self, " DIA_Addon_Nadja_LuciaInfo_weiter_15_00 " );	// Thanks, but I have to go.
	AI_Output(self,other, " DIA_Addon_Nadja_LuciaInfo_weiter_16_01 " );	// Very sorry! Well, then another time.
	Bromor_Pay = FALSE;
	Nadja_Night = TRUE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void DIA_Addon_Nadja_WAIT()
{
	Info_ClearChoices(DIA_Addon_Nadja_LuciaInfo);
};

var int LoveScene;

instance DIA_Nadja_Poppen (C_Info)
{
	npc = VLK_435_Nadja;
	nr = 3;
	condition = DIA_Nadja_Poppen_Condition;
	information = DIA_Nadja_Poppen_Info;
	permanent = TRUE;
	description = " Come to me!...(have fun) " ;
};

func int DIA_Nadja_Poppen_Condition()
{
	if((Bromor_Pay == TRUE) && (NadjaIsUp == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 300))
	{
		return TRUE;
	};
};

func void DIA_Nadja_Poppen_Info()
{
	if((LoveScene >= 2) && (LoveBonus == FALSE))
	{
		Snd_Play("LevelUp");
		hero.exp = hero.exp + 200;
		AI_NoticePrint(3000,4098,NAME_Addon_LoveBonus);
		LoveBonus = TRUE;
	};

	AI_Output(other,self, " DIA_Nadja_Poppen_16_99 " );	// Come to me!
	AI_Output(self,other, " DIA_Nadja_Poppen_16_00 " );	// The next couple of hours belongs to us only.
	AI_Output(self,other, " DIA_Nadja_Poppen_16_01 " );	// Relax! Lie down and enjoy.
	Info_ClearChoices(DIA_Nadja_Poppen);
	Info_AddChoice(DIA_Nadja_Dolls, " Хорошо... " ,DIA_Nadja_Dolls_Start);
};

func void DIA_Nadja_Poppen_Start()
{
	if(MIS_LoaRomance == LOG_Running)
	{
		LoaAntiBonus = TRUE;
	};

	Bromor_Pay = FALSE;
	Nadja_Night = TRUE ;
	LoveScene +=  1 ;
	PlayVideo("LOVESCENE.BIK");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void DIA_Addon_Nadja_LuciaInfo_Pop()
{
	DIA_Nadja_Dolls_Start();
};

instance DIA_Nadja_BUYHERB (C_Info)
{
	npc = VLK_435_Nadja;
	nr = 2;
	condition = DIA_Nadja_BUYHERB_Condition;
	information = DIA_Nadja_BUYHERB_Info;
	permanent = TRUE;
	description = " Can I buy weed here? " ;
};

func int DIA_Nadja_BUYHERB_Condition()
{
	if ((MY_Other_REDLIGHT == LOG_Running) && (Npc_KnowsInfo(other,DIA_Nadja_WANT_HERB) ==  FALSE ) && (Nadja_Money ==  FALSE ) && (Undercover_Failed ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Nadja_BUYHERB_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self, " DIA_Nadja_BUYHERB_15_00 " );	// Can I buy weed here?

	if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 500)
	{
		if((Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE) || (Hlp_IsItem(heroArmor,ITAR_TOWNGUARD) == TRUE))
		{
			AI_Output(self,other, " DIA_Nadja_BUYHERB_16_01 " );	// How should I know? And even if I had known, I still wouldn't have told the city guard.
			Undercover_Failed = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Nadja_BUYHERB_16_02 " );	// Pay some gold and I'll tell you where to get it.
			AI_Output(other,self, " DIA_Nadja_BUYHERB_15_03 " );	// How much do you want?
			AI_Output(self,other, " DIA_Nadja_BUYHERB_16_04 " );	// Fifty gold will be enough.
			Nadja_Money = TRUE;
		};
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);

		if ((Nadja_GiveLuciaInfo ==  FALSE ) && (Bromor_Pay ==  TRUE ) && (NadjaIsUp ==  TRUE ))
		{
			Npc_ExchangeRoutine(self,"DANCE");
		};
	};
};


instance DIA_Nadja_WANT_HERB(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 2;
	condition = DIA_Nadja_WANT_HERB_Condition;
	information = DIA_Nadja_WANT_HERB_Info;
	permanent = FALSE;
	description = " Now tell me, where can I buy weed? " ;
};


func int DIA_Nadja_WANT_HERB_Condition()
{
	if((Npc_HasItems(other,ItMi_Gold) >= 50) && (Nadja_Money == TRUE) && (MIS_Andre_REDLIGHT == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Nadja_WANT_HERB_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self, " DIA_Nadja_WANT_HERB_15_00 " );	// Now tell me where can I buy weed?

	if((Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE) || (Hlp_IsItem(heroArmor,ITAR_TOWNGUARD) == TRUE))
	{
		AI_Output(self,other, " DIA_Nadja_WANT_HERB_16_01 " );	// Sorry, I forgot.
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_Gold,50);
		AI_Output(self,other, " DIA_Nadja_WANT_HERB_16_02 " );	// Talk to Borka, baby. He has weed for you.
		Knows_Borka_Dealer = TRUE;
	};
};
