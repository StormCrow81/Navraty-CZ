

instance DIA_Fernando_EXIT (C_Info) .
{
	npc = VLK_405_Fernando;
	nr = 999;
	condition = DIA_Fernando_EXIT_Condition;
	information = DIA_Fernando_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fernando_EXIT_Condition()
{
	return TRUE;
};

func void DAY_Fernando_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

instance DIA_Fernando_Hello (C_Info) .
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Fernando_Hello_Condition;
	information = DIA_Fernando_Hello_Info;
	permanent = FALSE;
	description = " How are things going? " ;
};


func int DIA_Fernando_Hello_Condition()
{
	if (( NpcObsessedByDMT_Fernando ==  FALSE ) && ( Fernando_ImKnast ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Hello_Info()
{
	AI_Output(other,self, " DIA_Fernando_Hello_15_00 " );	// How are things going?
	AI_Output(self,other, " DIA_Fernando_Hello_14_01 " );	// Not very good. When the Barrier was still standing, times were better.
	AI_Output(self,other, " DIA_Fernando_Hello_14_02 " );	// The prisoners mined the ore in the mines, and my ships brought it to the mainland.
	AI_Output(self,other, " DIA_Fernando_Hello_14_03 " );	// And on the way back, they delivered food and other goods.
	AI_Output(self,other, " DIA_Fernando_Hello_14_04 " );	// But now we're cut off from the mainland, and we only have to rely on farmers for supplies.
};


instance DIA_Fernando_Perm (C_Info)
{
	npc = VLK_405_Fernando;
	nr = 850;
	condition = DIA_Fernando_Perm_Condition;
	information = DIA_Fernando_Perm_Info;
	permanent = TRUE;
	description = " What do you do for a living now? " ;
};

func int DIA_Fernando_Perm_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Fernando_Hello ) && ( Npc_ObsessedByDMT_Fernando ==  FALSE ) && ( Fernando_ImKnast ==  FALSE ))
	{
		return TRUE;
	};
};

func void DAY_Fernando_Perm_Info()
{
	AI_Output(other,self, " DIA_Fernando_Perm_15_00 " );	// And what do you do for a living now?
	AI_Output(self,other, " DIA_Fernando_Perm_14_01 " );	// Nothing! Now I live only at the expense of the accumulated earlier. But if I can't find a source of income, hard times will soon come for me.
};

instance DIA_Addon_Fernando_BanditTrader(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Addon_Fernando_BanditTrader_Condition;
	information = DIA_Addon_Fernando_BanditTrader_Info;
	description = " You sell weapons to bandits. " ;
};

func int DIA_Addon_Fernando_BanditTrader_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Fernando_Hello) && (NpcObsessedByDMT_Fernando ==  FALSE ) && (Fernando_ImKnast ==  FALSE ) && (Npc_HasItems(other,ItMw_Addon_BanditTrader) || Npc_HasItems(other,ItRi_Addon_BanditTrader) || (Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen ==  TRUE ))))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fernando_BanditTrader_Info()
{
	AI_Output(other,self, " DIA_Addon_Fernando_BanditTrader_15_00 " );	// You sell weapons to bandits.
	AI_Output(self,other, " DIA_Addon_Fernando_BanditTrader_14_01 " );	// Why did you decide that?...(puzzled)
	B_LogEntry(TOPIC_Addon_Bandittrader, " Heavy trader Fernando confessed to supplying guns to bandits. " );
	B_GivePlayerXP(XP_Addon_Fernando_HatsZugegeben);
	Fernando_HatsGranted = TRUE ;

	if (Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_delivery_read ==  TRUE ))
	{
		AI_Output(other,self, " DIA_Addon_Fernando_BanditTrader_15_02 " );	// The list of goods sold that I found from the bandits has your signature on it.
	};
	if(Npc_HasItems(other,ItRi_Addon_BanditTrader))
	{
		AI_Output(other,self, " DIA_Addon_Fernando_BanditTrader_15_03 " );	// I found a ring from the Araxos Sea Traders Guild from the bandits. You are a sea merchant!
		if(Npc_HasItems(other,ItMw_Addon_BanditTrader))
		{
			AI_Output(other,self, " DIA_Addon_Fernando_BanditTrader_15_04 " );	// And on the swords that the bandits had, there are your initials.
		};
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Fernando_BanditTrader_15_05 " );	// The swords that the bandits had had your initials on them.
	};
	AI_Output(other,self, " DIA_Addon_Fernando_BanditTrader_15_06 " );	// Now you can't get away. I opened you.

	if(Fernando_ImKnast == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Fernando_BanditTrader_14_07 " );	// So YOU ​​did it! You betrayed me! I will make you pay for this.
		AI_Output(other,self, " DIA_Addon_Fernando_BanditTrader_15_08 " );	// You'll have to get out of here first, and I don't think they'll let you out anytime soon.
		AI_Output(self,other, " DIA_Addon_Fernando_BanditTrader_14_09 " );	// Nothing, my time will come.
		B_NpcClearObsessionByDMT(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Fernando_BanditTrader_14_10 " );	// I didn't want to do this! Believe me!
		AI_Output(self,other, " DIA_Addon_Fernando_BanditTrader_14_11 " );	// At first I only sold them food. Things were not going well for me, and this was the only way out for me.
		AI_Output(self,other, " DIA_Addon_Fernando_BanditTrader_14_12 " );	// But then the bandits became aggressive and even threatened to kill me if I didn't sell them weapons.
		AI_Output(self,other, " DIA_Addon_Fernando_BanditTrader_14_13 " );	// You can't blame me! I'm just a victim of circumstance.

		if ( Fernando_ImKnast ==  FALSE )
		{
			Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader, " How much will you pay me if I let you go? " ,DIA_Addon_Fernando_BanditTrader_preis);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader, " Militia will deal with you. " ,DIA_Addon_Fernando_BanditTrader_mil);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader, " I'm trembling, I'm trembling! " ,DIA_Addon_Fernando_BanditTrader_Uptown);
		};
	};
};

func void DIA_Addon_Fernando_BanditTrader_Uptown()
{
	AI_Output(other,self, " DIA_Addon_Fernando_BanditTrader_Uptown_15_00 " );	// Don't try to take pity on me. You're just a disgusting and greedy huckster.
	AI_Output(other,self, " DIA_Addon_Fernando_BanditTrader_Uptown_15_01 " );	// You're ready to sell your soul for a handful of gold coins.
	AI_Output(self,other, " DIA_Addon_Fernando_BanditTrader_Uptown_14_02 " );	// But I have a lot of expenses! If I don't pay, they can simply let me feed the fish.
};

func void DIA_Addon_Fernando_BanditTrader_mil()
{
	AI_Output(other,self, " DIA_Addon_Fernando_BanditTrader_mil_15_00 " );	// The militia will deal with you.
	AI_Output(self,other, " DIA_Addon_Fernando_BanditTrader_mil_14_01 " );	// You can't do that!
	AI_Output(other,self, " DIA_Addon_Fernando_BanditTrader_mil_15_02 " );	// As much as I can. You'll see for yourself.
	AI_Output(self,other, " DIA_Addon_Fernando_BanditTrader_mil_14_03 " );	// Oh, Innos! I'm gone!
	B_NpcClearObsessionByDMT(self);
};

func void DIA_Addon_Fernando_BanditTrader_preis()
{
	AI_Output(other,self, " DIA_Addon_Fernando_BanditTrader_preis_15_00 " );	// How much will you pay me if I let you go?
	AI_Output(self,other, " DIA_Addon_Fernando_BanditTrader_preis_14_01 " );	// Things aren't going well for me. I can't pay much.
	AI_Output(self,other, " DIA_Addon_Fernando_BanditTrader_preis_14_02 " );	// Say two hundred gold pieces and a valuable ring?
	AI_Output(self,other, " DIA_Addon_Fernando_BanditTrader_preis_14_03 " );	// This should be enough. So, will you give me your evidence?
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
	Info_AddChoice(DIA_Addon_Fernando_BanditTrader, " No, I guess I'll keep them. " ,DIA_Addon_Fernando_BanditTrader_nein);
	Info_AddChoice(DIA_Addon_Fernando_BanditTrader, " Okay, I agree. " ,DIA_Addon_Fernando_BanditTrader_ja);
};

func void DIA_Addon_Fernando_BanditTrader_ja()
{
	AI_Output(other,self, " DIA_Addon_Fernando_BanditTrader_ja_15_00 " );	// Okay, I agree.
	B_GivePlayerXP(XP_Ambient);
	Npc_RemoveInvItems(hero,ItMw_Addon_BanditTrader,Npc_HasItems(other,ItMw_Addon_BanditTrader));
	Npc_RemoveInvItem(hero,ItRi_Addon_BanditTrader);
	Npc_RemoveInvItem(hero,ItWr_Addon_BanditTrader);
	AI_Output(self,other, " DIA_Addon_Fernando_BanditTrader_ja_14_01 " );	// Okay, here's the gold.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	AI_Output(self,other, " DIA_Addon_Fernando_BanditTrader_ja_14_02 " );	// And a ring. We're even.
	CreateInvItems(self,ItRi_Prot_Point_01,1);
	B_GiveInvItems(self,other,ItRi_Prot_Point_01,1);
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
};

func void DIA_Addon_Fernando_BanditTrader_nein()
{
	AI_Output(other,self, " DIA_Addon_Fernando_BanditTrader_nein_15_00 " );	// No, I guess I'll keep them for myself.
	AI_Output(self,other, " DIA_Addon_Fernando_BanditTrader_nein_14_01 " );	// As you wish. But I warn you: if you betray me, you will not be well.
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
};

instance DIA_Fernando_Obsession(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 30;
	condition = DIA_Fernando_Obsession_Condition;
	information = DIA_Fernando_Obsession_Info;
	description = " Is everything okay? " ;
};

func int DIA_Fernando_Obsession_Condition()
{
	if ((Chapter >=  3 ) && (NpcObsessedByDMT_Fernando ==  FALSE ) && (hero.guild ==  GIL_KDF ))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Obsession_Info()
{
	B_NpcObsessedByDMT(self);
};


instance DIA_Fernando_Healing (C_Info)
{
	npc = VLK_405_Fernando;
	nr = 55;
	condition = DIA_Fernando_Heilung_Condition;
	information = DIA_Fernando_Healing_Info;
	permanent = TRUE;
	description = " You're obsessed! " ;
};

func int DIA_Fernando_Healing_Condition()
{
	if((NpcObsessedByDMT_Fernando == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Healing_Info()
{
	AI_Output(other,self, " DIA_Fernando_Heilung_15_00 " );	// You're obsessed!
	AI_Output(self,other, " DIA_Fernando_Heilung_14_01 " );	// Leave. Leave immediately.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_FERNANDO_TALIASANLETTER ( C_Info ) ;
{
	npc = VLK_405_Fernando;
	nr = 55;
	condition = dia_fernando_taliasanletter_condition;
	information = dia_fernando_taliasanletter_info;
	permanent = FALSE;
	description = " Is there anything I can do for you? " ;
};


func int dia_fernando_taliasanletter_condition()
{
	if (( MY_TALIASANHELP  == LOG_Running ) && ( NpcObsessedByDMT_Fernando ==  FALSE ) && ( Fernando_ImKnast ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_fernando_taliasanletter_info()
{
	AI_Output(other,self, " DIA_Fernando_TaliasanLetter_01_00 " );	// Is there anything I can do for you?
	AI_Output(self,other, " DIA_Fernando_TaliasanLetter_01_03 " );	// Well, I don't even know what job to offer you...
	AI_Output(other,self, " DIA_Fernando_TaliasanLetter_01_04 " );	// For the most part, I don't care what I do.
	AI_Output(self,other, " DIA_Fernando_TaliasanLetter_01_06 " );	// Ha! I think you really need the money if you really want this job.
	AI_Output(other,self, " DIA_Fernando_TaliasanLetter_01_07 " );	// Well, not exactly money...
	AI_Output(self,other, " DIA_Fernando_TaliasanLetter_01_08 " );	// Yes?! What then?
	AI_Output(other,self, " DIA_Fernando_TaliasanLetter_01_09 " );	// For my services, I want you to praise Gallahad in front of Larius.
	AI_Output(other,self, " DIA_Fernando_TaliasanLetter_01_10 " );	// It's best if you write him a letter of recommendation.
	AI_Output(self,other, " DIA_Fernando_TaliasanLetter_01_11 " );	// WHAT?! Gallahad? (annoyed) Am I supposed to do something for this charlatan?
	AI_Output(other,self, " DIA_Fernando_TaliasanLetter_01_17 " );	// Did you share something?
	AI_Output(self,other, " DIA_Fernando_TaliasanLetter_01_22 " );	// We have one quarrel with him...
	AI_Output(self,other, " DIA_Fernando_TaliasanLetter_01_23 " );	// ...In general, once I wanted to buy one book from him.
	AI_Output(self,other, " DIA_Fernando_TaliasanLetter_01_24 " );	// Only he didn't want to sell it to me. I don't know why.
	AI_Output(self,other, " DIA_Fernando_TaliasanLetter_01_25 " );	// I almost on my knees asked him to sell me this book, but he refused.
	AI_Output(other,self, " DIA_Fernando_TaliasanLetter_01_26 " );	// What was that book?
	AI_Output(self,other, " DIA_Fernando_TaliasanLetter_01_27 " );	// It was a textbook on the art of rhetoric. You know, in our business it is simply necessary to be able to express your thoughts well and accurately.
	AI_Output(other,self, " DIA_Fernando_TaliasanLetter_01_30 " );	// And if I got you this book, could you change your mind about writing to Gallahad?
	AI_Output(self,other, " DIA_Fernando_TaliasanLetter_01_36 " );	// Okay. If you bring me this book, I will write a letter of recommendation for him.
	AI_Output(other,self, " DIA_Fernando_TaliasanLetter_01_39 " );	// Then I won't waste time.
	Wld_InsertItem(itwr_rhetorikbook,"FP_ITEM_TALIASANBOOK");
	MIS_FERNANDOHELP = LOG_Running;
	Log_CreateTopic(TOPIC_FERNANDOHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERNANDOHELP,LOG_Running);
	; _ _ _ _ _ _
};

instance DIA_FERNANDO_GOTBOOK(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 55;
	condition = dia_fernando_gotbook_condition;
	information = dia_fernando_gotbook_info;
	permanent = FALSE;
	description = " I brought a book. " ;
};

func int dia_fernando_gotbook_condition()
{
	if (( MY_TALIASANHELP  == LOG_Running ) && ( NpcObsessedByDMT_Fernando ==  FALSE ) && ( MY_FERNANDOHELP  == LOG_Running ) && ( Npc_HasItems ( other , itwr_rhetoricbook ) >=  1 ) && ( Fernando_ImKnast ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_fernando_gotbook_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Fernando_GotBook_01_00 " );	// I brought the book.
	AI_Output(self,other, " DIA_Fernando_GotBook_01_01 " );	// Yes? (incredulously) Let me see her.
	B_GiveInvItems(other,self,itwr_rhetorikbook,1);
	B_UseItem(self,itwr_rhetorikbook);
	AI_Output(self,other, " DIA_Fernando_GotBook_01_02 " );	// Hmmm. It really is that book.
	AI_Output(self,other, " DIA_Fernando_GotBook_01_04 " );	// You really surprised me!
	AI_Output(other,self, " DIA_Fernando_GotBook_01_06 " );	// What about the letter?
	AI_Output(self,other, " DIA_Fernando_GotBook_01_07 " );	// Oh, yes, your letter.
	B_GiveInvItems(self,other,itwr_fernandoletter,1);
	Npc_RemoveInvItems(self,itwr_rhetorikbook,Npc_HasItems(self,itwr_rhetorikbook));
	AI_Output(other,self, " DIA_Fernando_GotBook_01_09 " );	// Thank you.
	AI_Output(self,other, " DIA_Fernando_GotBook_01_14 " );	// I have to go. See you!
	Npc_ExchangeRoutine(vlk_6027_taliasan,"Start");
	vlk_6027_taliasan.guild = GIL_VLK ;
	Npc_SetTrueGuild(vlk_6027_taliasan, GIL_VLK );
	MIS_FERNANDOHELP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FERNANDOHELP,LOG_SUCCESS);
	B_LogEntry( TOPIC_FERNANDOHELP , " As promised, I brought Fernando the book he was interested in. In turn, he wrote a letter of recommendation for Gallahad. " );
};
