
var int ThorbenElzaDay;
var int ThorbenOnWork;

instance DIA_Thorben_EXIT(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 999;
	condition = DIA_Thorben_EXIT_Condition;
	information = DIA_Thorben_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Thorben_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Thorben_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THORBEN_NO_TALK(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = dia_thorben_no_talk_condition;
	information = dia_thorben_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_thorben_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_thorben_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_Thorben_PICKPOCKET(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 900;
	condition = DIA_Thorben_PICKPOCKET_Condition;
	information = DIA_Thorben_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Thorben_PICKPOCKET_Condition()
{
	return  C_Robbery ( 30 , 28 );
};

func void DIA_Thorben_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thorben_PICKPOCKET);
	Info_AddChoice(DIA_Thorben_PICKPOCKET,Dialog_Back,DIA_Thorben_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thorben_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Thorben_PICKPOCKET_DoIt);
};

func void DIA_Thorben_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Thorben_PICKPOCKET);
};

func void DIA_Thorben_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thorben_PICKPOCKET);
};

instance DIA_Thorben_pissed (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = DIA_Thorben_angepisst_Condition;
	information = DIA_Thorben_pissed_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Thorben_angepisst_Condition()
{
	if(Npc_IsDead(Gritta) && Npc_IsInState(self,ZS_Talk) && (GRITTAMUSTISDEAD == FALSE) && (GRITTAMEDEAD == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_pissed_Info()
{
	AI_Output(self,other, " DIA_Thorben_angepisst_06_00 " );	// You killed my Gritta. I will never forgive you. Get out of my sight, murderer!
	AI_StopProcessInfos(self);
};

instance DIA_Thorben_NoTalkAtAll (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = DIA_Thorben_NoTalkAtAll_Condition;
	information = DIA_Thorben_NoTalkAtAll_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Thorben_NoTalkAtAll_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_NoTalkAtAll_Info()
{
	AI_Output(self,other, " DIA_Thorben_NoTalkAtAll_12_00 " );	// What are you doing here?! Go away.
	AI_StopProcessInfos(self);
};

instance DIA_Thorben_Hello (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Hallo_Condition;
	information = DIA_Thorben_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Thorben_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (other.guild == GIL_NONE) && (CanTeachTownMaster == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Hallo_Info()
{
	AI_Output(self,other, " DIA_Thorben_Hallo_06_00 " );	// Ah! New face. You're not from Khorinis, are you?
	AI_Output(self,other, " DIA_Thorben_Hallo_06_01 " );	// Now is not the best time to travel. Bandits are everywhere, there is no work, and now the farmers have rebelled.
	AI_Output(self,other, " DIA_Thorben_Hallo_06_02 " );	// What wind brought you here?
};

instance DIA_Thorben_Work (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Arbeit_Condition;
	information = DIA_Thorben_Arbeit_Info;
	permanent = FALSE;
	description = " I'm looking for a job. " ;
};


func int DIA_Thorben_Work_Condition()
{
	return TRUE;
};

func void DIA_Thorben_Arbeit_Info()
{
	AI_Output(other,self, " DIA_Thorben_Arbeit_15_00 " );	// I'm looking for a job.
	AI_Output(self,other, " DIA_Thorben_Arbeit_06_01 " );	// Do you know anything about carpentry?
	AI_Output(other,self, " DIA_Thorben_Arbeit_15_02 " );	// The only thing I can get from wood is fire.
	AI_Output(self,other, " DIA_Thorben_Arbeit_06_03 " );	// What about castles?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_04");	//Нуууу...
	AI_Output(self,other, " DIA_Thorben_Arbeit_06_05 " );	// I'm sorry, but I can't take you if you don't understand my trade.
	AI_Output(self,other, " DIA_Thorben_Arbeit_06_06 " );	// And I don't have the money to pay the student.
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling, " Torben won't accept me as an apprentice. " );
};


instance DIA_Thorben_OtherMasters (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_OtherMasters_Condition;
	information = DIA_Thorben_OtherMasters_Info;
	permanent = FALSE;
	description = " What if I apprentice with one of the other masters here? " ;
};


func int DIA_Thorben_OtherMasters_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Arbeit) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_OtherMasters_Info()
{
	AI_Output(other,self, " DIA_Thorben_OtherMasters_15_00 " );	// What if I apprentice to one of the other masters here?
	AI_Output(self,other, " DIA_Thorben_OtherMasters_06_01 " );	// Okay, I'll give my approval.
	AI_Output(self,other, " DIA_Thorben_OtherMasters_06_02 " );	// But you need to get the blessing of the gods first.
	AI_Output(self,other, " DIA_Thorben_OtherMasters_06_03 " );	// Tell me, are you a believer?
	Info_ClearChoices(DIA_Thorben_OtherMasters);
	if ( ( other . guild ! =  GIL_KDF ) && ( other . guild ! =  GIL_NOV ) && ( other . guild ! =  GIL_PAL ) && ( other . guild ! =  GIL_KDW ) && ( other . guild !=  GIL_NDW ) && ( other . guild !=  GIL_KDM ) && ( other . guild !=  GIL_NDM ))
	{
		Info_AddChoice(DIA_Thorben_OtherMasters, " Well, if that's what you mean, I pray regularly... " ,DIA_Thorben_OtherMasters_Naja);
	};
	Info_AddChoice(DIA_Thorben_OtherMasters, " Yes. I am an exemplary believer, Master Torben. " ,DIA_Thorben_OtherMasters_Devoutly);
};

func void B_Thorben_GetBlessings()
{
	AI_Output(self,other, " B_Thorben_GetBlessings_06_00 " );	// Then go to Vatras, priest of Adanos, and let him bless you.
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		AI_Output(self,other, " B_Thorben_GetBlessings_06_01 " );	// He will also tell you where to find the priest Innos. You must also receive his blessing.
	};
	AI_Output(self,other, " B_Thorben_GetBlessings_06_02 " );	// And when you receive the blessing of the gods, I will vote for you.
	MIS_Thorben_GetBlessings = LOG_Running;
	Log_CreateTopic(TOPIC_Thorben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Thorben,LOG_Running);
	B_LogEntry(TOPIC_Thorben, " Torben will give me his approval if the priest of Adanos and the priest of Innos give me their blessing. " );
};

func void DIA_Thorben_OtherMasters_Devoutly()
{
	AI_Output(other,self, " DIA_Thorben_OtherMasters_Devoutly_15_00 " );	// Yes. I am an exemplary believer, Master Torben.
	B_Thorben_GetBlessings();
	Info_ClearChoices(DIA_Thorben_OtherMasters);
};

func void DIA_Thorben_OtherMasters_Naja()
{
	AI_Output(other,self, " DIA_Thorben_OtherMasters_Naja_15_00 " );	// Well, if that's what you mean, I pray regularly...
	AI_Output(self,other, " DIA_Thorben_OtherMasters_Naja_06_01 " );	// I understand!
	AI_Output(self,other, " DIA_Thorben_OtherMasters_Naja_06_02 " );	// A person who practices a craft without the blessing of the gods will never get my approval.
	AI_Output(self,other, " DIA_Thorben_OtherMasters_Naja_06_03 " );	// Ask the gods for forgiveness of your sins.
	B_Thorben_GetBlessings();
	Info_ClearChoices(DIA_Thorben_OtherMasters);
};


instance DIA_Thorben_CONSENT (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = DIA_Thorben_ZUSTIMMUNG_Condition;
	information = DIA_Thorben_APPROVAL_Info;
	permanent = TRUE;
	description = " How about an endorsement, master? " ;
};


func int DIA_Thorben_APPROVAL_Condition()
{
	if((Player_IsApprentice == APP_NONE) && (MIS_Thorben_GetBlessings == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Thorben_APPROVAL_Info()
{
	AI_Output(other,self, " DIA_Thorben_ZUSTIMMUNG_15_00 " );	// How about approval, master?
	AI_Output(self,other, " DIA_Thorben_ZUSTIMMUNG_06_01 " );	// Did Vatras give you a blessing?
	if (Vatras_Segen ==  TRUE )
	{
		AI_Output(other,self, " DIA_Thorben_SUMMIT_15_02 " );	// Yes.
		AI_Output(self,other, " DIA_Thorben_ZUSTIMMUNG_06_03 " );	// Did you receive the blessing of the priest Innos?

		if((Daron_Segen == TRUE) || (Isgaroth_Segen == TRUE) || (other.guild == GIL_KDF))
		{
			AI_Output(other,self, " DIA_Thorben_ZUSTIMMUNG_15_04 " );	// Yes, I got it.
			AI_Output(self,other, " DIA_Thorben_ZUSTIMMUNG_06_05 " );	// Then you will receive my blessing as well. No matter which path you choose to follow, be proud of your craft, my boy!
			MIS_Thorben_GetBlessings = LOG_SUCCESS;
			B_GivePlayerXP(XP_Consent);
			Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
			B_LogEntry(TOPIC_Lehrling, " Torben will give me his approval if I want to become an apprentice. " );
		}
		else
		{
			AI_Output(other,self, " DIA_Thorben_ZUSTIMMUNG_15_06 " );	// No. Not yet...
			AI_Output(self,other, " DIA_Thorben_ZUSTIMMUNG_06_07 " );	// You know my terms. You can only practice craft with the blessing of the gods.
		};
	}
	else
	{
		AI_Output(other,self, " DIA_Thorben_ZUSTIMMUNG_15_08 " );	// Not yet...
		AI_Output(self,other, " DIA_Thorben_ZUSTIMMUNG_06_09 " );	// Then I don't understand why you came to me again. You know my terms.
	};
};


instance DIA_Thorben_Locksmith(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Locksmith_Condition;
	information = DIA_Thorben_Locksmith_Info;
	permanent = FALSE;
	description = " So you're good with locks? " ;
};


func int DIA_Thorben_Locksmith_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Thorben_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Locksmith_Info()
{
	AI_Output(other,self, " DIA_Thorben_Locksmith_15_00 " );	// So you're good with locks?
	AI_Output(self,other, " DIA_Thorben_Locksmith_06_01 " );	// What's the point of having a good chest without a good lock?
	AI_Output(self,other, " DIA_Thorben_Locksmith_06_02 " );	// I make my own locks. So at least I can make sure I don't make chests that don't protect against anything.
	AI_Output(self,other, " DIA_Thorben_Locksmith_06_03 " );	// A poorly made lock is easy to break. And there are a lot of thieves in Khorinis. Especially lately!
};


instance DIA_Thorben_debt book (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Schuldenbuch_Condition;
	information = DIA_Thorben_Schuldenbuch_Info;
	permanent = FALSE;
	description = " I have Lemar's ledger. " ;
};


func int DIA_Thorben_Schuldenbuch_Condition()
{
	if((Npc_HasItems(other,ItWr_Schuldenbuch) > 0) && (LemarBookRead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_debt book_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self, " DIA_Thorben_Schuldenbuch_15_00 " );	// I have Lemar's ledger.
	AI_Output(self,other, " DIA_Thorben_Schuldenbuch_06_01 " );	// Where did you get it?..(suspicious)
	AI_Output(other,self, " DIA_Thorben_Schuldenbuch_15_02 " );	// You should not be interested in where I got it, but in the fact that it contains your name.
	AI_Output(self,other, " DIA_Thorben_Schuldenbuch_06_03 " );	// Give it here!
	B_GiveInvItems(other,self,ItWr_debt book, 1 );
	Npc_RemoveInvItems(self,ItWr_Debt Book, 1 );
	AI_Output(other,self, " DIA_Thorben_Schuldenbuch_15_04 " );	// And what are you willing to give for it?
	AI_Output(self,other, " DIA_Thorben_Schuldenbuch_06_05 " );	// I don't have money. But you can count on my heartfelt thanks.
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
	THORBENCANTEACH = TRUE;
};

instance DIA_Thorben_PleaseTeach (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_PleaseTeach_Condition;
	information = DIA_Thorben_PleaseTeach_Info;
	permanent = TRUE;
	description = " Can you teach me how to pick locks with picklocks? " ;
};

func int DIA_Thorben_PleaseTeach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Locksmith) && (Thorben_TeachPlayer == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void DIA_Thorben_PleaseTeach_Info()
{
	var int carminous;
	karmainnos = INNOSPRAYCOUNT  -  INNOSCRIMECOUNT ;
	AI_Output(other,self, " DIA_Thorben_PleaseTeach_15_00 " );	// Can you teach me how to pick locks?

	if(THORBENCANTEACH == TRUE)
	{
		AI_Output(self,other, " DIA_Thorben_PleaseTeach_06_01 " );	// If it weren't for you, I would have been giving debts to Lemar all my life.
		AI_Output(self,other, " DIA_Thorben_PleaseTeach_06_02 " );	// I'll teach you anything you want.
		Thorben_TeachPlayer = TRUE;
	}
	else if((Player_IsApprentice > APP_NONE) && (karmainnos >= 10))
	{
		AI_Output(self,other, " DIA_Thorben_PleaseTeach_06_20 " );	// You became a student of one of the masters..
		AI_Output(self,other, " DIA_Thorben_PleaseTeach_06_21 " );	// You honor our gods, and Innos favors you.
		AI_Output(self,other, " DIA_Thorben_PleaseTeach_06_02 " );	// I'll teach you anything you want.
		Thorben_TeachPlayer = TRUE;
	}
	else if((other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Thorben_PleaseTeach_06_21 " );	// You honor our gods, and Innos favors you.
		AI_Output(self,other, " DIA_Thorben_PleaseTeach_06_02 " );	// I'll teach you anything you want.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		if(THORBENFIRSTREFUSETALK == FALSE)
		{
			AI_Output(self,other, " DIA_Thorben_PleaseTeach_06_11 " );	// Hmm... I don't know if I can trust you.
			AI_Output(self,other, " DIA_Thorben_PleaseTeach_06_12 " );	// In the end, it turns out that you are one of the tramps who come to the city only to clear the chests of honest citizens.
			THORBENFIRSTREFUSETALK = TRUE;
		};
		AI_Output(self,other, " DIA_Thorben_PleaseTeach_06_13 " );	// I won't teach you anything until I'm sure you're an honest man.

		if((GRITTADEALOK == TRUE) && (THORBENFIRSTREFUSE == FALSE))
		{
			AI_Output(other,self, " DIA_Thorben_PleaseTeach_06_14 " );	// But I already helped you once by repaying Gritta's debt! Or does it not count anymore?
			AI_Output(self,other, " DIA_Thorben_PleaseTeach_06_15 " );	// Sorry, but I'm afraid that's not enough. I need more confidence to start trusting you.
			AI_Output(other,self, " DIA_Thorben_PleaseTeach_06_16 " );	// Hmmm. OK.
			THORBENFIRSTREFUSE = TRUE;
		};
	};
};

instance DIA_Thorben_Teach (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Teach_Condition;
	information = DIA_Thorben_Teach_Info;
	permanent = TRUE;
	description = " Teach me how to pick locks. " ;
};

func int DIA_Thorben_Teach_Condition()
{
	if((Thorben_TeachPlayer == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Teach_Info()
{
	AI_Output(other,self, " DIA_Thorben_Teach_15_00 " );	// Teach me how to pick locks.
	Info_ClearChoices(DIA_Thorben_Teach);
	Info_AddChoice(DIA_Thorben_Teach,Dialog_Back,DIA_Thorben_Teach_Back);
	Info_AddChoice(DIA_Thorben_Teach,b_buildlearnstringforthief("Взлом замков",B_GetLearnCostTalent(other,NPC_TALENT_PICKLOCK,1)),DIA_Thorben_Teach_PICKLOCK);
};

func void DIA_Thorben_Teach_Back()
{
	Info_ClearChoices(DIA_Thorben_Teach);
};

func void DIA_Thorben_Teach_PICKLOCK()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other, " DIA_Thorben_Teach_06_01 " );	// All you need is a lockpick. If you turn it carefully left and right in the lock, you can open it.
		AI_Output(self,other, " DIA_Thorben_Teach_06_02 " );	// But if you spin the lockpick too hard or too fast in the wrong direction, it will break.
		AI_Output(self,other, " DIA_Thorben_Teach_06_03 " );	// The more experienced you become, the fewer lockpicks you'll need. Here, perhaps, is all you need to know.
	};

	Info_ClearChoices(DIA_Thorben_Teach);
};

instance DIA_Thorben_SellTree (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_SellTree_Condition;
	information = DIA_Thorben_SellTree_Info;
	permanent = FALSE;
	description = " Do you have wood blanks? " ;
};

func int DIA_Thorben_SellTree_Condition()
{
	if(TorbenSellWood == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Thorben_SellTree_Info()
{
	AI_Output(other,self, " DIA_Thorben_SellTree_01_00 " );	// Do you have wood blanks?
	AI_Output(self,other, " DIA_Thorben_SellTree_01_01 " );	// Of course! Otherwise, what do you think I make furniture from?
	AI_Output(other,self, " DIA_Thorben_SellTree_01_02 " );	// Could you sell them to me?
	AI_Output(self,other, " DIA_Thorben_SellTree_01_03 " );	// I think so. The extra gold won't hurt me now.
	TorbenSellWoodDone = TRUE ;
	Log_CreateTopic(Topic_TalentMakeBows,LOG_NOTE);
	B_LogEntry(Topic_TalentMakeBows, " Torben will be able to sell me various types of wood. " );	
};

var int ThorbenPicklockFT;
var int TorbenFirstTree;

instance DIA_Thorben_TRADE_TREE (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 3;
	condition = DIA_Thorben_TRADE_TREE_Condition;
	information = DIA_Thorben_TRADE_TREE_Info;
	permanent = TRUE;
	description = " Show me your products. " ;
	trade = TRUE;
};

func int DIA_Thorben_TRADE_TREE_Condition()
{
	if((TorbenSellWoodDone == TRUE) && Wld_IsTime(6,0,20,0))
	{
		return TRUE;
	};
};

func void DIA_Thorben_TRADE_TREE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Elena_TRADE_15_00 " );	// Show me your products.

	if (Dietrichmachen_Trd ==  FALSE )
	{
		if(Npc_HasItems(self,ItKE_lockpick) == 0) 
		{
			CreateInvItems(self,ItKE_lockpick,10);
		};

		CreateInvItems(self,ItMi_JustTree,15);
		CreateInvItems(self,ItMi_EveTree,10);
		CreateInvItems(self,ItMi_VyzTree,5);
		CreateInvItems(self,ItMi_YsuoTree,5);
		CreateInvItems(self,ItMi_BokTree,5);
		CreateInvItems(self,ItMi_Pliers,1);
		CreateInvItems(self,ItMi_Pitch,10);
		Dietrichgeben_Trd = TRUE;
	};

	B_GiveTradeInv(self);
};

instance DIA_Thorben_TRADE (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 3;
	condition = DIA_Thorben_TRADE_Condition;
	information = DIA_Thorben_TRADE_Info;
	permanent = TRUE;
	description = " Can you sell me some lockpicks? " ;
	trade = TRUE;
};

func int DIA_Thorben_TRADE_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Thorben_Locksmith) == TRUE) && (TorbenSellWoodDone == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_TRADE_Info()
{
	AI_Output(other,self, " DIA_Thorben_TRADE_15_00 " );	// Can you sell me the lockpicks?

	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output(self,other, " DIA_Thorben_TRADE_06_01 " );	// If there are still...

		if (ThorbenPicklockFT ==  FALSE )
		{
			Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
			B_LogEntry(TOPIC_CityTrader, " Carpenter Torben sells lock picks. " );
			ThorbenPicklockFT = TRUE;
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Thorben_TRADE_06_02 " );	// Good! But they won't help you until you learn how to use them.

		if (ThorbenPicklockFT ==  FALSE )
		{
			Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
			B_LogEntry(TOPIC_CityTrader, " Carpenter Torben sells lock picks. " );
			ThorbenPicklockFT = TRUE;
		};
	};
	if ((Npc_HasItems(self,ItKE_lockpick) ==  0 ) && (Kapitel > Dietrichgeben))
	{
		CreateInvItems(self,ItKE_lockpick,25);
		picklock = picklock +  1 ;
	};
};

instance DIA_Addon_Thorben_MissingPeople(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 4;
	condition = DIA_Addon_Thorben_MissingPeople_Condition;
	information = DIA_Addon_Thorben_MissingPeople_Info;
	description = " Have you had a student before? " ;
};


func int DIA_Addon_Thorben_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Arbeit) && (SC_HearedAboutMissingPeople == TRUE) && (Elvrich_GoesBack2Thorben == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_MissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Thorben_MissingPeople_15_00 " );	// Did you have an apprentice before?
	AI_Output(self,other, " DIA_Addon_Thorben_MissingPeople_06_01 " );	// Yes, and very recently.
	AI_Output(other,self, " DIA_Addon_Thorben_MissingPeople_15_02 " );	// And what happened?
	AI_Output(self,other, " DIA_Addon_Thorben_MissingPeople_06_03 " );	// His name is Elvrich. He is my nephew.
	AI_Output(self,other, " DIA_Addon_Thorben_MissingPeople_06_04 " );	// I was very pleased with him, but one day he just took it and didn't come to work.
	MIS_Thorben_BringElvrichBack = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople, " Elvrich, apprentice carpenter Torben, is missing. " );
	Info_ClearChoices(DIA_Addon_Thorben_MissingPeople);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople,Dialog_Back,DIA_Addon_Thorben_MissingPeople_Back);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople, " Have you contacted the militia? " ,DIA_Addon_Thorben_MissingPeople_Mil);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople, " How long has he been gone? " ,DIA_Addon_Thorben_MissingPeople_wann);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople, " And where is Elvrich now? " ,DIA_Addon_Thorben_MissingPeople_where);
};

func void DIA_Addon_Thorben_MissingPeople_Back()
{
	Info_ClearChoices(DIA_Addon_Thorben_MissingPeople);
};

func void DIA_Addon_Thorben_MissingPeople_wann()
{
	AI_Output(other,self, " DIA_Addon_Thorben_MissingPeople_wann_15_00 " );	// How long has he been gone?
	AI_Output(self,other, " DIA_Addon_Thorben_MissingPeople_wann_06_01 " );	// About two weeks.
};

func void DIA_Addon_Thorben_MissingPeople_where()
{
	AI_Output(other,self, " DIA_Addon_Thorben_MissingPeople_where_15_00 " );	// And where is Elvrich now?
	AI_Output(self,other, " DIA_Addon_Thorben_MissingPeople_where_06_01 " );	// How should I know? Lately, he's been hanging around that filthy brothel in the harbor quite a bit.
	AI_Output(self,other, " DIA_Addon_Thorben_MissingPeople_where_06_02 " );	// I wouldn't be surprised if he's still having fun in bed with some whore.
};

func void DIA_Addon_Thorben_MissingPeople_Mil()
{
	AI_Output(other,self, " DIA_Addon_Thorben_MissingPeople_Mil_15_00 " );	// Have you contacted the militia?
	AI_Output(self,other, " DIA_Addon_Thorben_MissingPeople_Mil_06_01 " );	// Addressed, of course. I asked them to catch this bummer and make sure he gets back to work. But I already regret it.
	AI_Output(self,other, " DIA_Addon_Thorben_MissingPeople_Mil_06_02 " );	// Let him do whatever he wants. Sooner or later he will realize that there is nothing to do in Khorinis without decent work.
	AI_Output(other,self, " DIA_Addon_Thorben_MissingPeople_Mil_15_03 " );	// (cynically) Really?
};


instance DIA_Addon_Thorben_ElvrichIsBack (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = DIA_Addon_Thorben_ElvrichIsBack_Condition;
	information = DIA_Addon_Thorben_ElvrichIsBack_Info;
	description = " Elvrich will work for you again. " ;
};


func int DIA_Addon_Thorben_ElvrichIsBack_Condition()
{
	if((Elvrich_GoesBack2Thorben == TRUE) && (Npc_IsDead(Elvrich) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_ElvrichIsBack_Info()
{
	AI_Output(other,self, " DIA_Addon_Thorben_ElvrichIsBack_15_00 " );	// Elvrich will work for you again.
	AI_Output(self,other, " DIA_Addon_Thorben_ElvrichIsBack_06_01 " );	// Let's hope he doesn't run away again the next time another girl twirls her ass in his face.
	AI_Output(self,other, " DIA_Addon_Thorben_ElvrichIsBack_06_02 " );	// Take this gold as a reward for returning the apprentice.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	MIS_Thorben_BringElvrichBack = LOG_SUCCESS ;
	VLK_4302_Addon_Elvrich.flags = 0;
};


instance DIA_Thorben_Paladine(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 4;
	condition = DIA_Thorben_Paladine_Condition;
	information = DIA_Thorben_Paladine_Info;
	permanent = FALSE;
	description = " What do you know about paladins? " ;
};


func int DIA_Thorben_Paladine_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Thorben_Paladine_Info()
{
	AI_Output(other,self, " DIA_Thorben_Paladine_15_00 " );	// What do you know about paladins?
	AI_Output(self,other, " DIA_Thorben_Paladine_06_01 " );	// Not much. They arrived by ship from the mainland two weeks ago.
	AI_Output(self,other, " DIA_Thorben_Paladine_06_02 " );	// Since then, they have locked themselves in the upper quarter of the city.
	AI_Output(self,other, " DIA_Thorben_Paladine_06_03 " );	// No one really knows why they've come.
	AI_Output(self,other, " DIA_Thorben_Paladine_06_04 " );	// Many fear an orc attack.
	AI_Output(self,other, " DIA_Thorben_Paladine_06_05 " );	// And I think they're here to quell the farmers' rebellion.
};


instance DIA_Thorben_Bauernaufstand (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 4;
	condition = DIA_Thorben_Bauernaufstand_Condition;
	information = DIA_Thorben_Bauernaufstand_Info;
	permanent = FALSE;
	description = " Do you know anything about the farmers' rebellion? " ;
};


func int DIA_Thorben_Bauernaufstand_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Paladine) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Bauernaufstand_Info()
{
	AI_Output(other,self, " DIA_Thorben_Bauernaufstand_15_00 " );	// Do you know anything about the farmers' rebellion?
	AI_Output(self,other, " DIA_Thorben_Bauernaufstand_06_01 " );	// Rumor has it that Onar hired mercenaries to shake off the king's troops from his neck.
	AI_Output(self,other, " DIA_Thorben_Bauernaufstand_06_02 " );	// He's probably tired of giving all his crops to paladins and militia.
	AI_Output(self,other, " DIA_Thorben_Bauernaufstand_06_03 " );	// Well, in the city after that, food prices began to rise.
	AI_Output(self,other, " DIA_Thorben_Bauernaufstand_06_04 " );	// Onar's farm is far to the east of here. We don't know if there were battles or not.
	AI_Output(self,other, " DIA_Thorben_Bauernaufstand_06_05 " );	// If you want to know more, ask the merchants at Market Square. They know the situation on the island better than I do.
};


instance DIA_Thorben_Gritta (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = DIA_Thorben_Gritta_Condition;
	information = DIA_Thorben_Gritta_Info;
	permanent = FALSE;
	description = " I'm talking about Gritta... " ;
};


func int DIA_Thorben_Gritta_Condition()
{
	if((MIS_Matteo_Gold == LOG_Running) && !Npc_IsDead(Gritta))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Gritta_Info()
{
	AI_Output(other,self, " DIA_Thorben_Gritta_15_00 " );	// I'm talking about Gritta...
	AI_Output(self,other, " DIA_Thorben_Gritta_06_01 " );	// My niece? What do you care about her? It's about debt, right?
	AI_Output(other,self, " DIA_Thorben_Gritta_15_02 " );	// She owes a hundred gold to the merchant Matteo.
	AI_Output(self,other, " DIA_Thorben_Gritta_06_03 " );	// Tell me it's not! Since she's been living with me, she's been nothing but trouble!
	AI_Output(self,other, " DIA_Thorben_Gritta_06_04 " );	// She owed almost all the merchants in the city.
	AI_Output(self,other, " DIA_Thorben_Gritta_06_05 " );	// I had to borrow two hundred gold pieces from the moneylender Lemar to pay off her debts! And now again!
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output(self,other, " DIA_Thorben_Gritta_06_06 " );	// Grit must be in the house.
	};
	AI_Output(self,other, " DIA_Thorben_Gritta_06_07 " );	// Go talk to her. But I'll tell you honestly: she doesn't have ANY gold coins.
	if (Npc_HasItems(Gritta,ItMi_Gold) >=  100 )
	{
		AI_Output(other,self, " DIA_Thorben_Gritta_15_08 " );	// Let's see...
	};
};


instance DIA_Thorben_GrittaHatteGold (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = DIA_Thorben_GrittaHatteGold_Condition;
	information = DIA_Thorben_GrittaHatteGold_Info;
	permanent = FALSE;
	description = " Your niece had a hundred gold coins. " ;
};


func int DIA_Thorben_GrittaHatteGold_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Thorben_Gritta ) && ( Npc_HasItems ( Gritta , It'sMy_Gold ) <  100 ) &&  ! Npc_IsDead ( Gritta )) ;
	{
		return TRUE;
	};
};

func void DIA_Thorben_GrittaHatteGold_Info()
{
	AI_Output(other,self, " DIA_Thorben_GrittaHatteGold_15_00 " );	// Your niece had a hundred gold coins.
	AI_Output(self,other, " DIA_Thorben_GrittaHatteGold_06_01 " );	// WHAT? Oh, she's a snake - that was MY gold! She took it from my chest.
	AI_Output(self,other, " DIA_Thorben_GrittaHatteGold_06_02 " );	// Give it to me! I have to pay Lemar first. Matteo can wait!
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
	if(MIS_Matteo_Gold == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Thorben_GrittaHatteGold, " I already gave the money to Matteo! " ,DIA_Thorben_GrittaHatteGold_MatteoHatEs);
	}
	else
	{
		Info_AddChoice(DIA_Thorben_GrittaHatteGold, " No! Matteo will get his money back. " ,DIA_Thorben_GrittaHatteGold_MatteoSollHaben);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Thorben_GrittaHatteGold, " Вот твое золото. " ,DIA_Thorben_GrittaHatteGold_HereItIs);
	};
};

func void B_Thorben_DeletePetzCrimeGritta()
{
	if(Gritta_GoldGiven == FALSE)
	{
		AI_Output(self,other, " B_Thorben_DeletePetzCrimeGritta_06_00 " );	// And as far as I know this viper, I'm sure it will run straight to the guards and accuse you too!
		AI_Output(self,other, " B_Thorben_DeletePetzCrimeGritta_06_01 " );	// I have to sort this out.
		B_DeletePetzCrime(Gritta);
	};
};

func void DIA_Thorben_GrittaHatteGold_MatteoHatEs()
{
	AI_Output(other,self, " DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00 " );	// I already gave the gold to Matteo!
	AI_Output(self,other, " DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01 " );	// Damn! Okay, debt is debt. At least you didn't embezzle that gold. I think I need to thank you for this.
	B_Thorben_DeletePetzCrimeGritta();
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_MatteoSollHaben()
{
	AI_Output(other,self, " DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00 " );	// No. Matteo will get his money back.
	AI_Output(self,other, " DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01 " );	// You're just killing me. Lemar is not known for generosity when it comes to debt.
	AI_Output(self,other, " DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02 " );	// But at least you'll pay off my niece's debts. I think I need to thank you for this.
	B_Thorben_DeletePetzCrimeGritta();
	GRITTADEALOK = TRUE;
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_HereItIs()
{
	AI_Output(other,self, " DIA_Thorben_GrittaHatteGold_HereItIs_15_00 " );	// Here's your gold.
	B_GiveInvItems(other,self,ItMi_Gold,100);
	AI_Output(self,other, " DIA_Thorben_GrittaHatteGold_HereItIs_06_01 " );	// Thank you! Now, I have at least some of the money I owe Lemar.
	AI_Output(self,other, " DIA_Thorben_GrittaHatteGold_HereItIs_06_02 " );	// I can't believe she had the audacity to take my gold!
	B_Thorben_DeletePetzCrimeGritta();
	Thorben_GotGold = TRUE ;
	GRITTADEALOK = TRUE;
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
};


instance DIA_THORBEN_HOWLIFE (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = dia_thorben_howlife_condition;
	information = dia_thorben_howlife_info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int dia_thorben_howlife_condition()
{
	if (Npc_KnowsInfo(hero,DIA_Thorben_Arbeit))
	{
		return TRUE;
	};
};

func void dia_thorben_howlife_info()
{
	AI_Output(other,self, " DIA_Thorben_HowLife_01_00 " );	// How's life?
	if((MIS_Thorben_BringElvrichBack == LOG_SUCCESS) && (GRITTAISDEAD == FALSE) && (MIS_MISSGRITTA == LOG_SUCCESS))
	{
		AI_Output(self,other, " DIA_Thorben_HowLife_01_01 " );	// (smiles) Good.
		AI_Output(self,other, " DIA_Thorben_HowLife_01_02 " );	// Since Elvrich returned, my business has gone uphill.
		AI_Output(self,other, " DIA_Thorben_HowLife_01_04 " );	// And Gritt is now unrecognizable!
		AI_Output(self,other, " DIA_Thorben_HowLife_01_05 " );	// After that incident with the bandits, she seems to have become more serious about life.
	}
	else if((MIS_Thorben_BringElvrichBack == LOG_SUCCESS) && (GRITTAISDEAD == FALSE) && (MIS_MISSGRITTA == LOG_Running))
	{
		AI_Output(self,other, " DIA_Thorben_HowLife_01_08 " );	// Not bad.
		AI_Output(self,other, " DIA_Thorben_HowLife_01_09 " );	// Of course, since Elvrich returned, things have gotten a little better for me.
		AI_Output(self,other, " DIA_Thorben_HowLife_01_10 " );	// However, I'm very worried about Gritta. (nervously) My poor girl!
	}
	else if((MIS_Thorben_BringElvrichBack == LOG_SUCCESS) && (GRITTAISDEAD == TRUE))
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_13");	//Ужасно!
		AI_Output(self,other, " DIA_Thorben_HowLife_01_14 " );	// Of course, since Elvrich returned, things have gotten a little better for me.
		AI_Output(self,other, " DIA_Thorben_HowLife_01_15 " );	// But all this pales in comparison to Gritta's death. (heartbroken) My poor girl!
		AI_Output(self,other, " DIA_Thorben_HowLife_01_16 " );	// I will never forgive myself for this! It's my fault - it's all because of me...
		AI_StopProcessInfos(self);
	}
	else if((MIS_Thorben_BringElvrichBack == LOG_Running) && (GRITTAISDEAD == FALSE) && (MIS_MISSGRITTA == LOG_SUCCESS))
	{
		AI_Output(self,other, " DIA_Thorben_HowLife_01_17 " );	// (disappointingly) It could have been better.
		AI_Output(self,other, " DIA_Thorben_HowLife_01_18 " );	// Things are not going well for me - I really miss the help of my student Elvrich.
		AI_Output(self,other, " DIA_Thorben_HowLife_01_19 " );	// The only thing that makes me happy is Gritta.
		AI_Output(self,other, " DIA_Thorben_HowLife_01_20 " );	// After that incident with the bandits, it seems that she has changed a lot, and has become more serious about life.
	}
	else if((MIS_Thorben_BringElvrichBack == LOG_Running) && (GRITTAISDEAD == FALSE) && (MIS_MISSGRITTA == LOG_Running))
	{
		AI_Output(self,other, " DIA_Thorben_HowLife_01_24 " );	// Bad!
		AI_Output(self,other, " DIA_Thorben_HowLife_01_25 " );	// Things are not going well for me - I really miss the help of my student Elvrich.
		AI_Output(self,other, " DIA_Thorben_HowLife_01_26 " );	// But most of all I'm worried about Gritta. My poor girl!
	}
	else if((MIS_Thorben_BringElvrichBack == LOG_Running) && (GRITTAISDEAD == TRUE))
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_29");	//Ужасно!
		AI_Output(self,other, " DIA_Thorben_HowLife_01_30 " );	// Things are not going well for me - I really miss the help of my student Elvrich.
		AI_Output(self,other, " DIA_Thorben_HowLife_01_31 " );	// But all this pales in comparison to Gritta's death. (heartbroken) My poor girl!
		AI_Output(self,other, " DIA_Thorben_HowLife_01_32 " );	// I will never forgive myself for this! It's my fault - it's all because of me...
		AI_StopProcessInfos(self);
	}
	else if((GRITTAISDEAD == FALSE) && (MIS_MISSGRITTA == LOG_SUCCESS))
	{
		AI_Output(self,other, " DIA_Thorben_HowLife_01_33 " );	// (disappointingly) It could have been better.
		AI_Output(self,other, " DIA_Thorben_HowLife_01_34 " );	// Things are going really bad for me - I don't even want to talk about it.
		AI_Output(self,other, " DIA_Thorben_HowLife_01_35 " );	// The only thing that makes me happy is Gritta.
		AI_Output(self,other, " DIA_Thorben_HowLife_01_36 " );	// After that incident with the bandits, it seems that she has changed a lot, and has become more serious about life.
	}
	else if((GRITTAISDEAD == FALSE) && (MIS_MISSGRITTA == LOG_Running))
	{
		AI_Output(self,other, " DIA_Thorben_HowLife_01_40 " );	// (desperately) It couldn't get any worse.
		AI_Output(self,other, " DIA_Thorben_HowLife_01_41 " );	// Things are going really bad for me - I don't even want to talk about it.
		AI_Output(self,other, " DIA_Thorben_HowLife_01_42 " );	// But most of all I'm worried about Gritta. My poor girl!
	}
	else if(GRITTAISDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_45");	//Ужасно!
		AI_Output(self,other, " DIA_Thorben_HowLife_01_46 " );	// Things are going really bad for me - I don't even want to talk about it.
		AI_Output(self,other, " DIA_Thorben_HowLife_01_47 " );	// But all this pales in comparison to Gritta's death. (heartbroken) My poor girl!
		AI_Output(self,other, " DIA_Thorben_HowLife_01_48 " );	// I will never forgive myself for this! It's my fault - it's all because of me...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Thorben_HowLife_01_49 " );	// (sadly) Eh. Better not ask - some frustration.
	};
};


instance DIA_THORBEN_MISSGRITTANEWS (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = dia_thorben_missgrittanews_condition;
	information = dia_thorben_missgrittanews_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thorben_missgrittanews_condition()
{
	if ( ! Npc_IsDead( Gritta ) && ( Chapter >=  2 )) ;
	{
		return TRUE;
	};
};

func void dia_thorben_missgrittanews_info()
{
	AI_Output(self,other, " DIA_Thorben_MissGrittaNews_01_00 " );	// Hey, wait!
	AI_Output(other,self, " DIA_Thorben_MissGrittaNews_01_01 " );	// What's wrong?
	AI_Output(self,other, " DIA_Thorben_MissGrittaNews_01_02 " );	// (embarrassed) I'm sorry I bothered you.
	AI_Output(self,other, " DIA_Thorben_MissGrittaNews_01_03 " );	// Tell me, please, have you seen my niece Gritta anywhere in the city?
	AI_Output(other,self, " DIA_Thorben_MissGrittaNews_01_04 " );	// No, I haven't met her.
	AI_Output(self,other, " DIA_Thorben_MissGrittaNews_01_05 " );	// (sadly) I see.
};


instance DIA_THORBEN_MISSGRITTA (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = dia_thorben_missgritta_condition;
	information = dia_thorben_missgritta_info;
	permanent = FALSE;
	description = " Are you all right? " ;
};


func int dia_thorben_missgritta_condition()
{
	if ( ! Npc_IsDead(Gritta) && (Chapter >=  2 ) && Npc_KnowsInfo(hero,dia_thorben_missgrittanews));
	{
		return TRUE;
	};
};

func void dia_thorben_missgritta_info()
{
	AI_Output(other,self, " DIA_Thorben_MissGritta_01_00 " );	// Are you okay?
	AI_Output(other,self, " DIA_Thorben_MissGritta_01_01 " );	// I think you look a little worried.
	AI_Output(self,other, " DIA_Thorben_MissGritta_01_02 " );	// (sadly) Yes... my niece Gritta... she disappeared somewhere!
	AI_Output(self,other, " DIA_Thorben_MissGritta_01_04 " );	// The guards say they saw her go outside the gate yesterday to talk to some merchant.
	AI_Output(self,other, " DIA_Thorben_MissGritta_01_05 " );	// And then she went with him into the forest and never returned.
	AI_Output(other,self, " DIA_Thorben_MissGritta_01_09 " );	// Maybe it wasn't a merchant at all?
	AI_Output(other,self, " DIA_Thorben_MissGritta_01_12 " );	// The neighborhood is full of bandits, not to mention wolves and other dangerous creatures. And I don't think any merchant would leave the city.
	AI_Output(self,other, " DIA_Thorben_MissGritta_01_13 " );	// O Innos! (panicked) Do you think they were bandits? Was she kidnapped?!
	AI_Output(other,self, " DIA_Thorben_MissGritta_01_14 " );	// Anything is possible. Moreover, people have been constantly disappearing in Khorinis lately.
	AI_Output(self,other, " DIA_Thorben_MissGritta_01_19 " );	// What do we do now? The guards won't even lift a finger if you don't pay them!
	AI_Output(self,other, " DIA_Thorben_MissGritta_01_21 " );	// And I'm just a poor carpenter.
	AI_Output(other,self, " DIA_Thorben_MissGritta_01_22 " );	// Maybe then I can help?
	AI_Output(self,other, " DIA_Thorben_MissGritta_01_23 " );	// You? (surprised) Will you give me gold?
	AI_Output(self,other, " DIA_Thorben_MissGritta_01_25 " );	// (thoughtfully) I think the guards will ask for at least five hundred coins for their help.
	Info_ClearChoices(dia_thorben_missgritta);
	Info_AddChoice(dia_thorben_missgritta, " I'd rather take care of finding Gritta myself. " ,dia_thorben_missgritta_help);
	Info_AddChoice(dia_thorben_missgritta, " That's too much. " ,dia_thorben_missgritta_no);
	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_thorben_missgritta, " Okay! I'll give you five hundred coins. " ,dia_thorben_missgritta_ok);
	};
};

func void dia_thorben_missgritta_help()
{
	AI_Output(other,self, " DIA_Thorben_MissGritta_Help_01_00 " );	// I'd rather take care of finding Grit myself.
	AI_Output(self,other, " DIA_Thorben_MissGritta_Help_01_01 " );	// (surprised) You? Okay, just hurry up!
	AI_Output(self,other, " DIA_Thorben_MissGritta_Help_01_03 " );	// If she really fell into the hands of bandits, I'm even afraid to imagine what could happen to her!
	AI_Output(other,self, " DIA_Thorben_MissGritta_Help_01_05 " );	// Where do you say Gritta was last seen?
	AI_Output(self,other, " DIA_Thorben_MissGritta_Help_01_06 " );	// Near the south gate, from there there is a direct road to Lobart's farm.
	AI_Output(self,other, " DIA_Thorben_MissGritta_Help_01_08 " );	// Tell me everything you find out.
	B_KillNpc(gobbo_mage_gr1);
	B_KillNpc(gobbo_mage_gr2);
	B_KillNpc(gobbo_mage_gr3);
	B_KillNpc(gobbo_mage_gr4);
	B_KillNpc(gobbo_mage_gr5);
	Npc_ExchangeRoutine(VLK_418_Gritta,"MissGr");
	AI_Teleport(Gritta,"NW_CITY_GRITTA_MISS_01");
	Wld_InsertNpc(bdt_6140_grittashunt0,"NW_FARM1_CITYWALL_FOREST_15");
	Wld_InsertNpc(bdt_6141_grittashunt1,"NW_CITY_GRITTA_MISS_HUNT_02");
	Wld_InsertNpc(bdt_6142_grittashunt2,"NW_CITY_GRITTA_MISS_HUNT_03");
	Wld_InsertNpc(bdt_6143_grittashunt3,"NW_CITY_GRITTA_MISS_HUNT_04");
	Wld_InsertNpc(bdt_6144_grittashunt4,"NW_CITY_GRITTA_MISS_HUNT_05");
	MIS_MISSGRITTA = LOG_Running;
	GRITTACANFOUND = TRUE;
	Log_CreateTopic(TOPIC_MISSGRITTA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MISSGRITTA,LOG_Running);
	B_LogEntry( TOPIC_MISSGRITTA , " The carpenter Torben's niece, Gritta, went missing. She met with a merchant who promised to sell her cloth, and then went with him to the forest. Several days have passed since then, and Gritta still has not returned home. I volunteered to help Torben find his niece. She was last seen at the south gate of the city. " );
	Info_ClearChoices(dia_thorben_missgritta);
};

func void dia_thorben_missgritta_ok()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Thorben_MissGritta_Ok_01_00 " );	// Good! I will give you five hundred coins.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	AI_Output(self,other, " DIA_Thorben_MissGritta_Ok_01_03 " );	// Bless you Innos! I thank you from the bottom of my heart!
	AI_Output(self,other, " DIA_Thorben_MissGritta_Ok_01_04 " );	// Now I can pay the guards so they can find my Gritta.
	AI_Output(self,other, " DIA_Thorben_MissGritta_Ok_01_06 " );	// Wait! Don't go so fast - I want to thank you for your help.
	AI_Output(self,other, " DIA_Thorben_MissGritta_Ok_01_08 " );	// Here, take these lockpicks.
	AI_Output(self,other, " DIA_Thorben_MissGritta_Ok_01_09 " );	// I think you'll probably find them useful.
	B_GiveInvItems(self,other,ItKE_lockpick,20);
	AI_Output(other,self, " DIA_Thorben_MissGritta_Ok_01_10 " );	// Thank you!
	GRITTAMUSTNOTDEAD = TRUE;
	MIS_MISSGRITTA = LOG_Running;
	Log_CreateTopic(TOPIC_MISSGRITTA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MISSGRITTA,LOG_Running);
	B_LogEntry( TOPIC_MISSGRITTA , " The carpenter Torben's niece, Gritta, went missing. She met with a merchant who promised to sell her fabric, and then went with him to the forest. Several days have passed since then, and Gritta still has not returned home. I gave Torben five hundred gold for the city guards to look for Gritta. " );
	Info_ClearChoices(dia_thorben_missgritta);
	Npc_ExchangeRoutine(VLK_462_Thorben,"GoAndre");
};

func void dia_thorben_missgritta_no()
{
	AI_Output(other,self, " DIA_Thorben_MissGritta_No_01_00 " );	// This is too much.
	AI_Output(self,other, " DIA_Thorben_MissGritta_No_01_02 " );	// I understand. (sadly) Okay, I'll try to find this money myself.
	AI_Output(self,other, " DIA_Thorben_MissGritta_No_01_03 " );	// And I hope nothing happens to my girl until then.
	AI_Output(self,other, " DIA_Thorben_MissGritta_No_01_04 " );	// Eh... (sighs sadly)
	B_KillNpc(gobbo_mage_gr1);
	B_KillNpc(gobbo_mage_gr2);
	B_KillNpc(gobbo_mage_gr3);
	B_KillNpc(gobbo_mage_gr4);
	B_KillNpc(gobbo_mage_gr5);
	CreateInvItems(Gritta,itri_grittasring, 1 );
	Npc_ExchangeRoutine(VLK_418_Gritta,"MissGr");
	AI_Teleport(Gritta,"NW_CITY_GRITTA_MISS_01");
	B_KillNpc(Gritta);
	Wld_InsertNpc(bdt_6140_grittashunt0,"NW_FARM1_CITYWALL_FOREST_15");
	Wld_InsertNpc(bdt_6141_grittashunt1,"NW_CITY_GRITTA_MISS_HUNT_02");
	Wld_InsertNpc(bdt_6142_grittashunt2,"NW_CITY_GRITTA_MISS_HUNT_03");
	Wld_InsertNpc(bdt_6143_grittashunt3,"NW_CITY_GRITTA_MISS_HUNT_04");
	Wld_InsertNpc(bdt_6144_grittashunt4,"NW_CITY_GRITTA_MISS_HUNT_05");
	GRITTAMUSTISDEAD = TRUE;
	Info_ClearChoices(dia_thorben_missgritta);
};


instance DIA_THORBEN_GRITTAISBACK (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = dia_thorben_grittaisback_condition;
	information = dia_thorben_grittaisback_info;
	permanent = FALSE;
	description = " Is Gritta all right? " ;
};


func int dia_thorben_grittaisback_condition()
{
	if ( ! Npc_IsDead(Gritta) && ( GRITTAISBACK  ==  TRUE ) && ( MIS_MISSGRITTA  == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_thorben_grittaisback_info()
{
	AI_Output(other,self, " DIA_Thorben_GrittaIsBack_01_00 " );	// Is Gritta OK?
	AI_Output(self,other, " DIA_Thorben_GrittaIsBack_01_01 " );	// Yes, thank Innos - she's back!
	if((MIS_MISSGRITTA == LOG_Running) && (GRITTAMUSTNOTDEAD == FALSE))
	{
		B_GivePlayerXP(300);
		AI_Output(self,other, " DIA_Thorben_GrittaIsBack_01_02 " );	// I thank you from the bottom of my heart!
		AI_Output(self,other, " DIA_Thorben_GrittaIsBack_01_07 " );	// Unfortunately, I'm not too rich, and I can't thank you in gold.
		AI_Output(self,other, " DIA_Thorben_GrittaIsBack_01_08 " );	// That's why I'd rather show you how to be more dexterous with different types of locks.
		AI_Output(self,other, " DIA_Thorben_GrittaIsBack_01_09 " );	// Look, it's not that hard. Ready?
		Info_ClearChoices(dia_thorben_grittaisback);
		Info_AddChoice(dia_thorben_grittaisback, " Я готов. " ,dia_thorben_grittaisback_teach);
		MIS_MISSGRITTA = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_MISSGRITTA,LOG_SUCCESS);
		B_LogEntry( TOPIC_MISSGRITTA , " Gritta is back home. " );
	}
	else if((MIS_MISSGRITTA == LOG_Running) && (GRITTAMUSTNOTDEAD == TRUE))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_Thorben_GrittaIsBack_01_10 " );	// I paid the guards and they went looking for her.
		AI_Output(self,other, " DIA_Thorben_GrittaIsBack_01_11 " );	// And a couple of days later they returned with Gritta.
		AI_Output(self,other, " DIA_Thorben_GrittaIsBack_01_15 " );	// Please accept my sincere thanks. Thank you!
		MIS_MISSGRITTA = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_MISSGRITTA,LOG_SUCCESS);
		B_LogEntry( TOPIC_MISSGRITTA , " Gritta is back home. " );
	};
};

func void dia_thorben_grittaisback_teach()
{
	B_RaiseAttribute_Bonus(other,ATR_DEXTERITY,1);
	AI_Output(other,self, " DIA_Thorben_GrittaIsBack_Teach_01_00 " );	// I'm ready.
	AI_Output(self,other, " DIA_Thorben_GrittaIsBack_Teach_01_01 " );	// First of all, you need to be careful not to break the lockpick.
	AI_Output(self,other, " DIA_Thorben_GrittaIsBack_Teach_01_02 " );	// When you gain experience, you will begin to feel the moment when the lockpick is about to break. Then her sound changes.
	AI_Output(self,other, " DIA_Thorben_GrittaIsBack_Teach_01_03 " );	// I think you can do it. Train yourself to listen to the quiet clicking of the lock, and in the future you will save yourself a bunch of master keys.
};


instance DIA_THORBEN_GRITTAISDEAD (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = dia_thorben_grittaisdead_condition;
	information = dia_thorben_grittaisdead_info;
	permanent = TRUE;
	description = " Gritta will not return. " ;
};


func int dia_thorben_grittaisdead_condition()
{
	if((GRITTAFOUNDISDEAD == TRUE) && (GRITTAISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_thorben_grittaisdead_info()
{
	AI_Output(other,self, " DIA_Thorben_GrittaIsDead_01_00 " );	// Gritta won't come back.
	AI_Output(self,other, " DIA_Thorben_GrittaIsDead_01_01 " );	// (frightened) What?! Why?
	AI_Output(other,self, " DIA_Thorben_GrittaIsDead_01_02 " );	// I found her body in the forest. She is dead.
	AI_Output(self,other, " DIA_Thorben_GrittaIsDead_01_03 " );	// But... But who did it? (confused) Who killed my girl?
	AI_Output(other,self, " DIA_Thorben_GrittaIsDead_01_04 " );	// They were bandits.
	AI_Output(self,other, " DIA_Thorben_GrittaIsDead_01_05 " );	// No! It just can't be! I do not trust you!
	AI_Output(self,other, " DIA_Thorben_GrittaIsDead_01_06 " );	// This can't be true! You're lying to me!
	if (Npc_HasItems(other,itri_grittasring) >=  1 )
	{
		B_GivePlayerXP(50);
		AI_Output(other,self, " DIA_Thorben_GrittaIsDead_01_07 " );	// Here, I found this ring on her.
		B_GiveInvItems(other,self,itri_grittasring,1);
		AI_Output(self,other, " DIA_Thorben_GrittaIsDead_01_08 " );	// Oh god, no! (voice trembling) It's her wedding ring.
		AI_Output(self,other, " DIA_Thorben_GrittaIsDead_01_10 " );	// So...(bewildered) Oh no! I can not believe this!
		AI_Output(self,other, " DIA_Thorben_GrittaIsDead_01_12 " );	// O Innos, why do I need all this?
		AI_Output(self,other, " DIA_Thorben_GrittaIsDead_01_15 " );	// It's all my fault! I have no excuse...
		GRITTAISDEAD = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_THORBEN_ELVRICHGRITTA (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = dia_addon_thorben_elvrichgritta_condition;
	information = dia_addon_thorben_elvrichgritta_info;
	permanent = FALSE;
	description = " How is Elvrich?! " ;
};


func int dia_addon_thorben_elvrichgritta_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if ((Npc_IsDead(Elvrich) ==  FALSE ) && (Npc_IsDead(Gritta) ==  FALSE ) && ( MY_FINDLOSTHOUSE  ==  LOG_SUCCESS ) && ( MY_LuciasLetter ==  LOG_SUCCESS ) && ( ELVRIHMARRYGRITTAFLAG  ==  TRUE ) && ( ELVRIHMARRYGRITTATIMER  < ( daynow2  )))
	{
		return TRUE;
	};
};

func void dia_addon_thorben_elvrichgritta_info()
{
	AI_Output(other,self, " DIA_Addon_Thorben_ElvrichGritta_01_00 " );	// How is Elvrich doing?
	AI_Output(self,other, " DIA_Addon_Thorben_ElvrichGritta_01_01 " );	// So far so good.
	AI_Output(self,other, " DIA_Addon_Thorben_ElvrichIsBack_06_01 " );	// I can only hope that it does not evaporate again after the first glance at a woman's skirt.
	AI_Output(self,other, " DIA_Addon_Thorben_ElvrichGritta_01_03 " );	// Eh... Marry him!
	AI_Output(other,self, " DIA_Addon_Thorben_ElvrichGritta_01_04 " );	// It seems to me that Gritta would also do well to find a new husband.
	AI_Output(self,other, " DIA_Addon_Thorben_ElvrichGritta_01_07 " );	// (thoughtfully) Exactly. They would make a really good couple.
	AI_Output(self,other, " DIA_Addon_Thorben_ElvrichGritta_01_11 " );	// Just... how do I bring them together?
	AI_Output(other,self, " DIA_Addon_Thorben_ElvrichGritta_01_12 " );	// Just talk to them.
	AI_Output(self,other, " DIA_Addon_Thorben_ElvrichGritta_01_13 " );	// This is of course possible. But I'm afraid they won't listen to me.
	AI_Output(self,other, " DIA_Addon_Thorben_ElvrichGritta_01_15 " );	// Here you need to choose some special words...
	AI_Output(self,other, " DIA_Addon_Thorben_ElvrichGritta_01_17 " );	// Maybe you can talk to them yourself?
	Info_ClearChoices(dia_addon_thorben_elvrichgritta);
	Info_AddChoice(dia_addon_thorben_elvrichgritta, " Why not? " ,dia_addon_thorben_elvrichgritta_help);
	Info_AddChoice(dia_addon_thorben_elvrichgritta, " No, this is not for me. " ,dia_addon_thorben_elvrichgritta_no);
};

func void dia_addon_thorben_elvrichgritta_no()
{
	AI_Output(other,self, " DIA_Addon_Thorben_ElvrichGritta_No_01_00 " );	// No. It's all not for me.
	AI_Output(self,other, " DIA_Addon_Thorben_ElvrichGritta_No_01_01 " );	// Eh. It's a pity.
	AI_Output(self,other, " DIA_Addon_Thorben_ElvrichGritta_No_01_02 " );	// Okay, I'll try it myself sometime - I hope I can do it.
	Info_ClearChoices(dia_addon_thorben_elvrichgritta);
};

func void dia_addon_thorben_elvrichgritta_help()
{
	AI_Output(other,self, " DIA_Addon_Thorben_ElvrichGritta_Help_01_00 " );	// Why not? I will talk to them.
	AI_Output(self,other, " DIA_Addon_Thorben_ElvrichGritta_Help_01_01 " );	// Great! I hope everything works out for you.
	MIS_ELVRIHMARRYGRITTA = LOG_Running;
	Log_CreateTopic(TOPIC_ELVRIHMARRYGRITTA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ELVRIHMARRYGRITTA,LOG_Running);
	B_LogEntry( TOPIC_ELVRIHMARRYGRITTA , " Torben the carpenter is planning to marry his Gritta and Elvrich. I volunteered to be a matchmaker. " );
	Info_ClearChoices(dia_addon_thorben_elvrichgritta);
};


instance DIA_ADDON_THORBEN_ELVRICHGRITTADONE (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = dia_addon_thorben_elvrichgrittadone_condition;
	information = dia_addon_thorben_elvrichgrittadone_info;
	permanent = FALSE;
	description = " I spoke with Elvrich and Gritta. " ;
};


func int dia_addon_thorben_elvrichgrittadone_condition()
{
	if((ELVRIHAGREEMARRY == TRUE) && (GRITTAAGREEMARRY == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_thorben_elvrichgrittadone_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self, " DIA_Addon_Thorben_ElvrichGrittaDone_01_00 " );	// I've spoken to Elvrich and Gritta.
	AI_Output(self,other, " DIA_Addon_Thorben_ElvrichGrittaDone_01_01 " );	// And how are you doing?
	AI_Output(other,self, " DIA_Addon_Thorben_ElvrichGrittaDone_01_02 " );	// It seems that Gritta will soon have a new husband.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGrittaDone_01_03");	//Неужели?
	AI_Output(self,other, " DIA_Addon_Thorben_ElvrichGrittaDone_01_08 " );	// Thank you for your help!
	MIS_ELVRIHMARRYGRITTA = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ELVRIHMARRYGRITTA,LOG_SUCCESS);
	Npc_ExchangeRoutine(VLK_4302_Addon_Elvrich,"BackInTheCity");
	Npc_ExchangeRoutine(VLK_418_Gritta,"Start");
};

var int ThorbenDoCrossBow;

instance DIA_Thorben_DoCrossBow (C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = DIA_Thorben_DoCrossBow_condition;
	information = DIA_Thorben_DoCrossBow_info;
	permanent = FALSE;
	description = " Can you make crossbows? " ;
};

func int DIA_Thorben_DoCrossBow_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (CrossBowNeedPlotnik == TRUE) && (ThorbenDoCrossBow == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_DoCrossBow_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Thorben_DoCrossBow_01_01 " );	// Can you make crossbows?
	AI_Output(self,other, " DIA_Thorben_DoCrossBow_01_02 " );	// Yes, but not the crossbows themselves, but only wooden stops for them.
	AI_Output(other,self, " DIA_Thorben_DoCrossBow_01_03 " );	// Can you at least teach me that?
	AI_Output(self,other, " DIA_Thorben_DoCrossBow_01_04 " );	// Of course! But you have to pay tuition.
	AI_Output(other,self, " DIA_Thorben_DoCrossBow_01_05 " );	// Well, that goes without saying.
	ThorbenDoCrossBow = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap, " Carpenter Torben can show me how to make a wooden crossbow rest. " );
};

DIA_Thorben_MakeUpor (C_Info) instance
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = DIA_Thorben_MakeUpor_condition;
	information = DIA_Thorben_MakeUpor_info;
	permanent = TRUE;
	description = " Teach me how to do crossbow rests. (Price: 1500 coins) " ;
};

func int DIA_Thorben_MakeUpor_condition()
{
	if((ThorbenDoCrossBow == TRUE) && (PlayerTeachCrBowMade == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_MakeUpor_info()
{
	var int cost;
	var int money;

	AI_Output(other,self, " DIA_Thorben_MakeUpor_01_00 " );	// Teach me how to rest my crossbows.
	money = 1500;

	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other, " DIA_Thorben_MakeUpor_03_90 " );	// You don't have enough gold. Come back later.
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= money)
	{
		AI_Output(self,other, " DIA_Thorben_MakeUpor_01_01 " );	// It's very easy! Take a large piece of wood.
		AI_Output(self,other, " DIA_Thorben_MakeUpor_01_02 " );	// Then on the workbench you cut out the shape of the stop and make cuts for the hook and gutter.
		AI_Output(self,other, " DIA_Thorben_MakeUpor_01_03 " );	// Well, and then all the other metal parts of the crossbow are attached to the stop on the anvil in the forge.
		AI_Output(self,other, " DIA_Thorben_MakeUpor_01_04 " );	// Remember?
		AI_Output(other,self, " DIA_Thorben_MakeUpor_01_05 " );	// Of course.
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		PlayerTeachCrBowMade = TRUE;
		B_LogEntry(TOPIC_TagNorGrHunWeap, " Now I can make a wooden stop for a crossbow. " );
	};
};

// ----------------Dracia branch------------------------------ ------------

instance DIA_Addon_Thorben_TalkAboutElza ( C_Info );
{
	npc = VLK_462_Thorben;
	nr = 13;
	condition = DIA_Addon_Thorben_TalkAboutElza_Condition;
	information = DIA_Addon_Thorben_TalkAboutElza_Info;
	permanent = FALSE;
	description = " You're a carpenter, right? " ;
};

func int DIA_Addon_Thorben_TalkAboutElza_Condition();
{
	if((MIS_OldElza == LOG_Running) && (Npc_HasItems(other,ItMi_ShipShceme) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_TalkAboutElza_Info()
{
	AI_Output(other,self, " DIA_Addon_Thorben_TalkAboutElza_01_01 " );	// You're a carpenter, aren't you?
	AI_Output(self,other, " DIA_Addon_Thorben_TalkAboutElza_01_02 " );	// Sort of like. But if things continue to go as badly, you will have to do something more profitable.
	AI_Output(other,self, " DIA_Addon_Thorben_TalkAboutElza_01_03 " );	// Good. I have just one job for you.
	AI_Output(self,other, " DIA_Addon_Thorben_TalkAboutElza_01_04 " );	// New order? Excellent! And what is it?
	AI_Output(other,self, " DIA_Addon_Thorben_TalkAboutElza_01_05 " );	// Here, everything is written here.
	B_GiveInvItems(other,self,ItMi_ShipShceme,1);
	AI_Output(self,other, " DIA_Addon_Thorben_TalkAboutElza_01_06 " );	// Okay, let's take a look.
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Addon_Thorben_TalkAboutElza_01_07 " );	// Hmmm... Looks like parts for steering a ship. Are you building a ship?!
	AI_Output(other,self, " DIA_Addon_Thorben_TalkAboutElza_01_08 " );	// Not yet. But I'm thinking about it. So, are you going to take this job?
	AI_Output(self,other, " DIA_Addon_Thorben_TalkAboutElza_01_09 " );	// Of course. Although it won't be easy. The manufacture of these parts requires special precision and special types of wood. Besides...
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_01_10");	//Сколько? 
	AI_Output(self,other, " DIA_Addon_Thorben_TalkAboutElza_01_11 " );	// Eh... Two thousand gold pieces! Perhaps I would have given you a discount, but in my current position it would be a luxury.
	B_LogEntry(TOPIC_OldElza, " Carpenter Torben took on the job of making parts for the steering of the One-Eyed Elza. However, he paid a tidy sum of two thousand gold for the work. " );
};

instance DIA_Addon_Thorben_TalkAboutElza_Money(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 13;
	condition = DIA_Addon_Thorben_TalkAboutElza_Money_Condition;
	information = DIA_Addon_Thorben_TalkAboutElza_Money_Info;
	permanent = FALSE;
	description = " Here's your money. " ;
};

func int DIA_Addon_Thorben_TalkAboutElza_Money_Condition();
{
	if ((MY_OldElza == LOG_Running) && (Npc_KnowsInfo(hero, DIA_Addon_Thorben_TalkAboutElza) ==  TRUE ) && (Npc_HasItems(other,ItMy_Gold) >=  2000 )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_TalkAboutElza_Money_Info()
{
	AI_Output(other,self, " DIA_Addon_Thorben_TalkAboutElza_Money_01_01 " );	// Here's your money.
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,ItMi_Gold,2000);
	AI_Output(self,other, " DIA_Addon_Thorben_TalkAboutElza_Money_01_02 " );	// Good. Then I get to work immediately.
	AI_Output(other,self, " DIA_Addon_Thorben_TalkAboutElza_Money_01_03 " );	// How long will it take?
	AI_Output(self,other, " DIA_Addon_Thorben_TalkAboutElza_Money_01_04 " );	// No more than a day! So you can visit me tomorrow.
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_Money_01_05");	//Договорились. 
	B_LogEntry(TOPIC_OldElza, " I paid Torben for the work. It will take him at least a day to make all the parts. I hope Skip refunds me. " );
	ThorbenElzaDay = Wld_GetDay();
	ThorbenOnWork = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Thorben_TalkAboutElza_Done (C_Info) .
{
	npc = VLK_462_Thorben;
	nr = 13;
	condition = DIA_Addon_Thorben_TalkAboutElza_Done_Condition;
	information = DIA_Addon_Thorben_TalkAboutElza_Done_Info;
	permanent = FALSE;
	description = " How is my order doing? " ;
};

func int DIA_Addon_Thorben_TalkAboutElza_Done_Condition();
{
	where int daynow;

	daynow = Wld_GetDay();

	if (( MIS_OldElza == LOG_Running ) && ( ThorbenOnWork ==  TRUE ) && ( ThorbenElzaDay < daynow ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_TalkAboutElza_Done_Info()
{
	AI_Output(other,self, " DIA_Addon_Thorben_TalkAboutElza_Done_01_01 " );	// How is my order doing?
	AI_Output(self,other, " DIA_Addon_Thorben_TalkAboutElza_Done_01_02 " );	// Everything is ready. You can take him.
	B_GiveInvItems(self,other,ItMi_SkipShipPack,1);
	AI_Output(other,self, " DIA_Addon_Thorben_TalkAboutElza_Done_01_03 " );	// Благодарю.
	B_LogEntry(TOPIC_OldElza, " Torben made all the parts. Time to take them to Skip. " );
};
