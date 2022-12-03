
var int Vatras_SchickeLeuteWeg;
var int Vatras_LaresExit;
var int prayday_vatr;
var int prayday_vatr1;
var int prayday2_vatr;
var int praysum_vatr;

instance DIA_Addon_Vatras_KillerWarning(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_KillerWarning_Condition;
	information = DIA_Addon_Vatras_KillerWarning_Info;
	important = TRUE;
};


func int DIA_Addon_Vatras_KillerWarning_Condition()
{
	if((Kapitel >= 2) && (MadKillerCount >= 5) && (MadKillerCount <= 10) && (VatrasPissedOffForever == FALSE) && Npc_IsInState(self,ZS_Talk) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_KillerWarning_Info()
{
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_00");	//Я слышал про тебя.
	AI_Output(self,other, " DIA_Addon_Vatras_KillerWarning_ADD_05_01 " );	// They say that you are involved in the murder of innocent people.
	AI_Output(self,other, " DIA_Addon_Vatras_KillerWarning_ADD_05_02 " );	// If that's the case, then I should warn you, son.
	AI_Output(self,other, " DIA_Addon_Vatras_KillerWarning_ADD_05_03 " );	// Don't upset the balance of power, otherwise you'll have to face the consequences of your actions.
	AI_Output(self,other, " DIA_Addon_Vatras_KillerWarning_ADD_05_04 " );	// How can I help you?
};


instance DIA_Addon_Vatras_LastWarning (C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_LastWarning_Condition;
	information = DIA_Addon_Vatras_LastWarning_Info;
	important = TRUE;
};


func int DIA_Addon_Vatras_LastWarning_Condition()
{
	if ((Chapter >=  5 ) && (MadKillerCount >  10 ) && (BatrasPissedOffForever ==  FALSE ) && ( CAPTAINNORTHERDIAWAY  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_LastWarning_Info()
{
	B_LastWarningFire();
	AI_Output(self,other, " DIA_Addon_Vatras_LastWarning_ADD_05_06 " );	// What can you say in your defense?
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	Info_AddChoice(DIA_Addon_Vatras_LastWarning, " Отвали! " ,DIA_Addon_Vatras_LastWarning_Arsch);
	Info_AddChoice(DIA_Addon_Vatras_LastWarning, " I'm sorry. I didn't know what I was doing. " ,DIA_Addon_Vatras_LastWarning_Reue);
};

func void DIA_Addon_Vatras_LastWarning_Arsch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00");	//Отвали!
	AI_Output(self,other, " DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00 " );	// I don't hear a trace of repentance in your words.
	AI_Output(self,other, " DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01 " );	// You leave me no choice.
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	B_VatrasPissedOff();
};

func void DIA_Addon_Vatras_LastWarning_Repentance()
{
	AI_Output(other,self, " DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00 " );	// I'm sorry. I didn't understand what I was doing.
	AI_Output(self,other, " DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00 " );	// I will pray for you and ask the gods to restore your sanity.
	AI_Output(self,other, " DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01 " );	// Woe to you if I hear of even one murder in which you had a hand.
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	VatrasMadKillerCount = MadKillerCount;
};


instance DIA_Addon_Vatras_PissedOff(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_PissedOff_Condition;
	information = DIA_Addon_Vatras_PissedOff_Info;
	important = TRUE;
};


func int DIA_Addon_Vatras_PissedOff_Condition()
{
	if ((MadKillerCount > BatrasMadKillerCount) && Npc_KnowsInfo(other,DIA_Addon_Batras_LastWarning) && (Captain >=  5 ) && ( CAPTAINORDERDIAWAY  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_PissedOff_Info()
{
	AI_Output(self,other, " DIA_Addon_Vatras_PissedOff_ADD_05_00 " );	// Your words are as false as your deeds.
	AI_Output(self,other, " DIA_Addon_Vatras_PissedOff_ADD_05_01 " );	// You don't want to stop mindless killing.
	AI_Output(self,other, " DIA_Addon_Vatras_PissedOff_ADD_05_02 " );	// You leave me no choice...
	B_VatrasPissedOff();
};


instance DIA_Vatras_EXIT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 999;
	condition = DIA_Vatras_EXIT_Condition;
	information = DIA_Vatras_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vatras_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Vatras_EXIT_Info()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_HowToJoin) && (Vatras_LaresExit == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_00");	//Подожди!
		if(Vatras_GehZuLares == TRUE)
		{
			AI_Output(self,other, " DIA_Addon_Vatras_LaresExit_05_01 " );	// If you see Lares...
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Vatras_LaresExit_05_02 " );	// I want you to do me a little favor.
			AI_Output(self,other, " DIA_Addon_Vatras_LaresExit_05_03 " );	// Go to port. There you will find a man named Lares.
			Vatras_GehZuLares = TRUE;
		};
		AI_Output(self,other, " DIA_Addon_Vatras_LaresExit_05_04 " );	// Give him this ornament and tell him to return it. He knows what to do.
		CreateInvItems(self,ItMi_Ornament_Addon_Vatras,1);
		B_GiveInvItems(self,other,ItMi_Ornament_Addon_Vatras,1);
		Vatras_LaresExit = TRUE;
	};
	AI_StopProcessInfos(self);

	if (Vatras_SchickeLeuteWeg ==  TRUE )
	{
		B_StartOtherRoutine(VLK_455_Buerger,"VATRASAWAY");
		B_StartOtherRoutine(VLK_454_Buerger,"VATRASAWAY");
		B_StartOtherRoutine(VLK_428_Buergerin,"VATRASAWAY");
		B_StartOtherRoutine(VLK_450_Buerger,"VATRASAWAY");
		B_StartOtherRoutine(VLK_426_Buergerin,"VATRASAWAY");
		if(MIS_NOVICECANJOIN == FALSE)
		{
			B_StartOtherRoutine(VLK_421_Valentino,"VATRASAWAY");
		};
		Vatras_SchickeLeuteWeg = FALSE ;
	};
};

instance DIA_Vatras_PICKPOCKET(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 900;
	condition = DIA_Vatras_PICKPOCKET_Condition;
	information = DIA_Vatras_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Vatras_PICKPOCKET_Condition()
{
	return  C_Robbery ( 91 , 250 );
};

func void DIA_Vatras_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
	Info_AddChoice(DIA_Vatras_PICKPOCKET,Dialog_Back,DIA_Vatras_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Vatras_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Vatras_PICKPOCKET_DoIt);
};

func void DIA_Vatras_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
};

func void DIA_Vatras_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
};


instance DIA_Vatras_GREET(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_GREET_Condition;
	information = DIA_Vatras_GREET_Info;
	important = TRUE;
};


func int DIA_Vatras_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_GREET_Info()
{
	AI_Output(self,other, " DIA_Vatras_GREET_05_00 " );	// May Adanos be with you.
	AI_Output(other,self,"DIA_Vatras_GREET_15_01");	//Кто ты?
	AI_Output(self,other, " DIA_Vatras_GREET_05_02 " );	// I am Vatras, servant of Adanos, guardian of the balance of the divine and earthly.
	AI_Output(self,other, " DIA_Vatras_GREET_05_03 " );	// What can I do for you?
};


instance DIA_Addon_Vatras_Cavalorn (C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Cavalorn_Condition;
	information = DIA_Addon_Vatras_Cavalorn_Info;
	description = " I have a letter for you. " ;
};


func int DIA_Addon_Vatras_Cavalorn_Condition()
{
	if(((Npc_HasItems(other,ItWr_SaturasFirstMessage_Addon_Sealed) >= 1) && (MIS_Addon_Cavalorn_Letter2Vatras == LOG_Running)) || (Npc_HasItems(other,ItWr_SaturasFirstMessage_Addon) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Cavalorn_Info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_Cavalorn_15_00 " );	// I have a letter for you.
	AI_Output(self,other, " DIA_Addon_Vatras_Cavalorn_05_01 " );	// Для меня?
	if(SaturasFirstMessageOpened == FALSE)
	{
		B_GivePlayerXP(XP_Addon_Cavalorn_Letter2Vatras);
		B_GiveInvItems(other,self,ItWr_SaturasFirstMessage_Addon_Sealed,1);
	}
	else
	{
		B_GivePlayerXP(XP_Addon_Cavalorn_Letter2Vatras_Opened);
		B_GiveInvItems(other,self,ItWr_SaturasFirstMessage_Addon,1);
		AI_Output(self,other, " DIA_Addon_Vatras_Cavalorn_05_02 " );	// Yes, but... it's opened. I hope it didn't fall into the wrong hands?
	};
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Addon_Vatras_Cavalorn_05_03 " );	// Yes. This is very important news.
	AI_Output(self,other, " DIA_Addon_Vatras_Cavalorn_05_04 " );	// I wonder how you got this letter?
	Info_ClearChoices(DIA_Addon_Back_Cavalorn);
	Info_AddChoice(DIA_Addon_Vatras_Cavalorn, " I took it from the bandits. " ,DIA_Addon_Vatras_Cavalorn_Bandit);
	if(MIS_Addon_Cavalorn_KillBrago == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Addon_Vatras_Cavalorn, " I got it from Cavalorn the hunter. " ,DIA_Addon_Vatras_Cavalorn_Cavalorn);
	};
	MIS_Addon_Cavalorn_Letter2Vatras = LOG_SUCCESS;
};

func void DIA_Addon_Vatras_Cavalorn_Bandit()
{
	AI_Output(other,self, " DIA_Addon_Vatras_Cavalorn_Bandit_15_00 " );	// I took it from the bandits.
	AI_Output(self,other, " DIA_Addon_Vatras_Cavalorn_Bandit_05_01 " );	// (worried) Oh Adanos! This is bad. This is very bad.
	AI_Output(self,other, " DIA_Addon_Vatras_Cavalorn_Bandit_05_02 " );	// If what you're saying is true, then we have a huge problem.
	AI_Output(self,other, " DIA_Addon_Vatras_Cavalorn_Bandit_05_03 " );	// I have to deal with this as soon as possible.
	Info_ClearChoices(DIA_Addon_Back_Cavalorn);
};

func void DIA_Addon_Vatras_Cavalorn_Cavalorn()
{
	AI_Output(other,self, " DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00 " );	// I got it from Cavalorn the hunter.
	AI_Output(self,other, " DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01 " );	// (with surprise) Cavalorn? And where he?
	AI_Output(other,self, " DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02 " );	// He asked me to tell you that he did not have time and immediately went to the meeting place. Whatever that means.
	AI_Output(self,other, " DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03 " );	// I see you have gained Cavalorn's trust. This speaks in your favor.
	B_GivePlayerXP(XP_Addon_CavalornTrust);
	Info_ClearChoices(DIA_Addon_Back_Cavalorn);
};


var int Vatras_Why;

instance DIA_Addon_Vatras_CavalornSentMe (C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_CavalornSentMe_Condition;
	information = DIA_Addon_Vatras_CavalornSentMe_Info;
	permanent = FALSE;
	description = " Cavalorn sent me to you! " ;
};


func int DIA_Addon_Vatras_CavalornSentMe_Condition()
{
	if ((SC_KnowsRanger ==  TRUE ) && (SC_IsRanger ==  FALSE ) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ring) && (Batras_Why ==  TRUE ) && ( CAPTAINNORDERDIAWAY  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_CavalornSentMe_Info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_Add_15_00 " );	// Cavalorn sent me to you!
	AI_Output(self,other, " DIA_Addon_Vatras_Add_05_01 " );	// And what did he tell you?
	AI_Output(other,self, " DIA_Addon_Vatras_Add_15_02 " );	// He said you were looking for the right people.
	AI_Output(self,other, " DIA_Addon_Vatras_Add_05_03 " );	// (smiles) Yeah... So you want to join us, son?
};

instance DIA_Addon_Vatras_TellMe(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_TellMe_Condition;
	information = DIA_Addon_Vatras_TellMe_Info;
	permanent = TRUE;
	description = " Tell me about the Ring of Water. " ;
};

func int DIA_Addon_Vatras_TellMe_Condition()
{
	if ((SC_KnowsRanger ==  TRUE ) && (SC_IsRanger ==  FALSE ) && (other.guild !=  GIL_NDW ) && (other.guild !=  GIL_KDW ) && ( CAPTAINNORTHERDIAWAY  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_TellMe_Info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_TellMe_15_00 " );	// Tell me about the Ring of Water.

	if(!Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger))
	{
		AI_Output(self,other, " DIA_Addon_Vatras_TellMe_05_01 " );	// And why should I do this?
		Vatras_Why = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Vatras_TellMe_05_02 " );	// Since you're not a member of our community yet, I can't tell you EVERYTHING.
		AI_Output(self,other, " DIA_Addon_Vatras_TellMe_05_03 " );	// But I'll tell you what you can hear.
		Info_ClearChoices(DIA_Addon_Vatras_TellMe);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,Dialog_Back,DIA_Addon_Vatras_TellMe_BACK);
		Info_AddChoice(DIA_Addon_Vatras_TellMe, " What exactly do you do? " ,DIA_Addon_Vatras_TellMe_Philo);
		Info_AddChoice(DIA_Addon_Vatras_TellMe, " Where are the other waterbenders? " ,DIA_Addon_Vatras_TellMe_OtherKdW);
		Info_AddChoice(DIA_Addon_Vatras_TellMe, " Who is a member of the Water Ring? " ,DIA_Addon_Vatras_TellMe_WerNoch);
	};
};

func void DIA_Addon_Vatras_TellMe_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_TellMe);
};

func void DIA_Addon_Vatras_TellMe_Philo()
{
	AI_Output(other,self, " DIA_Addon_Vatras_TellMe_Philo_15_00 " );	// What exactly are you doing?
	AI_Output(self,other, " DIA_Addon_Vatras_TellMe_Philo_05_01 " );	// We stand in the way of the order of Innos and the chaos of Beliar.
	AI_Output(self,other, " DIA_Addon_Vatras_TellMe_Philo_05_02 " );	// If one of the parties prevails, then this will mean either complete chaos or the final loss of freedom.
	AI_Output(self,other, " DIA_Addon_Vatras_TellMe_Philo_05_03 " );	// Therefore, we maintain a balance of two forces. Thanks to us, all living things exist.
	if(MIS_Vatras_FindTheBanditTrader == 0)
	{
		Info_AddChoice(DIA_Addon_Vatras_TellMe, " And what does that mean to me? " ,DIA_Addon_Vatras_TellMe_Konkret);
	};
};

func void DIA_Addon_Vatras_TellMe_Konkret()
{
	AI_Output(other,self, " DIA_Addon_Vatras_TellMe_Konkret_15_00 " );	// And what does this mean for me?
	AI_Output(self,other, " DIA_Addon_Vatras_TellMe_Konkret_05_01 " );	// The fall of the Barrier caused many dangers.
	AI_Output(self,other, " DIA_Addon_Vatras_TellMe_Konkret_05_02 " );	// Bandits are probably the most obvious of them all.
	AI_Output(self,other, " DIA_Addon_Vatras_TellMe_Konkret_05_03 " );	// And it's not just that you can't travel safely anymore...
	AI_Output(self,other, " DIA_Addon_Vatras_TellMe_Konkret_05_04 " );	// There's someone in town helping the bandits!
	AI_Output(self,other, " DIA_Addon_Vatras_TellMe_Add_05_00 " );	// We have learned that the bandits receive regular supplies from an arms dealer in Khorinis.
	AI_Output(self,other, " DIA_Addon_Vatras_TellMe_Konkret_05_05 " );	// Now we are trying our best to prevent this.
	AI_Output(self,other, " DIA_Addon_Vatras_TellMe_Konkret_05_06 " );	// If you know anything about this, let me know.
	MIS_Vatras_FindTheBanditTrader = LOG_Running;
	Vatras_ToMartin = TRUE ;
	Log_CreateTopic(TOPIC_Addon_Bandittrader,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Bandittrader,LOG_Running);
	B_LogEntry(TOPIC_Addon_Bandittrader, " A merchant from Khorinis is supplying bandits with weapons. Vatras wants me to expose him. " );
	B_LogEntry_Quiet(TOPIC_Addon_Bandittrader, " Paladin Quartermaster Martin is also a weapons supplier. I can find him in the harbor where the paladins store their supplies. " );
	B_LogEntry_Quiet(TOPIC_Addon_RingOfWater, " The Ring of Water is dealing with the problem of bandits in Khorinis. " );
};

func void DIA_Addon_Vatras_TellMe_OtherKdW()
{
	AI_Output(other,self, " DIA_Addon_Vatras_TellMe_OtherKdW_15_00 " );	// Where are the rest of the waterbenders?
	AI_Output(self,other, " DIA_Addon_Vatras_TellMe_OtherKdW_05_01 " );	// They explore the buildings of an ancient civilization northeast of Khorinis.
	AI_Output(self,other, " DIA_Addon_Vatras_TellMe_OtherKdW_05_02 " );	// We suspect that these ruins may hide a passage to a part of the island that is not yet marked on the map.
	Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_KDW, " Waterbenders are exploring the ruins of an ancient culture northeast of Khorinis. Perhaps there is a passage to an unexplored part of the island. " );
	Info_AddChoice(DIA_Addon_Vatras_TellMe, " Tell me about it. " ,DIA_Addon_Vatras_TellMe_Unexplored);
};

func void DIA_Addon_Vatras_TellMe_Unexplored()
{
	AI_Output(other,self, " DIA_Addon_Vatras_TellMe_Unexplored_15_00 " );	// Tell me about it.
	AI_Output(self,other, " DIA_Addon_Vatras_TellMe_Unexplored_05_01 " );	// If you wish to join the expedition, I can deliver a letter with you, which you will take to Saturas.
	AI_Output(self,other, " DIA_Addon_Vatras_TellMe_Unexplored_05_02 " );	// You can only go with him if you're one of us.
	AI_Output(other,self, " DIA_Addon_Vatras_TellMe_Unexplored_15_03 " );	// Certainly.
	B_LogEntry(TOPIC_Addon_KDW, " Vatras requires me to join the Ring of Water before allowing me to participate in the expedition. " );
};

func void DIA_Addon_Vatras_TellMe_WerNoch()
{
	AI_Output(other,self, " DIA_Addon_Vatras_TellMe_WerNoch_15_00 " );	// Who is a member of the Water Ring?
	AI_Output(self,other, " DIA_Addon_Vatras_TellMe_WerNoch_05_01 " );	// Until you join our brotherhood, I can't give you the details.
	AI_Output(self,other, " DIA_Addon_Vatras_TellMe_WerNoch_05_02 " );	// But you've probably met them before.
};


instance DIA_Addon_Vatras_WannaBeRanger(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_WannaBeRanger_Condition;
	information = DIA_Addon_Vatras_WannaBeRanger_Info;
	description = " I want to join the Water Rings! " ;
};


func int DIA_Addon_Vatras_WannaBeRanger_Condition()
{
	if((SC_KnowsRanger == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_WannaBeRanger_Info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_WannaBeRanger_15_00 " );	// I want to join the Water Ring Brotherhood!
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ring))
	{
		AI_Output(self,other, " DIA_Addon_Vatras_WannaBeRanger_05_01 " );	// True? So you have already fulfilled the first requirement.
		AI_Output(other,self, " DIA_Addon_Vatras_WannaBeRanger_15_02 " );	// What do you mean by that?
		AI_Output(self,other, " DIA_Addon_Vatras_WannaBeRanger_05_03 " );	// There must be someone among us who trusts you. Otherwise, you would simply not know anything.
	};
	AI_Output(self,other, " DIA_Addon_Vatras_WannaBeRanger_05_04 " );	// But I don't know anything about you...
	AI_Output(other,self, " DIA_Vatras_INFLUENCE_15_04 " );	// What do you want to know?
	AI_Output(self,other, " DIA_Vatras_INFLUENCE_05_05 " );	// Well, you can tell me where you came from and why you came to this city.
	AI_Output(other,self, " DIA_Vatras_INFLUENCE_15_06 " );	// I have an important message for the head of the paladins.
	AI_Output(self,other, " DIA_Vatras_INFLUENCE_05_07 " );	// What's the message?
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, " The dragons have gathered a huge army! " ,DIA_Vatras_INFLUENCE_FIRST_TRUTH);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, " Terrible things are about to happen... " ,DIA_Vatras_INFLUENCE_FIRST_LIE);
};

func void DIA_Vatras_INFLUENCE_FIRST_TRUTH()
{
	AI_Output(other,self, " DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00 " );	// While we're talking, a huge army is gathering, led by dragons. This army intends to conquer our country.
	if(Vatras_First == TRUE)
	{
		AI_Output(self,other, " DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01 " );	// If this is indeed true, the balance of the earth will be disturbed. Who told you this?
	}
	else
	{
		AI_Output(self,other, " DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02 " );	// (thoughtfully) Dragons? You're talking about creatures that until recently were only mentioned in legends. How do you know this?
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, " Oh, I heard about that somewhere... " ,DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, "The mage Xardas told me about this! " ,DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	Vatras_First = TRUE;
};

func void DIA_Vatras_INFLUENCE_FIRST_LIE()
{
	AI_Output(other,self, " DIA_Vatras_INFLUENCE_FIRST_LIE_15_00 " );	// Terrible things are about to happen...
	if(Vatras_First == 2)
	{
		AI_Output(self,other, " DIA_Vatras_INFLUENCE_FIRST_LIE_05_01 " );	// Yeah...(angrily) And who told you that?
	}
	else
	{
		AI_Output(self,other, " DIA_Vatras_INFLUENCE_FIRST_LIE_05_02 " );	// Terrible things, hmmm... (thoughtfully) How do you know that?
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, " Oh, I heard about that somewhere... " ,DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, "The mage Xardas told me about this! " ,DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	Vatras_First = 2;
};

func void DIA_Vatras_INFLUENCE_SECOND_TRUTH()
{
	AI_Output(other,self, " DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00 " );	// The magician Xardas told me about this! He sent me to warn the paladins.
	if(Vatras_Second == TRUE)
	{
		AI_Output(self,other, " DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01 " );	// I know this man as a wise and powerful master of magic. Where did you come from?
	}
	else
	{
		AI_Output(self,other, " DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02 " );	// Necromancer... So he's alive... (thoughtfully) And he sent you? Who are you then?
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, " I'm an adventurer from the south. " ,DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, " I am a former prisoner of Khorinis Colony. " ,DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	Vatras_Second = TRUE;
};

func void DIA_Vatras_INFLUENCE_SECOND_LIE()
{
	AI_Output(other,self, " DIA_Vatras_INFLUENCE_SECOND_LIE_15_00 " );	// Oh, I heard about that somewhere...
	if(Vatras_Second == 2)
	{
		AI_Output(self,other, " DIA_Vatras_INFLUENCE_SECOND_LIE_05_01 " );	// (irritated) Do you even remember where you came from?
	}
	else
	{
		AI_Output(self,other, " DIA_Vatras_INFLUENCE_SECOND_LIE_05_02 " );	// Yeah. And so you made it all this long way. Who are you anyway?
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, " I'm an adventurer from the south. " ,DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, " I am an ex-prisoner. " ,DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	Vatras_Second = 2;
};

func void B_Vatras_INFLUENCE_REPEAT()
{
	AI_Output(self,other, " DIA_Vatras_INFLUENCE_REPEAT_05_01 " );	// Okay, let's recap...
	if(Vatras_Third == TRUE)
	{
		AI_Output(self,other, " DIA_Vatras_INFLUENCE_REPEAT_05_02 " );	// You're an ex-prisoner...
	}
	else
	{
		AI_Output(self,other, " DIA_Vatras_INFLUENCE_REPEAT_05_03 " );	// You're an adventurer from the south...
	};
	if(Vatras_Second == TRUE)
	{
		AI_Output(self,other, " DIA_Vatras_INFLUENCE_REPEAT_05_04 " );	// ...who was told by the necromancer Xardas...
	}
	else
	{
		AI_Output(self,other, " DIA_Vatras_INFLUENCE_REPEAT_05_05 " );	// ...who heard the rumors...
	};
	if(Vatras_First == TRUE)
	{
		AI_Output(self,other, " DIA_Vatras_INFLUENCE_REPEAT_05_06 " );	// ...that dragons have come to conquer the country.
	}
	else
	{
		AI_Output(self,other, " DIA_Vatras_INFLUENCE_REPEAT_05_07 " );	// ...that terrible things are about to happen.
	};
	AI_Output(self,other, " DIA_Vatras_INFLUENCE_REPEAT_05_08 " );	// And you've come to tell the paladins...
	if((Vatras_First == TRUE) && (Vatras_Second == TRUE) && (Vatras_Third == TRUE))
	{
		AI_Output(self,other, " DIA_Vatras_INFLUENCE_REPEAT_05_09 " );	// This all sounds pretty fantastic, but I don't think you're lying to me.
		AI_Output(self,other, " DIA_Vatras_INFLUENCE_REPEAT_05_10 " );	// So I'm forced to assume that your motives are noble.
		AI_Output(self,other, " DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11 " );	// I want to give you a chance to join the Water Ring.
		Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	}
	else
	{
		AI_Output(self,other, " DIA_Vatras_Add_05_00 " );	// I don't think you're telling me everything.
		AI_Output(self,other, " DIA_Vatras_Add_05_01 " );	// If you are afraid that I will tell someone about what you tell me, then let me assure you.
		AI_Output(self,other, " DIA_Vatras_Add_05_02 " );	// I swore to keep all the secrets that people trust me as if they were my own.
		if (Wld_IsTime( 5 , 5 , 20 , 10 ))
		{
			AI_Output(other,self, " DIA_Vatras_Add_15_03 " );	// What about the people standing here?
			AI_Output(self,other, " DIA_Vatras_Add_05_04 " );	// They understand only half of what I PREACH to them. So don't worry.
		};
		AI_Output(self,other, " DIA_Vatras_Add_05_05 " );	// Let's start from the beginning. What is this message?
		Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, " The dragons have gathered a huge army! " ,DIA_Vatras_INFLUENCE_FIRST_TRUTH);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, " Terrible things are about to happen... " ,DIA_Vatras_INFLUENCE_FIRST_LIE);
	};
};

func void DIA_Vatras_INFLUENCE_THIRD_TRUTH()
{
	AI_Output(other,self, " DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00 " );	// I am a former prisoner of the colony of Khorinis.
	Vatras_Third = TRUE;
	B_Vatras_INFLUENCE_REPEAT();
};

func void DIA_Vatras_INFLUENCE_THIRD_LIE()
{
	AI_Output(other,self, " DIA_Vatras_INFLUENCE_THIRD_LIE_15_00 " );	// I'm an adventurer from the south.
	Vatras_Third = FALSE;
	B_Vatras_INFLUENCE_REPEAT();
};


instance DIA_Addon_Vatras_HowToJoin(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_HowToJoin_Condition;
	information = DIA_Addon_Vatras_HowToJoin_Info;
	description = " What should I do? " ;
};


func int DIA_Addon_Vatras_HowToJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_HowToJoin_Info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_HowToJoin_15_00 " );	// What should I do?
	AI_Output(self,other, " DIA_Addon_Vatras_HowToJoin_05_01 " );	// You must understand the responsibility you take on by joining our society.
	AI_Output(self,other, " DIA_Addon_Vatras_HowToJoin_05_02 " );	// We don't accept just anyone.
	AI_Output(self,other, " DIA_Addon_Vatras_HowToJoin_05_03 " );	// If you want to join the society, you must prove that you are ready to act as one of us.
	AI_Output(other,self, " DIA_Addon_Vatras_HowToJoin_15_04 " );	// What does this mean?
	AI_Output(self,other, " DIA_Addon_Vatras_HowToJoin_05_05 " );	// Before a new warrior joins our ranks, he must perform a great deed for the good of the Ring.
	AI_Output(self,other, " DIA_Addon_Vatras_HowToJoin_05_06 " );	// And only after that we decide whether we can entrust him with the great task of maintaining the balance of power on this island.
	Info_ClearChoices(DIA_Addon_Vatras_HowToJoin);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin, " What do I need to do to convince you? " ,DIA_Addon_Vatras_HowToJoin_WhatsGreat);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin, " I freed a lot of people! The barrier is gone. " ,DIA_Addon_Vatras_HowToJoin_FreedMen);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin, " I destroyed the Sleeper. I think that's a pretty great deed. " ,DIA_Addon_Vatras_HowToJoin_Sleeper);
};

func void DIA_Addon_Vatras_HowToJoin_Sleeper()
{
	AI_Output(other,self, " DIA_Addon_Vatras_HowToJoin_Sleeper_15_00 " );	// I destroyed the Sleeper. I think it's a pretty big deal.
	AI_Output(self,other, " DIA_Addon_Vatras_HowToJoin_Sleeper_05_01 " );	// I've heard a lot of incredible stories lately.
	AI_Output(self,other, " DIA_Addon_Vatras_HowToJoin_Sleeper_05_02 " );	// Including the story about the destruction of the beast called the Sleeper.
	AI_Output(self,other, " DIA_Addon_Vatras_HowToJoin_Sleeper_05_03 " );	// I haven't heard of this being done by one person, though there's no lie in your eyes.
	AI_Output(self,other, " DIA_Addon_Vatras_HowToJoin_Sleeper_05_04 " );	// I'm a little embarrassed, but my feelings sometimes play tricks on me.
};

func void DIA_Addon_Vatras_HowToJoin_FreedMen()
{
	AI_Output(other,self, " DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00 " );	// I freed many people! The barrier is no more.
	AI_Output(self,other, " DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01 " );	// Even if it's really your job...
	AI_Output(self,other, " DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02 " );	// A great event in the Valley of Mines caused the release of not only waterbenders, but also many prisoners.
	AI_Output(self,other, " DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03 " );	// Criminals from all over the country are prowling around Khorinis, threatening the local population.
	AI_Output(self,other, " DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04 " );	// The bandits have already taken over vast areas of land outside the city. Now it is almost impossible to leave the city and return back safe and sound.
};

func void DIA_Addon_Vatras_HowToJoin_WhatsGreat()
{
	AI_Output(other,self, " DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00 " );	// And what do I need to do to convince you?
	AI_Output(self,other, " DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01 " );	// Khorinis faced a great mystery.
	AI_Output(self,other, " DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02 " );	// The number of people missing is increasing by the minute.
	AI_Output(self,other, " DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03 " );	// If you can explain to me the reason for their disappearance, you will take your rightful place among us.
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,LogText_Addon_KDWRight);
	B_LogEntry_Quiet(TOPIC_Addon_RingOfWater, " Vatras will only accept me into the Water Ring if I find the missing people. " );

	if(SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
	};

	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_Running;
	SC_HearedAboutMissingPeople = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_04");	//Однако...
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_05");	//Что еще?
	AI_Output(self,other, " DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06 " );	// ...you must deliver a message to the paladins first.
	AI_Output(self,other, " DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07 " );	// This is a matter of paramount importance!
	AI_Output(self,other, " DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08 " );	// Talk to Lord Hagen!
	B_LogEntry(TOPIC_Addon_RingOfWater, " Vatras wants me to give Lord Hagen an important message. " );
	Info_ClearChoices(DIA_Addon_Vatras_HowToJoin);
};


instance DIA_Addon_Vatras_GuildBypass(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_GuildBypass_Condition;
	information = DIA_Addon_Vatras_GuildBypass_Info;
	description = " But Lord Hagen won't see me! " ;
};


func int DIA_Addon_Vatras_GuildBypass_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_HowToJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_GuildBypass_Info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_GuildBypass_15_00 " );	// But Lord Hagen won't accept me!
	AI_Output(self,other, " DIA_Addon_Vatras_GuildBypass_05_01 " );	// No, he will, you can be sure. Provided that you first become a member of an influential society.
	AI_Output(self,other, " DIA_Addon_Vatras_GuildBypass_05_02 " );	// The Ring has its own connections.
	AI_Output(self,other, " DIA_Addon_Vatras_GuildBypass_05_03 " );	// We'll help you get the message across as soon as possible.
	AI_Output(self,other, " DIA_Addon_Vatras_GuildBypass_05_04 " );	// You should talk to Lares, I trust him. He will help you.
	B_LogEntry(TOPIC_Addon_RingOfWater, " In order to meet Lord Hagen, I must join one of Khorinis' powerful communities. " );
	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice(DIA_Addon_Vatras_GuildBypass, " WhichGuild should I join? " ,DIA_Addon_Vatras_GuildBypass_WhichGuild);
};

func void DIA_Addon_Vatras_GuildBypass_BACK()
{
	AI_Output(other,self, " DIA_Addon_Vatras_GuildBypass_BACK_15_00 " );	// Let's do this.
	Vatras_GehZuLares = TRUE;
	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
};

func void DIA_Addon_Vatras_GuildBypass_WhichGuild()
{
	AI_Output(other,self, " DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00 " );	// Which community should I join?
	AI_Output(self,other, " DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01 " );	// There are only three communities that have enough power.
	AI_Output(self,other, " DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02 " );	// Namely - the city militia, the monastery of the Mages of Fire and a detachment of mercenaries on the farm of the landowner Onar.
	AI_Output(self,other, " DIA_Addon_Vatras_GuildBypass_WhichGuild_05_0A " );	// Of course, there are others, but they are not as powerful as these first three. Perhaps you can join them.
	AI_Output(self,other, " DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03 " );	// The choice is yours, my son.
	AI_Output(self,other, " DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04 " );	// Lares will help you make this difficult decision. Talk to him!
	VatrasTellOther = TRUE;
	B_LogEntry(TOPIC_Addon_RingOfWater, " The most prominent communities are the Fire Mages, the city militia, and the mercenaries. There are other guilds, though less powerful than these three. " );
	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice(DIA_Addon_Vatras_GuildBypass, " Let's do that. " ,DIA_Addon_Vatras_GuildBypass_BACK);
};

instance DIA_Addon_Vatras_GuildBypass_Other(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_GuildBypass_Other_condition;
	information = DIA_Addon_Vatras_GuildBypass_Other_info;
	permanent = FALSE;
	description = " What other communities exist besides the most influential ones? " ;
};

func int DIA_Addon_Vatras_GuildBypass_Other_condition()
{
	if((VatrasTellOther == TRUE) && (TELLABOUTOTHERGUILD == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_GuildBypass_Other_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Addon_Vatras_GuildBypass_Other_15_00 " );	// What other communities exist besides the most influential ones?
	AI_Output(self,other, " DIA_Addon_Vatras_GuildBypass_Other_15_01 " );	// Well... first of all, it's us, the Waterbenders! On the island, our representation is not very large, but still our order has a great influence in Khorinis.
	AI_Output(self,other, " DIA_Addon_Vatras_GuildBypass_Other_15_02 " );	// I also heard that former swamps from the Brotherhood of the Sleeper also formed a small guild in this part of the island. You can try to join them.
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_Other_15_03");	//А еще?
	AI_Output(self,other, " DIA_Addon_Vatras_GuildBypass_Other_15_04 " );	// Hmmm. Well, other than that, I don't rule out the possibility of a guild of followers of the Dark God, Beliar! Though I can't tell you much about it.
	AI_Output(self,other, " DIA_Addon_Vatras_GuildBypass_Other_15_05 " );	// I think you'd better ask Xardas about this.
	AI_Output(self,other, " DIA_Addon_Vatras_GuildBypass_Other_15_06 " );	// And so, in general, everything, probably.
	TELLABOUTOTHERGUILD = TRUE;
};

instance DIA_ADDON_VATRAS_GUILDBYPASSKDW(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_guildbypasskdw_condition;
	information = dia_addon_vatras_guildbypasskdw_info;
	description = " Can I join you Waterbenders? " ;
};

func int dia_addon_vatras_guildbypasskdw_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_GuildBypass) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_guildbypasskdw_info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_GuildBypassKDW_15_00 " );	// Can I join you Waterbenders?

	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Addon_Vatras_GuildBypassKDW_15_01 " );	// I'm afraid we won't be able to organize proper training here on the island for those who wish to dedicate themselves to the path of the Waterbender.
		AI_Output(self,other, " DIA_Addon_Vatras_GuildBypassKDW_15_02 " );	// True, under certain circumstances we could, of course, make an exception.
		AI_Output(self,other, " DIA_Addon_Vatras_GuildBypassKDW_15_03 " );	// But few have been given this opportunity. For this honor must, first of all, be earned by your deeds for the glory of Adanos!
		AI_Output(self,other, " DIA_Addon_Vatras_GuildBypassKDW_15_04 " );	// And besides this, the chosen one must be completely free from vows given to other gods.
		AI_Output(self,other, " DIA_Addon_Vatras_GuildBypassKDW_15_05 " );	// Only under these conditions, perhaps you will be able to embark on this path.
		MIS_BECOMEKDW = LOG_Running;
		VATRASSAYABOUTKDW = TRUE;
		Log_CreateTopic(TOPIC_BECOMEKDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_Running);
		B_LogEntry( TOPIC_BECOMEKDW , " If I prove by my deeds that I am worthy of the honor to enter the path of service to Adanos, then perhaps I can later begin my training with the Water magicians. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Vatras_GuildBypassKDW_15_06 " );	// You've already made your choice! So follow the path firmly chosen by you.
	};
};

instance DIA_ADDON_VATRAS_HRAM (C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_HRAM_condition;
	information = DIA_ADDON_VATRAS_HRAM_info;
	permanent = FALSE;
	description = " Do the Water Mages have their own temple? " ;
};

func int DIA_ADDON_VATRAS_HRAM_condition()
{
	if((MIS_BECOMEKDW == LOG_Running) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_HRAM_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_ADDON_VATRAS_HRAM_01_00 " );	// Do the Waterbenders have their own temple?
	AI_Output(self,other, " DIA_ADDON_VATRAS_HRAM_01_01 " );	// Unfortunately not. We carry the word of Adanos only in our sermons.
	AI_Output(self,other,"DIA_ADDON_VATRAS_HRAM_01_02");	//Однако в древние времена строилось множество великолепных храмов и святилищ в его честь! 
	AI_Output(self,other,"DIA_ADDON_VATRAS_HRAM_01_03");	//Останки этих построек можно еще наблюдать во многих уголках нашего мира.
	AI_Output(other,self,"DIA_ADDON_VATRAS_HRAM_01_04");	//А на этом острове?
	AI_Output(self,other,"DIA_ADDON_VATRAS_HRAM_01_05");	//Насколько нам известно, в свое время тут существовала высокоразвитая цивилизация, по всей видимости, поклонявшаяся именно Аданосу.
	AI_Output(self,other,"DIA_ADDON_VATRAS_HRAM_01_06");	//Но ко временам появления здесь поселенцев из Миртаны от нее осталась лишь небольшая часть строений на северо-востоке этого острова.
};

instance DIA_ADDON_VATRAS_HOWBE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_HOWBE_condition;
	information = DIA_ADDON_VATRAS_HOWBE_info;
	permanent = FALSE;
	description = "И как же мне заслужить эту честь?";
};

func int DIA_ADDON_VATRAS_HOWBE_condition()
{
	if((MIS_BECOMEKDW == LOG_Running) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_HOWBE_info()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_HOWBE_01_00");	//И как же мне заслужить эту честь?
	AI_Output(self,other,"DIA_ADDON_VATRAS_HOWBE_01_01");	//Если ты хочешь моего совета, то лучше всего об этом поговорить с Сатурасом.
	AI_Output(other,self,"DIA_ADDON_VATRAS_HOWBE_01_02");	//Сатурас?! Тот самый Сатурас, возглавлявший круг Воды в Долине Рудников?
	AI_Output(self,other,"DIA_ADDON_VATRAS_HOWBE_01_03");	//Он самый. Сейчас он находится с остальными магами Воды на раскопках древних святынь. 
	AI_Output(self,other,"DIA_ADDON_VATRAS_HOWBE_01_04");	//Заслужи его уважение и доверие! И тогда, возможно, он посвятит тебя в послушники нашего круга.
	AI_Output(self,other,"DIA_ADDON_VATRAS_HOWBE_01_05");	//Ну, а после у тебя будет возможность проявить себя, дабы стать уже одним из нас.
	AI_Output(other,self,"DIA_ADDON_VATRAS_HOWBE_01_06");	//Ладно, я все понял.
	B_LogEntry(TOPIC_BECOMEKDW,"Если я хочу начать свое обучение у магов Воды, то первым делом мне стоит поговорить с Сатурасом. Не думаю, что он будет рад меня видеть, учитывая, что я сделал с их рудой в Новом лагере.");
};

instance DIA_ADDON_VATRAS_WATERLINE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_WATERLINE_condition;
	information = DIA_ADDON_VATRAS_WATERLINE_info;
	permanent = FALSE;
	description = "Могу я чем-нибудь помочь?";
};

func int DIA_ADDON_VATRAS_WATERLINE_condition()
{
	if(MIS_BECOMEKDW != FALSE)
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_WATERLINE_info()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_WATERLINE_01_00");	//Могу я чем-нибудь помочь?
	AI_Output(self,other,"DIA_ADDON_VATRAS_WATERLINE_01_01");	//(задумчиво) Возможно. У меня действительно есть несколько дел, которые не терпят отлагательств.
	AI_Output(self,other, " DIA_ADDON_VATRAS_WATERLINE_01_02 " );	// Unfortunately, I can't be out of town for long periods of time, so I could use an assistant.
	Water_Line_Start = TRUE;
};

instance DIA_ADDON_VATRAS_LobartMeal(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_LobartMeal_condition;
	information = DIA_ADDON_VATRAS_LobartMeal_info;
	permanent = FALSE;
	description = " What should I do? " ;
};

func int DIA_ADDON_VATRAS_LobartMeal_condition()
{
	if(Water_Line_Start == TRUE)
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_LobartMeal_info()
{
	AI_Output(other,self, " DIA_ADDON_VATRAS_LobartMeal_01_00 " );	// What should I do?
	AI_Output(self,other, " DIA_ADDON_VATRAS_LobartMeal_01_01 " );	// First, go to Lobart's farm. He must have a batch of food prepared for me.
	AI_Output(self,other, " DIA_ADDON_VATRAS_LobartMeal_01_02 " );	// I will distribute it to the poor and to everyone who needs it now.
	AI_Output(self,other, " DIA_ADDON_VATRAS_LobartMeal_01_03 " );	// Here, take three hundred coins. Give them to Lobart for his package.
	B_GiveInvItems(self,other,ItMi_VatrasPurse,1);
	AI_Output(self,other, " DIA_ADDON_VATRAS_LobartMeal_01_04 " );	// Just don't take this money for yourself. Otherwise, then you can not count on my help!
	AI_Output(other,self, " DIA_ADDON_VATRAS_LobartMeal_01_05 " );	// Yes, of course.
	MIS_LobartMeal = LOG_Running;
	Log_CreateTopic(TOPIC_LobartMeal,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LobartMeal,LOG_Running);
	B_LogEntry(TOPIC_LobartMeal, " Vatras asked me to go to Lobart and collect a shipment of food for the poor and the destitute. " );	
};

instance DIA_ADDON_VATRAS_LobartMeal_Done(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_LobartMeal_Done_condition;
	information = DIA_ADDON_VATRAS_LobartMeal_Done_info;
	permanent = FALSE;
	description = " I brought a package from Lobart. " ;
};

func int DIA_ADDON_VATRAS_LobartMeal_Done_condition()
{
	if ((MIS_LobartMeal == LOG_Running) && (Npc_HasItems(other,ItMi_VatrasPacket) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_LobartMeal_Done_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_ADDON_VATRAS_LobartMeal_Done_01_00 " );	// I brought a package from Lobart.
	AI_Output(self,other, " DIA_ADDON_VATRAS_LobartMeal_Done_01_01 " );	// Excellent, my son! Give it to me.
	AI_Output(other,self,"DIA_ADDON_VATRAS_LobartMeal_Done_01_02");	//Конечно.
	B_GiveInvItems(other,self,ItMi_VatrasPacket,1);
	Npc_RemoveInvItems(self,ItMi_VatrasPacket,1);
	AI_Output(self,other, " DIA_ADDON_VATRAS_LobartMeal_Done_01_03 " );	// Thank you. Now people don't have to starve. At least, at least for a while.
	AI_Output(self,other, " DIA_ADDON_VATRAS_LobartMeal_Done_01_04 " );	// You deserve a small reward for your help.
	AI_Output(self,other, " DIA_ADDON_VATRAS_LobartMeal_Done_01_05 " );	// Here, take these healing elixirs! They will come in handy on your travels.
	B_GiveInvItems(self,other,ItPo_Health_01,3);
	MIS_LobartMeal = LOG_Success;
	Log_SetTopicStatus(TOPIC_LobartMeal,LOG_Success);
	B_LogEntry(TOPIC_LobartMeal, " I brought Watras a food package. " );	
};

instance DIA_ADDON_VATRAS_PureElixir(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_PureElixir_condition;
	information = DIA_ADDON_VATRAS_PureElixir_info;
	permanent = FALSE;
	description = " Anything else? " ;
};

func int DIA_ADDON_VATRAS_PureElixir_condition()
{
	if(MIS_LobartMeal == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_PureElixir_info()
{
	AI_Output(other,self, " DIA_ADDON_VATRAS_PureElixir_01_00 " );	// Anything else?
	AI_Output(self,other, " DIA_ADDON_VATRAS_PureElixir_01_01 " );	// Good thing you asked! I'm just running out of elixirs of pure magical energy.
	AI_Output(self,other, " DIA_ADDON_VATRAS_PureElixir_01_02 " );	// It is necessary that you go to the alchemist Salandril and order him new potions.
	AI_Output(self,other, " DIA_ADDON_VATRAS_PureElixir_01_03 " );	// Take these two hundred coins as an advance for his work.
	B_GiveInvItems(self,other,ItMi_Gold,200);
	AI_Output(self,other, " DIA_ADDON_VATRAS_PureElixir_01_04 " );	// He'll get the rest when he completes my order.
	MIS_VatrasPotion = LOG_Running;
	Log_CreateTopic(TOPIC_VatrasPotion,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_VatrasPotion,LOG_Running);
	B_LogEntry(TOPIC_VatrasPotion, " Vatras is running out of elixirs of pure magical energy. He asked to go to the alchemist Salandril and give him an advance for a new batch of these potions. " );	
};

instance DIA_ADDON_VATRAS_PureElixir_Done(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_PureElixir_Done_condition;
	information = DIA_ADDON_VATRAS_PureElixir_Done_info;
	permanent = FALSE;
	description = " I gave Salandril your order. " ;
};

func int DIA_ADDON_VATRAS_PureElixir_Done_condition()
{
	if((MIS_VatrasPotion == LOG_Running) && (SalandrilPureElixir == TRUE))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_PureElixir_Done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_ADDON_VATRAS_PureElixir_Done_01_00 " );	// I gave Salandril your order.
	AI_Output(other,self, " DIA_ADDON_VATRAS_PureElixir_Done_01_01 " );	// He said that he will send you several dozen new elixirs during this week.
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_Done_01_02");	//Хорошо. Это меня вполне устраивает.
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_Done_01_03");	//Больше ничего он не просил мне передать?
	MIS_VatrasPotion = LOG_Success;
	Log_SetTopicStatus(TOPIC_VatrasPotion,LOG_Success);
	B_LogEntry(TOPIC_VatrasPotion,"Я передал слова Саландрила Ватрасу.");	
	Info_ClearChoices(DIA_ADDON_VATRAS_PureElixir_Done);
	Info_AddChoice(DIA_ADDON_VATRAS_PureElixir_Done,"Нет.",DIA_ADDON_VATRAS_PureElixir_Done_No);

	if(Npc_HasItems(other,ItPo_Mana_Addon_04) >= 2)
	{
		Info_AddChoice(DIA_ADDON_VATRAS_PureElixir_Done,"Да, чуть не забыл...",DIA_ADDON_VATRAS_PureElixir_Done_Yes);
	};
};

func void DIA_ADDON_VATRAS_PureElixir_Done_No()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_PureElixir_Done_No_01_01");	//Нет, больше ничего.
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_Done_No_01_02");	//Хммм. Ладно.
	Info_ClearChoices(DIA_ADDON_VATRAS_PureElixir_Done);
};

func void DIA_ADDON_VATRAS_PureElixir_Done_Yes()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_PureElixir_Done_Yes_01_01");	//Да, чуть не забыл. Еще он просил передать тебе эти два эликсира на случай того, если они у тебя вдруг закончатся.
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_Done_Yes_01_03");	//Я рад, что Саландрил проявил такую заботу о моих потребностях.
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_Done_Yes_01_04");	//Но думаю, что будет лучше, если ты оставишь их себе, сын мой.
	VatrasPotionTruth = TRUE;
	Info_ClearChoices(DIA_ADDON_VATRAS_PureElixir_Done);
};

instance DIA_ADDON_VATRAS_ShadowBeast(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_ShadowBeast_condition;
	information = DIA_ADDON_VATRAS_ShadowBeast_info;
	permanent = FALSE;
	description = " Why do you need so many mana elixirs? " ;
};

func int DIA_ADDON_VATRAS_ShadowBeast_condition()
{
	if(MIS_VatrasPotion == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_ShadowBeast_info()
{
	AI_Output(other,self, " DIA_ADDON_VATRAS_ShadowBeast_01_00 " );	// Why do you need so many mana elixirs?

	if(VatrasPotionTruth == TRUE)
	{
		AI_Output(self,other, " DIA_ADDON_VATRAS_ShadowBeast_01_01 " );	// The fact is that almost every day I have to help the wounded and sick people.
		AI_Output(self,other, " DIA_ADDON_VATRAS_ShadowBeast_01_02 " );	// And all this, as you understand, requires a lot of magical energy!
		AI_Output(self,other, " DIA_ADDON_VATRAS_ShadowBeast_01_03 " );	// It even happens that some ailments cannot be cured using only healing elixirs.
		AI_Output(self,other, " DIA_ADDON_VATRAS_ShadowBeast_01_04 " );	// And then the magic of Adanos comes to my aid, sometimes able to work miracles!
		AI_Output(self,other, " DIA_ADDON_VATRAS_ShadowBeast_01_05 " );	// Just yesterday, a man came to me...
		AI_Output(self,other, " DIA_ADDON_VATRAS_ShadowBeast_01_06 " );	// Some evil creature bit him so hard that he could barely stand on his feet!
		AI_Output(self,other, " DIA_ADDON_VATRAS_ShadowBeast_01_07 " );	// I had to use my magical arts to save his life.
		AI_Output(self,other, " DIA_ADDON_VATRAS_ShadowBeast_01_08 " );	// And after such cases, I feel completely empty.
		AI_Output(self,other, " DIA_ADDON_VATRAS_ShadowBeast_01_09 " );	// However, mana elixirs help me regain my strength.
		AI_Output(other,self, " DIA_ADDON_VATRAS_ShadowBeast_01_10 " );	// Got it. And what kind of creature bit this poor fellow like that?
		AI_Output(self,other, " DIA_ADDON_VATRAS_ShadowBeast_01_12 " );	// According to that person, it was a huge obscurantist! It seems he attacked him near the lighthouse.
		AI_Output(self,other, " DIA_ADDON_VATRAS_ShadowBeast_01_13 " );	// It would be better if someone took care of this beast before he did more trouble.
		AI_Output(other,self, " DIA_ADDON_VATRAS_ShadowBeast_01_14 " );	// Well, maybe there is such a daredevil.
		MIS_VatrasBeast = LOG_Running;
		Log_CreateTopic(TOPIC_VatrasBeast,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_VatrasBeast,LOG_Running);
		) ;	 _ _ _
	}
	else
	{
		AI_Output(self,other, " DIA_ADDON_VATRAS_ShadowBeast_01_15 " );	// You don't have to worry about that, my son.
		AI_Output(other,self, " DIA_ADDON_VATRAS_ShadowBeast_01_16 " );	// Hmmm... okay.
	};
};

instance DIA_ADDON_VATRAS_ShadowBeast_Done(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_ShadowBeast_Done_condition;
	information = DIA_ADDON_VATRAS_ShadowBeast_Done_info;
	permanent = FALSE;
	description = " The darkness is over. " ;
};

func int DIA_ADDON_VATRAS_ShadowBeast_Done_condition()
{
	if((MIS_VatrasBeast == LOG_Running) && (Npc_IsDead(Shadowbeast_Vatras) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_ShadowBeast_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_ADDON_VATRAS_ShadowBeast_Done_01_00 " );	// Darkness is over! I killed that beast.
	AI_Output(self,other, " DIA_ADDON_VATRAS_ShadowBeast_Done_01_01 " );	// You did the right thing, my son. Even though I didn't ask you to.
	AI_Output(self,other, " DIA_ADDON_VATRAS_ShadowBeast_Done_01_02 " );	// That's why you deserve a special reward.
	AI_Output(self,other, " DIA_ADDON_VATRAS_ShadowBeast_Done_01_03 " );	// Here, take this scroll as my recognition of your noble deeds.
	B_GiveInvItems(self,other,ItSc_Thunderstorm,1);
	AI_Output(other,self, " DIA_ADDON_VATRAS_ShadowBeast_Done_01_04 " );	// Thank you, father!
	MIS_VatrasBeast = LOG_Success;
	Log_SetTopicStatus(TOPIC_VatrasBeast,LOG_Success);
	B_LogEntry(TOPIC_VatrasBeast, " Vatras was pleased to hear that the beast was finished and thanked me generously. " );	
};

instance DIA_ADDON_VATRAS_MagicBook(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_MagicBook_condition;
	information = DIA_ADDON_VATRAS_MagicBook_info;
	permanent = FALSE;
	description = " Are there more errands for me? " ;
};

func int DIA_ADDON_VATRAS_MagicBook_condition()
{
	if ((MIS_VatrasPotion == LOG_Success) && (Npc_IsDead(VLK_447_Cassia) ==  FALSE ) && (Npc_IsDead(VLK_445_Ramirez) ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_MagicBook_info()
{
	AI_Output(other,self, " DIA_ADDON_VATRAS_MagicBook_01_00 " );	// Will there be more errands for me?
	AI_Output(self,other, " DIA_ADDON_VATRAS_MagicBook_01_01 " );	// (thoughtfully) I don't even know. I'm not sure if you should be assigned this case.
	AI_Output(other,self, " DIA_ADDON_VATRAS_MagicBook_01_02 " );	// What's the problem?
	AI_Output(self,other, " DIA_ADDON_VATRAS_MagicBook_01_03 " );	// Well, okay. Recently I was robbed by some vile thieves!
	AI_Output(self,other, " DIA_ADDON_VATRAS_MagicBook_01_04 " );	// The fact that they stole almost every piece of gold they could find in the house is of little concern to me.
	AI_Output(self,other, " DIA_ADDON_VATRAS_MagicBook_01_05 " );	// But, on top of everything else, they also took with them my diary, where I wrote down the magical formulas for making runes.
	AI_Output(self,other, " DIA_ADDON_VATRAS_MagicBook_01_06 " );	// This thing was very valuable to me. And I, of course, would like to return it back.
	AI_Output(self,other, " DIA_ADDON_VATRAS_MagicBook_01_08 " );	// I've already called on Lord Andre for help, but his men haven't been able to track down the thief.
	AI_Output(other,self, " DIA_ADDON_VATRAS_MagicBook_01_09 " );	// You think if they couldn't do it, then I can't do it either?
	AI_Output(self,other, " DIA_ADDON_VATRAS_MagicBook_01_10 " );	// You can try, my son. Although it seems to me that all this is useless.
	MIS_VatrasMagicBook = LOG_Running;
	Log_CreateTopic(TOPIC_VatrasMagicBook,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_VatrasMagicBook,LOG_Running);
	B_LogEntry(TOPIC_VatrasMagicBook, " Unknown thieves robbed the house of Vatras. In addition to gold, which was of little interest to the magician, they stole his diary, where he wrote down his magic formulas. We should help the old man! " );	
};

instance DIA_ADDON_VATRAS_MagicBook_Done(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_MagicBook_Done_condition;
	information = DIA_ADDON_VATRAS_MagicBook_Done_info;
	permanent = FALSE;
	description = " I found your diary. " ;
};

func int DIA_ADDON_VATRAS_MagicBook_Done_condition()
{
	if((MIS_VatrasMagicBook == LOG_Running) && (Npc_HasItems(other,ItWr_VatrasDiary) >= 1))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_MagicBook_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_ADDON_VATRAS_MagicBook_Done_01_00 " );	// I found your diary.
	B_GiveInvItems(other,self,ItWr_VatrasDiary,1);
	Npc_RemoveInvItems(self,ItWr_VatrasDiary,1);
	AI_Output(self,other, " DIA_ADDON_VATRAS_MagicBook_Done_01_01 " );	// Thank you, my son. I hope that you are not too burdened by these searches?
	AI_Output(other,self, " DIA_ADDON_VATRAS_MagicBook_Done_01_02 " );	// No, everything is fine.
	AI_Output(self,other, " DIA_ADDON_VATRAS_MagicBook_Done_01_03 " );	// Then here - take these magical scrolls as a reward for your efforts.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItSc_IceCube,1);
	CreateInvItems(other,ITSC_SUMSHOAL,2);
	AI_Output(other,self,"DIA_ADDON_VATRAS_MagicBook_Done_01_04");	//Спасибо.
	MIS_VatrasMagicBook = LOG_Success;
	Log_SetTopicStatus(TOPIC_VatrasMagicBook,LOG_Success);
	B_LogEntry(TOPIC_VatrasMagicBook, " I returned the diary to Vatras. " );	
};

instance DIA_ADDON_VATRAS_MagicBook_Fail(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_MagicBook_Fail_condition;
	information = DIA_ADDON_VATRAS_MagicBook_Fail_info;
	permanent = FALSE;
	description = " I'm afraid I couldn't find your diary. " ;
};

func int DIA_ADDON_VATRAS_MagicBook_Fail_condition()
{
	if((MIS_VatrasMagicBook == LOG_Running) && (MagicBookCantFind == TRUE))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_MagicBook_Fail_info()
{
	AI_Output(other,self, " DIA_ADDON_VATRAS_MagicBook_Fail_01_00 " );	// I'm afraid I couldn't find your diary.
	AI_Output(self,other, " DIA_ADDON_VATRAS_MagicBook_Fail_01_02 " );	// It's okay, my son. At least you tried.
	AI_Output(self,other, " DIA_ADDON_VATRAS_MagicBook_Fail_01_03 " );	// And this is already worth something.
	MIS_VatrasMagicBook = LOG_Success;
	Log_SetTopicStatus(TOPIC_VatrasMagicBook,LOG_Success);
	B_LogEntry(TOPIC_VatrasMagicBook, " I told Vatras that I couldn't find his journal. " );	
};

instance DIA_ADDON_VATRAS_LeeLetter(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_LeeLetter_condition;
	information = DIA_ADDON_VATRAS_LeeLetter_info;
	permanent = FALSE;
	description = " Do you have any more tasks for me? " ;
};

func int DIA_ADDON_VATRAS_LeeLetter_condition()
{
	if((MIS_VatrasPotion == LOG_Success) && (Kapitel >= 2))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_LeeLetter_info()
{
	AI_Output(other,self, " DIA_ADDON_VATRAS_LeeLetter_01_00 " );	// Do you have any more tasks for me?
	AI_Output(self,other, " DIA_ADDON_VATRAS_LeeLetter_01_01 " );	// I need you to take this letter to the leader of the mercenaries, General Lee.
	B_GiveInvItems(self,other,ItWr_VatrasLee,1);
	AI_Output(self,other, " DIA_ADDON_VATRAS_LeeLetter_01_02 " );	// This is very important! So you better hurry up.
	AI_Output(other,self, " DIA_ADDON_VATRAS_LeeLetter_01_03 " );	// I'll do everything.
	MIS_LeeLetter = LOG_Running;
	Log_CreateTopic(TOPIC_LeeLetter,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LeeLetter,LOG_Running);
	B_LogEntry(TOPIC_LeeLetter, " Vatras asked me to take the letter he wrote to General Lee, and do it as soon as possible. " );	
};

instance DIA_ADDON_VATRAS_LeeLetterDone(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_LeeLetterDone_condition;
	information = DIA_ADDON_VATRAS_LeeLetterDone_info;
	permanent = FALSE;
	description = " I delivered your letter. " ;
};

func int DIA_ADDON_VATRAS_LeeLetterDone_condition()
{
	if(MIS_LeeLetter == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_LeeLetterDone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_ADDON_VATRAS_LeeLetterDone_01_00 " );	// I delivered your letter.
	AI_Output(self,other, " DIA_ADDON_VATRAS_LeeLetterDone_01_01 " );	// Good. I hope there were no difficulties with this?
	AI_Output(other,self, " DIA_ADDON_VATRAS_LeeLetterDone_01_02 " );	// No, none.
	AI_Output(self,other, " DIA_ADDON_VATRAS_LeeLetterDone_01_03 " );	// I'm glad! Here, take this gold for your labors.
	B_GiveInvItems(self,other,ItMi_Gold,200);
};

instance DIA_Addon_Vatras_NowRanger(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_NowRanger_Condition;
	information = DIA_Addon_Vatras_NowRanger_Info;
	permanent = TRUE;
	description = " I'm ready to enter the 'Ring of Water'! " ;
};

func int DIA_Addon_Vatras_NowRanger_Condition()
{
	if ((SC_IsRanger ==  FALSE ) && (MY_Addon_Nefarius_BringMissingOrnaments ==  LOG_SUCCESS ) && (other.guild !=  GIL_NDW ) && (other.guild !=  GIL_KDW ) && ( CAPTAINNORTHERDIAWAY  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_NowRanger_Info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_NowRanger_15_00 " );	// I'm ready to join the 'Ring of Water' society!
	AI_Output(self,other, " DIA_Addon_Vatras_NowRanger_05_01 " );	// So you delivered a message to Lord Hagen?
	if (Chapter >=  1 )
	{
		if (( MY_OLDWORLD  !=  LOG_SUCCESS ) && (Chapter >=  2 )) ;
		{
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_02");	//Да.
			AI_Output(other,self, " DIA_Addon_Vatras_NowRanger_15_03 " );	// But he sent me to the Valley of Mines to get proof of my words!
			AI_Output(self,other, " DIA_Addon_Vatras_NowRanger_05_04 " );	// You decide what to do next.
			AI_Output(self,other, " DIA_Addon_Vatras_NowRanger_05_05 " );	// It was important to me that he received the message. Now it's up to him to decide whether to act on his own or wait for your evidence.
			AI_Output(self,other, " DIA_Addon_Vatras_NowRanger_05_06 " );	// If you're interested...
		}
		else if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS)
		{
			AI_Output(other,self, " DIA_Addon_Vatras_NowRanger_15_15 " );	// No, not yet.
			AI_Output(other,self, " DIA_Addon_Vatras_NowRanger_05_18 " );	// But I found the missing parts of the ornament to activate the portal.
			AI_Output(self,other, " DIA_Addon_Vatras_NowRanger_05_17 " );	// Yes... (approvingly) That deserves respect! But there is one more unfinished business.
			AI_Output(self,other, " DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08 " );	// Talk to Lord Hagen!
			AI_Output(self,other, " DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07 " );	// This is a matter of paramount importance!
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_07");	//Хорошо.
		};
		AI_Output(self,other, " DIA_Addon_Vatras_NowRanger_05_08 " );	// You proved that we need you. You will become one of us and serve for the good of Adanos.
		AI_Output(self,other, " DIA_Addon_Vatras_NowRanger_05_09 " );	// I give you this ring. May it help you find your brothers and with them keep the balance of power in this world.
		CreateInvItems(self,ItRi_Ranger_Addon,1);
		B_GiveInvItems(self,other,ItRi_Ranger_Addon,1);
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other, " DIA_Addon_Vatras_NowRanger_05_10 " );	// You are the first firebender among us. I am very happy with this fact.
		};
		AI_Output(self,other, " DIA_Addon_Vatras_NowRanger_05_11 " );	// May Adanos keep you. Now go and meet your brothers.
		AI_Output(self,other, " DIA_Addon_Vatras_NowRanger_05_12 " );	// They'll be waiting for you at the Dead Harpy Tavern. The brothers are ready to accept you into our society.
		AI_Output(self,other, " DIA_Addon_Vatras_NowRanger_05_13 " );	// You probably know this tavern. It is located on the way to Onar's farm.
		AI_Output(self,other, " DIA_Addon_Vatras_NowRanger_05_14 " );	// Don't forget to put on the ring so that the brothers recognize you.
		B_LogEntry(TOPIC_Addon_RingOfWater, " I have become a member of the Ring of Water. My new brothers are waiting for me at the Dead Harpy Tavern. " );
		SC_IsRanger = TRUE;
		Lares_CanBringScToPlaces = TRUE;
		MIS_Addon_Lares_ComeToRangerMeeting = LOG_Running;
		B_GivePlayerXP(XP_Addon_SC_IsRanger);
	};
};


instance DIA_Addon_Vatras_CloseMeeting(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_CloseMeeting_Condition;
	information = DIA_Addon_Vatras_CloseMeeting_Info;
	description = " The Brothers of the Ring have sent me to you. " ;
};

func int DIA_Addon_Vatras_CloseMeeting_Condition()
{
	if((Lares_TakeFirstMissionFromVatras == TRUE) && (CAPITANORDERDIAWAY == FALSE) && !Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_CloseMeeting_Info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_CloseMeeting_15_00 " );	// The Brothers of the Ring have sent me to you.
	AI_Output(self,other, " DIA_Addon_Vatras_CloseMeeting_05_01 " );	// Good! I was waiting for you!
	AI_Output(self,other, " DIA_Addon_Vatras_NowRanger_05_01 " );	// So you delivered a message to Lord Hagen?

	if (Chapter >=  2 )
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_02");	//Да.
		AI_Output(self,other, " DIA_Addon_Vatras_CloseMeeting_05_02 " );	// I'll send you through the portal to join the rest of the Waterbenders.
		AI_Output(self,other, " DIA_Addon_Vatras_CloseMeeting_05_03 " );	// You must track down the former ore baron Raven and find out why he is kidnapping the inhabitants of the city.
		AI_Output(self,other, " DIA_Addon_Vatras_CloseMeeting_05_04 " );	// And we'll stay here and try to deal with the bandits.

		if(VatrasGiveLetterSaturas == FALSE)
		{
			AI_Output(self,other, " DIA_Addon_Vatras_CloseMeeting_05_05 " );	// Give this letter to Saturas. From now on, he will give you tasks.

			if(MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS)
			{
				AI_Output(self,other, " DIA_Addon_Vatras_CloseMeeting_05_08 " );	// Lares will help you get to him if he hasn't already handed over the ornament himself.
			};

			CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven,1);
			B_GiveInvItems(self,other,ItWr_Vatras2Saturas_FindRaven,1);
			VatrasGiveLetterSaturas = TRUE;
		};

		AI_Output(self,other, " DIA_Addon_Vatras_CloseMeeting_05_06 " );	// May Adanos be with you!
		; _ _ _ _
		Log_CreateTopic(TOPIC_Addon_Sklaven,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Sklaven,LOG_Running);
		B_LogEntry_Quiet(TOPIC_Addon_Sklaven, " I have to find out why Raven took Khorinis captive. " );
		RangerMeetingRunning = LOG_SUCCESS;
		B_SchlussMitRangerMeeting();
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Vatras_NowRanger_15_15 " );	// No, not yet.
		AI_Output(self,other, " DIA_Addon_Vatras_NowRanger_05_16 " );	// In that case, hurry up. Go to him. This message is very important!
		RangerMeetingRunning = LOG_SUCCESS;
		B_SchlussMitRangerMeeting();
	};
};

instance DIA_ADDON_VATRAS_CANGOPORTAL(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_cangoportal_condition;
	information = dia_addon_vatras_cangoportal_info;
	permanent = FALSE;
	description = " Saturas is waiting for a message from you. " ;
};

func int dia_addon_vatras_cangoportal_condition()
{
	if((SATURASWAITSVATRASMESSAGE == TRUE) && (CANGOTOPORTAL == FALSE) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) && !Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_cangoportal_info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_CanGoPortal_15_00 " );	// Saturas is waiting for a message from you so he can travel through the portal.
	AI_Output(self,other, " DIA_Addon_Vatras_CanGoPortal_15_01 " );	// Oh yeah, I completely forgot. I will write him a letter right now. And you will take it to Saturas.
	AI_Output(self,other, " DIA_Addon_Vatras_CanGoPortal_15_02 " );	// But first, answer me one question.
	AI_Output(self,other, " DIA_Addon_Vatras_CanGoPortal_15_04 " );	// Did you deliver a message to Lord Hagen?

	if (Chapter >=  2 )
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_02");	//Да.

		if(MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output(other,self, " DIA_Addon_Vatras_NowRanger_15_03 " );	// But he sent me to the Valley of Mines to get proof of my words!
			AI_Output(self,other, " DIA_Addon_Vatras_NowRanger_05_04 " );	// You decide what to do next.
			AI_Output(self,other, " DIA_Addon_Vatras_NowRanger_05_05 " );	// It was important to me that he received the message. Now it's up to him to decide whether to act on his own or wait for your evidence.
			AI_Output(self,other, " DIA_Addon_Vatras_NowRanger_05_06 " );	// As for you...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_07");	//Хорошо.
		};

		AI_Output(self,other, " DIA_Addon_Vatras_CloseMeeting_05_02 " );	// I'll send you through the portal to join the rest of the Waterbenders.
		AI_Output(self,other, " DIA_Addon_Vatras_CloseMeeting_05_03 " );	// You must track down the former ore baron Raven and find out why he is kidnapping the inhabitants of the city.
		AI_Output(self,other, " DIA_Addon_Vatras_CloseMeeting_05_04 " );	// And we'll stay here and try to deal with the bandits.

		if(VatrasGiveLetterSaturas == FALSE)
		{
			AI_Output(self,other, " DIA_Addon_Vatras_CloseMeeting_05_05 " );	// Give this letter to Saturas. From now on, he will give you tasks.
			CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven,1);
			B_GiveInvItems(self,other,ItWr_Vatras2Saturas_FindRaven,1);
			VatrasGiveLetterSaturas = TRUE;
		};

		if (( SC_IsRanger ==  FALSE ) && ( hero . guild ==  GIL_NDW ))
		{
			AI_Output(self,other, " DIA_Addon_Vatras_CanGoPortal_15_05 " );	// And one more thing. Since you are our acolyte, you do not need to join our secret society, the 'Ring of Water'.
			AI_Output(self,other, " DIA_Addon_Vatras_CanGoPortal_15_06 " );	// However, in order for our brothers in the ring to trust you, please accept this item as their identification.
			CreateInvItems(self,ItRi_Ranger_Addon,1);
			B_GiveInvItems(self,other,ItRi_Ranger_Addon,1);
		};

		AI_Output(self,other, " DIA_Addon_Vatras_CanGoPortal_15_07 " );	// Now everything. Go to Saturas!
		AI_Output(self,other, " DIA_Addon_Vatras_CloseMeeting_05_06 " );	// May Adanos be with you!
		Log_CreateTopic(TOPIC_Addon_Sklaven,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Sklaven,LOG_Running);
		B_GivePlayerXP(100);
		B_LogEntry(TOPIC_Addon_Sklaven, " I need to find out why Raven took the people of Khorinis captive. " );
		B_LogEntry_Quiet(TOPIC_Addon_KDW, " Vatras sends me with a letter to Saturas. I must now go through the portal with the other waterbenders and follow in the footsteps of Ore Baron Raven. " );
		RangerMeetingRunning = LOG_SUCCESS;
		B_SchlussMitRangerMeeting();
		CANGOTOPORTAL = TRUE ;
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Vatras_NowRanger_15_15 " );	// No, not yet.
		AI_Output(self,other, " DIA_Addon_Vatras_NowRanger_05_16 " );	// In that case, hurry up. Go to him. This message is very important!
		VATRASSENDHAGEN = TRUE;

		if((Lares_TakeFirstMissionFromVatras == TRUE) || (SC_IsRanger == TRUE) || (hero.guild == GIL_NDW))
		{
			RangerMeetingRunning = LOG_SUCCESS;
			B_SchlussMitRangerMeeting();
		};
	};
};


instance DIA_ADD_BACKGROUND_CHANGEPORTAL (C_Info) .
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = dia_addon_vatras_cangoportaltwo_condition;
	information = dia_addon_vatras_cangoportaltwo_info;
	permanent = FALSE;
	description = " I delivered a message to Lord Hagen. " ;
};

func int dia_addon_vatras_cangoportaltwo_condition()
{
	if ((Chapter >=  2 ) && ( CANGOTOPORTAL  ==  FALSE ) && (MY_Addon_Vatras_WhereAreMissingPeople ==  LOG_SUCCESS ) && (MY_Addon_Nefarius_BringMissingOrnaments ==  LOG_SUCCESS )) ;
	{
		return TRUE;
	};
};

func void dia_addon_vatras_cangoportaltwo_info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_CanGoPortalTwo_15_00 " );	// I relayed a message to Lord Hagen.
	AI_Output(self,other, " DIA_Addon_Vatras_CloseMeeting_05_01 " );	// Good! I was waiting for you!
	AI_Output(self,other, " DIA_Addon_Vatras_CloseMeeting_05_02 " );	// I'll send you through the portal to join the rest of the Waterbenders.
	AI_Output(self,other, " DIA_Addon_Vatras_CloseMeeting_05_03 " );	// You will follow in the footsteps of the former ore baron Raven and find out why he stole the citizens of Khorinis.
	AI_Output(self,other, " DIA_Addon_Vatras_CloseMeeting_05_04 " );	// And we'll stay here and try to deal with the bandits.

	if(VatrasGiveLetterSaturas == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Vatras_CloseMeeting_05_05 " );	// Take this letter to Saturas. From now on, he will guide your actions.
		CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven,1);
		B_GiveInvItems(self,other,ItWr_Vatras2Saturas_FindRaven,1);
		VatrasGiveLetterSaturas = TRUE;
	};

	if (( SC_IsRanger ==  FALSE ) && ( hero . guild ==  GIL_NDW ))
	{
		AI_Output(self,other, " DIA_Addon_Vatras_CanGoPortal_15_05 " );	// And one more thing. Since you are our acolyte, there is no need for you to join our secret society, the Ring of Water.
		AI_Output(self,other, " DIA_Addon_Vatras_CanGoPortal_15_06 " );	// However, in order for our brothers in the ring to trust you, please accept this item as their identification.
		CreateInvItems(self,ItRi_Ranger_Addon,1);
		B_GiveInvItems(self,other,ItRi_Ranger_Addon,1);
	};
	AI_Output(self,other, " DIA_Addon_Vatras_CanGoPortalTwo_15_03 " );	// Now everything. Go to Saturas!
	AI_Output(self,other, " DIA_Addon_Vatras_CloseMeeting_05_06 " );	// And let Adanos guide you.
	Log_CreateTopic(TOPIC_Addon_Sklaven,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven,LOG_Running);
	B_GivePlayerXP(100);
	B_LogEntry_Quiet(TOPIC_Addon_Sklaven, " I have to find out why Raven took Khorinis captive. " );
	; _ _ _ _
	CANGOTOPORTAL = TRUE ;

	if((Lares_TakeFirstMissionFromVatras == TRUE) || (SC_IsRanger == TRUE) || (hero.guild == GIL_NDW))
	{
		RangerMeetingRunning = LOG_SUCCESS;
		B_SchlussMitRangerMeeting();
	};
};



var int missingpeopleinfo[ 20 ];

instance DIA_Addon_Vatras_MissingPeople(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_MissingPeople_Condition;
	information = DIA_Addon_Vatras_MissingPeople_Info;
	permanent = TRUE;
	description = " About the missing people... " ;
};


func int DIA_Addon_Vatras_MissingPeople_Condition()
{
	if((MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Addon_Vatras_MissingPeople_Wo_NoPerm;

func void DIA_Addon_Vatras_MissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_MissingPeople_15_00 " );	// As for the missing people...
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_05_01");	//Да?
	Info_ClearChoices(DIA_Addon_Vatras_MissingPeople);
	Info_AddChoice(DIA_Addon_Vatras_MissingPeople,Dialog_Back,DIA_Addon_Vatras_MissingPeople_BACK);
	if(SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople, " I know where the missing people are. " ,DIA_Addon_Vatras_MissingPeople_Success);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople, " Let me tell you what I know... " ,DIA_Addon_Vatras_MissingPeople_Report);
	};
	if (DIA_Addon_Back_MissingPeople_You_NoPerm ==  FALSE )
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople, " Where can I find them? " ,DIA_Addon_Vatras_MissingPeople_Wo);
	};
};

func void DIA_Addon_Vatras_MissingPeople_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_MissingPeople);
};

func void DIA_Addon_Vatras_MissingPeople_Wo()
{
	AI_Output(other,self, " DIA_Addon_Vatras_HintMissingPeople_Wo_15_00 " );	// Where can I find them?
	AI_Output(self,other, " DIA_Addon_Vatras_HintMissingPeople_Wo_05_01 " );	// Most of the people disappeared at the harbor. You should start your search there.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople, " Most of the people disappeared around the port. It's best to start looking there. " );
	DIA_Addon_Vatras_MissingPeople_Wo_NoPerm = TRUE;
};

func void DIA_Addon_Vatras_MissingPeople_Report()
{
	var int Vatras_MissingPeopleReports;
	var int XP_Vatras_MissingPeopleReports;
	Vatras_MissingPeopleReports = 0;
	AI_Output(other,self, " DIA_Addon_Vatras_MissingPeople_Report_15_00 " );	// Let me tell you what I know...
	if(((MIS_Akil_BringMissPeopleBack != 0) || (MIS_Bengar_BringMissPeopleBack != 0)) && (MISSINGPEOPLEINFO[1] == FALSE))
	{
		AI_Output(other,self, " DIA_Addon_Vatras_MissingPeople_Report_15_01 " );	// Farmers also lost their loved ones.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[1] = TRUE;
	};
	if(((Elvrich_GoesBack2Thorben == TRUE) || (Elvrich_SCKnowsPirats == TRUE) || (SC_KnowsDexterAsKidnapper == TRUE)) && (MISSINGPEOPLEINFO[2] == FALSE))
	{
		AI_Output(other,self, " DIA_Addon_Vatras_MissingPeople_Report_15_02 " );	// I learned that the bandits were responsible for these disappearances.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[2] = TRUE;
	};
	if((Elvrich_SCKnowsPirats == TRUE) && (MISSINGPEOPLEINFO[3] == FALSE))
	{
		AI_Output(other,self, " DIA_Addon_Vatras_MissingPeople_Report_15_03 " );	// Elvrich, Master Torben's apprentice, told me that the bandits take the kidnapped people out by sea.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	if((Elvrich_SCKnowsPirats == TRUE) && (MISSINGPEOPLEINFO[4] == FALSE))
	{
		AI_Output(other,self, " DIA_Addon_Vatras_MissingPeople_Report_15_04 " );	// Pirates have something to do with this. I have not yet fully understood their role in this event.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[4] = TRUE;
	};
	if((Elvrich_GoesBack2Thorben == TRUE) && (MISSINGPEOPLEINFO[5] == FALSE))
	{
		AI_Output(other,self, " DIA_Addon_Vatras_MissingPeople_Report_15_05 " );	// I saved Elvrich from the bandits.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	if((SC_KnowsLuciaCaughtByBandits == TRUE) && (MISSINGPEOPLEINFO[6] == FALSE))
	{
		AI_Output(other,self, " DIA_Addon_Vatras_MissingPeople_Report_15_06 " );	// Bandits captured a girl named Lucia.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	if((Npc_HasItems(other,ItWr_LuciasLoveLetter_Addon) || (MIS_LuciasLetter == LOG_SUCCESS)) && (MISSINGPEOPLEINFO[7] == FALSE))
	{
		AI_Output(other,self, " DIA_Addon_Vatras_MissingPeople_Report_15_07 " );	// Lucia, a girl kidnapped by bandits, decided to join them.
		if(MIS_LuciasLetter == LOG_SUCCESS)
		{
			AI_Output(other,self, " DIA_Addon_Vatras_MissingPeople_Report_15_08 " );	// Apparently, she joined them of her own free will.
		};
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[7] = TRUE;
	};
	if((SC_KnowsDexterAsKidnapper == TRUE) && (MISSINGPEOPLEINFO[8] == FALSE))
	{
		AI_Output(other,self, " DIA_Addon_Vatras_MissingPeople_Report_15_09 " );	// The bandit leader's name is Dexter. He is responsible for all these kidnappings.
		AI_Output(other,self, " DIA_Addon_Vatras_MissingPeople_Report_15_10 " );	// I met Dexter in hard labor. Then he worked for the ore merchant Gomez.
		AI_Output(self,other, " DIA_Addon_Vatras_MissingPeople_Report_05_11 " );	// He'll probably recognize you. Be careful.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[8] = TRUE;
	};
	if(Vatras_MissingPeopleReports != 0)
	{
		AI_Output(self,other, " DIA_Addon_Vatras_MissingPeople_Report_05_12 " );	// I think you're on the right track. Continue.
		XP_Vatras_MissingPeopleReports = XP_Addon_Vatras_MissingPeopleReport * Vatras_MissingPeopleReports;
		B_GivePlayerXP(XP_Vatras_MissingPeopleReports);
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Vatras_MissingPeople_Report_05_13 " );	// What did you learn?
		AI_Output(other,self, " DIA_Addon_Vatras_MissingPeople_Report_15_14 " );	// Nothing important yet.
	};
};

func void DIA_Addon_Vatras_MissingPeople_Success()
{
	AI_Output(other,self, " DIA_Addon_Vatras_MissingPeople_Success_15_00 " );	// I know where the missing people are.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_01");	//Что ты узнал?
	AI_Output(other,self, " DIA_Addon_Vatras_MissingPeople_Success_15_02 " );	// A man called Raven hid them in a remote part of Khorinis.
	AI_Output(self,other, " DIA_Addon_Vatras_MissingPeople_Success_05_03 " );	// Why are you so sure about this?
	AI_Output(other,self, " DIA_Addon_Vatras_MissingPeople_Success_15_04 " );	// I read his orders. Local bandits work for him.
	if(Npc_HasItems(other,ItWr_RavensKidnapperMission_Addon))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_05");	//Вот.
		B_UseFakeScroll();
	};
	AI_Output(self,other, " DIA_Addon_Vatras_MissingPeople_Success_05_06 " );	// Great job. I feared that we would never know the answer to this riddle.
	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Vatras_WhereAreMissingPeople);
	if((MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS) && (MIS_Vatras_FindTheBanditTrader == LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) && (other.guild == GIL_NONE))
	{
		AI_Output(self,other, " DIA_Addon_Vatras_Waffen_Success_05_11 " );	// You proved yourself worthy to join us.
		AI_Output(self,other, " DIA_Addon_Vatras_Waffen_Success_05_12 " );	// If you decide to join the Waterbenders, talk to Saturas.
	};
};


instance DIA_Addon_Vatras_Free(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Free_Condition;
	information = DIA_Addon_Vatras_Free_Info;
	permanent = FALSE;
	description = "The missing people have returned to their homes. " ;
};


func int DIA_Addon_Vatras_Free_Condition()
{
	if((MissingPeopleReturnedHome == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Free_Info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_Free_15_00 " );	// The missing people have returned to their homes.
	AI_Output(self,other, " DIA_Addon_Vatras_Free_05_01 " );	// Good work, my son.
	AI_Output(self,other, " DIA_Addon_Vatras_Free_05_02 " );	// But you must continue on your way. May Adanos bless you.
	AI_Output(self,other, " DIA_Addon_Vatras_Free_05_03 " );	// About Adanos. Bless this warrior! Illuminate his path and give him the strength to face any danger.
	B_RaiseAttribute_Bonus(other,ATR_MANA_MAX,3);
	other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
	other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
	Snd_Play("Levelup");
};


instance DIA_Addon_Vatras_Waffen (C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Waffen_Condition;
	information = DIA_Addon_Vatras_Waffen_Info;
	permanent = TRUE;
	description = " About that arms dealer... " ;
};


func int DIA_Addon_Vatras_Waffen_Condition()
{
	if((MIS_Vatras_FindTheBanditTrader == LOG_Running) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Waffen_Info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_Waffen_15_00 " );	// About that arms dealer...
	Info_ClearChoices(DIA_Addon_Vatras_Waffen);
	Info_AddChoice(DIA_Addon_Vatras_Waffen,Dialog_Back,DIA_Addon_Vatras_Waffen_BACK);
	if ((Fernando_ImKnast ==  TRUE ) || (Fernando_HatsZugegeben ==  TRUE ))
	{
		Info_AddChoice(DIA_Addon_Vatras_Waffen, " I know a merchant who sells weapons to bandits! " ,DIA_Addon_Vatras_Waffen_Success);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Vatras_Waffen, " How much do you know about this merchant? " ,DIA_Addon_Vatras_Waffen_ToMartin);
	};
};

func void DIA_Addon_Vatras_Waffen_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_Waffen);
};

func void DIA_Addon_Vatras_Waffen_ToMartin()
{
	AI_Output(other,self, " DIA_Addon_Vatras_Waffen_ToMartin_15_00 " );	// How much do you know about this merchant?
	AI_Output(self,other, " DIA_Addon_Vatras_Waffen_ToMartin_05_01 " );	// Ask Martin, quartermaster of the paladins. He can tell you more.
	AI_Output(self,other, " DIA_Addon_Vatras_Waffen_ToMartin_05_02 " );	// He should bring the arms dealer to clean water.
	AI_Output(self,other, " DIA_Addon_Vatras_Waffen_ToMartin_05_03 " );	// You will find Martin in the waterfront. When you see a bunch of boxes and a lot of paladins, then know: Martin is nearby.
	Vatras_ToMartin = TRUE ;
};

func void DIA_Addon_Vatras_Waffen_Success()
{
	AI_Output(other,self, " DIA_Addon_Vatras_Waffen_Success_15_00 " );	// I know a merchant who sells weapons to bandits!
	AI_Output(other,self, " DIA_Addon_Vatras_Waffen_Success_15_01 " );	// His name is Fernando.
	AI_Output(self,other, " DIA_Addon_Vatras_Waffen_Success_05_02 " );	// Great. Did Martin take the necessary steps to stop him?
	if(Fernando_ImKnast == TRUE)
	{
		AI_Output(other,self, " DIA_Addon_Vatras_Waffen_Success_15_03 " );	// Yes. Martin will see to it that he does not get out of jail soon.
		AI_Output(self,other, " DIA_Addon_Vatras_Waffen_Success_05_04 " );	// Good work, my son.
		if ( Npc_KnowsInfo ( other , DIA_Addon_Back_WannaBeRanger ) && ( SC_IsRanger ==  FALSE ))
		{
			AI_Output(other,self, " DIA_Addon_Vatras_Waffen_Success_15_05 " );	// (hopefully) And now you will accept me into the Ring of Water?
			AI_Output(self,other, " DIA_Addon_Vatras_Waffen_Success_05_06 " );	// (smiles) We didn't agree on THIS, and you know it.
		};
		AI_Output(self,other, " DIA_Addon_Vatras_Waffen_Success_05_07 " );	// May Adanos light your path.
		MIS_Vatras_FindTheBanditTrader = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Vatras_FindTheBanditTrader);
		if((MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS) && (MIS_Vatras_FindTheBanditTrader == LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) && (other.guild == GIL_NONE))
		{
			AI_Output(self,other, " DIA_Addon_Vatras_Waffen_Success_05_11 " );	// You proved yourself worthy to join us.
			AI_Output(self,other, " DIA_Addon_Vatras_Waffen_Success_05_12 " );	// If you decide to join the Waterbenders, talk to Saturas.
		};
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Vatras_CaughtFernando_15_09 " );	// Not yet.
		AI_Output(self,other, " DIA_Addon_Vatras_CaughtFernando_05_10 " );	// Please hurry up and tell him everything. This must be stopped as soon as possible.
	};
};


instance DIA_Addon_Vatras_Stoneplate(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_Stoneplate_Condition;
	information = DIA_Addon_Vatras_Stoneplate_Info;
	description = " I have a stone tablet with me. " ;
};


func int DIA_Addon_Vatras_Stoneplate_Condition()
{
	if((Npc_HasItems(hero,ItWr_StonePlateCommon_Addon) >= 1) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Stoneplate_Info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_Stoneplate_15_00 " );	// I have a stone tablet with me. Could you tell me something about her?
	AI_Output(self,other, " DIA_Addon_Vatras_Stoneplate_05_01 " );	// This is an artifact of an ancient culture that we've been researching for a long time.
	AI_Output(self,other, " DIA_Addon_Vatras_Stoneplate_05_02 " );	// There are several varieties of such plates. Some of them contain information on the history of ancient peoples.
	AI_Output(self,other, " DIA_Addon_Vatras_Stoneplate_05_03 " );	// I'm interested in them. Bring me everything you can find.
	AI_Output(self,other, " DIA_Addon_Vatras_Stoneplate_05_04 " );	// A worthy reward awaits you.
	Log_CreateTopic(TOPIC_Addon_Stoneplates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates,LOG_Running);
	B_LogEntry(TOPIC_Addon_Stoneplates,LogText_Addon_VatrasTrade);
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry_Quiet(TOPIC_CityTrader,LogText_Addon_VatrasTrade);
};


instance DIA_Addon_Vatras_SellStonplate(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_SellStonplate_Condition;
	information = DIA_Addon_Vatras_SellStonplate_Info;
	permanent = TRUE;
	description = " I brought you more tablets... " ;
};


func int DIA_Addon_Vatras_SellStonplate_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Addon_Behind_Stoneplate ) && ( Npc_HasItems ( hero , ItWr_StonePlateCommon_Addon ) >=  1 ) && ( CAPTAINNORTHERDIAWAY  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_SellStonplate_Info()
{
	var int number;
	count = Npc_HasItems(other,ItWr_StonePlateCommon_Addon);

	AI_Output(other,self, " DIA_Addon_Vatras_SellStonplate_15_00 " );	// I brought you more tablets...
	B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,number);
	Npc_RemoveInvItems(self,ItWr_StonePlateCommon_Addon,Npc_HasItems(self,ItWr_StonePlateCommon_Addon));
	AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_01");	//Отлично!

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NDM) || (other.guild == GIL_NDW) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other, " DIA_Addon_Vatras_SellStonplate_05_02 " );	// For this, I will increase your magical abilities!
		B_RaiseAttribute_Bonus(other, ATR_MANA_MAX ,number);
		Npc_ChangeAttribute(other,ATR_MANA,anzahl);
	}
	else if(other.guild != GIL_NONE)
	{
		AI_Output(self,other, " DIA_Addon_Vatras_SellStonplate_05_04 " );	// Here, take some magical scrolls as a reward...

		if (number >=  25 )
		{
			B_GiveInvItems(self,other,ItSc_AdanosBall,1);
			B_GiveInvItems(self,other,ItSc_Thunderstorm,1);
			B_GiveInvItems(self,other,ItSc_Geyser,1);
		}
		else  if (number >=  15 )
		{
			B_GiveInvItems(self,other,ItSc_IceWave,1);
			B_GiveInvItems(self,other,ItSc_LightningFlash,1);
		}
		else  if (number >=  10 )
		{
			B_GiveInvItems(self,other,ItSc_Waterfist,1);
			B_GiveInvItems(self,other,ITSC_SUMSHOAL,1);
		}
		else  if (number >=  5 )
		{
			B_GiveInvItems(self,other,ItSc_ThunderBall,1);
			B_GiveInvItems(self,other,ItSc_IceCube,1);
		}
		else  if (count >  1 )
		{
			B_GiveInvItems(self,other,ItSc_Icebolt,1);
			B_GiveInvItems(self,other,ItSc_Icelance,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItSc_Zap,1);
		};
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Addon_Vatras_SellStonplate_05_03 " );	// Here, take some potions as a reward...
		B_GiveInvItems(self,other,ItPo_Health_03,number +  1 );
	};

	B_GivePlayerXP(XP_Addon_VatrasStonplate * number);
};


var int Vatras_SentToDaron;

instance DIA_Addon_Vatras_GuildHelp(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_GuildHelp_Condition;
	information = DIA_Addon_Vatras_GuildHelp_Info;
	description = " Lares said you could help me get to the firebender monastery. " ;
};

func int DIA_Addon_Vatras_GuildHelp_Condition()
{
	if((RangerHelp_gildeKDF == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_GuildHelp_Info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_GuildHelp_15_00 " );	// Lares said you could help me get to the firebender monastery.
	AI_Output(self,other, " DIA_Addon_Vatras_GuildHelp_05_01 " );	// Is this your choice? Walk the path of fire?
	AI_Output(other,self, " DIA_Addon_Vatras_GuildHelp_15_02 " );	// Yes. I want to become a fire mage.
	AI_Output(self,other, " DIA_Addon_Vatras_GuildHelp_05_03 " );	// As far as I know, they gladly accept novices. So why do you need my help?
	if(SC_KnowsKlosterTribut == TRUE)
	{
		AI_Output(other,self, " DIA_Addon_Vatras_GuildHelp_15_04 " );	// A novice in front of the gates of the monastery demands that I pay the entrance fee. He demands a sheep and gold.
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Vatras_GuildHelp_15_05 " );	// Lares mentioned that they require a fee to enter the monastery.
	};
	AI_Output(self,other, " DIA_Addon_Vatras_GuildHelp_05_06 " );	// I can't take you to the monastery. I'm still a waterbender, you know. But I know firebender Daron very well.
	AI_Output(self,other, " DIA_Addon_Vatras_GuildHelp_05_07 " );	// He spends most of his time in the marketplace collecting donations.
	Vatras_SentToDaron = TRUE;
	AI_Output(self,other, " DIA_Addon_Vatras_GuildHelp_05_08 " );	// But I heard that sometimes he leaves the city.
	AI_Output(self,other, " DIA_Addon_Vatras_GuildHelp_05_09 " );	// He told me about the figurine that was stolen from him.
	AI_Output(self,other, " DIA_Addon_Vatras_GuildHelp_05_10 " );	// This thing means a lot to him. If you manage to return the figurine, he will definitely lead you to the monastery.
	AI_Output(self,other, " DIA_Addon_Vatras_GuildHelp_05_11 " );	// Remember that even if you enter the circle of fire, you can still join us.
	AI_Output(self,other, " DIA_Addon_Vatras_GuildHelp_05_12 " );	// If, of course, you prove your usefulness.
	MIS_Addon_Vatras_Go2Daron = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_RangerHelpKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpKDF, "The fire mage Daron will help me get into the monastery if I find his stolen figurine. " );
};

instance DIA_Vatras_INFLUENCE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 92;
	condition = DIA_Vatras_INFLUENCE_Condition;
	information = DIA_Vatras_INFLUENCE_Info;
	permanent = FALSE;
	description = " I ask for your blessing. " ;
};


func int DIA_Vatras_INFLUENCE_Condition()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Player_IsApprentice == APP_NONE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_INFLUENCE_Info()
{
	AI_Output(other,self, " DIA_Vatras_INFLUENCE_15_00 " );	// I ask for your blessing.
	AI_Output(self,other, " DIA_Vatras_INFLUENCE_05_01 " );	// Why should I give you my blessing, outlander?
	AI_Output(other,self, " DIA_Vatras_INFLUENCE_15_02 " );	// I want to become a student of one of the masters in the lower part of the city.
	AI_Output(self,other, " DIA_Vatras_INFLUENCE_REPEAT_05_11 " );	// Go with the blessing of Adanos, my son!
	Snd_Play("LevelUp");
	B_GivePlayerXP(XP_VatrasTruth);
	Vatra's blessing = TRUE ;
	B_LogEntry(TOPIC_Thorben, "The water mage Vatras has blessed me. " );
};


DIA_Vatras_WoKdF (C_Info) instances
{
	npc = VLK_439_Vatras;
	nr = 93;
	condition = DIA_Vatras_WoKdF_Condition;
	information = DIA_Vatras_WoKdF_Info;
	permanent = FALSE;
	description = " Where can I find a priest of Innos? " ;
};


func int DIA_Vatras_WoKdF_Condition()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Vatras_Segen == TRUE) && (Vatras_SentToDaron == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_WoKdF_Info()
{
	AI_Output(other,self, " DIA_Vatras_WoKdF_15_00 " );	// Where can I find the priest Innos?
	AI_Output(self,other, " DIA_Vatras_WoKdF_05_01 " );	// Try looking for it in the marketplace. You will find a representative of the monastery there.
};

var int VatrasBonusMana;

instance DIA_Vatras_Spende (C_Info)
{
	npc = VLK_439_Vatras;
	nr = 94;
	condition = DIA_Vatras_Spende_Condition;
	information = DIA_Vatras_Spende_Info;
	permanent = TRUE;
	description = " I want to donate to Adanos! " ;
};


func int DIA_Vatras_Spend_Condition()
{
	return TRUE;
};

func void DIA_Vatras_Spende_Info()
{
	AI_Output(other,self, " DIA_Vatras_Spende_15_00 " );	// I want to donate to Adanos!
	AI_Output(self,other, " DIA_Vatras_Spende_05_01 " );	// A donation to the church of Adanos will remove some of the sins you may have committed, my son.
	AI_Output(self,other, " DIA_Vatras_Spende_05_02 " );	// How much can you donate?
	Info_ClearChoices(DIA_Vatras_Spende);
	Info_AddChoice(DIA_Vatras_Spende, " I don't have anything to share right now... " ,DIA_Vatras_Spende_BACK);

	if(Npc_HasItems(other,ItMi_Gold) >= 50)
	{
		Info_AddChoice(DIA_Vatras_Spende, " I have fifty gold coins... " ,DIA_Vatras_Spende_50);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Vatras_Spende, " I have one hundred gold coins... " ,DIA_Vatras_Spende_100);
	};
};

func void DIA_Vatras_Spende_BACK()
{
	AI_Output(other,self, " DIA_Vatras_Spende_BACK_15_00 " );	// I have nothing to share right now...
	AI_Output(self,other, " DIA_Vatras_Spende_BACK_05_01 " );	// It's not a problem, you can express your good intentions later, my son.
	Info_ClearChoices(DIA_Vatras_Spende);
};

func void DIA_Vatras_Spend_50()
{
	AI_Output(other,self, " DIA_Vatras_Spende_50_15_00 " );	// I have fifty gold coins...
	AI_Output(self,other,"DIA_Vatras_Spende_50_05_01");	//Я благодарю тебя от имени Аданоса, сын мой. Твое золото будет роздано нуждающимся.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	PRAYSUM_VATR += 50;

	if((PRAYSUM_VATR > 1000) && (VatrasBonusMana == FALSE))
	{
		B_RaiseAttribute_Bonus(hero,ATR_MANA_MAX,5);
		Npc_ChangeAttribute(hero,ATR_MANA,ATR_MANA_MAX);
		BONUSCOUNT += 1;
		VatrasBonusMana = TRUE;
	};


	Info_ClearChoices(DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_100()
{
	AI_Output(other,self,"DIA_Vatras_Spende_100_15_00");	//У меня есть сто золотых монет...
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_01");	//Я благословляю тебя от имени Аданоса за это большое пожертвование!
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_02");	//Да будет путь, по которому ты идешь, благословлен Аданосом!
	B_GiveInvItems(other,self,ItMi_Gold,100);
	PRAYSUM_VATR  +=  100 ;

	if((PRAYSUM_VATR > 1000) && (VatrasBonusMana == FALSE))
	{
		B_RaiseAttribute_Bonus(hero,ATR_MANA_MAX,5);
		Npc_ChangeAttribute(hero,ATR_MANA,ATR_MANA_MAX);
		BONUSCOUNT += 1;
		VatrasBonusMana = TRUE;
	};

	Info_ClearChoices(DIA_Vatras_Spende);
};

instance DIA_Vatras_CanTeach(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 95;
	condition = DIA_Vatras_CanTeach_Condition;
	information = DIA_Vatras_CanTeach_Info;
	permanent = FALSE;
	description = " Can you teach me something about magic? " ;
};

func int DIA_Vatras_CanTeach_Condition()
{
	return TRUE;
};

func void DIA_Vatras_CanTeach_Info()
{
	AI_Output(other,self, " DIA_Vatras_CanTeach_15_00 " );	// Can you teach me something about magic?
	AI_Output(self,other, " DIA_Vatras_CanTeach_05_01 " );	// Only the Chosen of Innos and the Chosen of Adanos are allowed to use rune magic.
	AI_Output(self,other, " DIA_Vatras_CanTeach_05_02 " );	// But ordinary mortals can also use magic using scrolls.
	AI_Output(self,other, " DIA_Vatras_CanTeach_05_03 " );	// I can show you how to channel and enhance your magical abilities.
	Vatras_TeachMANA = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher, "The water mage Vatras can help me increase my magical abilities. " );
};

instance DIA_Vatras_Teach(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 100;
	condition = DIA_Vatras_Teach_Condition;
	information = DIA_Vatras_Teach_Info;
	permanent = TRUE;
	description = " I want to increase my magical abilities. " ;
};

func int DIA_Vatras_Teach_Condition()
{
	if(Vatras_TeachMANA == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_Teach_Info()
{
	AI_Output(other,self, " DIA_Vatras_Teach_15_00 " );	// I want to increase my magical abilities.
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);

	if ((Chapter >=  2 ) && (other.guild ==  GIL_KDW ) && ( BACK_TEACREGENMANA  ==  FALSE ))
	{
		Info_AddChoice(DIA_Vatras_Teach, " Mana Regen (Training Points: 10, Cost: 5000 Coins) " ,DIA_Vatras_Teach_RegenMana);
	};
};

func void DIA_Vatras_Teach_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= 500)
	{
		AI_Output(self,other, " DIA_Vatras_Teach_05_00 " );	// Your magical energy has become too high for me to increase it further.
	};

	Info_ClearChoices(DIA_Vatras_Teach);
};

func void DIA_Vatras_Teach_RegenMana()
{
	var int cost;
	var int money;

	AI_Output(other,self, " DIA_Vatras_Teach_regen_15_05 " );	// Teach me mana regeneration.

	cost = 10 ;
	money = 5000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other, " DIA_Vatras_Teach_regen_03_90 " );	// You don't have enough gold for this! Come back later.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print( " Training: Mana Regeneration " );
		VATRAS_TEACHREGENMANA = TRUE ;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);
};

func void DIA_Vatras_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);

	if ((Chapter >=  2 ) && (hero.guild ==  GIL_KDW ) && ( BACK_TEACREGENMAN  ==  FALSE ))
	{
		Info_AddChoice(DIA_Vatras_Teach, " Mana Regen (Training Points: 5, Cost: 15000 coins) " ,DIA_Vatras_Teach_RegenMana);
	};
};

func void DIA_Vatras_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);

	if ((Chapter >=  2 ) && (hero.guild ==  GIL_KDW ) && ( BACK_TEACREGENMAN  ==  FALSE ))
	{
		Info_AddChoice(DIA_Vatras_Teach, " Mana Regen (Training Points: 5, Cost: 15000 coins) " ,DIA_Vatras_Teach_RegenMana);
	};
};

instance DIA_Vatras_GODS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 98;
	condition = DIA_Vatras_GODS_Condition;
	information = DIA_Vatras_GODS_Info;
	permanent = TRUE;
	description = " Tell me about the gods. " ;
};

func int DIA_Vatras_GODS_Condition()
{
	return TRUE;
};

func void DIA_Vatras_GODS_Info()
{
	AI_Output(other,self, " DIA_Vatras_GODS_15_00 " );	// Tell me about the gods.
	AI_Output(self,other, " DIA_Vatras_GODS_05_01 " );	// What exactly do you want to know?
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS, " Tell me about Innos " ,DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS, " Tell me about Adanos " ,DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS, " Tell me about Beliar " ,DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BACK()
{
	Info_ClearChoices(DIA_Vatras_GODS);
};

func void DIA_Vatras_GODS_INNOS()
{
	AI_Output(other,self, " DIA_Vatras_GODS_INNOS_15_00 " );	// Tell me about Innos.
	AI_Output(self,other, " DIA_Vatras_GODS_INNOS_05_01 " );	// Good. (preaching) Innos is the first and greatest of the gods. He created the sun and the world.
	AI_Output(self,other, " DIA_Vatras_GODS_INNOS_05_02 " );	// He commands light and fire - his gift to mankind. He is the essence of law and justice.
	AI_Output(self,other, " DIA_Vatras_GODS_INNOS_05_03 " );	// His priests are Firebenders, and his paladins are his warriors.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS, " Tell me about Innos " ,DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS, " Tell me about Adanos " ,DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS, " Tell me about Beliar " ,DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_ADANOS()
{
	AI_Output(other,self, " DIA_Vatras_GODS_ADANOS_15_00 " );	// Tell me about Adanos.
	AI_Output(self,other, " DIA_Vatras_GODS_ADANOS_05_01 " );	// Adanos is the god of the center. He is the scales of justice, the guardian of the balance between Innos and Beliar.
	AI_Output(self,other, " DIA_Vatras_GODS_ADANOS_05_02 " );	// He commands the power of change. His gift is water in all oceans, rivers and lakes.
	AI_Output(self,other, " DIA_Vatras_GODS_ADANOS_05_03 " );	// Its priests are Waterbenders. I am also a servant and priest of Adanos.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS, " Tell me about Innos " ,DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS, " Tell me about Adanos " ,DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS, " Tell me about Beliar " ,DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BELIAR()
{
	AI_Output(other,self, " DIA_Vatras_GODS_BELIAR_15_00 " );	// Tell me about Beliar.
	AI_Output(self,other, " DIA_Vatras_GODS_BELIAR_05_01 " );	// Beliar is the dark god of death, destruction, and everything unnatural.
	AI_Output(self,other, " DIA_Vatras_GODS_BELIAR_05_02 " );	// He fights the eternal battle with Innos, but Adanos stands guard over the balance between the two.
	AI_Output(self,other, " DIA_Vatras_GODS_BELIAR_05_03 " );	// Only a few people follow the call of Beliar, however, he grants great power to his servants.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS, " Tell me about Innos " ,DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS, " Tell me about Adanos " ,DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS, " Tell me about Beliar " ,DIA_Vatras_GODS_BELIAR);
};


instance DIA_Vatras_HEAL(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 99;
	condition = DIA_Vatras_HEAL_Condition;
	information = DIA_Vatras_HEAL_Info;
	permanent = TRUE;
	description = " Can you heal me? " ;
};

func int DIA_Vatras_HEAL_Condition()
{
	return TRUE;
};

func void DIA_Vatras_HEAL_Info()
{
	AI_Output(other,self, " DIA_Vatras_HEAL_15_00 " );	// Can you heal me?

	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		if((hero.guild == GIL_KDW) || (hero.guild == GIL_NDW))
		{
			AI_Output(self,other, " DIA_Vatras_HEAL_05_01 " );	// Adanos, bless this body! Release him from his wounds and breathe into him the power of new life.
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			AI_Print(PRINT_FullyHealed);
			BONUSCOUNT += 1;
		}
		else if((PRAYSUM_VATR >= 500) && (PRAYDAY2_VATR != Wld_GetDay()))
		{
			AI_Output(self,other, " DIA_Vatras_HEAL_05_05 " );	// You have donated much to the Church of Adanos, my son, and I will help you!
			AI_Output(self,other, " DIA_Vatras_HEAL_05_01 " );	// Adanos, bless this body! Release him from his wounds and breathe into him the power of new life.
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			AI_Print(PRINT_FullyHealed);
			PRAYDAY2_VATR = Wld_GetDay();
			BONUSCOUNT += 1;
		}
		else  if ( PRAYDAY2_VATR  == Wld_GetDay())
		{
			AI_Output(self,other, " DIA_Vatras_HEAL_05_03 " );	// I already helped you today. My powers are not unlimited, come tomorrow.
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Vatras_TellMe_05_01 " );	// And why should I do this?
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Vatras_HEAL_05_02 " );	// You don't need healing magic right now.
	};
};


instance DIA_Vatras_MISSION(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Vatras_MISSION_Condition;
	information = DIA_Vatras_MISSION_Info;
	important = TRUE;
};


func int DIA_Vatras_MISSION_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MISSION_Info()
{
	AI_Output(self,other, " DIA_Vatras_Add_05_10 " );	// I have a message for Master Ysgaroth. He guards the chapel in front of the monastery.
	AI_Output(self,other, " DIA_Vatras_MISSION_05_01 " );	// If you complete this task for me, you can choose a reward.
	Info_ClearChoices(DIA_Vatras_MISSION);
	Info_AddChoice(DIA_Vatras_MISSION, " Not yet! " ,DIA_Vatras_MISSION_NO);
	Info_AddChoice(DIA_Vatras_MISSION,"Конечно.",DIA_Vatras_MISSION_YES);
};

func void B_SayVatrasGo()
{
	AI_Output(self,other, " DIA_Vatras_Add_05_13 " );	// Good. So go to Master Ysgaroth.
};

func void DIA_Vatras_MISSION_YES()
{
	AI_Output(other,self, " DIA_Vatras_MISSION_YES_15_00 " );	// I'll do it.
	AI_Output(self,other, " DIA_Vatras_Add_05_11 " );	// Okay, then deliver this message and choose one of these spell scrolls.
	AI_Output(self,other, " DIA_Vatras_Add_05_12 " );	// And when you deliver the message, I'll reward you accordingly.
	B_GiveInvItems(self,hero,ItWr_VatrasMessage,1);
	MIS_Vatras_Message = LOG_Running;
	Log_CreateTopic(TOPIC_Message, LOG_MISSION );
	Log_SetTopicStatus(TOPIC_Botschaft,LOG_Running);
	B_LogEntry(TOPIC_Botschaft, " Vatras gave me a note for Master Ysgaroth. He is in the chapel near the monastery. " );
	Info_ClearChoices(DIA_Vatras_MISSION);
	Info_AddChoice(DIA_Vatras_MISSION, " I choose light. " ,DIA_Vatras_MISSION_LIGHT);
	Info_AddChoice(DIA_Vatras_MISSION, " I choose minor heal. " ,DIA_Vatras_MISSION_HEAL);
	Info_AddChoice(DIA_Vatras_MISSION, " I choose an ice arrow. " ,DIA_Vatras_MISSION_ICE);
};

func void DIA_Vatras_MISSION_NO()
{
	AI_Output(other,self,"DIA_ADDON_Vatras_MISSION_NO_15_00");	//Пока нет!
	AI_Output(self,other, " DIA_ADDON_Vatras_MISSION_NO_05_01 " );	// No problem. I will send someone else.
	MIS_Vatras_Message = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_HEAL()
{
	AI_Output(other,self, " DIA_Vatras_MISSION_HEAL_15_00 " );	// I choose a healing spell.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_LightHeal,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_ICE()
{
	AI_Output(other,self, " DIA_Vatras_MISSION_ICE_15_00 " );	// Give me Frostbolt.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_Icebolt,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_LIGHT()
{
	AI_Output(other,self, " DIA_Vatras_MISSION_LIGHT_15_00 " );	// I'll take the spell of light.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_Light,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};


instance DIA_Vatras_MESSAGE_SUCCESS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Vatras_MESSAGE_SUCCESS_Condition;
	information = DIA_Vatras_MESSAGE_SUCCESS_Info;
	description = " I delivered your message. " ;
};


func int DIA_Vatras_MESSAGE_SUCCESS_Condition()
{
	if((MIS_Vatras_Message == LOG_Running) && (Vatras_Return == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MESSAGE_SUCCESS_Info()
{
	AI_Output(other,self, " DIA_Vatras_MESSAGE_SUCCESS_15_00 " );	// I delivered your message.
	AI_Output(self,other, " DIA_Vatras_Add_05_14 " );	// Please accept my thanks. And your reward!
	MIS_Vatras_Message = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Botschaft,LOG_SUCCESS);
	B_LogEntry(TOPIC_Botschaft, " I informed Vatras that I delivered a letter to Ysgaroth. " );
	B_GivePlayerXP(XP_Vatras_Message);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS, " Царский щавель. " ,DIA_Vatras_MESSAGE_SUCCESS_Plant);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS, " Ring of Agility. " ,DIA_Vatras_MESSAGE_SUCCESS_Ring);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"Кусок руды.",DIA_Vatras_MESSAGE_SUCCESS_Ore);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Plant()
{
	B_GiveInvItems(self,hero,ItPl_Perm_Herb,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Ring()
{
	B_GiveInvItems(self,hero,ItRi_Dex_01,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Ore()
{
	B_GiveInvItems(self,hero,ItMi_Nugget,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};


const int kurz = 0;
const int lang = 1;
var int Vatras_once long way;

func void B_Vatras_Walk(var int duration)
{
	if (Vatras_einmalLangWeg ==  TRUE )
	{
		return;
	};
	if((Npc_GetDistToWP(self,"NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500) && Npc_WasInState(self,ZS_Preach_Vatras))
	{
		B_StopLookAt(self);
		AI_AlignToWP(self);
		AI_Output(self,other, " DIA_Vatras_Add_05_06 " );	// Listen to me people! I'm needed elsewhere.
		if (duration == short)
		{
			AI_Output(self,other, " DIA_Vatras_Add_05_07 " );	// This won't take long. And when I return, I will tell you the end of this story.
		}
		else
		{
			AI_Output(self,other, " DIA_Vatras_Add_05_08 " );	// I don't know if I'll be back. If you want to know the ending, read this story in the scriptures.
			Vatras_einmalLangWeg = TRUE ;
		};
		AI_Output(self,other, " DIA_Vatras_Add_05_09 " );	// May Adanos be with you!
		B_TurnToNpc(self,other);
	};
	Vatras_SchickeLeuteWeg = TRUE ;
};


instance DIA_Addon_Vatras_AbloesePre(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_AbloesePre_Condition;
	information = DIA_Addon_Vatras_AbloesePre_Info;
	description = " I'm having trouble with the Eye of Innos! " ;
};

func int DIA_Addon_Vatras_AbloesePre_Condition()
{
	if ((Npc_HasItems(hero,ItMy_InnosEye_Broken_Mis) >=  1 ) && (Chapter ==  3 ) && (BackCanLeaveTown_Chapter3 ==  FALSE ) && (RavenAway ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_AbloesePre_Info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_AbloesePre_15_00 " );	// I'm having trouble with the Eye of Innos! I wanted to ask for help.
	AI_Output(self,other, " DIA_Addon_Vatras_AbloesePre_05_01 " );	// And because of your problem, I have to leave the city?
	AI_Output(other,self, " DIA_Addon_Vatras_AbloesePre_15_02 " );	// I don't know, maybe.
	AI_Output(self,other, " DIA_Addon_Vatras_AbloesePre_05_03 " );	// I've been waiting for days to be replaced. The rest of the waterbenders should have already returned to Khorinis.
	AI_Output(self,other, " DIA_Addon_Vatras_AbloesePre_05_04 " );	// If you can get at least one of them to replace me, I can help you.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	MIS_VatrasAbloesung = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_VatrasAbloesung,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung,LOG_Running);
	B_LogEntry(TOPIC_Addon_VatrasAbloesung, " Vatras can't help me solve the 'Eye of Innos' problem until there is another Water Mage ready to replace him in the city. " );
};

instance DIA_Addon_Vatras_AddonSolved(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_AddonSolved_Condition;
	information = DIA_Addon_Vatras_AddonSolved_Info;
	description = " I found a replacement for you. " ;
};

func int DIA_Addon_Vatras_AddonSolved_Condition()
{
	if((MIS_VatrasAbloesung == LOG_Running) && (CAPITANORDERDIAWAY == FALSE) && (MyxirIsBack == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_AddonSolved_Info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self, " DIA_Addon_Vatras_AddonSolved_15_00 " );	// I found a replacement for you.
	AI_Output(self,other, " DIA_Addon_Vatras_AddonSolved_05_03 " );	// This is very good news! Let's hope nothing bad happens again.
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_AbloesePre))
	{
		AI_Output(self,other, " DIA_Addon_Vatras_AddonSolved_05_04 " );	// NOW I can help you.
		AI_Output(self,other, " DIA_Addon_Vatras_AddonSolved_05_05 " );	// Sounds like it's about the Eye of Innos, doesn't it?
	};
	MIS_VatrasAbloesung = LOG_Success;
	VatrasCanLeaveTown_Kap3 = TRUE;
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung,LOG_Success);
	B_LogEntry(TOPIC_Addon_VatrasAbloesung, " Now Vatras will help me with the Eye of Innos. " );
};

instance DIA_Vatras_INNOSEYEKAPUTT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_INNOSEYEKAPUTT_Condition;
	information = DIA_Vatras_INNOSEYEKAPUTT_Info;
	description = " Innos ' eye is damaged. " ;
};

func int DIA_Vatras_INNOSEYEKAPUTT_Condition()
{
	if((Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)) && (Kapitel == 3) && (VatrasCanLeaveTown_Kap3 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_INNOSEYEKAPUTT_Info()
{
	if (MIS_Pyrokar_GoToVatrasInnoseye == LOG_Running)
	{
		AI_Output(other,self, " DIA_Vatras_INNOSEYEKAPUTT_15_00 " );	// Pirokar sent me.
	}
	else if(MIS_Xardas_GoToVatrasInnoseye == LOG_Running)
	{
		AI_Output(other,self, " DIA_Vatras_INNOSEYEKAPUTT_15_01 " );	// Xardas sent me.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self, " DIA_Vatras_INNOSEYEKAPUTT_15_02 " );	// Innos' eye is damaged.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_05_03 " );	// I know. I have already learned this from a very distressed novice.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_05_04 " );	// The Dark Mages used the Fire Mages' Sun Circle to destroy the Eye.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_05_05 " );	// I would call it a forced step of the enemy.
	Info_ClearChoices(DIA_Vatras_INNOSEYEKAPUTT);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT, " News travels fast in this city. " ,DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten);
	if((hero.guild == GIL_KDF) && (MIS_Pyrokar_GoToVatrasInnoseye == LOG_Running))
	{
		Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT, " Why did Pyrokar send me to you? " ,DIA_Vatras_INNOSEYEKAPUTT_warumdu);
	};
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT, " What will happen to the Eye now? " ,DIA_Vatras_INNOSEYEKAPUTT_Auge);
};

func void DIA_Vatras_INNOSEYEKAPUTT_eye()
{
	AI_Output(other,self, " DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00 " );	// What will happen to the Eye now?
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01 " );	// We need to restore it. But this, I'm afraid, will not be an easy task.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02 " );	// The frame is split into two parts. A skilled blacksmith should be able to repair it.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03 " );	// But that's not the problem. I'm more concerned about the gem.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04 " );	// It is dull and lifeless. The enemy seemed to know well how to weaken him.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT, " Where can I find a blacksmith who can fix the setting? " ,DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT, " How can I restore the stone's power? " ,DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein);
};

func void DIA_Vatras_INNOSEYEKAPUTT_eye_stone()
{
	AI_Output(other,self, " DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00 " );	// How can the power of the stone be restored?
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01 " );	// I only see one way. The union of the three ruling deities should have the desired effect.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02 " );	// A well-prepared conversion ritual at the site of the stone's destruction will restore its fire to it.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03 " );	// However, the problem is that you must bring the earthly representatives of each of these three gods to this place.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04 " );	// Also, this ritual requires a lot of swamp grass. I think you need at least 3 plants.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT, " Who can be these three earthly representatives of the gods? " ,DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT, " Where can I find marsh grass? " ,DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut);
};

func void DIA_Vatras_INNOSEYEKAPUTT_eye_stone_herb()
{
	AI_Output(other,self, " DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00 " );	// Where can I find swamp grass?
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01 " );	// I heard about the old shaman Sagitta, who lives in the forest. Presumably, she sells such herbs.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02 " );	// But you can also try your luck at the local harbor.
};

func void DIA_Vatras_INNOSEYEKAPUTT_Eye_Stone_Who()
{
	AI_Output(other,self, " DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00 " );	// Who can be these three earthly representatives of the gods?
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01 " );	// I will represent the god Adanos personally.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02 " );	// Pyrokar, the supreme fire mage, would be a suitable candidate for the representative of the god Innos.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03 " );	// But for Beliar, I can't think of a suitable candidate. It must be someone with black magic.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT, " Black magic? What about Xardas? " ,DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Eye_Stone_Who_Xardas()
{
	AI_Output(other,self, " DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00 " );	// Black magic? What about Xardas?
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01 " );	// Exactly. It might work.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02 " );	// But I ask myself a question - how will you bring the three of us to one place.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03 " );	// Imagine the look on the Pyrocar's face when he hears that he must work hand in hand with Xardas.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT, " I must go. " ,DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter);
};

func void DIA_Vatras_INNOSEYEKAPUTT_eye_smith()
{
	AI_Output(other,self, " DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00 " );	// Where can I find a blacksmith who can repair the frame of the Eye?
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01 " );	// Ask around for who can repair jewelry.
};

func void DIA_Vatras_INNOSEYEKAPUTT_warumdu()
{
	AI_Output(other,self, " DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00 " );	// Why did Pirokar send me to you?
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01 " );	// I suspected something like this would happen sooner or later.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02 " );	// The Pyrocar has always considered itself so invulnerable and unbeatable that it almost bordered on nonchalance.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03 " );	// So, his precautions to protect the Eye were nonchalant too.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04 " );	// I just think he's subconsciously relying on the abilities Adanos bestowed on me.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05 " );	// I can't bear to think what might have happened if I wasn't available right now.
};

func void DIA_Vatras_INNOSEYEKAPUTT_quickmessages()
{
	AI_Output(other,self, " DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00 " );	// In this city, news travels fast.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01 " );	// That's fine, but the enemy won't sleep either.
};

func void DIA_Vatras_INNOSEYEKAPUTT_eye_stone_who_Xardas_next()
{
	AI_Output(other,self, " DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00 " );	// I have to go.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01 " );	// I, too, must be on my way to prepare the ceremony in the Circle of the Sun.
	AI_Output(self,other, " DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02 " );	// Send Xardas and Pyrocar there. And don't forget to bring swamp grass. I'm relying on you.
	; _ _ _ _ _ _
	MIS_RitualInnosEyeRepair = LOG_Running;
	Info_ClearChoices(DIA_Vatras_INNOSEYEKAPUTT);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYEREPAIR");
	Vatras_GoesToRitualInnosEye = TRUE;
	B_Vatras_GoAway(short);
	dmt_1201.aivar[AIV_EnemyOverride] = TRUE ;
	dmt_1202.aivar[AIV_EnemyOverride] = TRUE ;
	dmt_1203.aivar[AIV_EnemyOverride] = TRUE ;
	dmt_1204.aivar[AIV_EnemyOverride] = TRUE ;
	dmt_1205.aivar[AIV_EnemyOverride] = TRUE ;
	dmt_1206.aivar[AIV_EnemyOverride] = TRUE ;
	dmt_1207.aivar[AIV_EnemyOverride] = TRUE ;
	dmt_1208.aivar[AIV_EnemyOverride] = TRUE ;
	dmt_1209.aivar[AIV_EnemyOverride] = TRUE ;
	dmt_1210.aivar[AIV_EnemyOverride] = TRUE ;
	dmt_1211.aivar[AIV_EnemyOverride] = TRUE ;
	B_StartOtherRoutine(dmt_1201,"AfterRitual");
	B_StartOtherRoutine(dmt_1202,"AfterRitual");
	B_StartOtherRoutine(dmt_1203,"AfterRitual");
	B_StartOtherRoutine(dmt_1204,"AfterRitual");
	B_StartOtherRoutine(dmt_1205,"AfterRitual");
	B_StartOtherRoutine(dmt_1206,"AfterRitual");
	B_StartOtherRoutine(dmt_1207,"AfterRitual");
	B_StartOtherRoutine(dmt_1208,"AfterRitual");
	B_StartOtherRoutine(dmt_1209,"AfterRitual");
	B_StartOtherRoutine(dmt_1210,"AfterRitual");
	B_StartOtherRoutine(dmt_1211,"AfterRitual");
};

instance DIA_ADDON_VATRAS_SEEKERS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_SEEKERS_condition;
	information = DIA_ADDON_VATRAS_SEEKERS_info;
	permanent = FALSE;
	description = " Who are these dark wanderers " ;
};

func int DIA_ADDON_VATRAS_SEEKERS_condition()
{
	if(MIS_RitualInnosEyeRepair == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_SEEKERS_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_ADDON_VATRAS_SEEKERS_01_00 " );	// And who are these dark wanderers?
	AI_Output(self,other, " DIA_ADDON_VATRAS_SEEKERS_01_01 " );	// These are powerful dark magicians who began to serve Beliar in very old times!
	AI_Output(self,other, " DIA_ADDON_VATRAS_SEEKERS_01_02 " );	// They received great power and power, but in exchange their souls were consumed by the demonic magic of Darkness.
	AI_Output(self,other, " DIA_ADDON_VATRAS_SEEKERS_01_03 " );	// Even after their death, these people, bound by their oath, remained ghosts and serve their master.
	AI_Output(self,other, " DIA_ADDON_VATRAS_SEEKERS_01_04 " );	// Try to stay away from them! For they are extremely dangerous creatures...
};

instance DIA_Vatras_RitualInnosEyeRepair(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_RitualInnosEyeRepair_Condition;
	information = DIA_Vatras_RitualInnosEyeRepair_Info;
	permanent = TRUE;
	description = " What's up with the Eye of Innos? " ;
};

func int DIA_Vatras_RitualInnosEyeRepair_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Vatras_RitualInnosEyeRepair_Info()
{
	AI_Output(other,self, " DIA_Vatras_RitualInnosEyeRepair_15_00 " );	// How is the Eye of Innos?
	AI_Output(self,other, " DIA_Vatras_RitualInnosEyeRepair_05_01 " );	// Remember: only the ritual of turning in the Circle of the Sun, along with Xardas and Pyrokar, will restore the Eye.
	AI_Output(self,other, " DIA_Vatras_RitualInnosEyeRepair_05_02 " );	// And don't forget to bring the Eye with the repaired frame.
};


instance DIA_Vatras_BEGINN (C_Info)
{
	npc = VLK_439_Vatras;
	nr = 31;
	condition = DIA_Vatras_BEGINN_Condition;
	information = DIA_Vatras_BEGINN_Info;
	description = " I did everything you told me to. " ;
};

func int DIA_Vatras_BEGINN_Condition()
{
	if((Kapitel == 3) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(Xardas,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(Pyrokar,"NW_TROLLAREA_RITUAL_02") < 2000) && Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) && (MIS_Bennet_InnosEyeRepairedSetting == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Vatras_BEGINN_Info()
{
	AI_Output(other,self, " DIA_Vatras_BEGINN_15_00 " );	// I did everything you told me! Here is the repaired Eye.
	B_GivePlayerXP(XP_RitualInnosEyeRuns);
	B_GiveInvItems(other,self,ItMi_InnosEye_Broken_Mis,1);
	Npc_RemoveInvItem(self,ItMi_InnosEye_Broken_Mis);
	AI_Output(self,other, " DIA_Vatras_BEGINN_05_01 " );	// Yes, now everything is ready for the ritual.
	AI_Output(other,self, " DIA_Vatras_BEGINN_15_02 " );	// What about swamp grass?
	AI_Output(self,other, " DIA_Vatras_BEGINN_05_03 " );	// Oh, yes. Have you brought three stalks of swamp grass?
	if(B_GiveInvItems(other,self,ItPl_SwampHerb,3))
	{
		AI_Output(other,self, " DIA_Vatras_BEGINN_15_04 " );	// Here are three plants.
		AI_Output(self,other, " DIA_Vatras_BEGINN_05_05 " );	// Great!
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(other,self, " DIA_Vatras_BEGINN_15_06 " );	// No, my God, no!
		AI_Output(self,other, " DIA_Vatras_BEGINN_05_07 " );	// Good! Then we'll have to do without it.
	};
	AI_Output(self,other, " DIA_Vatras_BEGINN_05_08 " );	// You did a good job, but now step aside so we can start the ceremony. May our souls unite!
	Info_ClearChoices(DIA_Vatras_BEGINN);
	Info_AddChoice(DIA_Vatras_BEGINN,Dialog_End,DIA_Vatras_BEGINN_los);
};

func void DIA_Vatras_BEGINN_los()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYE");
	B_StartOtherRoutine(Xardas,"RITUALINNOSEYE");
	B_StartOtherRoutine(Pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk(self,60);
	RitualInnosEyeRuns = LOG_Running;
};


instance DIA_Vatras_EYEHEALED (C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_AUGEGEHEILT_Condition;
	information = DIA_Vatras_AUGEHEILT_Info;
	important = TRUE;
};

func int DIA_Vatras_AUGEGEHEILT_Condition()
{
	if((Kapitel == 3) && (RitualInnosEyeRuns == LOG_Running) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_AUGEGEHEILT_Info()
{
	AI_Output(self,other, " DIA_Vatras_AUGEGEHEILT_05_00 " );	// That's great! We managed to thwart the enemy's plan and heal the eye.
	AI_Output(self,other, " DIA_Vatras_AUGEGEHEILT_05_01 " );	// Let Pyrokar teach you how to use his power.

	if (( JOINWATERRING  ==  TRUE ) && ( YARKENDARTROUBLE  ==  FALSE ) && ( RavenAway ==  TRUE ) && ( AWORCINVASIONSTART  ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Vatras_AUGEGEHEILT_05_03 " );	// And one more thing. Since you are a member of our secret society 'Ring of Water', I have a very important task for you.
		AI_Output(self,other, " DIA_Vatras_AUGEGEHEILT_05_04 " );	// We haven't received any news from our expedition in Yarkendar for a long time. This fact worries me a lot!
		AI_Output(self,other, " DIA_Vatras_AUGEGEHEILT_05_05 " );	// You should get there as soon as possible and find out what happened there. This matter is urgent!
		AI_Output(self,other, " DIA_Vatras_AUGEGEHEILT_05_06 " );	// But before you go there, be sure to talk to Pyrokar. That's it.
		MIS_ADW_NEWSVATRAS = LOG_Running;
		Log_CreateTopic(TOPIC_ADW_NEWSVATRAS,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADW_NEWSVATRAS,LOG_Running);
		Log_AddEntry( TOPIC_ADW_NEWSVATRAS , " Vatras hasn't heard from the Water Mages in Yarkendar for a long time. He wants me to go there and find out what happened. " );
		YARKENDARTROUBLE = TRUE;
	};
	AI_Output(self,other, " DIA_Vatras_AUGEGEHEILT_05_02 " );	// I hope to see you again when you've completed your task. Good luck!
	B_LogEntry( TOPIC_INNOSEYE , " The eye is healed. Pyrocar will give it to me and tell me how to use it. " );
	AI_StopProcessInfos(self);
	RitualInnosEyeRuns = LOG_SUCCESS;
	MIS_RitualInnosEyeRepair = LOG_SUCCESS;
	B_StartOtherRoutine(Pyrokar,"RitualInnosEyeRepair");
	B_StartOtherRoutine(Xardas,"RitualInnosEyeRepair");
	B_StartOtherRoutine(VLK_455_Buerger,"START");
	B_StartOtherRoutine(VLK_454_Buerger,"START");
	B_StartOtherRoutine(VLK_428_Buergerin,"START");
	B_StartOtherRoutine(VLK_450_Buerger,"START");
	B_StartOtherRoutine(VLK_426_Buergerin,"START");
};


DIA_VATRAS_NEWSFORVATRAS (C_Info) instance
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = dia_vatras_newsforvatras_condition;
	information = dia_vatras_newsforvatras_info;
	description = " About the news from the expedition... " ;
};


func int dia_vatras_newsforvatras_condition()
{
	if((YARKENDARTROUBLE == TRUE) && (AWORCINVASIONSTOP == TRUE) && (NEWSFORVATRAS == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_newsforvatras_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Vatras_NewsForVatras_01_00 " );	// Regarding the news from the expedition...
	AI_Output(self,other, " DIA_Vatras_NewsForVatras_01_01 " );	// Yes? What can you report?
	AI_Output(other,self, " DIA_Vatras_NewsForVatras_01_02 " );	// Orcs have invaded the valley. Saturas and the other mages had to hide in a temple near the ancient ruins.
	AI_Output(other,self, " DIA_Vatras_NewsForVatras_01_03 " );	// They feared that the orcs would infiltrate Khorinis through the portal.
	AI_Output(other,self, " DIA_Vatras_NewsForVatras_01_06 " );	// But now everything is fine. I fixed this problem!
	AI_Output(other,self, " DIA_Vatras_NewsForVatras_01_07 " );	// All the Waterbenders are safe and have begun to study the ancient relics of Yarkendar again.
	AI_Output(self,other, " DIA_Vatras_NewsForVatras_01_08 " );	// May Adanos bless you, my son! You bring truly good news.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	MIS_ADW_NEWSVATRAS = LOG_SUCCESS ;
	Log_AddEntry( TOPIC_ADW_NEWSVATRAS , " I told Vatras about what happened in Yarkendar. He was very pleased that I was able to help the Waterbenders solve this problem with the orcs. " );
	Log_SetTopicStatus(TOPIC_ADW_NEWSVATRAS,LOG_SUCCESS);
	NEWSFORVATRAS = TRUE;
};


DIA_Vatras_PERMKAP3 (C_Info) instances
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_PERMKAP3_Condition;
	information = DIA_Vatras_PERMKAP3_Info;
	description = " Thank you for helping me restore the Eye of Innos. " ;
};


func int DIA_Vatras_PERMKAP3_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_PERMKAP3_Info()
{
	AI_Output(other,self, " DIA_Vatras_PERMKAP3_15_00 " );	// Thank you for helping restore the Eye of Innos.
	AI_Output(self,other, " DIA_Vatras_PERMKAP3_05_01 " );	// Leave empty thanks. The hardest part is still ahead of you.
	if(MIS_ReadyforChapter4 == FALSE)
	{
		AI_Output(self,other, " DIA_Vatras_PERMKAP3_05_02 " );	// Talk to Pyrocar, he'll explain everything you need to know.
	};
	AI_Output(self,other, " DIA_Vatras_PERMKAP3_05_03 " );	// I hope to see you again safe and sound, my son.
};


instance DIA_Vatras_HILDAKRANK(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 34;
	condition = DIA_Vatras_HILDAKRANK_Condition;
	information = DIA_Vatras_HILDAKRANK_Info;
	description = " Lobart's wife, Hilda, is ill. " ;
};


func int DIA_Vatras_HILDAKRANK_Condition()
{
	if ((MIS_HealHilda == LOG_Running) && Npc_KnowsInfo(other,DIA_Vatras_GREET) && ( CAPTAINORDERDIAWAY  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Vatras_HILDAKRANK_Info()
{
	AI_Output(other,self, " DIA_Vatras_HILDAKRANK_15_00 " );	// Lobart's wife, Hilda, is ill.
	AI_Output(self,other, " DIA_Vatras_HILDAKRANK_05_01 " );	// What? Again? This kind woman should take care of herself more.
	AI_Output(self,other, " DIA_Vatras_HILDAKRANK_05_02 " );	// Another hard winter, and it won't be with us anymore. Okay, I'll give her some medicine to ease the fever.
	AI_Output(self,other, " DIA_Vatras_HILDAKRANK_05_03 " );	// Oh, you know, since you're here anyway, you could bring it to her.
	CreateInvItems(self,ItPo_HealHilda_MIS,1);
	B_GiveInvItems(self,other,ItPo_HealHilda_MIS,1);
};


instance DIA_Vatras_OBSESSION(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 35;
	condition = DIA_Vatras_OBSESSION_Condition;
	information = DIA_Vatras_OBSESSION_Info;
	description = " I feel inner turmoil. " ;
};


func int DIA_Vatras_OBSESSION_Condition()
{
	if((SC_IsObsessed == TRUE) && (SC_ObsessionTimes < 1) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_OBSESSION_Info()
{
	AI_Output(other,self, " DIA_Vatras_OBSESSION_15_00 " );	// I feel inner anxiety.
	AI_Output(self,other, " DIA_Vatras_OBSESSION_05_01 " );	// Yes, and you look pale. You have been exposed to the black gaze of the dark wanderers for too long.
	AI_Output(self,other, " DIA_Vatras_OBSESSION_05_02 " );	// All I can do is heal your body, but only a monastery can cleanse your soul. Talk to Pirokar. He will help you.
};


instance DIA_Vatras_AllDragonsDead(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 59;
	condition = DIA_Vatras_AllDragonsDead_Condition;
	information = DIA_Vatras_AllDragonsDead_Info;
	description = " Dragons will no longer wreak havoc. " ;
};


func int DIA_Vatras_AllDragonsDead_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Vatras_AllDragonsDead_Info()
{
	AI_Output(other,self, " DIA_Vatras_AllDragonsDead_15_00 " );	// Dragons will no longer wreak havoc.
	AI_Output(self,other, " DIA_Vatras_AllDragonsDead_05_01 " );	// I knew you'd be back in good health. However, the most severe test is still ahead of you.
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//Я знаю.
	AI_Output(self,other, " DIA_Vatras_AllDragonsDead_05_03 " );	// Then get yourself some better gear and come to me if you need help. And always carry the Eye of Innos with you, do you hear? Adanos blesses you.
};


instance DIA_Vatras_KnowWhereEnemy(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_KnowWhereEnemy_Condition;
	information = DIA_Vatras_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = " I know where our enemy is. " ;
};


func int DIA_Vatras_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Vatras_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_KnowWhereEnemy_Info()
{
	AI_Output(other,self, " DIA_Vatras_KnowWhereEnemy_15_00 " );	// I know where our enemy is.
	AI_Output(self,other, " DIA_Vatras_KnowWhereEnemy_05_01 " );	// Then let's not waste time and find him in his lair before he comes to us.
	AI_Output(other,self, " DIA_Vatras_KnowWhereEnemy_15_02 " );	// Do you want to accompany me?
	AI_Output(self,other, " DIA_Vatras_KnowWhereEnemy_05_03 " );	// I've been thinking about this a lot. Yes, I have never been so sure of my choice, my friend.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew, " Oddly enough, Vatras has offered to accompany me on my journey. A person with his skills and experience can be very helpful to me. " );
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self, " DIA_Vatras_KnowWhereEnemy_15_04 " );	// There are already too many people on my list. I'm afraid there's no room for you.
		AI_Output(self,other, " DIA_Vatras_KnowWhereEnemy_05_05 " );	// So make room. I'll need you.
	}
	else
	{
		Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy, " I need to think about this more. " ,DIA_Vatras_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy, " I would be honored to have you by my side. " ,DIA_Vatras_KnowWhereEnemy_Yes);
	};
};

func void DIA_Vatras_KnowWhereEnemy_Yes()
{
	AI_Output(other,self, " DIA_Vatras_KnowWhereEnemy_Yes_15_00 " );	// I'll be honored to have you by my side. Meet me at the harbor.
	AI_Output(self,other, " DIA_Vatras_KnowWhereEnemy_Yes_05_01 " );	// Just don't waste your time. Remember, my friend, the enemy does not sleep.
	B_GivePlayerXP(XP_Crewmember_Success);
	Vatras_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	B_Vatras_GeheWeg(only);
	Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
};

func void DIA_Vatras_KnowWhereEnemy_No()
{
	AI_Output(other,self, " DIA_Vatras_KnowWhereEnemy_No_15_00 " );	// I need to think about this some more.
	AI_Output(self,other, " DIA_Vatras_KnowWhereEnemy_No_05_01 " );	// As you know. Come back to me if you change your mind.
	Vatras_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
};


instance DIA_Vatras_LeaveMyShip(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_LeaveMyShip_Condition;
	information = DIA_Vatras_LeaveMyShip_Info;
	permanent = TRUE;
	description = " You better stay here. The city needs you. " ;
};


func int DIA_Vatras_LeaveMyShip_Condition()
{
	if((Vatras_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_LeaveMyShip_Info()
{
	AI_Output(other,self, " DIA_Vatras_LeaveMyShip_15_00 " );	// You'd better stay here. The city needs you.
	AI_Output(self,other, " DIA_Vatras_LeaveMyShip_05_01 " );	// Maybe you're right. And yet I am ready to accompany you if you so desire. You know it.
	Vatras_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"PRAY");
};


instance DIA_Vatras_StillNeedYou(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_StillNeedYou_Condition;
	information = DIA_Vatras_StillNeedYou_Info;
	permanent = TRUE;
	description = " Let's sail together to the enemy island. " ;
};


func int DIA_Vatras_StillNeedYou_Condition()
{
	if(((Vatras_IsOnBoard == LOG_OBSOLETE) || (Vatras_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_StillNeedYou_Info()
{
	AI_Output(other,self, " DIA_Vatras_StillNeedYou_15_00 " );	// Escort me to the enemy's island.
	AI_Output(self,other, " DIA_Vatras_StillNeedYou_05_01 " );	// Wise decision! I hope you stop there.
	Vatras_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	B_Vatras_GeheWeg(only);
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_Addon_Vatras_PISSOFFFOREVVER(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_PISSOFFFOREVVER_Condition;
	information = DIA_Addon_Vatras_PISSOFFFOREVVER_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Addon_Vatras_PISSOFFFOREVVER_Condition()
{
	if((VatrasPissedOffForever == TRUE) && (Kapitel >= 5) && Npc_IsInState(self,ZS_Talk) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_PISSOFFFOREVVER_Info()
{
	B_VatrasPissedOff();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_VATRAS_PRAYFORGOMEZ (C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_prayforgomez_condition;
	information = dia_addon_vatras_prayforgomez_info;
	permanent = FALSE;
	description = " I need the blessing of Adanos. " ;
};


func int dia_addon_vatras_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_prayforgomez_info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_PrayForGomez_01_00 " );	// I need the blessing of Adanos.
	AI_Output(self,other, " DIA_Addon_Vatras_PrayForGomez_01_03 " );	// Who are you talking about, my son?
	AI_Output(other,self, " DIA_Addon_Vatras_PrayForGomez_01_04 " );	// I wanted Adanos to grant forgiveness to one of the restless souls in this world.
	AI_Output(self,other, " DIA_Addon_Vatras_PrayForGomez_01_05 " );	// Hmmm. This changes things a bit.
	AI_Output(self,other, " DIA_Addon_Vatras_PrayForGomez_01_06 " );	// And whose soul is this?
	AI_Output(other,self, " DIA_Addon_Vatras_PrayForGomez_01_07 " );	// In life, his name was Gomez. He's a former ore baron!
	AI_Output(self,other, " DIA_Addon_Vatras_PrayForGomez_01_20 " );	// To another who would come to me with such a request, I would immediately refuse.
	AI_Output(self,other, " DIA_Addon_Vatras_PrayForGomez_01_21 " );	// But not for you.
	AI_Output(other,self, " DIA_Addon_Vatras_PrayForGomez_01_22 " );	// Does this mean that his soul will receive the forgiveness of Adanos?
	AI_Output(self,other, " DIA_Addon_Vatras_PrayForGomez_01_23 " );	// Yes, I'll help you.
	Info_ClearChoices(dia_addon_vatras_prayforgomez);
	Info_AddChoice(dia_addon_vatras_prayforgomez, " (ask Adanos' blessing) " ,dia_addon_vatras_prayforgomez_ok);
};

func void dia_addon_vatras_prayforgomez_ok()
{
	B_GivePlayerXP(200);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DIA_Addon_Vatras_PrayForGomez_Ok_01_00 " );	// The divine wisdom of Adanos and the power given to me by Water...
	AI_Output(self,other, " DIA_Addon_Vatras_PrayForGomez_Ok_01_01 " );	// ...I grant forgiveness to this sinful soul...
	AI_Output(self,other, " DIA_Addon_Vatras_PrayForGomez_Ok_01_02 " );	// ...and may the sacred Water cleanse her of her sins...
	AI_Output(self,other, " DIA_Addon_Vatras_PrayForGomez_Ok_01_03 " );	// ...and give her rest in this world!
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DIA_Addon_Vatras_PrayForGomez_Ok_01_04 " );	// That's all. Now you can go, my son.
	AI_Output(self,other, " DIA_Addon_Vatras_PrayForGomez_Ok_01_05 " );	// May Adanos be with you!
	RESCUEGOMEZPRAYADANOS = TRUE ;
	B_LogEntry( TOPIC_RESCUEGOMEZ , " I received forgiveness for Gomez's soul from the Watermage, Vatras. " );
	if((RESCUEGOMEZPRAYINNOS == TRUE) && (RESCUEGOMEZPRAYBELIAR == TRUE) && (RESCUEGOMEZPRAYADANOS == TRUE))
	{
		RESCUEGOMEZSTEPONEDONE = TRUE;
		RESCUEGOMEZSTEPTWO = TRUE;
		Log_AddEntry( TOPIC_RESCUEGOMEZ , " I have received forgiveness for Gomez's soul from all the gods. Now I must go to the Old Mine. " );
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_VATRAS_ABOUTORKS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_aboutorks_condition;
	information = dia_addon_vatras_aboutorks_info;
	permanent = FALSE;
	description = " What is the situation in the monastery? " ;
};


func int dia_addon_vatras_aboutorks_condition()
{
	if((KAPITELORCATC == TRUE) && (GATHERALLONBIGFARM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_aboutorks_info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_AboutOrks_01_00 " );	// What is the situation in the monastery?
	AI_Output(self,other, " DIA_Addon_Vatras_AboutOrks_01_01 " );	// It's all right, my son. We are all safe here for now!
	AI_Output(self,other, " DIA_Addon_Vatras_AboutOrks_01_02 " );	// However, I am very worried about the things that are now happening outside of its walls.
	AI_Output(other,self, " DIA_Addon_Vatras_AboutOrks_01_04 " );	// I'm afraid to upset you, but the situation is even worse there!
	AI_Output(other,self, " DIA_Addon_Vatras_AboutOrks_01_05 " );	// Orcs have almost completely captured this part of the island, and only Onar's farm has not yet been attacked by them.
	AI_Output(self,other, " DIA_Addon_Vatras_AboutOrks_01_06 " );	// O almighty Adanos! And how could you let that happen?
};


instance DIA_ADDON_VATRAS_ABOUTWATERMAGE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_aboutwatermage_condition;
	information = dia_addon_vatras_aboutwatermage_info;
	permanent = FALSE;
	description = " Where are the rest of the Waterbenders? " ;
};


func int dia_addon_vatras_aboutwatermage_condition()
{
	if((KAPITELORCATC == TRUE) && (GATHERALLONBIGFARM == FALSE) && (BEWAREWATERMAGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_aboutwatermage_info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_AboutWaterMage_01_00 " );	// Where are the rest of the Waterbenders?
	AI_Output(self,other, " DIA_Addon_Vatras_AboutWaterMage_01_01 " );	// I believe that they are still in an unknown part of the island.
	AI_Output(self,other, " DIA_Addon_Vatras_AboutWaterMage_01_02 " );	// And to be honest, I'm really worried about all this!
	AI_Output(other,self, " DIA_Addon_Vatras_AboutWaterMage_01_03 " );	// What exactly is troubling you?
	AI_Output(self,other, " DIA_Addon_Vatras_AboutWaterMage_01_04 " );	// They probably don't know yet that the orcs have invaded Khorinis.
	AI_Output(other,self, " DIA_Addon_Vatras_AboutWaterMage_01_06 " );	// Then you need to somehow warn them about it.
	AI_Output(self,other, " DIA_Addon_Vatras_AboutWaterMage_01_07 " );	// I completely agree with you, my son! However, I myself am not allowed to leave the walls of this monastery now.
	AI_Output(self,other, " DIA_Addon_Vatras_AboutWaterMage_01_08 " );	// Because Pirokar and his Firebenders still need my help to protect the monastery from these creatures.
	AI_Output(self,other, " DIA_Addon_Vatras_AboutWaterMage_01_09 " );	// Hmmm...(thoughtfully) You might as well tell them the news.
	Info_ClearChoices(dia_addon_vatras_aboutwatermage);
	Info_AddChoice(dia_addon_vatras_aboutwatermage, " I don't have time for this right now. " ,dia_addon_vatras_aboutwatermage_no);
	Info_AddChoice(dia_addon_vatras_aboutwatermage, " Why not? " ,dia_addon_vatras_aboutwatermage_ok);
};

func void dia_addon_vatras_aboutwatermage_no()
{
	AI_Output(other,self, " DIA_Addon_Vatras_AboutWaterMage_No_01_00 " );	// I don't have time for this right now.
	AI_Output(self,other, " DIA_Addon_Vatras_AboutWaterMage_No_01_01 " );	// Of course, my son. I understand.
	Info_ClearChoices(dia_addon_vatras_aboutwatermage);
};

func void dia_addon_vatras_aboutwatermage_ok()
{
	AI_Output(other,self, " DIA_Addon_Vatras_AboutWaterMage_Ok_01_00 " );	// Why not?
	AI_Output(self,other, " DIA_Addon_Vatras_AboutWaterMage_Ok_01_01 " );	// Thank you, my son. I knew that I could count on your help.
	AI_Output(self,other, " DIA_Addon_Vatras_AboutWaterMage_Ok_01_02 " );	// I'm only begging you, hurry up! We now value every minute.
	MIS_BEWAREWATERMAGE = LOG_Running;
	Log_CreateTopic(TOPIC_BEWAREWATERMAGE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BEWAREWATERMAGE,LOG_Running);
	B_LogEntry( TOPIC_BEWAREWATERMAGE , " Vatras asked me to warn the other Waterbenders of the danger that awaits them in Khorinis. " );
	Info_ClearChoices(dia_addon_vatras_aboutwatermage);
};


instance DIA_ADDON_VATRAS_ABOUTWATERMAGEDONE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_aboutwatermagedone_condition;
	information = dia_addon_vatras_aboutwatermagedone_info;
	permanent = FALSE;
	description = " I warned the other Waterbenders of the danger. " ;
};


func int dia_addon_vatras_aboutwatermagedone_condition()
{
	if((MIS_BEWAREWATERMAGE == LOG_SUCCESS) && (MOVEFORCESCOMPLETE_01 == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_aboutwatermagedone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_Vatras_AboutWaterMageDone_01_01 " );	// I warned the other Waterbenders of the danger.
	AI_Output(self,other, " DIA_Addon_Vatras_AboutWaterMageDone_01_02 " );	// All right, my son. I'm glad you managed to do it.
	AI_Output(self,other, " DIA_Addon_Vatras_AboutWaterMageDone_01_03 " );	// Here, take this gold from me as my thanks. You deserve this award!
	B_GiveInvItems(self,other,ItMi_Gold,1000);
};


instance DIA_ADDON_VATRAS_ABOUTBIGBATTLE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_aboutbigbattle_condition;
	information = dia_addon_vatras_aboutbigbattle_info;
	permanent = FALSE;
	description = " The battle with the orcs promises to be difficult. " ;
};


func int dia_addon_vatras_aboutbigbattle_condition()
{
	if((MOVEFORCESCOMPLETE_01 == TRUE) && (MOVEFORCESCOMPLETE_02 == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_aboutbigbattle_info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_AboutBigBattle_01_00 " );	// Fighting the orcs promises to be difficult.
	AI_Output(self,other, " DIA_Addon_Vatras_AboutBigBattle_01_01 " );	// Don't worry about us... (smiling) We're ready for it.
};


instance DIA_ADDON_VATRAS_AFTERBIGBATTLE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_afterbigbattle_condition;
	information = dia_addon_vatras_afterbigbattle_info;
	permanent = FALSE;
	description = " How are you? " ;
};


func int dia_addon_vatras_afterbigbattle_condition()
{
	if((STOPBIGBATTLE == TRUE) && (ALLGUARDIANSKILLED == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_afterbigbattle_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AfterBigBattle_01_00");	//Как ты?
	AI_Output(self,other, " DIA_Addon_Vatras_AfterBigBattle_01_01 " );	// I'm fine, my son.
	AI_Output(self,other, " DIA_Addon_Vatras_AfterBigBattle_01_02 " );	// However, as you can see, the same cannot be said for the rest of us.
	AI_Output(self,other, " DIA_Addon_Vatras_AfterBigBattle_01_03 " );	// (grimly) So many of us died...
	AI_Output(self,other, " DIA_Addon_Vatras_AfterBigBattle_01_04 " );	// It's extremely hard for me to watch all this.
};


instance DIA_ADDON_VATRAS_RUNEMAGICNOTWORK(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_runemagicnotwork_condition;
	information = dia_addon_vatras_runemagicnotwork_info;
	permanent = FALSE;
	description = " Can you still use your rune magic? " ;
};


func int dia_addon_vatras_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (WATERMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_Vatras_RuneMagicNotWork_01_00 " );	// Can you still use your rune magic?
	AI_Output(self,other, " DIA_Addon_Vatras_RuneMagicNotWork_01_01 " );	// I'm afraid to upset you, my son. All of my magical runes have somehow lost their power.
	AI_Output(self,other, " DIA_Addon_Vatras_RuneMagicNotWork_01_02 " );	// And not only for me, but for other Waterbenders too! And I have no idea how this could happen.
	AI_Output(self,other, " DIA_Addon_Vatras_RuneMagicNotWork_01_03 " );	// Perhaps something terrible and irreparable happened in this world, if now we all suddenly lost this gift.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " It seems the Waterbenders have also lost their ability to use rune magic. " );
	WATERMAGERUNESNOT = TRUE;
};


// -------------------- Yarkendar's ruler about undead ------------------------ -------

instance DIA_Vatras_JarCurse(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_JarCurse_Condition;
	information = DIA_Vatras_JarCurse_Info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Vatras_JarCurse_Condition()
{
	if (Npc_IsInState(self,ZS_Talk) && (MY_DarkOrder == LOG_Success) && (HagenSendVat ==  TRUE ) && (DO_SendToHagen ==  TRUE ) && (Chapter <  6 )) ;
	{
		return TRUE;
	};
};

func void DIA_Vatras_JarCurse_Info()
{
	AI_Output(self,other, " DIA_Vatras_JarCurse_01_00 " );	// It's good that you came, my son!
	AI_Output(other,self, " DIA_Vatras_JarCurse_01_01 " );	// What did you want to talk to me about?
	AI_Output(self,other, " DIA_Vatras_JarCurse_01_02 " );	// Looks like we're in dark times. So I have to turn to you for help!
	AI_Output(other,self, " DIA_Vatras_JarCurse_01_03 " );	// I'm listening to you carefully.
	AI_Output(self,other, " DIA_Vatras_JarCurse_01_04 " );	// Recently, I heard rumors that not far from our excavations near the pyramids, several dead warriors were seen.
	AI_Output(self,other, " DIA_Vatras_JarCurse_01_05 " );	// However, they weren't like the undead we've encountered here before!
	AI_Output(self,other, " DIA_Vatras_JarCurse_01_06 " );	// I've already sent Mixir and another of our brothers there to clarify the situation.
	AI_Output(self,other, " DIA_Vatras_JarCurse_01_07 " );	// But still no news from them.
	AI_Output(self,other, " DIA_Vatras_JarCurse_01_08 " );	// All this worries me a lot. Has anything bad happened to them?
	AI_Output(other,self, " DIA_Vatras_JarCurse_01_09 " );	// I understand what you're getting at.
	AI_Output(self,other, " DIA_Vatras_JarCurse_01_10 " );	// So I can count on your help?
	Info_ClearChoices(DIA_Vatras_JarCurse);
	Info_AddChoice(DIA_Vatras_JarCurse, " Of course! I'll help you. " ,DIA_Vatras_JarCurse_Yes);
	// Info_AddChoice(DIA_Vatras_JarCurse,"Sorry, I don't have time for this right now.",DIA_Vatras_JarCurse_No);
};

func void DIA_Vatras_JarCurse_Yes()
{
	AI_Output(other,self, " DIA_Vatras_JarCurse_Yes_01_01 " );	// Of course. I will help you.
	AI_Output(self,other, " DIA_Vatras_JarCurse_Yes_01_02 " );	// Thank you, my son. It was very noble of you.
	AI_Output(other,self, " DIA_Vatras_JarCurse_Yes_01_03 " );	// Okay, let's leave all these boasts. Better tell me, how long ago did you send Mixir to dig?
	AI_Output(self,other, " DIA_Vatras_JarCurse_Yes_01_04 " );	// Three days ago. So better hurry before it's too late.
	AI_Output(other,self, " DIA_Vatras_JarCurse_Yes_01_05 " );	// Then I'll go there immediately.
	MIS_JarCurse = LOG_Running;
	Log_CreateTopic(TOPIC_JarCurse,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JarCurse,LOG_Running);
	B_LogEntry(TOPIC_JarCurse, " According to Vatras, several dead warriors were seen near the Waterbenders' excavations near the pyramids. Vatras sent Mixir and another magician there to look into the situation. However, there is still no news from them! Vatras asked me to go to the pyramids and find out everything you can. " );	
	AI_StopProcessInfos(self);
	B_KillNpc(pal_188_ritter);
	B_KillNpc(pal_189_ritter);
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_01");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_03");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_04");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_10");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_09");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_12");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_23");
	Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_24");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_25");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_20");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_19");
	Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_21");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_17");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_16");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_18");
	Wld_InsertNpc(Ancient_Warrior_01,"NW_TROLLAREA_PORTALTEMPEL_22");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTALTEMPEL_21");
	Wld_InsertNpc(Ancient_Warrior_02,"NW_TROLLAREA_PORTALTEMPEL_23");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTALTEMPEL_STUDY_02");
	Wld_InsertNpc(Ancient_Warrior_01,"NW_TROLLAREA_PORTALTEMPEL_25");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTAL_01");
	Wld_InsertNpc(Ancient_Warrior_02,"NW_TROLLAREA_PORTALTEMPEL_STUDY_03");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTAL_KDWWAIT_06");
	Wld_InsertNpc(Ancient_Warrior_01,"NW_TROLLAREA_PORTAL_KDWWAIT_02");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTAL_KDWWAIT_04A");
	Wld_InsertNpc(Ancient_Warrior_02,"FP_SMALLTALK_NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_SMALLTALK_NW_TROLLAREA_PORTALTEMPEL_01");
	Wld_InsertNpc(Skeleton_Shadow_Priest_JC,"EXIT_ADDON");

	// ------attack Mixira and Mithras--------------------------------

	Wld_InsertNpc(Ancient_Warrior_01,"NW_TROLLAREA_PORTALTEMPEL_41");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_02");
	Wld_InsertNpc(Ancient_Warrior_02,"NW_TROLLAREA_PORTALTEMPEL_40");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTALTEMPEL_STUDY_04");
};

func void DIA_Vatras_JarCurse_No()
{
	AI_Output(other,self, " DIA_Vatras_JarCurse_No_01_01 " );	// Sorry, but I don't have time for this right now.
	AI_Output(self,other, " DIA_Vatras_JarCurse_No_01_02 " );	// As you say, my son. But anyway, thank you for listening to me.
	AI_StopProcessInfos(self);
};

instance DIA_Vatras_JarCurseDone(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Vatras_JarCurseDone_condition;
	information = DIA_Vatras_JarCurseDone_info;
	permanent = FALSE;
	description = " Mixir is back in town again. " ;
};

func int DIA_Vatras_JarCurseDone_condition()
{
	if((MyxirSendSaturas == TRUE) && (Npc_IsDead(KDW_140300_Addon_Myxir_CITY) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_JarCurseDone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Vatras_JarCurseDone_01_01 " );	// Mixer is back in town again.
	AI_Output(self,other, " DIA_Vatras_JarCurseDone_01_02 " );	// Yes, I know. He told me about everything that happened at the excavations of the temple.
	AI_Output(self,other, " DIA_Vatras_JarCurseDone_01_03 " );	// I hope you've already visited Saturas?

	if ( MeetSaturasOkPortal ==  TRUE )
	{
		AI_Output(other,self, " DIA_Vatras_JarCurseDone_01_04 " );	// Of course! I spoke to him.
		AI_Output(self,other, " DIA_Vatras_JarCurseDone_01_05 " );	// So they are alive. This calmed me down a bit.
		AI_Output(self,other, " DIA_Vatras_JarCurseDone_01_06 " );	// But anyway, I thank you for helping me with the Mixer.
	}
	else
	{
		AI_Output(other,self, " DIA_Vatras_JarCurseDone_01_07 " );	// Not yet.
		AI_Output(self,other, " DIA_Vatras_JarCurseDone_01_08 " );	// Then don't waste your time! Go to them immediately.
		AI_Output(other,self, " DIA_Vatras_JarCurseDone_01_09 " );	// Okay, okay. Already going.
	};
};

instance DIA_Vatras_MAXROBE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_MAXROBE_condition;
	information = DIA_Vatras_MAXROBE_info;
	permanent = FALSE;
	description = " How about a better robe? " ;
};

func int DIA_Vatras_MAXROBE_condition()
{
	if ((hero.guild ==  GIL_KDW ) && (Chapter >=  5 ) && (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE ) ==  6 ) && (LastRobeKDW ==  FALSE ) && (MAXROBE_Permanent ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Vatras_MAXROBE_info()
{
	AI_Output(other,self, " DIA_Vatras_MAXROBE_01_00 " );	// How about a better robe?
	AI_Output(self,other, " DIA_Vatras_MAXROBE_01_01 " );	// Since you are proficient with all six circles of magic, you are worthy to wear the robe of the archmage of Water.
	AI_Output(self,other, " DIA_Vatras_MAXROBE_01_02 " );	// However, you will have to pay for it. It's too expensive to make for us to just give it away for nothing.
	AI_Output(other,self,"DIA_Vatras_MAXROBE_01_03");	//Понимаю.
	LastRobeKDW = TRUE;
};

instance DIA_Vatras_MAXROBE_Buy(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_MAXROBE_Buy_condition;
	information = DIA_Vatras_MAXROBE_Buy_info;
	permanent = TRUE;
	description = " Sell me the Robe of the Archmage of Water! (Price: 20000 coins) " ;
};

func int DIA_Vatras_MAXROBE_Buy_condition()
{
	if (( hero . guild ==  GIL_KDW ) && ( LastRobe_KDW ==  TRUE ) && ( MAXROBE_Permanent ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MAXROBE_Buy_info()
{
	AI_Output(other,self, " DIA_Vatras_MAXROBE_Buy_01_00 " );	// Sell me the robe of the Archmage of Water!

	if(Npc_HasItems(hero,ItMi_Gold) >= 20000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,20000);
		Npc_RemoveInvItems(self,ItMi_Gold,20000);
		AI_Output(self,other, " DIA_Vatras_MAXROBE_Buy_01 " );	// Good! Here, hold her.
		AI_Output(self,other, " DIA_Vatras_MAXROBE_Buy_02 " );	// It's a great honor to wear such an attire. Remember this.
		CreateInvItems(self,itar_kdw_sh,1);
		B_GiveInvItems(self,other,itar_kdw_sh,1);
		MAXROBE_Permanent = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Vatras_MAXROBE_Buy_01_03 " );	// You don't have enough gold.
	};
};

instances of DIA_Vatras_WolfAndMan (C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_WolfAndMan_condition;
	information = DIA_Vatras_WolfAndMan_info;
	permanent = FALSE;
	description = " I have a very unusual business with you. " ;
};

func int DIA_Vatras_WolfAndMan_condition()
{
	if((MIS_WolfAndMan == LOG_Running) && (SagittaWereWolf == TRUE) && (WereWolfIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_WolfAndMan_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Vatras_WolfAndMan_01_00 " );	// I have a very unusual business with you.
	AI_Output(self,other, " DIA_Vatras_WolfAndMan_01_01 " );	// Good. I am listening to you.
	AI_Output(other,self, " DIA_Vatras_WolfAndMan_01_02 " );	// One person really needs your help! More precisely, it's like not quite a person ...
	AI_Output(self,other, " DIA_Vatras_WolfAndMan_01_03 " );	// (surprised) You speak in riddles, my son.
	AI_Output(other,self, " DIA_Vatras_WolfAndMan_01_04 " );	// Well, this is a man, but only he is in the body of a beast!
	AI_Output(other,self, " DIA_Vatras_WolfAndMan_01_05 " );	// A transformation spell was cast on him, but he could not return to his body.
	AI_Output(self,other, " DIA_Vatras_WolfAndMan_01_06 " );	// (seriously) And you want me to change him back to his human form? I'm right?
	AI_Output(other,self, " DIA_Vatras_WolfAndMan_01_07 " );	// That's right.
	AI_Output(self,other, " DIA_Vatras_WolfAndMan_01_08 " );	// Sorry. I don't want to upset you, but I'm afraid no one can help him with this.
	AI_Output(self,other, " DIA_Vatras_WolfAndMan_01_09 " );	// Such things are beyond anyone's control! Even to the most powerful mages of this world.
	AI_Output(self,other, " DIA_Vatras_WolfAndMan_01_10 " );	// The only thing I can do is restore his human consciousness.
	AI_Output(self,other, " DIA_Vatras_WolfAndMan_01_11 " );	// He will remain in the body of the beast, but will think and reason like a man.
	AI_Output(other,self, " DIA_Vatras_WolfAndMan_01_12 " );	// Well, then at least do that.
	AI_Output(self,other, " DIA_Vatras_WolfAndMan_01_13 " );	// (seriously) Okay, wait a minute...
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Vatras_WolfAndMan_01_14 " );	// Here, take this magic scroll and use it on that beast.
	B_GiveInvItems(self,other,ItWr_VatrasTransferMagic,1);
	AI_Output(self,other, " DIA_Vatras_WolfAndMan_01_15 " );	// But don't ask for more...
	AI_Output(other,self, " DIA_Vatras_WolfAndMan_01_16 " );	// Good. I understand.
	VatrasGiveSpell = TRUE;
	; _ _ _ _
};

instance DIA_ADDON_VATRAS_WISP(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = dia_addon_vatras_wisp_condition;
	information = dia_addon_vatras_wisp_info;
	description = " Can you help me in my search? " ;
};

func int dia_addon_vatras_wisp_condition()
{
	if(MIS_Vatras_FindTheBanditTrader != FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_wisp_info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_Waffen_WISP_15_00 " );	// Can you help me in my search?
	AI_Output(self,other, " DIA_Addon_Vatras_Waffen_WISP_05_01 " );	// You are a very persistent young man. But I can really give you something to make it easier for you.
	AI_Output(self,other, " DIA_Addon_Vatras_Waffen_WISP_05_02 " );	// I'll give you this amulet. You will need it.
	B_GiveInvItems(self,other,ItAm_Addon_WispDetector,1);
	AI_Output(self,other, " DIA_Addon_Vatras_Waffen_WISP_05_03 " );	// This is the amulet of the Seeking Wisp.
	AI_Output(self,other, " DIA_Addon_Vatras_Waffen_WISP_05_04 " );	// Very rare item! The seeker flame that lives in this amulet has special properties.
	AI_Output(self,other, " DIA_Addon_Vatras_Waffen_WISP_05_05 " );	// It will help you find items that you might not find without it.
	// AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_06"); //To summon a wisp, simply put on the amulet.
	// AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_07"); //If the wisp loses its power or is lost, remove the amulet and put it on again, and the wisp will return.
	AI_Output(self,other, " DIA_Addon_Vatras_Waffen_WISP_05_10 " );	// Keep him safe and he will never let you down.
	Info_ClearChoices(dia_addon_vatras_wisp);
	Info_AddChoice(dia_addon_vatras_wisp, " Thank you! I'll definitely use it. " ,dia_addon_vatras_wisp_thanks);
	Info_AddChoice(dia_addon_vatras_wisp, " What else can a Seeking Wisp do? " ,dia_addon_vatras_wisp_morewisp);
	Info_AddChoice(dia_addon_vatras_wisp, " Looking for the Wisp in the Amulet? " ,dia_addon_vatras_wisp_amulett);
	SC_GotWisp = TRUE;
};

func void dia_addon_vatras_wisp_thanks()
{
	AI_Output(other,self, " DIA_Addon_Vatras_Waffen_Thanks_15_00 " );	// Thank you! I will definitely use it.
	Info_ClearChoices(dia_addon_vatras_wisp);
};

func void dia_addon_vatras_wisp_morewisp()
{
	AI_Output(other,self, " DIA_Addon_Vatras_Waffen_MoreWISP_15_00 " );	// What else can a searching light do?
	AI_Output(self,other, " DIA_Addon_Vatras_Waffen_MoreWISP_05_02 " );	// I think Riordan knows how to train these things. He is one of us, and at the moment he is traveling with Saturas.
	AI_Output(self,other, " DIA_Addon_Vatras_Waffen_MoreWISP_05_03 " );	// Maybe he can tell you more.
};

func void dia_addon_vatras_wisp_amulett()
{
	AI_Output(other,self, " DIA_Addon_Vatras_WISPDETECTOR_was_15_00 " );	// Looking for a spark in an amulet?
	AI_Output(self,other, " DIA_Addon_Vatras_WISPDETECTOR_was_05_01 " );	// Seeking Wisps are amazing creatures. They are made up entirely of magical energy.
	AI_Output(self,other, " DIA_Addon_Vatras_WISPDETECTOR_was_05_02 " );	// They are connected to this world's magical ores. She gives them strength.
	AI_Output(self,other, " DIA_Addon_Vatras_WISPDETECTOR_was_05_03 " );	// I'm not surprised you've never heard of them. They appear only to people who have their native ore with them.
	AI_Output(self,other, " DIA_Addon_Vatras_WISPDETECTOR_was_05_04 " );	// Seeking Wisps were forcibly expelled from their lands.
	AI_Output(self,other, " DIA_Addon_Vatras_WISPDETECTOR_was_05_05 " );	// There's no way we can help these unfortunate creatures. You better stay away from them.
};

var int VatrasInspectRing;
var int VatrasInspectScroll;

instances of DIA_Addon_Vatras_DarkWeb (C_Info)
{
	npc = VLK_439_Vatras;
	nr = 3;
	condition = DIA_Addon_Vatras_DarkWeb_Condition;
	information = DIA_Addon_Vatras_DarkWeb_Info;
	permanent = FALSE;
	description = " Can you see one ring? " ;
};

func int DIA_Addon_Vatras_DarkWeb_Condition()
{
	if ((MY_DarkWeb == LOG_Running) && (Npc_HasItems(hero,ItMy_LotteryRing) >=  1 ) && (FindLotteryRing ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_DarkWeb_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Addon_Vatras_DarkWeb_01_01 " );	// Can you see one ring?
	AI_Output(self,other, " DIA_Addon_Vatras_DarkWeb_01_02 " );	// Of course, my son. Show it to me.
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_01_03");	//Вот.
	B_GiveInvItems(other,self,ItMi_LotarRing,1);
	Npc_RemoveInvItems(self,ItMi_LotarRing,1);
	AI_Output(self,other, " DIA_Addon_Vatras_DarkWeb_01_04 " );	// (doubtfully) It looks like an ordinary silver ring. Although...
	AI_Output(self,other, " DIA_Addon_Vatras_DarkWeb_01_05 " );	// See that faint magical glow around him? Most likely, this is the remnant of exposure to some kind of magic.
	AI_Output(self,other, " DIA_Addon_Vatras_DarkWeb_01_06 " );	// And, as far as I can tell, quite powerful! Only she could leave a magical imprint on this ring.
	AI_Output(other,self, " DIA_Addon_Vatras_DarkWeb_01_07 " );	// And what is this magic?
	AI_Output(self,other, " DIA_Addon_Vatras_DarkWeb_01_08 " );	// Don't know yet. I need time to study this subject more thoroughly. Leave the ring to me and visit me tomorrow.
	VatrasInspectRing = Wld_GetDay();
	B_LogEntry(TOPIC_DarkWeb, " After examining the ring, Vatras concluded that the glow of the ring was caused by powerful magic. He kept the ring for himself to understand the nature of this magic. I should look into it tomorrow. " );
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Vatras_DarkWeb_Done(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 3;
	condition = DIA_Addon_Vatras_DarkWeb_Done_Condition;
	information = DIA_Addon_Vatras_DarkWeb_Done_Info;
	permanent = FALSE;
	description = " Did you learn anything? " ;
};

func int DIA_Addon_Vatras_DarkWeb_Done_Condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if ((MIS_DarkWeb == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Addon_Back_DarkWeb) ==  TRUE ) && (BackInspectRing < DayNow));
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_DarkWeb_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Addon_Vatras_DarkWeb_Done_01_01 " );	// Did you manage to learn anything?
	AI_Output(self,other, " DIA_Addon_Vatras_DarkWeb_Done_01_02 " );	// And even more than I thought. But I have one question for you - where did you get this ring from?
	AI_Output(other,self, " DIA_Addon_Vatras_DarkWeb_Done_01_03 " );	// It belonged to the paladin Lothar, who was recently vilely murdered. And I found the ring not far from the place of the murder.
	AI_Output(self,other, " DIA_Addon_Vatras_DarkWeb_Done_01_04 " );	// Then that explains a lot. This magic is none other than Beliar's dark magic!
	AI_Output(self,other, " DIA_Addon_Vatras_DarkWeb_Done_01_05 " );	// And so strong that it was dangerous even for me to come into contact with it. Whoever used it must be a very powerful mage.
	AI_Output(other,self, " DIA_Addon_Vatras_DarkWeb_Done_01_06 " );	// Is there anything to help you find it?
	AI_Output(self,other, " DIA_Addon_Vatras_DarkWeb_Done_01_07 " );	// What are you thinking?
	AI_Output(other,self, " DIA_Addon_Vatras_DarkWeb_Done_01_08 " );	// Lord Hagen wants the head of Lothar's killer, and I'll stop at nothing until I get it.
	AI_Output(self,other, " DIA_Addon_Vatras_DarkWeb_Done_01_09 " );	// Do you even realize what you're about to face?
	AI_Output(other,self, " DIA_Addon_Vatras_DarkWeb_Done_01_10 " );	// Quite. So will you help me?
	AI_Output(self,other, " DIA_Addon_Vatras_DarkWeb_Done_01_11 " );	// Good. But for this I will need one of the things that belonged to this magician. Without it, all our attempts to determine its location will be in vain.
	AI_Output(other,self, " DIA_Addon_Vatras_DarkWeb_Done_01_12 " );	// Then I'll try to find something.

	B_LogEntry(TOPIC_DarkWeb, " According to Vatras, the imprint on the ring was from Beliar's dark magic. Only a very powerful magician could use such a thing. To track him down, Vatras will need something that the magician has come into contact with. It remains only to figure out where to look for it. " );
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Background_DarkWeb_Wait (C_Info);
{
	npc = VLK_439_Vatras;
	nr = 3;
	condition = DIA_Addon_Vatras_DarkWeb_Wait_Condition;
	information = DIA_Addon_Vatras_DarkWeb_Wait_Info;
	permanent = FALSE;
	description = " I have the magic scroll used by Lothar's killer. " ;
};

func int DIA_Addon_Background_DarkWeb_Wait_Condition();
{
	if ((MY_DarkWeb == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Addon_Back_DarkWeb_Done) ==  TRUE ) && (Npc_HasItems(hero,ItMy_DarkScroll) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Batras_DarkWeb_Wait_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Addon_Vatras_DarkWeb_Wait_01_01 " );	// I have the magic scroll used by Lothar's killer. Will it fit?
	B_GiveInvItems(other,self,ItMi_DarkScroll,1);
	Npc_RemoveInvItems(self,ItMi_DarkScroll,1);
	AI_Output(self,other, " DIA_Addon_Vatras_DarkWeb_Wait_01_02 " );	// (disgusted) I can already feel the magic in it.
	AI_Output(self,other, " DIA_Addon_Vatras_DarkWeb_Wait_01_03 " );	// Now I have to prepare well for what we have planned. For now, you can rest.
	AI_Output(self,other, " DIA_Addon_Vatras_DarkWeb_Wait_01_04 " );	// This will take no more than one day.
	VatrasInspectScroll = Wld_GetDay();
	B_LogEntry(TOPIC_DarkWeb, " I gave the magic scroll to Vatras. Now he needs time to prepare something that will help us find Lothar's killer. We'll have to visit him tomorrow. " );
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Vatras_DarkWeb_Ready(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 3;
	condition = DIA_Addon_Vatras_DarkWeb_Ready_Condition;
	information = DIA_Addon_Vatras_DarkWeb_Ready_Info;
	permanent = FALSE;
	description = " Have you finished your preparations yet? " ;
};

func int DIA_Addon_Vatras_DarkWeb_Ready_Condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if ((MIS_DarkWeb == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Addon_Background_DarkWeb_Wait) ==  TRUE ) && (BackgroundInspectScroll < DayNow));
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_DarkWeb_Ready_Info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_DarkWeb_Ready_01_01 " );	// Have you finished your preparations yet?
	AI_Output(self,other, " DIA_Addon_Vatras_DarkWeb_Ready_01_02 " );	// Yes, take this magical rune.
	B_GiveInvItems(self,other,ItMi_Darktransfer,1);
	AI_Output(self,other, " DIA_Addon_Vatras_DarkWeb_Ready_01_03 " );	// Just use it and it will take you where you find the answer to your question.
	AI_Output(self,other, " DIA_Addon_Vatras_DarkWeb_Ready_01_04 " );	// But my advice to you is: get ready first. What you encounter there may end badly for you.
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_Ready_01_05");	//Спасибо.
	AI_Output(self,other, " DIA_Addon_Vatras_DarkWeb_Ready_01_06 " );	// May Adanos keep you, my son.
	B_LogEntry(TOPIC_DarkWeb, " Vatras gave me a rune that will take me to where Lothar's killer hides. I should be well prepared before using it. " );
	AI_StopProcessInfos(self);
};
