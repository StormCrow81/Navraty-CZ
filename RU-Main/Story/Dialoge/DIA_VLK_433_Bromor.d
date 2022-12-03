

instance DIA_Bromor_EXIT(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 999;
	condition = DIA_Bromor_EXIT_Condition;
	information = DIA_Bromor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bromor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bromor_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

var int BromorFirstMeet;

instance DIA_Bromor_GIRLS(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_GIRLS_Condition;
	information = DIA_Bromor_GIRLS_Info;
	permanent = TRUE;
	description = " Are you the owner of this place? " ;
};

func int DIA_Bromor_GIRLS_Condition()
{
	if((NpcObsessedByDMT_Bromor == FALSE)	 && (BromorFirstMeet == FALSE))

	{
		return TRUE;
	};
};

func void DIA_Bromor_GIRLS_Info()
{
	if (Wld_IsTime( 13 , 0 , 16 , 0 ) ==  FALSE )
	{
		AI_Output(other,self, " DIA_Addon_Bromor_GIRLS_15_00 " );	// Are you the owner of this establishment?
		AI_Output(self,other, " DIA_Bromor_GIRLS_07_02 " );	// I'm Bromor! This is my house and these are my girls. I love my girls.
		AI_Output(self,other, " DIA_Bromor_GIRLS_07_03 " );	// And if you love my girls too, you have to pay fifty gold coins for it.
		AI_Output(self,other, " DIA_Bromor_GIRLS_07_04 " );	// Just make sure no problems.
		BromorFirstMeet = TRUE;
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	};
};


instance DIA_Addon_Bromor_MissingPeople(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Addon_Bromor_MissingPeople_Condition;
	information = DIA_Addon_Bromor_MissingPeople_Info;
	description = " Are your girls all right? " ;
};


func int DIA_Addon_Bromor_MissingPeople_Condition()
{
	if((NpcObsessedByDMT_Bromor == FALSE) && (SC_HearedAboutMissingPeople == TRUE) && (BromorFirstMeet == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bromor_MissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Bromor_MissingPeople_15_00 " );	// Are your girls all right?
	AI_Output(self,other, " DIA_Addon_Bromor_MissingPeople_07_01 " );	// Of course! Or do you think I want to go to jail?
	AI_Output(other,self, " DIA_Addon_Bromor_MissingPeople_15_02 " );	// I don't ask about their health. I mean, they're all there. Or is there no one?
	AI_Output(self,other, " DIA_Addon_Bromor_MissingPeople_07_03 " );	// Ahh...(thoughtfully) Yes, one of my girls is really missing! Her name is Lucia.
	AI_Output(self,other, " DIA_Addon_Bromor_MissingPeople_07_04 " );	// I even addressed people from the militia. But they found no trace of her.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople, " A whore named Lucia has gone missing from a brothel in the harbor. " );
};


instance DIA_Addon_Bromor_Lucia (C_Info)
{
	npc = VLK_433_Bromor;
	nr = 5;
	condition = DIA_Addon_Bromor_Lucia_Condition;
	information = DIA_Addon_Bromor_Lucia_Info;
	description = " How long was Lucia away? " ;
};


func int DIA_Addon_Bromor_Lucia_Condition()
{
	if((NpcObsessedByDMT_Bromor == FALSE) && (SC_HearedAboutMissingPeople == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Bromor_MissingPeople))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bromor_Lucia_Info()
{
	AI_Output(other,self, " DIA_Addon_Bromor_Lucia_15_00 " );	// How long has Lucia been gone?
	AI_Output(self,other, " DIA_Addon_Bromor_Lucia_07_01 " );	// Several days. I don't know exactly how much.
	AI_Output(self,other, " DIA_Addon_Bromor_Lucia_07_02 " );	// I guess she ran off with one of her suitors.
	AI_Output(self,other, " DIA_Addon_Bromor_Lucia_07_03 " );	// That bitch brought something with her. My precious golden dish.
	AI_Output(self,other, " DIA_Addon_Bromor_Lucia_07_04 " );	// If she falls into my hands, she will pay the price!
	AI_Output(self,other, " DIA_Addon_Bromor_Lucia_07_05 " );	// But what do you care? What, you want to laugh at me?
	Log_CreateTopic(TOPIC_Addon_BromorsGold,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold,LOG_Running);
	B_LogEntry(TOPIC_Addon_BromorsGold, " Slut Lucia stole a golden cup from her boss, Bromor. Bromor wants that cup back. " );
	MIS_Bromor_LuciaStoleGold = LOG_Running;
};


instance DIA_Addon_Bromor_LuciaGold (C_Info)
{
	npc = VLK_433_Bromor;
	nr = 5;
	condition = DIA_Addon_Bromor_LuciaGold_Condition;
	information = DIA_Addon_Bromor_LuciaGold_Info;
	permanent = TRUE;
	description = " I found the dish that Lucia stole. " ;
};


func int DIA_Addon_Bromor_LuciaGold_Condition()
{
	if ((NpcObsessedByDMT_Brother ==  FALSE ) && (MY_Brother_LuciaStoleGold == LOG_Running) && Npc_HasItems(other,ItMy_BrothersGold_Addon));
	{
		return TRUE;
	};
};

func void DIA_Addon_Bromor_LuciaGold_Info()
{
	AI_Output(other,self, " DIA_Addon_Bromor_LuciaGold_15_00 " );	// I found the dish that Lucia stole.
	AI_Output(self,other, " DIA_Addon_Bromor_LuciaGold_07_01 " );	// Great, I'll be glad to have it back.
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	if (Bromor_house ban ==  FALSE )
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold, " How about a reward? " ,DIA_Addon_Bromor_LuciaGold_lohn);
	};
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold, " Вот блюдо. " ,DIA_Addon_Bromor_LuciaGold_einfachgeben);
	if(DIA_Addon_Bromor_LuciaGold_lucia_OneTime == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold, " Aren't you curious what happened to Lucia? " ,DIA_Addon_Bromor_LuciaGold_lucia);
	};
};

func void DIA_Addon_Bromor_LuciaGold_just give()
{
	AI_Output(other,self, " DIA_Addon_Bromor_LuciaGold_einfachgeben_15_00 " );	// Here is the dish.
	B_GiveInvItems(other,self,ItMi_BromorsGeld_Addon,1);
	AI_Output(self,other, " DIA_Addon_Bromor_LuciaGold_einfachgeben_07_01 " );	// Thank you. Very generous of you. Anything else?
	MIS_Bromor_LuciaStoleGold = LOG_SUCCESS;
	Bromor_ban on house = FALSE ;
	B_GivePlayerXP(XP_Addon_Bromor_LuciaGold);
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
};


var int DIA_Addon_Bromor_LuciaGold_lucia_OneTime;

func void DIA_Addon_Bromor_LuciaGold_lucia()
{
	AI_Output(other,self, " DIA_Addon_Bromor_LuciaGold_lucia_15_00 " );	// Aren't you wondering what happened to Lucia?
	AI_Output(self,other, " DIA_Addon_Bromor_LuciaGold_lucia_07_01 " );	// No. Why should I know? The main thing is that I have a dish.
	AI_Output(self,other, " DIA_Addon_Bromor_LuciaGold_lucia_07_02 " );	// I've been without Lucia all this time, and I'll get by. Why should I try to get her back?
	DIA_Addon_Bromor_LuciaGold_lucia_OneTime = TRUE;
};

func void DIA_Addon_Bromor_LuciaGold_lohn()
{
	AI_Output(other,self, " DIA_Addon_Bromor_LuciaGold_lohn_15_00 " );	// How about a reward?
	AI_Output(self,other, " DIA_Addon_Bromor_LuciaGold_lohn_07_01 " );	// You can spend free time with one of my girls. What do you say?
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	if(DIA_Addon_Bromor_LuciaGold_lucia_OneTime == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold, " Aren't you curious what happened to Lucia? " ,DIA_Addon_Bromor_LuciaGold_lucia);
	};
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold, " This is not enough. " ,DIA_Addon_Bromor_LuciaGold_mehr);
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold, " Agree! Here's a dish. " ,DIA_Addon_Bromor_LuciaGold_geben);
};

func void DIA_Addon_Bromor_LuciaGold_more()
{
	AI_Output(other,self, " DIA_Addon_Bromor_LuciaGold_mehr_15_00 " );	// This is not enough.
	AI_Output(self,other, " DIA_Addon_Bromor_LuciaGold_mehr_07_01 " );	// Agree, or you may not show up here anymore.
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold, " Forget it. " ,DIA_Addon_Bromor_LuciaGold_nein);
};

func void DIA_Addon_Bromor_LuciaGold_no()
{
	AI_Output(other,self, " DIA_Addon_Bromor_LuciaGold_nein_15_00 " );	// Forget it.
	AI_Output(self,other, " DIA_Addon_Bromor_LuciaGold_nein_07_01 " );	// Then get the hell out of my place, you bastard.
	AI_Output(self,other, " DIA_Addon_Bromor_LuciaGold_nein_07_02 " );	// And don't think you'll ever get served here.
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	Bromor_ban = TRUE ;
	Bromor_Pay = 0;
};

func void DIA_Addon_Bromor_LuciaGold_giving()
{
	AI_Output(other,self, " DIA_Addon_Bromor_LuciaGold_geben_15_00 " );	// Agree! Here is the dish.
	B_GiveInvItems(other,self,ItMi_BromorsGeld_Addon,1);
	AI_Output(self,other, " DIA_Addon_Bromor_LuciaGold_geben_07_01 " );	// Thank you. Go to Nadia. She'll keep you company upstairs.
	Bromor_Pay = TRUE;
	NadjaIsUp = FALSE;
	Nadja_Night = FALSE ;
	MIS_Bromor_LuciaStoleGold = LOG_SUCCESS;
	Bromor_ban on house = FALSE ;
	B_GivePlayerXP(XP_Addon_Bromor_LuciaGold);
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
};


instance DIA_Bromor_Pay(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_Pay_Condition;
	information = DIA_Bromor_Pay_Info;
	permanent = TRUE;
	description = " I want to have fun. (Price: 50 gold coins) " ;
};

func int DIA_Bromor_Pay_Condition()
{
	if ((Brother_Pay ==  FALSE ) && (Brother_Housewife ==  FALSE ) && (BrotherFirstMeet ==  TRUE ) && (NpcObsessedByDMT_Brother ==  FALSE ) && (Npc_IsDead(Nadja) ==  FALSE ))
	{
		return TRUE;
	};
};


var int DIA_Bromor_Pay_OneTime;

func void DIA_Bromor_Pay_Info()
{
	AI_Output(other,self, " DIA_Bromor_Pay_15_00 " );	// I want to have some fun.

	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other, " DIA_Bromor_Pay_07_01 " );	// Great! You won't forget the next few hours of your life for a long time.
		AI_Output(self,other, " DIA_Bromor_Pay_07_02 " );	// Go upstairs with Nadia! Good luck.

		if ( DIA_Bromor_Pay_OneTime ==  FALSE )
		{
			DIA_Bromor_Pay_OneTime = TRUE;
		};

		Bromor_Pay = TRUE;
		NadjaIsUp = FALSE;
	}
	else
	{
		AI_Output(self,other, " DIA_Bromor_Pay_07_03 " );	// I can't stand it when someone tries to trick me! Get out of here if you can't pay.
	};

	B_NpcClearObsessionByDMT(self);
};


instance DIA_Bromor_DOPE(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 3;
	condition = DIA_Bromor_DOPE_Condition;
	information = DIA_Bromor_DOPE_Info;
	permanent = FALSE;
	description = " Can I get 'special' services, huh? " ;
};

func int DIA_Bromor_DOPE_Condition()
{
	if ((MY_Other_REDLIGHT == LOG_Running) && (NpcObsessedByDMT_Brother ==  FALSE ) && (Brother_Household ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Bromor_DOPE_Info()
{
	AI_Output(other,self, " DIA_Bromor_DOPE_15_00 " );	// Can I get 'special' services, huh?
	AI_Output(self,other, " DIA_Bromor_DOPE_07_01 " );	// Of course, all my girls are special!
	AI_Output(self,other, " DIA_Bromor_DOPE_07_02 " );	// If you have money, you can go upstairs with Nadia.
};

instance DIA_Bromor_Obsession(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 30;
	condition = DIA_Bromor_Obsession_Condition;
	information = DIA_Bromor_Obsession_Info;
	description = " Is everything okay? " ;
};


func int DIA_Bromor_Obsession_Condition()
{
	if ((Chapter >=  3 ) && (NpcObsessedByDMT_Bromother ==  FALSE ) && (hero.guild ==  GIL_KDF ))
	{
		return TRUE;
	};
};

var int DIA_Bromor_Obsession_GotMoney;

func void DIA_Bromor_Obsession_Info()
{
	B_NpcObsessedByDMT(self);
};


instance DIA_Bromor_Healing (C_Info)
{
	npc = VLK_433_Bromor;
	nr = 55;
	condition = DIA_Bromor_Heilung_Condition;
	information = DIA_Bromor_Healing_Info;
	permanent = TRUE;
	description = " You're possessed. " ;
};


func int DIA_Bromor_Heilung_Condition()
{
	if((NpcObsessedByDMT_Bromor == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Bromor_Healing_Info()
{
	AI_Output(other,self, " DIA_Bromor_Heilung_15_00 " );	// You're obsessed.
	AI_Output(self,other, " DIA_Bromor_Heilung_07_01 " );	// What? What are you talking about? Get out of here.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Bromor_PICKPOCKET(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 900;
	condition = DIA_Bromor_PICKPOCKET_Condition;
	information = DIA_Bromor_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};

func int DIA_Bromor_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_Bromor) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Bromor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bromor_PICKPOCKET);
	Info_AddChoice(DIA_Bromor_PICKPOCKET,Dialog_Back,DIA_Bromor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bromor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bromor_PICKPOCKET_DoIt);
};

func void DIA_Bromor_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,ItKe_Bromor,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Bromor_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Bromor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bromor_PICKPOCKET);
};

instance DIA_Bromor_AskForWoman(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_AskForWoman_Condition;
	information = DIA_Bromor_AskForWoman_Info;
	permanent = FALSE;
	description = " I have a special order! " ;
};

func int DIA_Bromor_AskForWoman_Condition()
{
	if((MIS_WomanForSkip == LOG_Running)  && (BromorFirstMeet == TRUE) && (NpcObsessedByDMT_Bromor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bromor_AskForWoman_Info()
{
	AI_Output(other,self, " DIA_Bromor_AskForWoman_01_01 " );	// I have a special order!

	if (Npc_IsDead(VLK_436_Sonja) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Bromor_AskForWoman_01_02 " );	// (smiling) Do you want two at once? Or maybe three?
		AI_Output(self,other, " DIA_Bromor_AskForWoman_01_03 " );	// I'm sorry, but I don't have that many free birds right now.
		AI_Output(other,self, " DIA_Bromor_AskForWoman_01_04 " );	// No, I need one, but for three days.
		AI_Output(self,other, " DIA_Bromor_AskForWoman_01_05 " );	// No problem! (laughs) Don't leave my establishment for a week! I will only be glad.
		AI_Output(other,self, " DIA_Bromor_AskForWoman_01_06 " );	// Well, actually, I want to take one of your girls with me.
		AI_Output(other,self, " DIA_Bromor_AskForWoman_01_07 " );	// But I promise to return her safe and sound!
		AI_Output(self,other, " DIA_Bromor_AskForWoman_01_08 " );	// (surprised) Yes, your request is really unusual! However, this is not a problem either.
		AI_Output(self,other, " DIA_Bromor_AskForWoman_01_09 " );	// You just have to pay more! And then it's yours.
		AI_Output(other,self, " DIA_Bromor_AskForWoman_01_10 " );	// How much do you want?
		AI_Output(self,other, " DIA_Bromor_AskForWoman_01_11 " );	// Let me think. Three days for fifty gold coins... That's one hundred and fifty coins.
		AI_Output(self,other, " DIA_Bromor_AskForWoman_01_12 " );	// For work outside the walls of my establishment, I charge double the rate! And it already comes out three hundred gold.
		AI_Output(self,other, " DIA_Bromor_AskForWoman_01_13 " );	// The risk of the girl getting hurt or not coming back will cost you another seven hundred coins.
		AI_Output(self,other, " DIA_Bromor_AskForWoman_01_14 " );	// So... (counting) On two thousand gold coins, you and I will completely agree!
		Info_ClearChoices(DIA_Bromor_AskForWoman);

		if(RhetorikSkillValue[1] >= 20)
		{
			Info_AddChoice(DIA_Bromor_AskForWoman, " Your account is very strange! " ,DIA_Bromor_AskForWoman_Yes);
		};

		Info_AddChoice(DIA_Bromor_AskForWoman, " Isn't it too expensive? " ,DIA_Bromor_AskForWoman_No);
	}
	else
	{
		AI_Output(self,other, " DIA_Bromor_AskForWoman_01_15 " );	// Sorry. One of my girls is dead.
		AI_Output(self,other, " DIA_Bromor_AskForWoman_01_16 " );	// So I'm not up to special orders right now.
		SonyaNoGoWithMe = TRUE;
	};
};



func void DIA_Bromor_AskForWoman_Yes()
{
	AI_Output(other,self, " DIA_Bromor_AskForWoman_Yes_01_01 " );	// You have a very strange account!
	AI_Output(self,other,"DIA_Bromor_AskForWoman_Yes_01_02");	//Правда?
	AI_Output(other,self, " DIA_Bromor_AskForWoman_Yes_01_03 " );	// I only counted a thousand gold pieces.
	AI_Output(self,other, " DIA_Bromor_AskForWoman_Yes_01_04 " );	// Oh, yes... (innocently) I just forgot to mention a small tax to the militia.
	AI_Output(self,other, " DIA_Bromor_AskForWoman_Yes_01_05 " );	// And then you never know, some problems will suddenly arise.
	AI_Output(other,self, " DIA_Bromor_AskForWoman_Yes_01_06 " );	// Deal with the militia yourself! Don't drag me here.
	AI_Output(other,self, " DIA_Bromor_AskForWoman_Yes_01_07 " );	// So I pay you exactly a thousand coins - and my girl.
	AI_Output(self,other, " DIA_Bromor_AskForWoman_Yes_01_08 " );	// Eh... Okay, deal with it. But money up front!

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	B_LogEntry(TOPIC_WomanForSkip, " Bromor agreed to give me one of his girls for one thousand coins. " );
	BromorDisCount_01 = TRUE;
};

func void DIA_Bromor_AskForWoman_No()
{
	AI_Output(other,self, " DIA_Bromor_AskForWoman_No_01_01 " );	// Isn't it too expensive?
	AI_Output(self,other, " DIA_Bromor_AskForWoman_No_01_02 " );	// These are my conditions! If you don't want to, you don't have to pay.
	AI_Output(self,other, " DIA_Bromor_AskForWoman_No_01_03 " );	// But forget about my girl, too.
	B_LogEntry(TOPIC_WomanForSkip, " Bromor agreed to give me one of his girls for two thousand coins. " );
	BromorDisCount_02 = TRUE;
};

instance DIA_Bromor_AskForWoman_Pay(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_AskForWoman_Pay_Condition;
	information = DIA_Bromor_AskForWoman_Pay_Info;
	permanent = TRUE;
	description = " Here is your gold. " ;
};

func int DIA_Bromor_AskForWoman_Pay_Condition()
{
	if((MIS_WomanForSkip == LOG_Running) && (SonyaGoWithMe == FALSE) && (SonyaNoGoWithMe == FALSE) && ((BromorDisCount_01 == TRUE) || (BromorDisCount_02 == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bromor_AskForWoman_Pay_Info()
{
	AI_Output(other,self, " DIA_Bromor_AskForWoman_Pay_01_01 " );	// Here's your gold.
	
	if(Npc_IsDead(VLK_436_Sonja) == TRUE)
	{
		AI_Output(self,other, " DIA_Bromor_AskForWoman_Pay_01_02 " );	// One of my girls is dead! So our contract is cancelled.
		B_LogEntry(TOPIC_WomanForSkip, " Bromore refused the deal because one of his girls is dead. " );
		SonyaNoGoWithMe = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		if(BromorDisCount_01 == TRUE)
		{
			if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
			{
				B_GivePlayerXP(100);
				B_GiveInvItems(other,self,ItMi_Gold,1000);
				Npc_RemoveInvItems(self,ItMi_Gold,1000);
				AI_Output(self,other, " DIA_Bromor_AskForWoman_Pay_01_03 " );	// Great! Then you can take Sonya with you.
				AI_Output(self,other, " DIA_Bromor_AskForWoman_Pay_01_04 " );	// Just look, bring her back on time! Otherwise, I'll raise the alarm.
				B_LogEntry(TOPIC_WomanForSkip, " Now I can take Sonya with me. I must remember to return her to Bromor on time. " );	
				SonyaGoWithMe = TRUE;
				SonyaGoWithMeDay = Wld_GetDay();
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Print(Print_NotEnoughGold);
				AI_Output(self,other, " DIA_Bromor_Pay_07_03 " );	// I can't stand it when someone tries to trick me! Get out of here if you can't pay.
				AI_StopProcessInfos(self);
			};
		}
		else if(BromorDisCount_02 == TRUE)
		{
			if(Npc_HasItems(hero,ItMi_Gold) >= 2000)
			{
				B_GivePlayerXP(100);
				B_GiveInvItems(other,self,ItMi_Gold,2000);
				Npc_RemoveInvItems(self,ItMi_Gold,2000);
				AI_Output(self,other, " DIA_Bromor_AskForWoman_Pay_01_03 " );	// Great! Then you can take Sonya with you.
				AI_Output(self,other, " DIA_Bromor_AskForWoman_Pay_01_04 " );	// Just look, bring her back on time! Otherwise, I'll raise the alarm.
				B_LogEntry(TOPIC_WomanForSkip, " Now I can take Sonya with me. I must remember to return her to Bromor on time. " );	
				SonyaGoWithMe = TRUE;
				SonyaGoWithMeDay = Wld_GetDay();
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Print(Print_NotEnoughGold);
				AI_Output(self,other, " DIA_Bromor_Pay_07_03 " );	// I can't stand it when someone tries to trick me! Get out of here if you can't pay.
				AI_StopProcessInfos(self);
			};
		}
		else
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other, " DIA_Bromor_Pay_07_03 " );	// I can't stand it when someone tries to trick me! Get out of here if you can't pay.
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_Bromor_AskForWoman_Back(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_AskForWoman_Back_Condition;
	information = DIA_Bromor_AskForWoman_Back_Info;
	permanent = FALSE;
	description = " I got Sonya back. " ;
};

func int DIA_Bromor_AskForWoman_Back_Condition()
{
	if((MIS_WomanForSkip == LOG_Running) && (SonyaBackOk == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bromor_AskForWoman_Back_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Bromor_AskForWoman_Back_01_01 " );	// I returned Sonya.
	AI_Output(self,other, " DIA_Bromor_AskForWoman_Back_01_02 " );	// Good! If you ever need anything else, please get in touch.
	MIS_WomanForSkip = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_WomanForSkip,LOG_SUCCESS);
	B_LogEntry(TOPIC_WomanForSkip, " I brought Sonya back to the brothel. " );
};

instance DIA_Bromor_AskForWoman_BadBack(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_AskForWoman_BadBack_Condition;
	information = DIA_Bromor_AskForWoman_BadBack_Info;
	permanent = FALSE;
	description = " I got Sonya back. " ;
};

func int DIA_Bromor_AskForWoman_BadBack_Condition()
{
	if((MIS_WomanForSkip == LOG_Running) && (SonyaBackOkNot == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bromor_AskForWoman_BadBack_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Bromor_AskForWoman_BadBack_01_01 " );	// I returned Sonya.
	AI_Output(self,other, " DIA_Bromor_AskForWoman_BadBack_01_02 " );	// Wait! It seems that the conversation was only about three days.
	AI_Output(self,other, " DIA_Bromor_AskForWoman_BadBack_01_03 " );	// And much more has passed!
	AI_Output(other,self, " DIA_Bromor_AskForWoman_BadBack_01_04 " );	// So what?
	AI_Output(self,other,"DIA_Bromor_AskForWoman_BadBack_01_05");	//А вот что...
	MIS_WomanForSkip = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_WomanForSkip);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};
