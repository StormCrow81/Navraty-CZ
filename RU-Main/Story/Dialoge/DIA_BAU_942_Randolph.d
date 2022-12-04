
instance DIA_Randolph_EXIT(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 999;
	condition = DIA_Randolph_EXIT_Condition;
	information = DIA_Randolph_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Randolph_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Randolph_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_SchwereLuft (C_Info)
{
	npc = BAU_942_Randolph;
	nr = 4;
	condition = DIA_Randolph_HeavyAir_Condition;
	information = DIA_Randolph_SchwereLuft_Info;
	permanent = FALSE;
	description = " Is everything okay? " ;
};


func int DIA_Randolph_HeavyAir_Condition()
{
	if ( ! Npc_IsDead(Alvares) &&  ! Npc_IsDead(Engardo) && (Chapter <  4 )) ;
	{
		return TRUE;
	};
};

func void DIA_Randolph_HeavyAir_Info()
{
	AI_Output(other,self, " DIA_Randolph_SchwereLuft_15_00 " );	// Is everything okay?
	AI_Output(self,other, " DIA_Randolph_SchwereLuft_06_01 " );	// Hmmm... As soon as anyone here says the wrong word, the dance of death will begin... so be careful - or there will be a massacre.
	AI_Output(other,self, " DIA_Randolph_SchwereLuft_15_02 " );	// Are you going to fight?
	AI_Output(self,other, " DIA_Randolph_SchwereLuft_06_03 " );	// I won't stand by when the fight starts. But I'm also not going to provoke one.
	Akils_SLDStillthere = TRUE;
	Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
	B_LogEntry(TOPIC_AkilsSLDStillthere, " Farmer Akil is threatened by mercenaries. " );
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_HALLO(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 4;
	condition = DIA_Randolph_HALLO_Condition;
	information = DIA_Randolph_HALLO_Info;
	permanent = FALSE;
	description = " Is everything okay? " ;
};


func int DIA_Randolph_HALLO_Condition()
{
	if ( Npc_IsDead ( Alvares ) && Npc_IsDead ( Engardo ) && ( Chapter <  4 )) ;
	{
		return TRUE;
	};
};

func void DIA_Randolph_HALLO_Info()
{
	AI_Output(other,self, " DIA_Randolph_HALLO_15_00 " );	// Is everything okay?
	if (Npc_IsDead(Akil) && Npc_IsDead(Kati))
	{
		AI_Output(self,other, " DIA_Randolph_HALLO_06_01 " );	// Now that Kati and Akil have gone to the realm of Innos, I will manage this farm.
		Npc_ExchangeRoutine(self,"START");
		AI_ContinueRoutine(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Randolph_HALLO_06_02 " );	// Yes, I'm fine. Alvarez was getting bolder and bolder every day. It was only ever going to end in blood.
	};
	AI_Output(self,other, " DIA_Randolph_HALLO_06_03 " );	// What I wouldn't say no to right now is a glass of good wine in a tavern.
};


instance DIA_Randolph_Baltram(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 5;
	condition = DIA_Randolph_Baltram_Condition;
	information = DIA_Randolph_Baltram_Info;
	permanent = FALSE;
	description = " Baltram sent me. " ;
};


func int DIA_Randolph_Baltram_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Randolph_HALLO ) && ( MIS_Baltram_ScoutAkil == LOG_Running ) && Npc_IsDead ( Acil ) && Npc_IsDead ( Now ) && ( Lieferung_Geholt ==  FALSE ) && ( Chapter <  4 )) ;
	{
		return TRUE;
	};
};

func void DIA_Randolph_Baltram_Info()
{
	AI_Output(other,self, " DIA_Randolph_Baltram_15_00 " );	// Baltram sent me. I have to pick up a package for him.
	AI_Output(self,other, " DIA_Randolph_Baltram_06_01 " );	// Good. I've got everything ready. Here it is.
	CreateInvItems(self,ItMi_BaltramPaket,1);
	B_GiveInvItems(self,other,ItMi_BaltramPaket,1);
	Delivery_Geholt = TRUE ;
};


instance DIA_Randolph_History (C_Info)
{
	npc = BAU_942_Randolph;
	nr = 5;
	condition = DIA_Randolph_History_Condition;
	information = DIA_Randolph_History_Info;
	permanent = FALSE;
	description = " You're not from here, are you? " ;
};


func int DIA_Randolph_History_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Randolph_HELLO ) && ( Capital <  4 )) .
	{
		return TRUE;
	};
};

func void DIA_Randolph_History_Info()
{
	AI_Output(other,self, " DIA_Randolph_Geschichte_15_00 " );	// You're not from here, are you?
	AI_Output(self,other, " DIA_Randolph_Geschichte_06_01 " );	// I come from the southern islands. Once upon a time, heralds went and announced that people were needed on Khorinis to mine magical ore.
	AI_Output(self,other, " DIA_Randolph_Geschichte_06_02 " );	// But when I came here, they put up this huge barrier. And I didn't want to go there. So I started working at the port.
	AI_Output(self,other, " DIA_Randolph_Geschichte_06_03 " );	// Then the ships stopped coming here, and I went to work for Akil. Now I have nothing.
};


instance DIA_Randolph_TAVERNE(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 5;
	condition = DIA_Randolph_TAVERNE_Condition;
	information = DIA_Randolph_TAVERNE_Info;
	description = " Do you go to the tavern? " ;
};


func int DIA_Randolph_TAVERNE_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Randolph_HELLO ) && ( Capital <  4 )) .
	{
		return TRUE;
	};
};

func void DIA_Randolph_TAVERNE_Info()
{
	AI_Output(other,self, " DIA_Randolph_TAVERNE_15_00 " );	// Do you go to the tavern?
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_01");	//I did.
	AI_Output(self,other, " DIA_Randolph_TAVERNE_06_02 " );	// But I can't afford to go there anymore.
};


instance DIA_Randolph_WASISTINTAVERNE (C_Info)
{
	npc = BAU_942_Randolph;
	nr = 6;
	condition = DIA_Randolph_WASISTINTAVERNE_Condition;
	information = DIA_Randolph_WASISTINTAVERNE_Info;
	description = " What's going on in the tavern? " ;
};


func int DIA_Randolph_WASISTINTAVERNE_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Randolph_TAVERN ) && ( Capital <  4 )) ;
	{
		return TRUE;
	};
};

func void DIA_Randolph_WASISTINTAVERNE_Info()
{
	AI_Output(other,self, " DIA_Randolph_WASISTINTAVERNE_15_00 " );	// What's going on in the tavern?
	AI_Output(self,other, " DIA_Randolph_WASISTINTAVERNE_06_01 " );	// Drinking contests are held there.
	AI_Output(self,other, " DIA_Randolph_WASISTINTAVERNE_06_02 " );	// Two men compete against each other. Whoever can drink the most beer wins.
	AI_Output(self,other, " DIA_Randolph_WASISTINTAVERNE_06_03 " );	// Only I've been on a losing streak lately, and now I don't have any money left.
	Log_CreateTopic(TOPIC_Wettsaufen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wettsaufen,LOG_Running);
	B_LogEntry(TOPIC_Wettsaufen, " You can bet in the tavern. " );
};


instance DIA_Randolph_GEGENWEN (C_Info)
{
	npc = BAU_942_Randolph;
	nr = 7;
	condition = DIA_Randolph_GEGENWEN_Condition;
	information = DIA_Randolph_GEGENWEN_Info;
	description = " Who did you compete with? " ;
};


func int DIA_Randolph_GIVEAWAY_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Randolph_HOUSE INTAVERNE ) && ( Capital <  4 )) .
	{
		return TRUE;
	};
};

func void DIA_Randolph_TOP_Info()
{
	AI_Output(other,self, " DIA_Randolph_GEGENWEN_15_00 " );	// Who did you compete against?
	AI_Output(self,other, " DIA_Randolph_GEGENWEN_06_01 " );	// With Ruhar, that old boozehound. He always beats me.
	AI_Output(self,other, " DIA_Randolph_GEGENWEN_06_02 " );	// I have a hunch that the dirty pig was putting schnapps in my beer when no one was looking.
	AI_Output(self,other, " DIA_Randolph_GEGENWEN_06_03 " );	// I hear he keeps schnapps in his goddamn trunk!
	AI_Output(self,other, " DIA_Randolph_GEGENWEN_06_04 " );	// Someone needs to swap the schnapps in his chest for water. Then he can pour it into my beer as much as he wants.
	AI_Output(self,other, " DIA_Randolph_GEGENWEN_06_05 " );	// If only I had the money to face him one more time.
	B_LogEntry(TOPIC_Wettsaufen, " Randolph told me about Ruhar and the drinking contest. Randolph doesn't have enough money to bet against Ruhar again. " );
	B_LogEntry_Quiet(TOPIC_Wettsaufen, " Randolph suspects Ruhar of cheating in the drinking contest. Randolph would like to swap the bottle of schnapps in Ruhar's chest for a bottle of water. " );
};

instance DIA_Randolph_WASBRAUCHSTDU (C_Info)
{
	npc = BAU_942_Randolph;
	nr = 8;
	condition = DIA_Randolph_WASBRAUCHSTDU_Condition;
	information = DIA_Randolph_WASBRAUCHSTDU_Info;
	description = " How much money do you need for this contest? " ;
};

func int DIA_Randolph_WASBRAUCHSTDU_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Randolph_ACQUIRED) && (MIS_Rukhar_Wettkampf == LOG_Running) && (Chapter <  4 )) ;
	{
		return TRUE;
	};
};

func void DIA_Randolph_WASBRAUCHSTDU_Info()
{
	AI_Output(other,self, " DIA_Randolph_WASBRAUCHSTDU_15_00 " );	// How much money do you need for this challenge?
	AI_Output(self,other, " DIA_Randolph_WASBRAUCHSTDU_06_01 " );	// Ten gold.
};


instance DIA_Randolph_ICHGEBEDIRGELD (C_Info)
{
	npc = BAU_942_Randolph;
	nr = 9;
	condition = DIA_Randolph_ICHGEBEDIRGELD_Condition;
	information = DIA_Randolph_I GIVEDIRMONEY_Info;
	permanent = TRUE;
	description = " I'll give you money to fight Ruhar. " ;
};


var int DIA_Randolph_ICHGEBEDIRGELD_noPerm;

func int DIA_Randolph_ICHGEBEDIRGELD_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Randolph_WASBRAUCHSTDU ) && ( DIA_Randolph_ICHGETDIRGEL_noPerm ==  FALSE ) && ( Chapter <  4 )) ;
	{
		return TRUE;
	};
};

func void DIA_Randolph_I GIVEDIRMONEY_Info()
{
	AI_Output(other,self, " DIA_Randolph_ICHGEBEDIRGELD_15_00 " );	// I'll give you money to fight Ruhar.

	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		AI_Output(self,other, " DIA_Randolph_ICHGEBEDIRGELD_06_01 " );	// Really? Thank you so much. I will return it to you soon.
		AI_Output(self,other, " DIA_Randolph_ICHGEBEDIRGELD_06_02 " );	// If I win, I'll even give it back to you with interest. See you.
		B_LogEntry(TOPIC_Wettsaufen, "The bet is made. I must watch him. " );
		B_GivePlayerXP(XP_Randolph_CompetitionStart);
		DIA_Randolph_ICHGEBEDIRGELD_noPerm = TRUE ;
		B_NpcClearObsessionByDMT(self);
		MIS_Rukhar_Competition_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other, " DIA_Randolph_ICHGEBEDIRGELD_06_03 " );	// Come on. You don't even have that little gold?
	};

	B_NpcClearObsessionByDMT(self);
};

instance DIA_Randolph_WETTKAMPZZENDE (C_Info)
{
	npc = BAU_942_Randolph;
	nr = 10;
	condition = DIA_Randolph_WETTKAMPZZENDE_Condition;
	information = DIA_Randolph_WETTKAMPZUMENDE_Info;
	permanent = TRUE;
	description = " Hangover? " ;
};

func int DIA_Randolph_COMPETITION_START_Condition()
{
	if ((MIS_Rukhar_Competition ==  LOG_SUCCESS ) && (Chapter <  4 ))
	{
		return TRUE;
	};
};


var int DIA_Randolph_COMPETITION_ONETIME;

func void DIA_Randolph_COMPETITION_START_Info()
{
	AI_Output(other,self, " DIA_Randolph_WETTKAMPFZUENDE_15_00 " );	// Hangover?

	if (Rukhar_Won_Competition ==  TRUE )
	{
		AI_Output(self,other, " DIA_Randolph_WETTKAMPFZUENDE_06_01 " );	// Yeah, you wouldn't wish this on your enemy. And I can't get rid of it. I'll never drink again, I swear!
		AI_Output(self,other, " DIA_Randolph_WETTKAMPFZUENDE_06_02 " );	// Your money is gone. I'm sorry.
	}
	else
	{
		AI_Output(self,other, " DIA_Randolph_WETTKAMPFZUENDE_06_03 " );	// No. I feel great, really.
		if (DIA_Randolph_WETTKAMPZUMENDE_OneTime ==  FALSE )
		{
			AI_Output(self,other, " DIA_Randolph_WETTKAMPFZUENDE_06_04 " );	// Everything finally worked out. Thanks again for the money. Here, take it back.
			CreateInvItems(self,ItMi_Gold,20);
			B_GiveInvItems(self,other,ItMi_Gold,12);
			DIA_Randolph_WETTKAMPZUENDE_OneTime = TRUE ;
		};
		AI_Output(self,other, " DIA_Randolph_WETTKAMPFZUENDE_06_05 " );	// Looks like Ruhar won't recover anytime soon after this.
	};

	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_PERM(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 30;
	condition = DIA_Randolph_PERM_Condition;
	information = DIA_Randolph_PERM_Info;
	permanent = TRUE;
	description = " Are you okay? " ;
};


func int DIA_Randolph_PERM_Condition()
{
	if((Kapitel >= 4) && (NpcObsessedByDMT_Randolph == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Randolph_PERM_GotMoney;

func void DIA_Randolph_PERM_Info()
{
	if(hero.guild == GIL_KDF)
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(other,self, " DIA_Randolph_PERM_15_00 " );	// Are you okay?

		if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) && (MIS_HealRandolph != LOG_SUCCESS))
		{
			if (( DIA_Sagitta_HEALRANDOLPH_GotOne ==  FALSE ) && ( DIA_Sagitta_HEALRANDOLPH_KnowsPrice ==  TRUE ) && ( DIA_Randolph_PERM_GotMoney ==  FALSE ))
			{
				AI_Output(other, self, " DIA_Randolph_PERM_15_01 " );	// You sent me without any money, and didn't warn me that medicine is so expensive?!
				AI_Output(other,self, " DIA_Randolph_PERM_15_02 " );	// Sagitta wants three hundred gold for it.
				AI_Output(self,other, " DIA_Randolph_PERM_06_03 " );	// I can only give you a hundred and fifty gold pieces. Please! You must help me. Please.
				CreateInvItems(self,ItMi_Gold,150);
				B_GiveInvItems(self,other,ItMi_Gold,150);
				DIA_Randolph_PERM_GotMoney = TRUE;
			}
			else
			{
				AI_Output(self,other, " DIA_Randolph_PERM_06_04 " );	// I feel bad. Every time I stop drinking, this hangover kills me. I really need help.
				AI_Output(self,other, " DIA_Randolph_PERM_06_05 " );	// But there is a medicine that can help.
				AI_Output(self,other, " DIA_Randolph_PERM_06_06 " );	// Sagitta, the healer witch, was already preparing it for me. But I don't think I can go get it myself now. Orcs are everywhere.
			};
			Log_CreateTopic(TOPIC_HealRandolph,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_HealRandolph,LOG_Running);
			B_LogEntry(TOPIC_HealRandolph, " Randolph seems to have decided to stop drinking and sent me to Sagitta for a hangover cure. " );
			MIS_HealRandolph = LOG_Running;
		}
		else
		{
			AI_Output(self,other, " DIA_Randolph_PERM_06_07 " );	// My legs still feel like pudding, but I'm getting better.
		};
	};
};


instance DIA_Randolph_Healing (C_Info)
{
	npc = BAU_942_Randolph;
	nr = 55;
	condition = DIA_Randolph_Healing_Condition;
	information = DIA_Randolph_Healing_Info;
	permanent = TRUE;
	description = "The booze went to your head, huh? " ;
};


func int DIA_Randolph_Healing_Condition()
{
	if((NpcObsessedByDMT_Randolph == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Randolph_Healing_Info()
{
	AI_Output(other,self, " DIA_Randolph_Heilung_15_00 " );	// The booze went to your head, huh?
	AI_Output(self,other, " DIA_Randolph_Heilung_06_01 " );	// I won't take another drop in my mouth. Not in this life. You can trust me on that.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_SAGITTAHEAL(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 56;
	condition = DIA_Randolph_SAGITTAHEAL_Condition;
	information = DIA_Randolph_SAGITTAHEAL_Info;
	description = " Here. This will ease your hangover. " ;
};


func int DIA_Randolph_SAGITTAHEAL_Condition()
{
	if((MIS_HealRandolph == LOG_Running) && Npc_HasItems(other,ItPo_HealRandolph_MIS))
	{
		return TRUE;
	};
};

func void DIA_Randolph_SAGITTAHEAL_Info()
{
	AI_Output(other,self, " DIA_Randolph_SAGITTAHEAL_15_00 " );	// Here, It will ease your hangover.
	B_GiveInvItems(other,self,ItPo_HealRandolph_MIS,1);
	if(Npc_IsInState(self,ZS_Pick_FP))
	{
		B_UseItem(self,ItPo_HealRandolph_MIS);
	};
	AI_Output(self,other, " DIA_Randolph_SAGITTAHEAL_06_01 " );	// Oh! Thank you friend. Now I can at least sleep.
	AI_Output(self,other, " DIA_Randolph_SAGITTAHEAL_06_02 " );	// How can I repay you for this?
	if(DIA_Randolph_PERM_GotMoney == FALSE)
	{
		AI_Output(self,other, " DIA_Randolph_SAGITTAHEAL_06_03 " );	// I think these few coins can only help me save face. But I'm afraid that's all I have.
		CreateInvItems(self,ItMi_Gold,150);
		B_GiveInvItems(self,other,ItMi_Gold,150);
	}
	else
	{
		AI_Output(other,self, " DIA_Randolph_SAGITTAHEAL_15_04 " );	// I paid a lot of money for that. Your measly few coins can't make up for my expenses.
		AI_Output(self,other, " DIA_Randolph_SAGITTAHEAL_06_05 " );	// Well, in that case, I'm lucky to have met such a generous new friend, don't you think?
	};
	MIS_HealRandolph = LOG_SUCCESS;
	B_GivePlayerXP(XP_HealRandolph);
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_PICKPOCKET(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 900;
	condition = DIA_Randolph_PICKPOCKET_Condition;
	information = DIA_Randolph_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Randolph_PICKPOCKET_Condition()
{
	return  C_Robbery ( 58 , 2 );
};

func void DIA_Randolph_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Randolph_PICKPOCKET);
	Info_AddChoice(DIA_Randolph_PICKPOCKET,Dialog_Back,DIA_Randolph_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Randolph_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Randolph_PICKPOCKET_DoIt);
};

func void DIA_Randolph_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Randolph_PICKPOCKET);
};

func void DIA_Randolph_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Randolph_PICKPOCKET);
};
