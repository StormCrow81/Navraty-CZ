
instance DIA_Addon_Fisk_EXIT(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 999;
	condition = DIA_Addon_Fisk_EXIT_Condition;
	information = DIA_Addon_Fisk_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Fisk_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Fisk_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Fisk_PICKPOCKET(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 900;
	condition = DIA_Addon_Fisk_PICKPOCKET_Condition;
	information = DIA_Addon_Fisk_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Fisk_PICKPOCKET_Condition()
{
	return  C_Robbery ( 118 , 300 );
};

func void DIA_Addon_Fisk_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Fisk_PICKPOCKET,Dialog_Back,DIA_Addon_Fisk_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Fisk_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Fisk_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fisk_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
};

func void DIA_Addon_Fisk_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
};


instance DIA_Addon_Fisk_Hi (C_Info) .
{
	npc = BDT_1097_Addon_Fisk;
	nr = 1;
	condition = DIA_Addon_Fisk_Hi_Condition;
	information = DIA_Addon_Fisk_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Fisk_Hi_Condition()
{
	if((Npc_GetDistToWP(self,"BL_INN_UP_06") > 500) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Fisk_Hi_Info()
{
	AI_Output(self,other, " DIA_Addon_Fisk_Hi_12_00 " );	// Hey, if you're looking for a merchant, you've found one.
	AI_Output(self,other, " DIA_Addon_Fisk_Hi_12_01 " );	// My shop is behind Esteban's house. If you need anything, come by.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader, " Fisk sells a wide variety of products. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


was int fisharrowsday;

instance DIA_Addon_Fisk_Trade(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 888;
	condition = DIA_Addon_Fisk_Trade_Condition;
	information = DIA_Addon_Fisk_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int DIA_Addon_Fisk_Trade_Condition()
{
	if(((Npc_GetDistToWP(self,"BL_INN_UP_06") > 500) && (FISK_TP == FALSE)) || (Kapitel == 4))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Trade_Info()
{
	where int daynow;
	var int bolzenamount;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_2");
	daynow = Wld_GetDay();

	if(FISKARROWSDAY < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (FISKARROWSDAY < (daynow - 1)))
		{
			boltamount = (chapter *  100 ) + ( 10  * (daynow -  FISKARROWSDAY  -  1 ));
			if(bolzenamount > Npc_HasItems(self,ItRw_Bolt))
			{
				CreateInvItems(self,ItRw_Bolt,bolzenamount - Npc_HasItems(self,ItRw_Bolt));
			};
			if(bolzenamount > Npc_HasItems(self,ItRw_Arrow))
			{
				CreateInvItems(self,ItRw_Arrow,bolzenamount - Npc_HasItems(self,ItRw_Arrow));
			};
			FISH CROWSDAY = daynow;
		};
	};

	B_GiveTradeInv(self);
};


instance DIA_Addon_Fisk_Attentat(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Attentat_Condition;
	info = DIA_Addon_Fisk_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Fisk_Attentat_Condition()
{
	if((MIS_Judas == LOG_Running) && (FISK_TP == FALSE))
	{
		return TRUE;
	};

	return  FALSE ;
};

func void DIA_Addon_Fisk_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other, " DIA_Addon_Fisk_Attentat_12_00 " );	// Look, I have nothing to do with this, okay?
	AI_Output(self,other, " DIA_Addon_Fisk_Attentat_12_01 " );	// I have my own concerns. Besides, I myself became a victim of treachery.
	AI_Output(other,self, " DIA_Addon_Fisk_Attentat_15_02 " );	// How so?
	AI_Output(self,other, " DIA_Addon_Fisk_Attentat_12_03 " );	// For the last batch of goods, I paid a solid amount in gold.
	AI_Output(self,other, " DIA_Addon_Fisk_Attentat_12_04 " );	// But I never received the goods! Some bastard stole it from me.
	AI_Output(self,other, " DIA_Addon_Fisk_Attentat_12_05 " );	// I was robbed by some of my own people!
};


instance DIA_Addon_Fisk_delivery (C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 3;
	condition = DIA_Addon_Fisk_delivery_condition;
	information = DIA_Addon_Fisk_Delivery_Info;
	permanent = FALSE;
	description = " What item were you supposed to get? " ;
};


func int DIA_Addon_Fisk_delivery_condition()
{
	if ((Npc_KnowsInfo(other,DIA_Addon_Fish_Attendant)) && ( FISH_TP  ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Fisk_delivery_info()
{
	AI_Output(other,self, " DIA_Addon_Fisk_Lieferung_15_00 " );	// What item were you supposed to receive?
	AI_Output(self,other, " DIA_Addon_Fisk_Lieferung_12_01 " );	// A package with lockpicks. Someone had to bring it to me from the pirates.
	AI_Output(self,other, " DIA_Addon_Fisk_Lieferung_12_02 " );	// But a guy named Juan stole both the lockpicks and the gold!
	AI_Output(self,other, " DIA_Addon_Fisk_Lieferung_12_03 " );	// The bastard is hiding somewhere in the swamp.
	MIS_Lennar_Lockpick = LOG_Running;
	Log_CreateTopic(Topic_Addon_Fisk,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Fisk,LOG_Running);
	B_LogEntry(TOPIC_Addon_KillJuan, " Juan was trading with the bandits. He's hiding somewhere in the swamps. " );
	B_LogEntry_Quiet(Topic_Addon_Fisk, " A guy named Juan intercepted Fisk's supply (a package of lock picks). He's hiding somewhere in the swamps. " );
};

func void B_Addon_Fisk_AboutJuan()
{
	if (Npc_IsDead(Juan))
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_00");	//The thief Juan is dead.
		AI_Output(self,other, " DIA_Addon_Fisk_AboutJuan_12_01 " );	// So he won't be able to give me any more trouble!
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Fisk_AboutJuan_15_02 " );	// He's still alive...
		AI_Output(self,other, " DIA_Addon_Fisk_AboutJuan_12_03 " );	// Did you let that bastard live?
		AI_Output(other,self, " DIA_Addon_Fisk_AboutJuan_15_04 " );	// He wasn't alone...
		AI_Output(self,other, " DIA_Addon_Fisk_AboutJuan_12_05 " );	// Okay. I'll deal with those thieves myself...
	};
};

func void B_Addon_Fisk_Reward()
{
	AI_Output(self,other, " DIA_Addon_Fisk_Belohnung_12_00 " );	// I think you might be interested...
	AI_Output(self,other, " DIA_Addon_Fisk_Belohnung_12_01 " );	// I have a good relationship with Huno.
	AI_Output(self,other, " DIA_Addon_Fisk_Belohnung_12_02 " );	// I'll talk to him and he'll give you a discount on armor.
	Huno_ArmorCheap = TRUE;
	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_Addon_Fisk_Belohnung_12_03 " );	// Yes, and take this stone. I once received it from Corristo.
		AI_Output(self,other, " DIA_Addon_Fisk_Belohnung_12_04 " );	// It's the only thing I have left after traveling through the Barrier. I think you will find a use for it.
		B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Fisk_Belohnung_12_05 " );	// And I'll give you this weapon.
		if(other.HitChance[NPC_TALENT_2H] > other.HitChance[NPC_TALENT_1H])
		{
			B_GiveInvItems(self,other,ItMw_Streitaxt1,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItMw_Bartaxt,1);
		};
	};
	AI_Output(self,other, " DIA_Addon_Fisk_Belohnung_12_06 " );	// Hand washes hand! An old principle that still works today.
};


instance DIA_Addon_Fisk_GivePaket(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 4;
	condition = DIA_Addon_Fisk_GivePaket_Condition;
	information = DIA_Addon_Fisk_GivePaket_Info;
	permanent = FALSE;
	description = " I brought you your package. " ;
};


func int DIA_Addon_Fisk_GivePaket_Condition()
{
	if((MIS_Lennar_Lockpick == LOG_Running) && (Npc_HasItems(other,ItMi_Addon_Lennar_Paket) >= 1) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Fisk_GivePaket_Info()
{
	AI_Output(other,self, " DIA_Addon_Fisk_GivePaket_15_00 " );	// I brought you your package.
	B_GiveInvItems(other,self,ItMi_Addon_Lennar_Paket,1);
	Npc_RemoveInvItems(self,ItMi_Addon_Lennar_Paket,1);
	MIS_Lennar_Lockpick = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_LennarPaket);
	AI_Output(self,other, " DIA_Addon_Fisk_GivePaket_12_01 " );	// Great... (suspiciously) What about Juan?
	B_Addon_Fisk_AboutJuan();
	B_Addon_Fisk_Reward();
};


instances of DIA_Addon_Fisk_PaketOpen (C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 5;
	condition = DIA_Addon_Fisk_PaketOpen_Condition;
	information = DIA_Addon_Fisk_PaketOpen_Info;
	permanent = FALSE;
	description = " I opened your package! " ;
};


func int DIA_Addon_Fisk_PaketOpen_Condition()
{
	if((MIS_Lennar_Lockpick == LOG_Running) && (LennarPaket_Open == TRUE) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Fisk_PaketOpen_Info()
{
	AI_Output(other,self, " DIA_Addon_Fisk_PaketOpen_15_00 " );	// I opened your package!
	AI_Output(self,other, " DIA_Addon_Fisk_PaketOpen_12_01 " );	// Of course you did...(laughs) You were itching to find out what was inside, weren't you?
	AI_Output(self,other, " DIA_Addon_Fisk_PaketOpen_12_02 " );	// Did you at least bring the lockpicks?
	AI_Output(self,other, " DIA_Addon_Fisk_PaketOpen_12_03 " );	// And more importantly, what about Juan?
	B_Addon_Fisk_AboutJuan();
};


instance DIA_Addon_Fisk_GivePicks(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 6;
	condition = DIA_Addon_Fisk_GivePicks_Condition;
	information = DIA_Addon_Fisk_GivePicks_Info;
	permanent = TRUE;
	description = " Here's your dozen lockpicks. " ;
};


func int DIA_Addon_Fisk_GivePicks_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Addon_Fish_PacketOpen) && (MY_Lennar_Lockpick == LOG_Running) && ( FISH_TP  ==  FALSE )) ;
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Fisk_GivePicks_Info()
{
	AI_Output(other,self, " DIA_Addon_Fisk_GivePicks_15_00 " );	// Here's your dozen picks.
	if(B_GiveInvItems(other,self,ItKE_lockpick,12))
	{
		AI_Output(self,other, " DIA_Addon_Fisk_GivePicks_12_01 " );	// Very good! Buyers are already waiting for them.
		B_Addon_Fisk_Reward();
		MIS_Lennar_Lockpick = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_LennarPaket);
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Fisk_GivePicks_12_02 " );	// There aren't a dozen lockpicks here! You're not trying to trick me, are you?
	};
};


instances of DIA_Addon_Fisk_Inspector (C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 7;
	condition = DIA_Addon_Fisk_Inspektor_Condition;
	information = DIA_Addon_Fisk_Inspektor_Info;
	permanent = FALSE;
	description = " Juan worked for Esteban! " ;
};


func int DIA_Addon_Fisk_Inspektor_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Fisk_Lieferung ) && Npc_Knows Info ( other , DIA_ Addon_Tom_Esteban ) && ( FISK_TP  ==  FALSE )) ;
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Fisk_Inspektor_Info()
{
	AI_Output(other,self, " DIA_Addon_Fisk_Inspektor_15_00 " );	// Juan worked for Esteban!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_01");	//Что?
	AI_Output(other,self, " DIA_Addon_Fisk_Inspektor_15_02 " );	// Don't play your games with me! You knew about it!
	AI_Output(self,other, " DIA_Addon_Fisk_Inspektor_12_03 " );	// You're right. But I hope you understand why I didn't tell you about it.
	AI_Output(self,other, " DIA_Addon_Fisk_Inspektor_12_04 " );	// Everyone in this camp knows you work for Esteban too.
	AI_Output(self,other, " DIA_Addon_Fisk_Inspektor_12_05 " );	// I have no desire to be drawn into this mess because of your stupid enthusiasm.
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor, " Actually, I don't work for Esteban. " ,DIA_Addon_Fisk_Inspektor_AntiEsteban);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor, " I don't believe you! " ,DIA_Addon_Fisk_Inspektor_DontBelieve);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor, " I understand! " ,DIA_Addon_Fisk_Inspektor_ISee);
};

func void DIA_Addon_Fisk_Inspektor_ISee()
{
	AI_Output(other,self, " DIA_Addon_Fisk_Inspektor_ISee_15_00 " );	// I understand!
	AI_Output(self,other, " DIA_Addon_Fisk_Inspektor_ISee_12_01 " );	// Good! In that case, let's leave this subject. I don't want to be overheard!
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_DontBelieve()
{
	AI_Output(other,self, " DIA_Addon_Fisk_Inspektor_DontBelieve_15_00 " );	// I don't believe you!
	AI_Output(self,other, " DIA_Addon_Fisk_Inspektor_DontBelieve_12_01 " );	// B elieve me, don't believe me, it's up to you! But I warn you, buddy, if you say a word about it to Esteban, you die!
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_AntiEsteban()
{
	AI_Output(other,self, " DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00 " );	// Actually, I don't work for Esteban.
	AI_Output(self,other, " DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01 " );	// What are you, a child?
	AI_Output(self,other, " DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02 " );	// My advice to you is: Don't waste your time.
	AI_Output(self,other, " DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03 " );	// When it comes to Esteban, don't trust anyone. Even me.
	AI_Output(self,other, " DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04 " );	// Enough about that. Look, they're listening.
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};


instance DIA_Addon_Fisk_Meeting(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Meeting_Condition;
	information = DIA_Addon_Fisk_Meeting_Info;
	permanent = FALSE;
	description = " So you planned an attack! " ;
};


func int DIA_Addon_Fisk_Meeting_Condition()
{
	if((Npc_GetDistToWP(self,"BL_INN_UP_06") <= 500) && Npc_IsInState(self,ZS_Talk) && (MIS_Judas == LOG_Running) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Fisk_Meeting_Info()
{
	AI_Output(other,self, " DIA_Addon_Fisk_Meeting_15_00 " );	// So you planned the attack!
	AI_Output(self,other, " DIA_Addon_Fisk_Meeting_12_01 " );	// Yes. Esteban is in my way. He needs to be removed.
	AI_Output(self,other, " DIA_Addon_Fisk_Meeting_12_02 " );	// He won't let any bandits work for me at the mine. He wants everyone to work only for him.
	AI_Output(self,other, " DIA_Addon_Fisk_Meeting_12_03 " );	// So he wants to get his share of every deal and hold the whole camp by the throat.
	Info_ClearChoices(DIA_Addon_Fisk_Meeting);
	Info_AddChoice(DIA_Addon_Fisk_Meeting, " What are you going to do next? " ,DIA_Addon_Fisk_Meeting_now);
	Info_AddChoice(DIA_Addon_Fisk_Meeting, " And I guess you want to control the camp yourself. " ,DIA_Addon_Fisk_Meeting_You);
	if ( ! Npc_IsDead(Esteban))
	{
		Info_AddChoice(DIA_Addon_Fisk_Meeting, " You know, I can sell you to Esteban. " ,DIA_Addon_Fisk_Meeting_sell);
	};
};

func void DIA_Addon_Fisk_Meeting_You()
{
	AI_Output(other,self, " DIA_Addon_Fisk_Meeting_You_15_00 " );	// And you, I suppose, want to control the camp yourself.
	AI_Output(self,other, " DIA_Addon_Fisk_Meeting_You_12_01 " );	// No. I'm just a simple merchant. I just want no one to interfere with my work.
};

func void DIA_Addon_Fisk_Meeting_sell()
{
	AI_Output(other,self, " DIA_Addon_Fisk_Meeting_sell_15_00 " );	// You know, I could easily betray you to Esteban.
	AI_Output(self,other, " DIA_Addon_Fisk_Meeting_sell_12_01 " );	// Yeah you could. Fat load of good it'll do you though.
	AI_Output(self,other, " DIA_Addon_Fisk_Meeting_sell_12_02 " );	// Forget that and listen to me. I have a better idea.
};

func void DIA_Addon_Fisk_Meeting_now()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_00");	//I'm listening?
	if ( ! Npc_IsDead(Esteban))
	{
		AI_Output(self,other, " DIA_Addon_Fisk_Meeting_now_12_01 " );	// We'll get Esteban out of our way. Which means you kill him and take his place.
		AI_Output(other,self, " DIA_Addon_Fisk_Meeting_now_15_02 " );	// As long as his guards are with him, he is beyond my reach.
		AI_Output(self,other, " DIA_Addon_Fisk_Meeting_now_12_03 " );	// So we'll lure them out. Savvy?
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_04");	//Savvy.
		AI_Output(self,other, " DIA_Addon_Fisk_Meeting_now_12_05 " );	// You've done your job. You found out I was behind the attack.
		AI_Output(self,other, " DIA_Addon_Fisk_Meeting_now_12_06 " );	// Say so to Esteban and he'll send his guys here to finish me off. I will ambush them.
		AI_Output(self,other, " DIA_Addon_Fisk_Meeting_now_12_07 " );	// When they're gone, you'll take care of the bastard and I'll take care of the guards.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Fisk_Meeting_now_12_08 " );	// Esteban is dead. Finally, I can do my job again.
		AI_Output(self,other, " DIA_Addon_Fisk_Meeting_now_12_09 " );	// Here you go, this is for you.
		B_GiveInvItems(self,other,ItMi_Gold,500);
	};
	Info_ClearChoices(DIA_Addon_Fisk_Meeting);
	MIS_Judas = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AMBUSH");
	B_LogEntry(Topic_Addon_Esteban, " Fisk ordered the attack on Esteban. " );
};


instance DIA_Addon_Fisk_Sieg (C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Sieg_Condition;
	information = DIA_Addon_Fisk_Sieg_Info;
	permanent = FALSE;
	description = " Esteban is no longer to be reckoned with! He is dead. " ;
};


func int DIA_Addon_Fish_Fish_Condition()
{
	if ((MY_Judas ==  LOG_SUCCESS ) && (Npc_IsDead(Stephen) ==  TRUE ) && ( FISK_TP  ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Fisk_Sieg_Info()
{
	AI_Output(other,self, " DIA_Addon_Fisk_Sieg_15_00 " );	// Esteban is no longer an issue! He is dead.
	AI_Output(self,other, " DIA_Addon_Fisk_Sieg_12_01 " );	// I've been waiting for this for a long time.
	AI_Output(self,other, " DIA_Addon_Fisk_Sieg_12_02 " );	// I guess you have a lot of things to do. So do I. I'll see you later.
	AI_Output(self,other, " DIA_Addon_Fisk_Sieg_12_03 " );	// If you need something, you know where to find me.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	B_GivePlayerXP(XP_Ambient);
};

instance DIA_ADDON_FISK_RETFORD(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = dia_addon_fisk_retford_condition;
	information = dia_addon_fisk_retford_info;
	permanent = FALSE;
	description = " Ratford says hello to you! " ;
};

func int dia_addon_fisk_retford_condition()
{
	if((MIS_RATFORDFISK == LOG_Running) && (HIFROMRATFORD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_retford_info()
{
	B_GivePlayerXP(XP_FISKRETFORD);
	AI_Output(other,self, " DIA_Addon_Fisk_Retford_01_00 " );	// Ratford sends greetings!
	AI_Output(self,other, " DIA_Addon_Fisk_Retford_01_03 " );	// What the devil! So that old rogue is alive. Where is he?
	AI_Output(other,self, " DIA_Addon_Fisk_Retford_01_04 " );	// I met him in the Valley of Mines. He settled there.
	AI_Output(self,other, " DIA_Addon_Fisk_Retford_01_05 " );	// That's all I need...
	AI_Output(other,self, " DIA_Addon_Fisk_Retford_01_06 " );	// Something wrong?
	AI_Output(self,other, " DIA_Addon_Fisk_Retford_01_07 " );	// No, nothing. Old debts!
	AI_Output(other,self, " DIA_Addon_Fisk_Retford_01_08 " );	// Do you owe something to Ratford?
	AI_Output(self,other, " DIA_Addon_Fisk_Retford_01_09 " );	// None of your business! Be a pal - if you see him again, give him this package from me.
	AI_Output(self,other, " DIA_Addon_Fisk_Retford_01_11 " );	// I'll pay you for the delivery.
	AI_Output(self,other, " DIA_Addon_Fisk_Retford_01_13 " );	// Let's say a hundred coins. Agreed?
	AI_Output(other,self, " DIA_Addon_Fisk_Retford_01_14 " );	// Okay, give me the package and gold.
	AI_Output(self,other, " DIA_Addon_Fisk_Retford_01_15 " );	// Here, take it. Just don't lose it.
	AI_Wait(self,1);
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(hero,itmi_fiskpacket,1);
	CreateInvItems(hero,ItMi_Gold,100);
	AI_StopProcessInfos(self);
	B_LogEntry( TOPIC_RATFORDFISK , " I said hi to Fisk from Ratford. He got a little nervous when I mentioned it and then asked me to deliver a small, oddly shaped package to Ratford. " );
	HIFROMRATFORD = TRUE;
};

var int FishABoutFingers;

instance DIA_ADDON_FISK_ORCINVASION (C_Info);
{
	npc = BDT_1097_Addon_Fisk;
	condition = dia_addon_fisk_orcinvasion_condition;
	information = dia_addon_fisk_orcinvasion_info;
	important = TRUE;
	permanent = TRUE;
};

func int dia_addon_fisk_orcinvasion_condition()
{
	if((FISK_TP == TRUE) && Npc_IsInState(self,ZS_Talk) && (MIS_RATFORDFISK == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_orcinvasion_info()
{
	AI_Output(self,other, " DIA_Addon_Fisk_OrcInvasion_01_00 " );	// I'm not in the mood to talk right now. Back off!

	if((MIS_WhereFingers == LOG_SUCCESS) || (FingersMeet == TRUE) || (FiskABoutFingers == TRUE))
	{
		AI_StopProcessInfos(self);
		FISK_TP = TRUE;
	};
};

instance DIA_Addon_Fisk_WhereFingers(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_WhereFingers_condition;
	information = DIA_Addon_Fisk_WhereFingers_info;
	permanent = FALSE;
	description = " Do you know anything about Fingers? " ;
};

func int DIA_Addon_Fisk_WhereFingers_condition()
{
	if((MIS_WhereFingers == LOG_Running) && (FingersMeet == FALSE) && (FingersIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_WhereFingers_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_Fisk_WhereFingers_01_00 " );	// Do you know anything about Fingers?
	AI_Output(self,other, " DIA_Addon_Fisk_WhereFingers_01_01 " );	// Hmmm... I haven't seen him since the barrier came down.
	AI_Output(self,other, " DIA_Addon_Fisk_WhereFingers_01_02 " );	// Some say he died. Although I personally don't believe it.
	AI_Output(other,self,"DIA_Addon_Fisk_WhereFingers_01_03");	//Why not?
	AI_Output(self,other, " DIA_Addon_Fisk_WhereFingers_01_04 " );	// He was not the type person to just up and disappear like that.
	AI_Output(self,other, " DIA_Addon_Fisk_WhereFingers_01_05 " );	// But that's just my opinion.
	FishABoutFingers = TRUE ;
	B_LogEntry(TOPIC_WhereFingers, " Fisk thinks Fingers is still alive. But no one knows where he is. " );
};

//---------------------------


instance DIA_NONE_1801_Fingers_EXIT(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 999;
	condition = DIA_NONE_1801_Fingers_EXIT_Condition;
	information = DIA_NONE_1801_Fingers_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_NONE_1801_Fingers_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_1801_Fingers_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NONE_1801_Fingers_PICKPOCKET(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 900;
	condition = DIA_NONE_1801_Fingers_PICKPOCKET_Condition;
	information = DIA_NONE_1801_Fingers_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_NONE_1801_Fingers_PICKPOCKET_Condition()
{
	if((hero.attribute[ATR_DEXTERITY] >= 250) && (FingersPocket == FALSE) && ((MIS_TellAboutFingers == LOG_Running) || (MIS_TellAboutFingers == LOG_Success)))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_NONE_1801_Fingers_PICKPOCKET);
	Info_AddChoice(DIA_NONE_1801_Fingers_PICKPOCKET,Dialog_Back,DIA_NONE_1801_Fingers_PICKPOCKET_BACK);
	Info_AddChoice(DIA_NONE_1801_Fingers_PICKPOCKET,DIALOG_PICKPOCKET,DIA_NONE_1801_Fingers_PICKPOCKET_DoIt);
};

func void DIA_NONE_1801_Fingers_PICKPOCKET_DoIt()
{
	B_Stealing_Fingers();
	Info_ClearChoices(DIA_NONE_1801_Fingers_PICKPOCKET);
};

func void DIA_NONE_1801_Fingers_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_NONE_1801_Fingers_PICKPOCKET);
};

instance DIA_NONE_1801_Fingers_Hi(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_Hi_Condition;
	information = DIA_NONE_1801_Fingers_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1801_Fingers_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_Hi_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Hi_01_00 " );	// Fancy seeing you here!
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Hi_01_01 " );	// Who are you? Wait... I think I recognize your face...
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Hi_01_02 " );	// You're the guy I taught thieving skills to at the Old Camp.
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Hi_01_03 " );	// Fingers! I thought you were dead.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Hi_01_04 " );	// It takes actual fucking effort to send me to the next world. Ha!
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Hi_01_05 " );	// How did you get here?
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Hi_01_06 " );	// I barely recall actually. A... boat? I think?
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Hi_01_07 " );	// Don't you remember anything?
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Hi_01_08 " );	// Bits and pieces mostly.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Hi_01_09 " );	// When the barrier collapsed, everyone rushed out of that cursed colony as one.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Hi_01_10 " );	// Most of the guards and stragglers left with Raven. He said something about the northwestern part of the island.
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Hi_01_11 " );	// Why didn't you go with him?
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Hi_01_12 " );	// I didn't like his way of doing things.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Hi_01_13 " );	// Moreover, I wanted not just to get out of the Valley of Mines, but to get away from this island forever.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Hi_01_14 " );	// On the east coast, I've stashed a boat just in case.
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Hi_01_15 " );	// And what did you do?
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Hi_01_16 " );	// Sailed her I suppose.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Hi_01_17 " );	// But there was a storm... after that  everything is foggy.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Hi_01_18 " );	// I woke up here.
	FingersMeet = TRUE;
	B_LogEntry(TOPIC_WhereFingers, " I found Fingers on the shore of Fort Azgan's island. This news will please Cassia. " );
};

instance DIA_NONE_1801_Fingers_Place(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_Place_Condition;
	information = DIA_NONE_1801_Fingers_Place_Info;
	permanent = FALSE;
	description = " Do you even know what this place is? " ;
};

func int DIA_NONE_1801_Fingers_Place_Condition()
{
	if (( Npc_KnowsInfo ( other , DIA_NONE_1801_Fingers_Hi ) ==  TRUE ) && ( FingersInFort ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_Place_Info()
{
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Place_01_00 " );	// Do you even know where you are?
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Place_01_01 " );	// I didn't know until recently.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Place_01_02 " );	// But when the army of paladins arrived, everything became clear.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Place_01_03 " );	// So I won't go any further than here.
};

instance DIA_NONE_1801_Fingers_How(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_How_Condition;
	information = DIA_NONE_1801_Fingers_How_Info;
	permanent = FALSE;
	description = " How are you doing here? " ;
};

func int DIA_NONE_1801_Fingers_How_Condition()
{
	if (( Npc_KnowsInfo ( other , DIA_NONE_1801_Fingers_Hi ) ==  TRUE ) && ( FingersInFort ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_How_Info()
{
	AI_Output(other,self, " DIA_NONE_1801_Fingers_How_01_00 " );	// And how are you doing out here?
	AI_Output(self,other, " DIA_NONE_1801_Fingers_How_01_01 " );	// It's better than it was in the colony!
	AI_Output(other,self, " DIA_NONE_1801_Fingers_How_01_02 " );	// Orcs are in charge there now.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_How_01_03 " );	// That's not surprising.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_How_01_04 " );	// So at the very least, this place is tranquil.
};

instance DIA_NONE_1801_Fingers_WhatNext(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_WhatNext_Condition;
	information = DIA_NONE_1801_Fingers_WhatNext_Info;
	permanent = FALSE;
	description = " What are you going to do next? " ;
};

func int DIA_NONE_1801_Fingers_WhatNext_Condition()
{
	if (( Npc_KnowsInfo ( other , DIA_NONE_1801_Fingers_Hi ) ==  TRUE ) && ( FingersInFort ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_WhatNext_Info()
{
	AI_Output(other,self, " DIA_NONE_1801_Fingers_WhatNext_01_00 " );	// What will you do next?
	AI_Output(self,other, " DIA_NONE_1801_Fingers_WhatNext_01_02 " );	// What else can I do? Just sit here and wait for the right opportunity to get out of this hole.
	AI_Output(other,self, " DIA_NONE_1801_Fingers_WhatNext_01_03 " );	// You could go to the fort.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_WhatNext_01_04 " );	// Are you kidding?! Everyone knows ol' fingers the sneak thief.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_WhatNext_01_05 " );	// I don't feel like being hanged, ya know?
	AI_Output(self,other, " DIA_NONE_1801_Fingers_WhatNext_01_06 " );	// I'm ok out here, thanks.
};

instance DIA_NONE_1801_Fingers_Stolen(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_Stolen_Condition;
	information = DIA_NONE_1801_Fingers_Stolen_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1801_Fingers_Stolen_Condition()
{
 	if((Npc_HasItems(hero,ItMi_PocketFingers) >= 1) && (FingersPocket == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_Stolen_Info()
{
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Stolen_01_00 " );	// (laughing) Wow! Robbing Fingers himself! Who would have thought...
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Stolen_01_01 " );	// Yeah, mate. You didn't waste any time. A true master of the craft!
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Stolen_01_02 " );	// And now, please, give me back my wallet.
	Info_ClearChoices(DIA_NONE_1801_Fingers_Stolen);
	Info_AddChoice(DIA_NONE_1801_Fingers_Stolen, " Nope, it's mine unfair and square. " ,DIA_NONE_1801_Fingers_Stolen_No);
	Info_AddChoice(DIA_NONE_1801_Fingers_Stolen, " Of course, here it is. " ,DIA_NONE_1801_Fingers_Stolen_Yes);
	Info_AddChoice(DIA_NONE_1801_Fingers_Stolen, " What do I get for it? " ,DIA_NONE_1801_Fingers_Stolen_What);
};

func void DIA_NONE_1801_Fingers_Stolen_No()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Stolen_No_01_00");	//Nope, it's mine unfair and square.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Stolen_No_01_01 " );	// Dammit.
	AI_StopProcessInfos(self);

	if(FingersInFort == FALSE)
	{
		B_Attack(self,other,AR_KILL,1);
	};
};

func void DIA_NONE_1801_Fingers_Stolen_Yes()
{
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Stolen_Yes_01_00 " );	// Of course, here it is.
	B_GiveInvItems(other,self,ItMi_PocketFingers,1);
	Npc_RemoveInvItems(self,ItMi_PocketFingers,1);
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Stolen_Yes_01_01 " );	// Good. You work with your brains no worse than with your hands.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Stolen_Yes_01_02 " );	// If so, take this key.
	B_GiveInvItems(self,other,ItKe_FingersKey,1);
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Stolen_Yes_01_03 " );	// It's from my chest that was left in the Valley of Mines.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Stolen_Yes_01_04 " );	// I don't need it now, but you'll find a lot of useful things in it.
	AI_StopProcessInfos(self);
};

func void DIA_NONE_1801_Fingers_Stolen_What()
{
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Stolen_What_15_00 " );	// What do I get for this?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Stolen_What_01_00");	//You'll see soon enough!
};

instance DIA_NONE_1801_Fingers_Master(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_Master_Condition;
	information = DIA_NONE_1801_Fingers_Master_Info;
	permanent = FALSE;
	description = " You know locks, right? " ;
};

func int DIA_NONE_1801_Fingers_Master_Condition()
{
	if(MIS_FingersOpenDoor == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_Master_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Master_01_00 " );	// You still remember your old skills?
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Master_01_01 " );	// Of course! thievery is in my blood.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Master_01_02 " );	// Why do you ask?
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Master_01_03 " );	// The Paladins have lost the key to their warehouse. And the castle is too complicated.
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Master_01_04 " );	// So I thought: is it true that they say that no castle can resist you?
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Master_01_05 " );	// It's true. But they will have to solve their problem themselves.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Master_01_06 " );	// I won't get close to the fort!
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Master_01_07 " );	// What if I arrange with the paladins not to touch you?
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Master_01_08 " );	// Do you think they can be trusted?
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Master_01_09 " );	// Do you have a choice? Or are you going to sit here for the rest of your life?
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Master_01_10 " );	// Eh... Okay! I will help them, but only on the condition that they leave me be.
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Master_01_11 " );	// Okay, I'll talk to their leader.
	FingersAgree = TRUE;
	B_LogEntry(TOPIC_FingersOpenDoor, " Fingers agreed to help the paladins with the door on the condition that they do not touch him. " );
};

instance DIA_NONE_1801_Fingers_Master_Ok(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_Master_Ok_Condition;
	information = DIA_NONE_1801_Fingers_Master_Ok_Info;
	permanent = FALSE;
	description = " I've spoken to the paladins. " ;
};

func int DIA_NONE_1801_Fingers_Master_Ok_Condition()
{
	if((MIS_FingersOpenDoor == LOG_Running) && (VarusFingersAgree == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_Master_Ok_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Master_Ok_01_00 " );	// I've spoken to the paladins.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Master_Ok_01_01 " );	// (with interest) And?
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Master_Ok_01_02 " );	// Lord Varus, their commander, has given his word that he will not harm you if you help them open the door.
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Master_Ok_01_03 " );	// But don't try to steal from them! Otherwise I won't be able to help you.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Master_Ok_01_04 " );	// Of course! Do I look like an idiot?
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Master_Ok_01_05 " );	// In that case, they're waiting for you at the fort.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Master_Ok_01_06 " );	// Good. I'll just sit here for another day. I'll collect my thoughts, so to speak. And then I'll go to them.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_Ok_01_07");	//As you wish.
	FingersCrack = TRUE;
	FingersGoFort = Wld_GetDay();
	B_LogEntry(TOPIC_FingersOpenDoor, " Fingers will be heading to the fort in about a day. I hope the paladins will appreciate his skill when he opens the door. " );
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1801_Fingers_Master_Finish(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_Master_Finish_Condition;
	information = DIA_NONE_1801_Fingers_Master_Finish_Info;
	permanent = FALSE;
	description = " So, how did it go? " ;
};

func int DIA_NONE_1801_Fingers_Master_Finish_Condition()
{
	if(FingersInFort == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_Master_Finish_Info()
{
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Master_Finish_01_00 " );	// Well, how did it go?
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Master_Finish_01_01 " );	// The job turned out to be really difficult!
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Master_Finish_01_02 " );	// The one who made that lock was a master of his craft.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Master_Finish_01_03 " );	// Unfortunately for him, I'm a master of MINE. I opened it with only some slight cursing.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Master_Finish_01_04 " );	// I'm in good standing with Lord Varus now. Which is very weird even for me...
	AI_Output(other,self, " DIA_NONE_1801_Fingers_Master_Finish_01_05 " );	// So the old business is done?
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Master_Finish_01_06 " );	// It turns out that it is. I won't say that I really like it.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Master_Finish_01_07 " );	// But the food here is good, and there is booze and broads!
	AI_Output(self,other, " DIA_NONE_1801_Fingers_Master_Finish_01_08 " );	// And that's definitely better than hanging around with a rope around your neck! (laughs)
	THIEF_REPUTATION = THIEF_REPUTATION + 15;

	if(MIS_FingersOpenDoor == LOG_Running)
	{
		B_LogEntry(TOPIC_FingersOpenDoor, " As expected, Fingers opened the warehouse lock without difficulty. " );
	};
};

instance DIA_NONE_1801_Fingers_OpenSkald(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_OpenSkald_Condition;
	information = DIA_NONE_1801_Fingers_OpenSkald_Info;
	permanent = FALSE;
	description = " So the warehouse is now open? " ;
};

func int DIA_NONE_1801_Fingers_OpenSkald_Condition()
{
	if(Npc_KnowsInfo(other,DIA_NONE_1801_Fingers_Master_Finish) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_OpenSkald_Info()
{
	AI_Output(other,self, " DIA_NONE_1801_Fingers_OpenSkald_01_00 " );	// So the warehouse is now open?
	AI_Output(self,other, " DIA_NONE_1801_Fingers_OpenSkald_01_01 " );	// No. I made a new key and gave it to Varus.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_OpenSkald_01_02 " );	// So it's under new lock and key, so to speak.
	FingersTellKey = TRUE;
};

var int FingersCanGaveMeKey;

instance DIA_NONE_1801_Fingers_GetKeySkald(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_GetKeySkald_Condition;
	information = DIA_NONE_1801_Fingers_GetKeySkald_Info;
	permanent = FALSE;
	description = " Can you make another one like this? " ;
};

func int DIA_NONE_1801_Fingers_GetKeySkald_Condition()
{
	if ((FingersTellKey ==  TRUE ) && (HavePalSkladMeKey ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_GetKeySkald_Info()
{
	AI_Output(other,self, " DIA_NONE_1801_Fingers_GetKeySkald_01_00 " );	// Can you make another one like it
	AI_Output(self,other, " DIA_NONE_1801_Fingers_GetKeySkald_01_01 " );	// Hmmm... (squinting) What, you want to inspect their warehouse for yourself?
	AI_Output(other,self, " DIA_NONE_1801_Fingers_GetKeySkald_01_02 " );	// You can say that.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_GetKeySkald_01_03 " );	// Hmmm... Of course I can do it. But it's too risky for me! After all, if they had something stolen from there, I'd be suspect number one!
	AI_Output(other,self, " DIA_NONE_1801_Fingers_GetKeySkald_01_04 " );	// I'll pay well. Plus, I'm sure the paladins aren't that careful with their stuff.
	AI_Output(other,self, " DIA_NONE_1801_Fingers_GetKeySkald_01_05 " );	// They have more important things to do now. For example, orcs!
	AI_Output(self,other, " DIA_NONE_1801_Fingers_GetKeySkald_01_06 " );	// Well, okay, I see your point.But it will cost you at least two thousand gold coins.
	Info_ClearChoices(DIA_NONE_1801_Fingers_GetKeySkald);
	Info_AddChoice(DIA_NONE_1801_Fingers_GetKeySkald, " Then we better talk about it later. " ,DIA_NONE_1801_Fingers_GetKeySkald_No);

	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		Info_AddChoice(DIA_NONE_1801_Fingers_GetKeySkald, " Okay. Here's your money. " ,DIA_NONE_1801_Fingers_GetKeySkald_Yes);
	};
};

func void DIA_NONE_1801_Fingers_GetKeySkald_No()
{
	AI_Output(other,self, " DIA_NONE_1801_Fingers_GetKeySkald_No_01_00 " );	// Then we'd better talk about it later.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_GetKeySkald_No_01_01 " );	// As you say.
	FingersCanGaveMeKey = TRUE;
	Info_ClearChoices(DIA_NONE_1801_Fingers_GetKeySkald);
};

func void DIA_NONE_1801_Fingers_GetKeySkald_Yes()
{
	AI_Output(other,self, " DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_00 " );	// Good. Here is your money.
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,ItMi_Gold,2000);
	AI_Output(self,other, " DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_01 " );	// Great! And here is your key.
	B_GiveInvItems(self,other,itke_varuskey,1);
	AI_Output(other,self, " DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_02 " );	// You rogue! Looks like you already had it. And you probably wanted to take care of the warehouse yourself.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_03 " );	// It doesn't matter what I wanted, man. The main thing is that everyone got what they wanted.
	Info_ClearChoices(DIA_NONE_1801_Fingers_GetKeySkald);
};

instance DIA_NONE_1801_Fingers_GetKeySkald_Again(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_GetKeySkald_Again_Condition;
	information = DIA_NONE_1801_Fingers_GetKeySkald_Again_Info;
	permanent = TRUE;
	description = " Sell me the key to the warehouse. " ;
};

func int DIA_NONE_1801_Fingers_GetKeySkald_Again_Condition()
{
	if ((FingersCanGaveMeKey ==  TRUE ) && (HavePalSkladMeKey ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_GetKeySkald_Again_Info()
{
	AI_Output(other,self, " DIA_NONE_1801_Fingers_GetKeySkald_Again_01_00 " );	// Sell me the key to the warehouse.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_GetKeySkald_Again_01_01 " );	// As I said, it will cost you at least two thousand gold coins.
	Info_ClearChoices(DIA_NONE_1801_Fingers_GetKeySkald_Again);
	Info_AddChoice(DIA_NONE_1801_Fingers_GetKeySkald_Again, " Then we better talk about it later. " ,DIA_NONE_1801_Fingers_GetKeySkald_Again_No);

	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		Info_AddChoice(DIA_NONE_1801_Fingers_GetKeySkald_Again, " Okay. Here's your money. " ,DIA_NONE_1801_Fingers_GetKeySkald_Again_Yes);
	};
};

func void DIA_NONE_1801_Fingers_GetKeySkald_Again_No()
{
	AI_Output(other,self, " DIA_NONE_1801_Fingers_GetKeySkald_No_01_00 " );	// Then we'd better talk about it later.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_GetKeySkald_No_01_01 " );	// As you say.
	Info_ClearChoices(DIA_NONE_1801_Fingers_GetKeySkald_Again);
};

func void DIA_NONE_1801_Fingers_GetKeySkald_Again_Yes()
{
	AI_Output(other,self, " DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_00 " );	// Good. Here is your money.
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,ItMi_Gold,2000);
	AI_Output(self,other, " DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_01 " );	// Great! And here is your key.
	B_GiveInvItems(self,other,itke_varuskey,1);
	AI_Output(other,self, " DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_02 " );	// You rogue! Looks like you already had it. And you probably wanted to take care of the warehouse yourself.
	AI_Output(self,other, " DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_03 " );	// It doesn't matter what I wanted, man. The main thing is that everyone got what they wanted.
	HavePalSkladMeKey = TRUE ;
	Info_ClearChoices(DIA_NONE_1801_Fingers_GetKeySkald_Again);
};
