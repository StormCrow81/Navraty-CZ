

instance DIA_Rod_EXIT(C_Info)
{
	npc = Sld_804_Rod;
	nr = 999;
	condition = DIA_Rod_EXIT_Condition;
	information = DIA_Rod_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rod_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rod_EXIT_Info()
{
	AI_EquipBestMeleeWeapon(self);
	AI_StopProcessInfos(self);
};


instance DIA_Rod_Hello(C_Info)
{
	npc = Sld_804_Rod;
	nr = 1;
	condition = DIA_Rod_Hello_Condition;
	information = DIA_Rod_Hello_Info;
	permanent = FALSE;
	description = " How are you? " ;
};


func int DIA_Rod_Hello_Condition()
{
	return TRUE;
};

func void DIA_Rod_Hello_Info()
{
	AI_Output(other,self, " DIA_Rod_Hello_15_00 " );	// How are you?

	if(other.guild != GIL_SLD)
	{
		AI_Output(self,other, " DIA_Rod_Hello_06_01 " );	// What do YOU ​​want from me baby?

		if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
		{
			AI_Output(self,other, " DIA_Rod_Hello_06_02 " );	// What, there was no place for you in the monastery?
		};
	};
};


var int Rod_WeakSaid;
var int Rod_Brand_2h;

instance DIA_Rod_Teach(C_Info)
{
	npc = Sld_804_Rod;
	nr = 3;
	condition = DIA_Rod_Teach_Condition;
	information = DIA_Rod_Teach_Info;
	permanent = TRUE;
	description = " I want to learn how to use two-handed weapons better! " ;
};

func int DIA_Rod_Teach_Condition()
{
	if(Rod_Teach2H == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Rod_Teach_Info()
{
	AI_Output(other,self, " DIA_Rod_Teach_15_00 " );	// I want to learn how to use two-handed weapons better!
	AI_Output(self,other, " DIA_Rod_WannaLearn_06_01 " );	// I'm a good fighter, but that doesn't mean I'm a good teacher.
	AI_Output(self,other, " DIA_Rod_WannaLearn_06_02 " );	// Still, I think I can show you the basics of two-handed combat.
	Rod_Merke_2h = other.HitChance[NPC_TALENT_2H];
	Info_ClearChoices(DIA_Rod_Teach);
	Info_AddChoice(DIA_Rod_Teach,Dialog_Back,DIA_Rod_Teach_Back);
	Info_AddChoice(DIA_Rod_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Rod_Teach_2H_1);
	Info_AddChoice(DIA_Rod_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Rod_Teach_2H_5);
};

func void DIA_Rod_Teach_Back()
{
	if(Rod_Merke_2h < other.HitChance[NPC_TALENT_2H])
	{
		AI_Output(self,other, " DIA_Rod_Teach_BACK_06_00 " );	// You're already better at it.
	};
	Info_ClearChoices(DIA_Rod_Teach);
};

func void DIA_Rod_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,90);
	Info_ClearChoices(DIA_Rod_Teach);
	Info_AddChoice(DIA_Rod_Teach,Dialog_Back,DIA_Rod_Teach_Back);
	Info_AddChoice(DIA_Rod_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Rod_Teach_2H_1);
	Info_AddChoice(DIA_Rod_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Rod_Teach_2H_5);
};

func void DIA_Rod_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,90);
	Info_ClearChoices(DIA_Rod_Teach);
	Info_AddChoice(DIA_Rod_Teach,Dialog_Back,DIA_Rod_Teach_Back);
	Info_AddChoice(DIA_Rod_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Rod_Teach_2H_1);
	Info_AddChoice(DIA_Rod_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Rod_Teach_2H_5);
};


instance DIA_Rod_WannaJoin(C_Info)
{
	npc = Sld_804_Rod;
	nr = 4;
	condition = DIA_Rod_WannaJoin_Condition;
	information = DIA_Rod_WannaJoin_Info;
	permanent = TRUE;
	description = " I want to join the mercenaries! " ;
};


func int DIA_Rod_WannaJoin_Condition()
{
	if((other.guild == GIL_NONE) && (RodAgreed == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rod_WannaJoin_Info()
{
	AI_Output(other,self, " DIA_Rod_WannaJoin_15_00 " );	// I want to join the mercenaries!

	if(Npc_HasItems(self,ItMw_2h_Rod) == 0)
	{
		AI_Output(self,other, " DIA_Rod_WannaJoin_06_01 " );	// How about giving me back my sword first, huh?
	}
	else if((self.aivar[AIV_DefeatedByPlayer] == TRUE) || (Rod_WetteGewonnen == TRUE))
	{
		if(self.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			AI_Output(self,other, " DIA_Rod_WannaJoin_06_02 " );	// Good! I don't hold grudges.
			AI_Output(self,other, " DIA_Rod_WannaJoin_06_03 " );	// You know how to fight, and that's all that matters.
			AI_Output(self,other, " DIA_Rod_WannaJoin_06_04 " );	// Most of the guys here don't care about petty fights between friends. You will get used to it.
		};

		AI_Output(self,other, " DIA_Rod_WannaJoin_06_06 " );	// If you're interested in my opinion, then I don't mind.
		B_LogEntry(TOPIC_SLDRespekt, " I'll get Rod's vote if I want to join the mercenaries. " );
		RodAgreed = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Rod_WannaLearn_06_05 " );	// Why don't you go to the pasture and play round dance with the sheep?
		Rod_WeaklySaid = TRUE ;
	};
};


instance DIA_Rod_Duell (C_Info)
{
	npc = Sld_804_Rod;
	nr = 6;
	condition = DIA_Rod_Duell_Condition;
	information = DIA_Rod_Duell_Info;
	permanent = TRUE;
	description = " Looks like I need to teach you some manners, do you mind? " ;
};


func int DIA_Rod_Duell_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] ==  FALSE )
	{
		if ((Rod_BetWon ==  FALSE ) && (Rod_WeakSaid ==  TRUE ))
		{
			return TRUE;
		};
		if(MIS_Jarvis_SldKO == LOG_Running)
		{
			return TRUE;
		};
	};
};

func void DIA_Rod_Duell_Info()
{
	AI_Output(other,self, " DIA_Rod_Duell_15_00 " );	// Sounds like I need to teach you some manners, do you mind?

	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output(self,other, " DIA_Rod_Duell_06_01 " );	// Come on, try it!
	}
	else
	{
		AI_Output(self,other, " DIA_Rod_Duell_06_02 " );	// You don't learn anything!
	};

	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Rod_StarkGenug(C_Info)
{
	npc = Sld_804_Rod;
	nr = 5;
	condition = DIA_Rod_StarkGenug_Condition;
	information = DIA_Rod_StarkGenug_Info;
	permanent = FALSE;
	description = " I'm strong enough! " ;
};

func int DIA_Rod_StarkGenug_Condition()
{
	if ((self.aivar[AIV_DefeatedByPlayer] ==  FALSE ) && (Rod_WetteExposed ==  FALSE ) && (Rod_SchwachSpoken ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Rod_StarkGenug_Info()
{
	AI_Output(other,self, " DIA_Rod_StarkGenug_15_00 " );	// I'm strong enough!
	AI_Output(self,other, " DIA_Rod_StarkGenug_06_01 " );	// Nonsense! You couldn't even lift a decent sword like mine!
	MIS_RodWette = LOG_Running;
	Log_CreateTopic(Topic_RodWette,LOG_MISSION);
	Log_SetTopicStatus(Topic_RodWette,LOG_Running);
	B_LogEntry(Topic_RodWette, " Mercenary Rod doesn't think I can hold his sword. " );
};


instance DIA_Rod_BINStarkGenug(C_Info)
{
	npc = Sld_804_Rod;
	nr = 5;
	condition = DIA_Rod_BINStarkGenug_Condition;
	information = DIA_Rod_BINStarkGenug_Info;
	permanent = FALSE;
	description = " I said I'm strong enough! " ;
};


func int DIA_Rod_BINStarkGenug_Condition()
{
	if ((self.aivar[AIV_DefeatedByPlayer] ==  FALSE ) && (Rod_WetteExperienced ==  FALSE ) && Npc_KnowsInfo(other,DIA_Rod_StarkGenug));
	{
		return TRUE;
	};
};

func void DIA_Rod_BINStarkGenug_Info()
{
	AI_Output(other,self, " DIA_Rod_BINStarkGenug_15_00 " );	// I said I'm strong enough!
	AI_Output(self,other, " DIA_Rod_BINSStarkGenug_06_01 " );	// Ohhh, you're breaking my heart! Would you dare to make a small bet?
};


var int Rod_WetteWon;
var int Rod_WetteAngenommen;
var int DoomSword1;
var int DoomSword2;

instance DIA_Rod_bet (C_Info)
{
	npc = Sld_804_Rod;
	nr = 5;
	condition = DIA_Rod_Wette_Condition;
	information = DIA_Rod_bet_info;
	permanent = TRUE;
	description = " I bet I can hold your sword! " ;
};


func int DIA_Rod_Wette_Condition()
{
	if ((self.aivar[AIV_DefeatedByPlayer] ==  FALSE ) && (MIS_RodWette == LOG_Running) && (Rod_WetteGewonnen ==  FALSE ) && Npc_KnowsInfo(other,DIA_Rod_BINStarkGenug) && (Npc_HasItems(self,ItMwnge_2h_Rod) >  0 ) = W_D_  & FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Rod_Wette_Info()
{
	AI_Output(other,self, " DIA_Rod_Wette_15_00 " );	// I bet I can hold your sword!
	AI_Output(self,other, " DIA_Rod_Wette_06_01 " );	// Right? Hmm... (thinks) And how much should I charge you?
	AI_Output(self,other, " DIA_Rod_Wette_06_02 " );	// Well... you look like a beggar sucker! Let's say it will be thirty coins! Do you even have that much?
	Info_ClearChoices(DIA_Rod_Wette);
	Info_AddChoice(DIA_Rod_Wette,"Нет.",DIA_Rod_Wette_No);
	Info_AddChoice(DIA_Rod_Wette, " Of course! " ,DIA_Rod_Wette_Yes);
	B_LogEntry(Topic_RodWette, " Rod bets thirty gold pieces that I won't be able to hold his sword. " );
};

func void DIA_Rod_Wette_No()
{
	AI_Output(other,self,"DIA_Rod_Wette_No_15_00");	//Нет.
	AI_Output(self,other, " DIA_Rod_Wette_No_06_01 " );	// Oh, then get lost.
	Info_ClearChoices(DIA_Rod_Wette);
};

func void DIA_Rod_Wette_Yes()
{
	AI_Output(other,self, " DIA_Rod_Wette_Yes_15_00 " );	// Of course!
	AI_Output(self,other,"DIA_Rod_Wette_Yes_06_01");	//Покажи...

	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		Rod_WetteAngenommen = TRUE;
		AI_Output(other,self,"DIA_Rod_Wette_Yes_15_02");	//Вот!
		AI_Output(self,other, " DIA_Rod_Wette_Yes_06_03 " );	// Okay, let's see how strong you are... (gloatingly)
		B_GiveInvItems(self,other,ItMw_2h_Rod,1);

		if(other.attribute[ATR_STRENGTH] >= 30)
		{
			if(Npc_HasItems(hero,ITMW_1H_DOOMSWORD) > 0)
			{
				DoomSword1 = Npc_HasItems(hero,ITMW_1H_DOOMSWORD);			
				Npc_RemoveInvItems(hero,ITMW_1H_DOOMSWORD,Npc_HasItems(hero,ITMW_1H_DOOMSWORD));
			};
			if(Npc_HasItems(hero,ITMW_2H_DOOMSWORD) > 0)
			{
				DoomSword2 = Npc_HasItems(hero,ITMW_2H_DOOMSWORD);			
				Npc_RemoveInvItems(hero,ITMW_2H_DOOMSWORD,Npc_HasItems(hero,ITMW_2H_DOOMSWORD));
			};

			CreateInvItems(hero,ItMw_2h_Rod_Fake,1);
			AI_UnequipWeapons(hero);
			AI_EquipBestMeleeWeapon(hero);
			AI_ReadyMeleeWeapon(hero);
			AI_Output(other,self, " DIA_Rod_Wette_Yes_15_04 " );	// Is that enough?
			AI_Output(self,other, " DIA_Rod_Wette_Yes_06_05 " );	// Looks like... (surprised) Did you beat me?
			AI_RemoveWeapon(hero);
			AI_UnequipWeapons(hero);
			AI_Output(self,other, " DIA_Rod_Wette_Yes_06_06 " );	// I never expected this from you. You don't look like someone with that kind of power.
			AI_Output(self,other, " DIA_Rod_Wette_Yes_06_07 " );	// Well, looks like I just lost thirty gold coins. Hold on!
			B_GiveInvItems(self,other,ItMi_Gold,60);
			Rod_WetteGewonnen = TRUE ;
			B_GivePlayerXP(XP_Rod);
			MIS_RodWette = LOG_SUCCESS;
			Log_SetTopicStatus(Topic_RodWette,LOG_SUCCESS);
			B_LogEntry(Topic_RodWette, " I picked up Rod's sword and won our argument. " );
		}
		else
		{
			AI_Output(other,self, " DIA_Rod_Wette_Yes_15_08 " );	// I can't lift this weapon.
			AI_Output(self,other, " DIA_Rod_Wette_Yes_06_09 " );	// What did I say!
			MIS_RodWette = LOG_FAILED;
			B_LogEntry_Failed(Topic_RodWette);
		};

		AI_Output(self,other, " DIA_Rod_Wette_Yes_06_10 " );	// Now, give me back my weapon.
		Info_ClearChoices(DIA_Rod_Wette);
		Info_AddChoice(DIA_Rod_Wette,"Как же!",DIA_Rod_Wette_KeepIt);
		Info_AddChoice(DIA_Rod_Wette, " Here you go. " ,DIA_Rod_Wette_GiveBack);
	}
	else
	{
		AI_Output(other,self, " DIA_Rod_Wette_Yes_15_11 " );	// And where do I put it...
		AI_Output(self,other, " DIA_Rod_Wette_Yes_06_12 " );	// Ha! Come back when you have enough gold to place your bet.
		Info_ClearChoices(DIA_Rod_Wette);
	};
};

func void DIA_Rod_Wette_GiveBack()
{
	AI_RemoveWeapon(other);
	Npc_RemoveInvItems(hero,ItMw_2h_Rod_Fake,1);
	AI_Output(other,self, " DIA_Rod_Wette_GiveBack_15_00 " );	// Here, take this.
	Info_ClearChoices(DIA_Rod_Wette);
	Info_AddChoice(DIA_Rod_Wette, " (...return weapon) " ,DIA_Rod_Wette_GiveBack2);
};

func void DIA_Rod_Wette_GiveBack2()
{
	if(DoomSword1 > 0)
	{
		CreateInvItems(other,ITMW_1H_DOOMSWORD,DoomSword1);
		DoomSword1 = FALSE;
	};
	if(DoomSword2 > 0)
	{
		CreateInvItems(other,ITMW_1H_DOOMSWORD,DoomSword2);
		DoomSword2 = FALSE;
	};

	B_GiveInvItems(other,self,ItMw_2h_Rod,1);
	Rod_BetAssumed = FALSE ;

	if (Rod_WetteGewonnen ==  FALSE )
	{
		AI_Output(self,other, " DIA_Rod_Wette_GiveBack_06_01 " );	// Yes, you're just a scoundrel after that!
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_GiveItBack_06_01");	//Вовремя!
	};

	RodCanGiveRing = TRUE;
	CanBeatRodFist = FALSE;
	Info_ClearChoices(DIA_Rod_Wette);
};

func void DIA_Rod_Wette_KeepIt()
{
	if(DoomSword1 > 0)
	{
		CreateInvItems(other,ITMW_1H_DOOMSWORD,DoomSword1);
		DoomSword1 = FALSE;
	};
	if(DoomSword2 > 0)
	{
		CreateInvItems(other,ITMW_1H_DOOMSWORD,DoomSword2);
		DoomSword2 = FALSE;
	};

	Npc_RemoveInvItems(hero,ItMw_2h_Rod_Fake,1);
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_00");	//Как же!
	AI_Output(self,other, " DIA_Rod_Wette_KeepIt_06_01 " );	// (threateningly) What does that mean?!
	AI_Output(other,self, " DIA_Rod_Wette_KeepIt_15_02 " );	// I'd rather keep him for a while.
	AI_Output(self,other, " DIA_Rod_Wette_KeepIt_06_03 " );	// Well, wait, you bastard!
	Info_ClearChoices(DIA_Rod_Wette);
	AI_StopProcessInfos(self);
	CanBeatRodFist = TRUE;
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Rod_GiveItBack(C_Info)
{
	npc = Sld_804_Rod;
	nr = 7;
	condition = DIA_Rod_GiveItBack_Condition;
	information = DIA_Rod_GiveItBack_Info;
	permanent = TRUE;
	description = " Here, hold your sword! " ;
};

func int DIA_Rod_GiveItBack_Condition()
{
	if(Npc_HasItems(other,ItMw_2h_Rod) > 0)
	{
		return TRUE;
	};
};

func void DIA_Rod_GiveItBack_Info()
{
	B_GiveInvItems(other,self,ItMw_2h_Rod,1);
	AI_Output(other,self, " DIA_Rod_GiveItBack_15_00 " );	// Here, hold your sword!
	AI_Output(self,other,"DIA_Rod_GiveItBack_06_01");	//Вовремя!
	RodCanGiveRing = TRUE;

	if (Rod_SchwertXPGiven ==  FALSE )
	{
		B_GivePlayerXP(XP_Ambient);
		Rod_SchwertXPGiven = TRUE ;
	};

	CanBeatRodFist = FALSE;
};

instance DIA_Rod_Quest(C_Info)
{
	npc = Sld_804_Rod;
	nr = 3;
	condition = DIA_Rod_Quest_Condition;
	information = DIA_Rod_Quest_Info;
	permanent = FALSE;
	description = " What's special about your sword? " ;
};

func int DIA_Rod_Quest_Condition()
{
	if((RodCanGiveRing == TRUE) && (Npc_HasItems(self,ItMw_2h_Rod) > 0))
	{
		return TRUE;
	};
};

func void DIA_Rod_Quest_Info()
{
	AI_Output(other,self, " DIA_Rod_Quest_01_01 " );	// What's special about your sword?
	AI_Output(self,other, " DIA_Rod_Quest_01_02 " );	// Nothing. I'm just used to fighting exclusively with two-handed weapons. Everything else is just not for me.
	AI_Output(other,self, " DIA_Rod_Quest_01_04 " );	// Could you train me in handling it?
	AI_Output(self,other, " DIA_Rod_Quest_01_05 " );	// Of course, mate. True, for this I need at least a dozen bottles of schnapps.
	AI_Output(other,self, " DIA_Rod_Quest_01_06 " );	// Hmmm... Are you sure about that?
	AI_Output(self,other, " DIA_Rod_Quest_01_07 " );	// You can be sure...(laughs) Bring a drink and I'll show you how to cut with a two-handed sword.
	MIS_RodRing = LOG_Running;
	Log_CreateTopic(TOPIC_RodRing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RodRing,LOG_Running);
	B_LogEntry(TOPIC_RodRing, " Rod can help me improve my two-handed weapon skills. But he needs at least a dozen bottles of schnapps to do so. " );
};

instance DIA_Rod_Quest_Done(C_Info)
{
	npc = Sld_804_Rod;
	nr = 1;
	condition = DIA_Rod_Quest_Done_Condition;
	information = DIA_Rod_Quest_Done_Info;
	permanent = FALSE;
	description = " Here's your schnapps! " ;
};

func int DIA_Rod_Quest_Done_Condition()
{
	if((MIS_RodRing == LOG_Running) && (Npc_HasItems(other,ItFo_Booze) >= 12))
	{
		return TRUE;
	};
};

func void DIA_Rod_Quest_Done_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Rod_Quest_Done_01_01 " );	// Here's your schnapps!
	B_GiveInvItems(other,self,ItFo_Booze,12);
	Npc_RemoveInvItems(self,ItFo_Booze,12);
	AI_Output(self,other, " DIA_Rod_Quest_Done_01_02 " );	// Hmmm...(assessing) Yes, it looks like he's the one!
	AI_Output(self,other, " DIA_Rod_Quest_Done_01_03 " );	// Now I'll have something to pass the time we'll spend on this farm!
	AI_Output(other,self, " DIA_Rod_Quest_Done_01_04 " );	// What about training?
	AI_Output(self,other, " DIA_Rod_Quest_Done_01_05 " );	// Of course! As I promised.
	AI_Output(self,other, " DIA_Rod_Quest_Done_01_06 " );	// Here, take this ring.
	B_GiveInvItems(self,other,ItRi_Rod,1);
	AI_Output(other,self, " DIA_Rod_Quest_Done_01_07 " );	// Ring?! And what should I do with it?
	AI_Output(self,other, " DIA_Rod_Quest_Done_01_08 " );	// Put it on and you'll realize that you've gotten a little better with two-handed weapons.
	Rod_Teach2H = TRUE;
	MIS_RodRing = LOG_Success;
	Log_SetTopicStatus(TOPIC_RodRing,LOG_Success);
	B_LogEntry(TOPIC_RodRing, " I brought schnapps to Rod, and he gave me a ring. He says it will help me become better with two-handed weapons. " );
};

instance DIA_Rod_PERM(C_Info)
{
	npc = Sld_804_Rod;
	nr = 1;
	condition = DIA_Rod_PERM_Condition;
	information = DIA_Rod_PERM_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Rod_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rod_Hello))
	{
		return TRUE;
	};
};

func void DIA_Rod_PERM_Info()
{
	AI_Output(other,self,"DIA_Rod_PERM_15_00");	//Как дела?
	if (chapter <=  2 )
	{
		if(other.guild == GIL_NONE)
		{
			if (( self . aivar [ AIV_DefeatedByPlayer ] ==  FALSE ) && ( Root_WetteCreated ==  FALSE ))
			{
				AI_Output(self,other, " DIA_Rod_PERM_06_01 " );	// It's none of your business, weakling.
				Rod_WeaklySaid = TRUE ;
			}
			else
			{
				AI_Output(self,other, " DIA_Rod_PERM_06_02 " );	// I'm wondering if you'll be allowed to join us.
			};
		}
		else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			AI_Output(self,other, " DIA_Rod_PERM_06_03 " );	// You're one of us now, baby. We'll get used to you soon.
		}
		else
		{
			AI_Output(self,other, " DIA_Rod_PERM_06_04 " );	// You're not our man. You'd be better off somewhere else!
		};
	};
	if (Chapter >=  3 )
	{
		AI_Output(self,other, " DIA_Rod_PERM_06_05 " );	// If all these stories about dragons are true, we need to gather a squad and finish off these creatures!
	};
};


instance DIA_RodSLD_PICKPOCKET(C_Info)
{
	npc = Sld_804_Rod;
	nr = 900;
	condition = DIA_RodSLD_PICKPOCKET_Condition;
	information = DIA_RodSLD_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_RodSLD_PICKPOCKET_Condition()
{
	return  C_Robbery ( 15 , 35 );
};

func void DIA_RodSLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_RodSLD_PICKPOCKET);
	Info_AddChoice(DIA_RodSLD_PICKPOCKET,Dialog_Back,DIA_RodSLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_RodSLD_PICKPOCKET,DIALOG_PICKPOCKET,DIA_RodSLD_PICKPOCKET_DoIt);
};

func void DIA_RodSLD_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_RodSLD_PICKPOCKET);
};

func void DIA_RodSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_RodSLD_PICKPOCKET);
};

