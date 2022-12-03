

instance DIA_Salandril_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_EXIT_Condition;
	information = DIA_Salandril_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Salandril_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Salandril_PICKPOCKET(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 900;
	condition = DIA_Salandril_PICKPOCKET_Condition;
	information = DIA_Salandril_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};


var int DIA_Salandril_PICKPOCKET_perm;

func int DIA_Salandril_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (DIA_Salandril_PICKPOCKET_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Salandril_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Salandril_PICKPOCKET);
	Info_AddChoice(DIA_Salandril_PICKPOCKET,Dialog_Back,DIA_Salandril_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Salandril_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Salandril_PICKPOCKET_DoIt);
};

func void DIA_Salandril_PICKPOCKET_DoIt()
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
		CreateInvItems(self,ItKe_Salandril,1);
		B_GiveInvItems(self,other,ItKe_Salandril,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		DIA_Salandril_PICKPOCKET_perm = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Salandril_PICKPOCKET);
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

func void DIA_Salandril_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Salandril_PICKPOCKET);
};


instance DIA_Salandril_Hallo (C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_Hallo_Condition;
	information = DIA_Salandril_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Salandril_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_OLDWORLD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Salandril_Hallo_Info()
{
	AI_Output(self,other, " DIA_Salandril_PERM_13_00 " );	// Welcome traveler. Looking for a good potion?
	AI_Output(self,other, " DIA_Salandril_PERM_13_01 " );	// I have a large selection and reasonable prices. My potions are better than the poison Zuris sells.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, " Salandril sells potions. His shop is in the upper quarter. " );
};

instance DIA_Salandril_Trade(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 9;
	condition = DIA_Salandril_Trade_Condition;
	information = DIA_Salandril_Trade_Info;
	permanent = TRUE;
	description = " Show me your products. " ;
	trade = TRUE;
};


func int DIA_Salandril_Trade_Condition()
{
	if ((Npc_KnowsInfo(other,DIA_Salandril_Closter) ==  FALSE ) && Wld_IsTime( 8 , 0 , 22 , 0 )) ;
	{
		return TRUE;
	};
};

func void DIA_Salandril_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	AI_Output(other,self, " DIA_Salandril_Trade_15_00 " );	// Show me your products.

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Salandril_Trade_13_01 " );	// With pleasure, Reverend Brother.
		if(MIS_Serpentes_MinenAnteil_KDF == LOG_Running)
		{
			SC_KnowsProspektorSalandril = TRUE;
		};
	};
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Salandril_Trade_13_02 " );	// With pleasure, oh noble warrior.
	};
	if(other.guild == GIL_GUR)
	{
		AI_Output(self,other, " DIA_Salandril_Trade_13_03 " );	// With pleasure!
	};

	B_GiveTradeInv(self);
};


instance DIA_Salandril_KAP3_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_KAP3_EXIT_Condition;
	information = DIA_Salandril_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Salandril_CLOSE (C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_KLOSTER_Condition;
	information = DIA_Salandril_KLOSTER_Info;
	description = " You must go to the monastery to stand trial. " ;
};

func int DIA_Salandril_KLOSTER_Condition()
{
	if((SC_KnowsProspektorSalandril == TRUE) || (MIS_Serpentes_BringSalandril_SLD == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Salandril_KLOSTER_Info()
{
	AI_Output(other,self, " DIA_Salandril_KLOSTER_15_00 " );	// You must go to the monastery to stand trial.
	AI_Output(self,other, " DIA_Salandril_KLOSTER_13_01 " );	// What? Have you lost your roof? Hell no! These pathetic magicians have no evidence against me.

	if((hero.guild == GIL_KDF) && (SC_KnowsProspektorSalandril == TRUE))
	{
		AI_Output(other,self, " DIA_Salandril_KLOSTER_15_02 " );	// What about those fake stocks you've been flooding the country with? They have your signature on them. You are guilty.
	}
	else
	{
		AI_Output(other,self, " DIA_Salandril_KLOSTER_15_03 " );	// I have an order and I will follow it. So either you go on your own or I have to force you.
	};
	AI_Output(self,other, " DIA_Salandril_KLOSTER_13_04 " );	// What? Yes, I will drag you through the whole city by the scruff of the neck, like a lousy puppy, and throw you out the gate.
	CreateInvItems(self,ItKe_Salandril,1);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Salandril_GehinsMonastery (C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_GehinsKloster_Condition;
	information = DIA_Salandril_GehinsKloster_Info;
	description = " So are you going to the monastery, or are you going to have another lesson? " ;
};

func int DIA_Salandril_GehinsKloster_Condition()
{
	if (((SC_KnowsProspectorSalandril ==  TRUE ) || (MIS_Serpents_BringSalandril_SLD == LOG_Running)) && (self.aivar[AIV_LastFightAgainstPlayer] ==  FIGHT_LOST ) && Npc_KnowsInfo(other,DIA_Salandril_CLOSE));
	{
		return TRUE;
	};
};

func void DIA_Salandril_GehinsKloster_Info()
{
	AI_Output(other,self, " DIA_Salandril_GehinsKloster_15_00 " );	// So are you going to the monastery, or will you be taught another lesson?
	AI_Output(self,other, " DIA_Salandril_GehinsKloster_13_01 " );	// You'll regret it. Yes, damn you, I'll go to this monastery, but you won't get away with it just like that.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"KlosterUrteil");
	MIS_Serpentes_BringSalandril_SLD = LOG_SUCCESS;

	if(MIS_SALANDRILRESECH == LOG_Running)
	{
		MIS_SALANDRILRESECH = LOG_OBSOLETE;
	};
};


instance DIA_Salandril_Disappear (C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_Disappear_Condition;
	information = DIA_Salandril_Disappear_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Salandril_Disappear_Condition()
{
	if((MIS_Serpentes_BringSalandril_SLD == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Salandril_Disappear_Info()
{
	if(MIS_SALANDRILHELP == LOG_Running)
	{
		MIS_SALANDRILHELP = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_SALANDRILHELP);
	};
	B_Disappear_Voice13();
	AI_StopProcessInfos(self);
};


instance DIA_Salandril_KAP4_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_KAP4_EXIT_Condition;
	information = DIA_Salandril_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Salandril_KAP5_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_KAP5_EXIT_Condition;
	information = DIA_Salandril_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Salandril_KAP6_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_KAP6_EXIT_Condition;
	information = DIA_Salandril_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_KAP6_EXIT_Condition()
{
	if (chapter ==  6 )
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_RECEPTFORTYON(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_receptfortyon_condition;
	information = dia_salandril_receptfortyon_info;
	permanent = FALSE;
	description = " I heard about a rare potion... " ;
};


func int dia_salandril_receptfortyon_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && (KNOWABOUTRECEPTFORTYON == FALSE) && (Npc_HasItems(other,itwr_tyonrecept) < 1))
	{
		return TRUE;
	};
};

func void dia_salandril_receptfortyon_info()
{
	AI_Output(other,self, " DIA_Salandril_ReceptForTyon_01_00 " );	// I heard about a very rare potion...
	AI_Output(other,self, " DIA_Salandril_ReceptForTyon_01_02 " );	// It is in some way able to influence the consciousness of a person. Haven't heard anything about it?
	AI_Output(self,other, " DIA_Salandril_ReceptForTyon_01_03 " );	// No. This is the first time I hear about such an elixir.
	AI_Output(self,other, " DIA_Salandril_ReceptForTyon_01_05 " );	// But maybe the other alchemists in town can help you.
};


instance DIA_SALANDRIL_TALIASANLETTER(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_taliasanletter_condition;
	information = dia_salandril_taliasanletter_info;
	permanent = FALSE;
	description = " Can you help me? " ;
};


func int dia_salandril_taliasanletter_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (MIS_Serpentes_BringSalandril_SLD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_salandril_taliasanletter_info()
{
	AI_Output(other,self, " DIA_Salandril_TaliasanLetter_01_00 " );	// Can you help me?
	AI_Output(self,other, " DIA_Salandril_TaliasanLetter_01_01 " );	// What's the matter?
	AI_Output(other,self, " DIA_Salandril_TaliasanLetter_01_02 " );	// I really need you to write one letter of recommendation for me.
	AI_Output(self,other, " DIA_Salandril_TaliasanLetter_01_03 " );	// Oh! (laughs) Looks like you've found yourself a job and they want good references from you, right?
	AI_Output(other,self, " DIA_Salandril_TaliasanLetter_01_06 " );	// You misunderstood me a little. I need a letter that recommends not me, but another person.
	AI_Output(self,other, " DIA_Salandril_TaliasanLetter_01_07 " );	// And who is this, if not a secret?
	AI_Output(other,self, " DIA_Salandril_TaliasanLetter_01_08 " );	// This man's name is Gallahad.
	AI_Output(self,other, " DIA_Salandril_TaliasanLetter_01_13 " );	// To whom should I recommend it?
	AI_Output(other,self, " DIA_Salandril_TaliasanLetter_01_14 " );	// The letter must be addressed to Larius.
	AI_Output(self,other, " DIA_Salandril_TaliasanLetter_01_20 " );	// (thinking) All right, I'll write this letter for Gallahad.
	AI_Output(self,other, " DIA_Salandril_TaliasanLetter_01_21 " );	// But first, you'll have to do me a little favor.
	AI_Output(self,other, " DIA_Salandril_TaliasanLetter_01_24 " );	// Get me a sample of one rare potion - and consider the letter in your pocket.
	AI_Output(other,self, " DIA_Salandril_TaliasanLetter_01_32 " );	// What potion do you need?
	AI_Output(self,other, " DIA_Salandril_TaliasanLetter_01_33 " );	// I'm guessing Orcs use this potion to increase their strength and stamina.
	AI_Output(self,other, " DIA_Salandril_TaliasanLetter_01_34 " );	// Therefore, I think it will be possible to get it only from one of them.
	AI_Output(other,self, " DIA_Salandril_TaliasanLetter_01_38 " );	// Okay, I'll try to find this drink.
	AI_Output(self,other, " DIA_Salandril_TaliasanLetter_01_39 " );	// I heard from a hunter here that some orc was seen near the city. It looks like there was a cave in that place.
	AI_Output(self,other, " DIA_Salandril_TaliasanLetter_01_40 " );	// Perhaps this information will be useful in your search.
	Wld_InsertNpc(orcwarrior_salandril,"NW_CITY_SMFOREST_03_M");
	MIS_SALANDRILHELP = LOG_Running;
	Log_CreateTopic(TOPIC_SALANDRILHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SALANDRILHELP,LOG_Running);
	B_LogEntry( TOPIC_SALANDRILHELP , " Salandril will write a letter of recommendation for Gallahad if I bring him an orc potion. According to him, an orc was seen near the city. Perhaps he will have the drink I need with him. " );
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_GIVEPOTION(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_givepotion_condition;
	information = dia_salandril_givepotion_info;
	permanent = FALSE;
	description = " I brought you an orc potion. " ;
};


func int dia_salandril_givepotion_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (MIS_SALANDRILHELP == LOG_Running) && (MIS_Serpentes_BringSalandril_SLD != LOG_SUCCESS) && (Npc_HasItems(other,itpo_xorcpotion) >= 1))
	{
		return TRUE;
	};
};

func void dia_salandril_givepotion_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Salandril_GivePotion_01_00 " );	// I brought you an orc potion.
	AI_Output(self,other, " DIA_Salandril_GivePotion_01_01 " );	// True? Show me!
	AI_Output(other,self, " DIA_Salandril_GivePotion_01_02 " );	// Here. Like you said, one of the orcs had it.
	B_GiveInvItems(other,self,itpo_xorcpotion,1);
	Npc_RemoveInvItems(self,itpo_xorcpotion,1);
	AI_Output(self,other, " DIA_Salandril_GivePotion_01_03 " );	// Great! Finally, I can study its composition!
	AI_Output(other,self, " DIA_Salandril_GivePotion_01_04 " );	// What about the letter?
	AI_Output(self,other, " DIA_Salandril_GivePotion_01_05 " );	// Oh yeah. Here you are.
	B_GiveInvItems(self,other,itwr_salandrilletter,1);
	AI_Output(self,other, " DIA_Salandril_GivePotion_01_09 " );	// And now it's time for me to study this elixir.
	MIS_SALANDRILHELP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SALANDRILHELP,LOG_SUCCESS);
	B_LogEntry( TOPIC_SALANDRILHELP , " I brought Salandril an orc potion. He was beside himself with happiness and almost forgot to give me a letter of recommendation for Gallahad. " );
	AI_StopProcessInfos(self);
};

DIA_SALANDRIL_ORCRUM (C_Info) instances
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_orcrum_condition;
	information = dia_salandril_orcrum_info;
	permanent = FALSE;
	description = " Look what I have. " ;
};

func int dia_salandril_orcrum_condition()
{
	if((MIS_TALIASANHELP == LOG_SUCCESS) && (MIS_SALANDRILHELP == LOG_SUCCESS) && (MIS_Serpentes_BringSalandril_SLD != LOG_SUCCESS) && (Npc_HasItems(other,itfo_addon_orcrum) >= 1))
	{
		return TRUE;
	};
};

func void dia_salandril_orcrum_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Salandril_ORCRUM_01_00 " );	// Look what I have. Some kind of orc swill. Do you know what can be done with it?
	B_GiveInvItems(other,self,itfo_addon_orcrum,1);
	Npc_RemoveInvItems(self,itfo_addon_orcrum,1);
	AI_Output(self,other, " DIA_Salandril_ORCRUM_01_01 " );	// I've never seen this before. Leave the potion with me and come back in a couple of days. I need time to research.
	ORCRUMDAY = Wld_GetDay();
	MIS_SALANDRILRESECH = LOG_Running;
	Log_CreateTopic(TOPIC_SALANDRILRESECH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SALANDRILRESECH,LOG_Running);
	B_LogEntry( TOPIC_SALANDRILRESECH , " Salandril will try to research orc brew for practical use. We'll know the result in a couple of days. " );
};


instance DIA_SALANDRIL_ORCRUM2(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_orcrum2_condition;
	information = dia_salandril_orcrum2_info;
	permanent = FALSE;
	description = " How's the research? " ;
};

func int dia_salandril_orcrum2_condition()
{
	if((MIS_SALANDRILRESECH == LOG_Running) && (ORCRUMDAY < (Wld_GetDay() - 1)))
	{
		return TRUE;
	};
};

func void dia_salandril_orcrum2_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Salandril_ORCRUM2_01_00 " );	// How's the research?
	AI_Output(self,other, " DIA_Salandril_ORCRUM2_01_01 " );	// The potion turned out to be very small, and it was enough for me only for the initial experiments.
	AI_Output(self,other, " DIA_Salandril_ORCRUM2_01_02 " );	// But it is obvious that it has interesting and unique properties, which can be revealed only by continuing research.
	AI_Output(other,self, " DIA_Salandril_ORCRUM2_01_04 " );	// Are you saying that I should bring you more of this drink for experiments?
	AI_Output(self,other, " DIA_Salandril_ORCRUM2_01_05 " );	// You got it right. If you bring me ten bottles of this drink, I'll continue my research.
	SALFIRST = TRUE;
	B_LogEntry( TOPIC_SALANDRILRESECH , " Salandril wants ten bottles of Orc liquor for research. " );
};


instance DIA_SALANDRIL_ORCRUM3(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_orcrum3_condition;
	information = dia_salandril_orcrum3_info;
	permanent = FALSE;
	description = " I brought ten bottles of booze. " ;
};

func int dia_salandril_orcrum3_condition()
{
	if((MIS_SALANDRILRESECH == LOG_Running) && (SALFIRST == TRUE) && (Npc_HasItems(other,itfo_addon_orcrum) >= 10))
	{
		return TRUE;
	};
};

func void dia_salandril_orcrum3_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Salandril_ORCRUM3_01_00 " );	// I brought ten bottles of booze.
	B_GiveInvItems(other,self,itfo_addon_orcrum,10);
	Npc_RemoveInvItems(self,itfo_addon_orcrum,10);
	AI_Output(self,other, " DIA_Salandril_ORCRUM3_01_01 " );	// Great! So I can continue my research.
	AI_Output(self,other, " DIA_Salandril_ORCRUM3_01_03 " );	// Come see me sometime later, maybe there'll be some news.
	SALANDRILRESECHPOTION = Wld_GetDay();
	B_LogEntry( TOPIC_SALANDRILRESECH , " Salandril got ten bottles of swill for research. For now, mind your own business. " );
};


DIA_SALANDRIL_ORCRUM4 (C_Info) instances
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_orcrum4_condition;
	information = dia_salandril_orcrum4_info;
	permanent = TRUE;
	description = " How's the research? " ;
};

func int dia_salandril_orcrum4_condition()
{
	if((MIS_SALANDRILRESECH == LOG_Running) && (SALANDRILRESECHPOTION != FALSE))
	{
		return TRUE;
	};
};

func void dia_salandril_orcrum4_info()
{
	AI_Output(other,self, " DIA_Salandril_ORCRUM4_01_00 " );	// How's the research?

	if ((Capital >=  2 ) && ( SALANDRILRESECHPOTION  <= (Wld_GetDay() -  2 ))) .
	{
		B_GivePlayerXP(250);
		AI_Output(self,other, " DIA_Salandril_ORCRUM4_01_01 " );	// I made a discovery...
		AI_Output(self,other, " DIA_Salandril_ORCRUM4_01_02 " );	// I can make a potion with very interesting properties from orc liquor!
		AI_Output(self,other, " DIA_Salandril_ORCRUM4_01_03 " );	// For one bottle of potion, I'll need ten bottles of Orc brew and three hundred gold. And keep in mind that this discounted price is just for you!
		CanMakeSimpleOrcPotion = TRUE;
		MIS_SALANDRILRESECH = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_SALANDRILRESECH,LOG_SUCCESS);
		; _ _ _ _ _ _
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Salandril_ORCRUM4_01_09 " );	// Better keep me busy! Come back in a couple of days.
	};
};

instance DIA_SALANDRIL_ORCRUM5(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_orcrum5_condition;
	information = dia_salandril_orcrum5_info;
	permanent = FALSE;
	description = " Prepare me that potion. (Price: 300 coins) " ;
};

func int dia_salandril_orcrum5_condition()
{
	if (( CanMakeSimpleOrcPotion ==  TRUE ) && ( Npc_HasItems ( other , itfo_addon_orcrum ) >=  10 ) && ( SaltPotionOneTime ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_salandril_orcrum5_info()
{
	AI_Output(other,self, " DIA_Salandril_ORCRUM51_01_00 " );	// Prepare that potion for me.

	if(Npc_HasItems(other,ItMi_Gold) >= 300)
	{
		B_GiveInvItems(other,self,itfo_addon_orcrum,10);
		Npc_RemoveInvItems(self,itfo_addon_orcrum,10);
		Npc_RemoveInvItems(other,ItMi_Gold,300);
		AI_Output(self,other, " DIA_Salandril_ORCRUM51_01_01 " );	// So you decided to try. Excellent! Come in tomorrow, the potion will be ready.
		ORCRUMDAY4 = Wld_GetDay();
	}
	else
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other, " DIA_Salandril_ORCRUM51_03_90 " );	// You don't have enough gold!
		AI_StopProcessInfos(self);
	};
};

DIA_SALANDRIL_ORCRUM6 (C_Info) instances
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_orcrum6_condition;
	information = dia_salandril_orcrum6_info;
	permanent = FALSE;
	description = " Is my potion ready? " ;
};

func int dia_salandril_orcrum6_condition()
{
	var int DaySNow;

	DaySNow = Wld_GetDay();

	if((CanMakeSimpleOrcPotion == TRUE) && (ORCRUMDAY4 < DaySNow) && (ORCRUMDAY4 > 0))
	{
		return TRUE;
	};
};

func void dia_salandril_orcrum6_info()
{
	AI_Output(other,self, " DIA_Salandril_ORCRUM6_01_00 " );	// Is my potion ready?
	AI_Output(self,other, " DIA_Salandril_ORCRUM6_01_01 " );	// Yes. Here you are.
	B_GiveInvItems(self,other,itfo_addon_orcrumsal,1);
	AI_Output(self,other, " DIA_Salandril_ORCRUM6_01_02 " );	// Only the effect of using it can be quite unusual. And I'm not responsible for the consequences!
	SalPotionOneTime = TRUE;
};

instance DIA_SALANDRIL_MyBrew(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_MyBrew_condition;
	information = dia_salandril_MyBrew_info;
	permanent = FALSE;
	description = " Can you take a look at one alchemy recipe? " ;
};

func int dia_salandril_MyBrew_condition()
{
	if((MIS_MyBrew == LOG_Running) && (MIS_Serpentes_BringSalandril_SLD != LOG_SUCCESS) && (Npc_HasItems(other,ItWr_ConstRecept) >= 1) && (FTConsPotion == TRUE) && (KnowFakeRecept == FALSE))
	{
		return TRUE;
	};
};

func void dia_salandril_MyBrew_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Salandril_MyBrew_01_00 " );	// Can you take a look at one alchemy recipe?
	AI_Output(self,other, " DIA_Salandril_MyBrew_01_01 " );	// Of course! Give it here.
	AI_Output(other,self, " DIA_Salandril_MyBrew_01_02 " );	// Here, take this.
	B_GiveInvItems(other,self,ItWr_ConstRecept,1);
	AI_Output(self,other, " DIA_Salandril_MyBrew_01_03 " );	// So what do we have here...
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Salandril_MyBrew_01_04 " );	// Hmmm... (thoughtfully) And what kind of idiot wrote this?!
	AI_Output(other,self, " DIA_Salandril_MyBrew_01_05 " );	// What do you mean?
	AI_Output(self,other, " DIA_Salandril_MyBrew_01_06 " );	// Those ingredients that are listed here are absolutely incompatible with each other.
	AI_Output(self,other, " DIA_Salandril_MyBrew_01_07 " );	// Not only that, some of them are never used in alchemy at all. This is some nonsense!
	B_GiveInvItems(self,other,ItWr_ConstRecept,1);
	AI_Output(self,other, " DIA_Salandril_MyBrew_01_08 " );	// So who wrote this anyway?
	AI_Output(other,self, " DIA_Salandril_MyBrew_01_09 " );	// You better not know.
	AI_Output(self,other, " DIA_Salandril_MyBrew_01_10 " );	// Okay, if you don't want to, don't say... (chuckling) But this guy definitely needs to change his occupation!
	AI_Output(self,other, " DIA_Salandril_MyBrew_01_11 " );	// Alchemist from him is simply useless.
	KnowFakeRecept = TRUE;
	B_LogEntry(TOPIC_MyBrew, " I showed Salandril the alchemy recipe Constantino gave me. It looks like he was just trying to trick me with it, because this recipe is completely useless for a real alchemist. " );
};

instance DIA_SALANDRIL_PureElixir(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_PureElixir_condition;
	information = dia_salandril_PureElixir_info;
	permanent = FALSE;
	description = " Vatras wants to place an order for elixirs of pure magical energy. " ;
};

func int dia_salandril_PureElixir_condition()
{
	if((MIS_VatrasPotion == LOG_Running) && (Npc_HasItems(other,ItMi_Gold) >= 200))
	{
		return TRUE;
	};
};

func void dia_salandril_PureElixir_info()
{
	AI_Output(other,self, " DIA_Salandril_PureElixir_01_00 " );	// Vatras, the Waterbender wants to place an order with you for elixirs of pure magical energy.
	AI_Output(other,self, " DIA_Salandril_PureElixir_01_01 " );	// Here are the two hundred gold coins he gives you as an advance for your work.
	B_GiveInvItems(other,self,ItMi_Gold,200);
	Npc_RemoveInvItems(self,ItMi_Gold,200);
	AI_Output(self,other, " DIA_Salandril_PureElixir_01_02 " );	// Of course... (respectfully) I am honored to fulfill this order.
	AI_Output(self,other, " DIA_Salandril_PureElixir_01_03 " );	// However, the formula for this potion is too complicated, so it will take me at least a week to complete the order.
	AI_Output(self,other, " DIA_Salandril_PureElixir_01_04 " );	// Of course, I would not want to upset the esteemed Vatras, but, unfortunately, it will not work faster.
	AI_Output(other,self, " DIA_Salandril_PureElixir_01_05 " );	// Okay. So I'll give it to him.
	AI_Output(self,other, " DIA_Salandril_PureElixir_01_06 " );	// Um, wait a bit...(fussily) I seem to have a small supply of this elixir here.
	AI_Output(self,other, " DIA_Salandril_PureElixir_01_07 " );	// Oh yes, here they are. Here are a couple of potions in case he suddenly runs out of them.
	B_GiveInvItems(self,other,ItPo_Mana_Addon_04,2);
	AI_Output(self,other, " DIA_Salandril_PureElixir_01_08 " );	// Give them to him with my best wishes! Do not forget?
	AI_Output(other,self, " DIA_Salandril_PureElixir_01_09 " );	// Of course.
	SalandrilPureElixir = TRUE;
	B_LogEntry(TOPIC_VatrasPotion, " Salandril accepted Vatras' order, but said it would take at least a week to complete. In addition, he gave me a couple of elixirs from his supply to give to Vatras. " );
};

// -----------------------------------------bones----- --------------------------------

instance DIA_VLK_422_Salandril_Game (C_Info)
{
	npc = VLK_422_Salandril;
	nr = 3;
	condition = DIA_VLK_422_Salandril_Game_condition;
	information = DIA_VLK_422_Salandril_Game_info;
	description = " Cardiff said you were playing dice. " ;
};

func int DIA_VLK_422_Salandril_Game_condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Salandril_Hello ) && ( GameOtherPlayers ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_VLK_422_Salandril_Game_info()
{
 	AI_Output(other,self, " DIA_VLK_422_Salandril_Game_01_00 " ); // Cardiff said you were playing dice.
 	AI_Output(self,other, " DIA_VLK_422_Salandril_Game_01_01 " ); // Yes, he's right. But not with just anyone!
 	AI_Output(other,self, " DIA_VLK_422_Salandril_Game_01_02 " ); // Will you play with me?
 	AI_Output(self,other, " DIA_VLK_422_Salandril_Game_01_03 " ); // With you? Are you saying that you'll get something out of this?
 	AI_Output(other,self, " DIA_VLK_422_Salandril_Game_01_04 " ); // Let's play and find out.
 	AI_Output(self,other, " DIA_VLK_422_Salandril_Game_01_05 " ); // Okay. As you wish.
	SalandrilPlayResult = 250 ;
	Menu_WriteInt("AST","SysTimer02",0);
};

instance DIA_VLK_422_Salandril_GamePlay (C_Info)
{
	npc = VLK_422_Salandril;
	nr = 900;
	condition = DIA_VLK_422_Salandril_GamePlay_condition;
	information = DIA_VLK_422_Salandril_GamePlay_info;
	permanent = TRUE;
	description = " Let's play dice! " ;
};

func int DIA_VLK_422_Salandril_GamePlay_condition()
{
	if ((Npc_KnowsInfo(other,DIA_VLK_422_Salandril_Game) ==  TRUE ) && ( Mount_Up ==  FALSE ) && ( FlyCarpetIsOn ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_VLK_422_Salandril_GamePlay_info()
{
	var int DayNow;

	DayNow = Wld_GetDay();
	CheckLastGame = Menu_ReadInt("AST","SysTimer02");

	if(CheckLastGame >= SalandrilPlayResult)
	{
		CheckLastSum = CheckLastGame - SalandrilPlayResult;
	};

	AI_Output(other,self, " DIA_VLK_422_Salandril_GamePlay_01_00 " );	// Let's play dice!

	if(SalandrilPlayResult >= CheckLastGame)
	{
		if((SalandrilPlayResult > 0) && (SalandrilDayFlag == FALSE))
		{
			AI_Output(self,other, " DIA_VLK_422_Salandril_GamePlay_01_01 " );	// Of course. Let's start!
			PlayPocker(1,self);
		}
		else
		{
			if(SalandrilDayFlag == FALSE)
			{
				AI_Output(self,other, " DIA_VLK_422_Salandril_GamePlay_01_02 " );	// No, that's enough! You've cleared almost all of my wallet anyway.
				SandrilDayPlay = Wld_GetDay();
				SalandrilDayFlag = TRUE;
			}
			else
			{
				AI_Output(self,other, " DIA_VLK_422_Salandril_GamePlay_01_03 " );	// Forget it.
			};
		};
	}
	else
	{
		AI_Output(self,other, " DIA_VLK_422_Salandril_GamePlay_01_04 " );	// Last time you didn't give me my winnings.
		AI_Output(self,other, " DIA_VLK_422_Salandril_GamePlay_01_05 " );	// Ну же, я жду!
		Info_ClearChoices(DIA_VLK_422_Salandril_GamePlay);

		if(Npc_HasItems(other,ItMi_Gold) >= CheckLastSum)
		{
			Info_AddChoice(DIA_VLK_422_Salandril_GamePlay, " Here's your money. " ,DIA_VLK_422_Salandril_GamePlay_Here);
		};

		Info_AddChoice(DIA_VLK_422_Salandril_GamePlay, " I don't have that much money. " ,DIA_VLK_422_Salandril_GamePlay_No);
	};
};

func void DIA_VLK_422_Salandril_GamePlay_Here()
{
	Snd_Play("Geldbeutel");
	Npc_RemoveInvItems(hero,ItMi_Gold,CheckLastSum);
	SalandrilPlayResult = CheckLastGame;
	AI_Output(other,self, " DIA_VLK_422_Salandril_GamePlay_Here_01_01 " );	// Here's your money.
	AI_Output(self,other, " DIA_VLK_422_Salandril_GamePlay_Here_01_02 " );	// Nice! Now you can play...
	PlayPocker(1,self);
};

func void DIA_VLK_422_Salandril_GamePlay_No()
{
	AI_Output(other,self, " DIA_VLK_422_Salandril_GamePlay_No_01_01 " );	// I don't have that much money.
	AI_Output(self,other, " DIA_VLK_422_Salandril_GamePlay_No_01_02 " );	// These are not my problems.
	Info_ClearChoices(DIA_VLK_422_Salandril_GamePlay);
};

instance DIA_VLK_422_Salandril_GameEnd (C_Info)
{
	npc = VLK_422_Salandril;
	nr = 3;
	condition = DIA_VLK_422_Salandril_GameEnd_condition;
	info = DIA_VLK_422_Salandril_GameEnd_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_422_Salandril_GameEnd_condition()
{
	if((MustTellResult_Salandril == TRUE) && ((SalandrilLost == TRUE) || (SalandrilWon == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_VLK_422_Salandril_GameEnd_info()
{
	if(SalandrilLost == TRUE)
	{
		AI_Output(self,other, " DIA_VLK_422_Salandril_GameEnd_00 " );	// And how do you manage to do it? I won't put my mind to it.
		SalandrilLost = FALSE;
	}
	else if(SalandrilWon == TRUE)
	{
		AI_Output(self,other, " DIA_VLK_422_Salandril_GameEnd_01 " );	// Fortune was on my side this time, mate.
		SalandrilWon = FALSE;
	};

	MustTellResult_Salandril = FALSE ;
};

instance DIA_Fernando_Minental (C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Fernando_Minental_Condition;
	information = DIA_Fernando_Minental_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Fernando_Minental_Condition()
{
	if (( MY_OLDWORLD  == LOG_Running) && (Chapter ==  2 ))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Minental_Info()
{
	AI_Output(self,other, " DIA_Fernando_Minental_14_00 " );	// Hey, you - wait a minute. You're heading to the Valley of Mines, right?
	AI_Output(other,self,"DIA_Fernando_Minental_15_01");	//И?
	AI_Output(self,other, " DIA_Fernando_Minental_14_02 " );	// I want to offer you a deal. You bring me a report on what's going on with the ore, and for that I'll give you...

	if((other.guild == GIL_KDF) || (other.guild == GIL_GUR) || (other.guild == GIL_KDM) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_03");	//...рунный камень.
	}
	else
	{
		AI_Output(self,other, " DIA_Fernando_Minental_14_04 " );	// ...a ring that will boost your vitality.
	};

	AI_Output(other,self, " DIA_Fernando_Minental_15_05 " );	// I'll see what I can do.
	MIS_SalandrilOre = LOG_Running;
	Log_CreateTopic(TOPIC_Fernando,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Fernando,LOG_Running);
	B_LogEntry(TOPIC_Fernando, " The alchemist Salandril wants to know how the ore is doing in the Valley of Mines. " );
};

instance DIA_Fernando_Success(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 5;
	condition = DIA_Fernando_Success_Condition;
	information = DIA_Fernando_Success_Info;
	permanent = FALSE;
	description = " I was in the Valley of Mines. " ;
};

func int DIA_Fernando_Success_Condition()
{
	if((MIS_SalandrilOre == LOG_Running) && (MIS_ScoutMine == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Success_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self, " DIA_Fernando_Success_15_00 " );	// I was in the Valley of Mines.
	AI_Output(self,other, " DIA_Fernando_Success_14_01 " );	// And? How are things going there?
	AI_Output(other,self, " DIA_Fernando_Success_15_02 " );	// The mines are depleted, only a few boxes of ore can be mined there. It is unlikely that this game is worth the candle.
	AI_Output(self,other, " DIA_Fernando_Success_14_03 " );	// This can't be! That means I'm broke...
	AI_Output(other,self, " DIA_Fernando_Success_15_04 " );	// How's our deal?
	AI_Output(self,other, " DIA_Fernando_Success_14_05 " );	// Well, as for the reward...

	if((other.guild == GIL_KDF) || (other.guild == GIL_GUR) || (other.guild == GIL_KDM) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Fernando_Minental_14_06 " );	// Here, hold this runestone.
		B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Fernando_Minental_14_07 " );	// Here's your ring.
		B_GiveInvItems(self,other,ItRi_Hp_02,1);
	};

	MIS_SalandrilOre = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Fernando,LOG_SUCCESS);
	B_LogEntry(TOPIC_Fernando, " I told the alchemist Salandril about the situation in the Valley of Mines. It is strange that this news upset him very much... " );
};
