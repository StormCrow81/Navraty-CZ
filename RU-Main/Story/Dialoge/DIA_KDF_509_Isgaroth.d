
be int ice penalty;

instance DIA_Isgaroth_EXIT(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 999;
	condition = DIA_Isgaroth_EXIT_Condition;
	information = DIA_Isgaroth_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Isgaroth_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Isgaroth_EXIT_Info()
{
	AI_Output(self,other, " DIA_Isgaroth_EXIT_01_00 " );	// May Innos always light your path.
	AI_StopProcessInfos(self);
};


instance DIA_Isgaroth_Hello(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 2;
	condition = DIA_Isgaroth_Hello_Condition;
	information = DIA_Isgaroth_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Isgaroth_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Hello_Info()
{
	AI_Output(self,other, " DIA_Isgaroth_Hello_01_00 " );	// May Innos be with you. What can I do for you, wanderer?
};


instance DIA_Isgaroth_Blessing (C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 10;
	condition = DIA_Isgaroth_Segen_Condition;
	information = DIA_Isgaroth_Segen_Info;
	permanent = TRUE;
	description = " Bless me! " ;
};


func int DIA_Isgaroth_Segen_Condition()
{
	return TRUE;
};

func void DIA_Isgaroth_Blessing_Info()
{
	AI_Output(other,self, " DIA_Isgaroth_Segen_15_00 " );	// Bless me!
	AI_Output(self,other, " DIA_Isgaroth_Segen_01_01 " );	// I bless you in the name of Innos. May the fire of the Almighty burn in your heart and give you the strength to live according to his precepts.

	if(MIS_Thorben_GetBlessings == LOG_Running)
	{
		B_LogEntry(TOPIC_Thorben, "The fire mage Ysgaroth has blessed me. " );
	};

	Isgaroth_blessing = TRUE ;
};


instance DIA_Isgaroth_Wolf(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 2;
	condition = DIA_Isgaroth_Wolf_Condition;
	information = DIA_Isgaroth_Wolf_Info;
	permanent = FALSE;
	description = " Sergio sent me. " ;
};


func int DIA_Isgaroth_Wolf_Condition()
{
	if ((MY_MonasteryWorks == LOG_Running) && (Sergio_Sends ==  TRUE ) && (Chapter ==  1 ))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Wolf_Info()
{
	AI_Output(other,self, " DIA_Isgaroth_Wolf_15_00 " );	// Sergio sent me. He entrusted me with his duties. What should be done?
	AI_Output(self,other, " DIA_Isgaroth_Wolf_01_01 " );	// A black wolf has recently appeared here. Find him and kill him.
	MIS_IsgarothWolf = LOG_Running;
	B_LogEntry(Topic_IsgarothWolf, " A black wolf is roaming near the altar. I must find him and kill him. " );
};


instance DIA_Isgaroth_tot (C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 2;
	condition = DIA_Isgaroth_tot_Condition;
	information = DIA_Isgaroth_tot_Info;
	permanent = TRUE;
	description = " I killed the wolf. " ;
};


func int DIA_Isgaroth_tot_Condition()
{
	Wolfi = Hlp_GetNpc(BlackWolf);
	if ((MIS_IsgarothWolf == LOG_Running) && Npc_IsDead(Wolfi))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_tot_Info()
{
	AI_Output(other,self, " DIA_Isgaroth_tot_15_00 " );	// I killed the wolf.
	AI_Output(self,other, " DIA_Isgaroth_tot_01_01 " );	// Good work, novice. You are a courageous person. Now return to the monastery and take up your duties.
	MIS_IsgarothWolf = LOG_SUCCESS;
	B_GivePlayerXP(XP_IsgarothWolf);
	AI_StopProcessInfos(self);
};


instance DIA_Isgaroth_Job(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 4;
	condition = DIA_Isgaroth_Job_Condition;
	information = DIA_Isgaroth_Job_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Isgaroth_Job_Condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Job_Info()
{
	AI_Output(other,self, " DIA_Isgaroth_Job_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Isgaroth_Job_01_01 " );	// I'm a fire mage! Priest of our god Innos.
	AI_Output(self,other, " DIA_Isgaroth_Job_01_02 " );	// This altar is dedicated to HIM, the highest god, the creator of fire and the supreme judge.
	AI_Output(self,other, " DIA_Isgaroth_Job_01_03 " );	// People come to me to pray to Innos and receive a blessing.
	AI_Output(self,other, " DIA_Isgaroth_Job_01_04 " );	// And for a small donation, you can get a lot of useful things from me.
	Log_CreateTopic(Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry(Topic_KlosterTrader, " Master Ysgaroth sells useful magic items in a chapel near the monastery. " );
};


instance DIA_Isgaroth_Trade(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 99;
	condition = DIA_Isgaroth_Trade_Condition;
	information = DIA_Isgaroth_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show me your products. " ;
};


func int DIA_Isgaroth_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Isgaroth_Job))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Isgaroth_Trade_15_00 " );	// Show me your products.
	B_GiveTradeInv(self);
};


instance DIA_Isgaroth_Monastery (C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 3;
	condition = DIA_Isgaroth_Kloster_Condition;
	information = DIA_Isgaroth_Kloster_Info;
	permanent = FALSE;
	description = " Where does this road lead to? " ;
};


func int DIA_Isgaroth_Kloster_Condition()
{
	if((other.guild != GIL_NOV) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Kloster_Info()
{
	AI_Output(other,self, " DIA_Isgaroth_Kloster_15_00 " );	// Where does this road lead?
	AI_Output(self,other, " DIA_Isgaroth_Kloster_01_01 " );	// This road leads to the Fire Mage Monastery. However, only the servants of Innos are allowed to enter it.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Isgaroth_Kloster_01_02 " );	// If you want to become a novice of a monastery, you must bring a sheep and...
		B_Say_Gold(self,other,Summe_Kloster);
		Log_CreateTopic(Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus(Topic_Kloster,LOG_Running);
		B_LogEntry(Topic_Kloster, " To become an acolyte of the Innos monastery, I need a sheep and a thousand gold pieces. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Isgaroth_Kloster_01_03 " );	// Since you have already decided to join another group, you are not allowed to enter.
	};
};


instance DIA_Isgaroth_Vatras(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 3;
	condition = DIA_Isgaroth_Vatras_Condition;
	information = DIA_Isgaroth_Vatras_Info;
	permanent = TRUE;
	description = " I bring a message from Vatras. " ;
};


func int DIA_Isgaroth_Vatras_Condition()
{
	if((MIS_Vatras_Message == LOG_Running) && ((Npc_HasItems(other,ItWr_VatrasMessage) == 1) || (Npc_HasItems(other,ItWr_VatrasMessage_Open) == 1)))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Vatras_Info()
{
	AI_Output(other,self, " DIA_ISgaroth_Vatras_15_00 " );	// I'm carrying a message from Vatras.
	AI_Output(self,other, " DIA_Isgaroth_Vatras_01_01 " );	// What is this message?
	AI_Output(other,self, " DIA_Isgaroth_Vatras_15_02 " );	// This is a letter, here.

	if(Npc_HasItems(other,ItWr_VatrasMessage) == 1)
	{
		if(B_GiveInvItems(other,self,ItWr_VatrasMessage,1))
		{
			Npc_RemoveInvItems(self,ItWr_VatrasMessage,1);
		};

		B_UseFakeScroll();
		AI_Output(self,other, " DIA_Isgaroth_Vatras_01_03 " );	// Okay, you can tell Vatras that I got his message.
		AI_Output(self,other, " DIA_Isgaroth_Vatras_01_04 " );	// Take these potions as a reward for your service, they will surely come in handy for you.
		B_LogEntry(TOPIC_Botschaft, " I delivered the letter to Ysgaroth. We need to report this to Vatras. " );
		CreateInvItems(self,ItPo_Health_02,2);
		B_GiveInvItems(self,other,ItPo_Health_02,2);
		B_GivePlayerXP(XP_Ambient * 2);
	}
	else if(Npc_HasItems(other,ItWr_VatrasMessage_Open) == 1)
	{
		if(B_GiveInvItems(other,self,ItWr_VatrasMessage_Open,1))
		{
			Npc_RemoveInvItems(self,ItWr_VatrasMessage_Open,1);
		};

		B_UseFakeScroll();
		AI_Output(self,other, " DIA_Isgaroth_Vatras_01_05 " );	// Seal is broken. What were you thinking, idiot!
		AI_Output(self,other, " DIA_Isgaroth_Vatras_01_06 " );	// Go tell Watras I got his message.
		B_LogEntry(TOPIC_Botschaft, " I gave the opened letter to Ysgaroth. He was furious! Now I need to report this to Vatras. " );
		AI_StopProcessInfos(self);
	};
	Vatras_Return = TRUE;
};


instance DIA_Isgaroth_PICKPOCKET(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 900;
	condition = DIA_Isgaroth_PICKPOCKET_Condition;
	information = DIA_Isgaroth_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Isgaroth_PICKPOCKET_Condition()
{
	return  C_Robbery ( 48 , 50 );
};

func void DIA_Isgaroth_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Isgaroth_PICKPOCKET);
	Info_AddChoice(DIA_Isgaroth_PICKPOCKET,Dialog_Back,DIA_Isgaroth_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Isgaroth_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Isgaroth_PICKPOCKET_DoIt);
};

func void DIA_Isgaroth_PICKPOCKET_DoIt()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Isgaroth_PICKPOCKET);
};

func void DIA_Isgaroth_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Isgaroth_PICKPOCKET);
};


instance DIA_ISGAROTH_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 1;
	condition = dia_isgaroth_runemagicnotwork_condition;
	information = dia_isgaroth_runemagicnotwork_info;
	permanent = FALSE;
	description = " Your magic runes - do they still work? " ;
};


func int dia_isgaroth_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_isgaroth_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Isgaroth_RuneMagicNotWork_01_00 " );	// Your magic runes - do they still work?
	AI_Output(self,other, " DIA_Isgaroth_RuneMagicNotWork_01_01 " );	// That's just the point, that is not present. And I can't understand the reason why I can't use them!
	AI_Output(other,self, " DIA_Isgaroth_RuneMagicNotWork_01_02 " );	// What about the rest?
	AI_Output(self,other, " DIA_Isgaroth_RuneMagicNotWork_01_03 " );	// Apparently, it affected us all. The other Firebenders also fail to do anything.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " The runestones of the other Fire Mages have also lost their power. " );
	FIREMAGERUNESNOT = TRUE;
};
