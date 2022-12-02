

instance DIA_Addon_Martin_EXIT(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 999;
	condition = DIA_Addon_Martin_EXIT_Condition;
	information = DIA_Addon_Martin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Martin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Martin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Martin_PICKPOCKET(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 900;
	condition = DIA_Addon_Martin_PICKPOCKET_Condition;
	information = DIA_Addon_Martin_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Martin_PICKPOCKET_Condition()
{
	return  C_Robbery ( 65 , 77 );
};

func void DIA_Addon_Martin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Martin_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Martin_PICKPOCKET,Dialog_Back,DIA_Addon_Martin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Martin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Martin_PICKPOCKET_DoIt);
};

func void DIA_Addon_Martin_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Martin_PICKPOCKET);
};

func void DIA_Addon_Martin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Martin_PICKPOCKET);
};


instance DIA_Addon_Martin_MeetingIsRunning(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 1;
	condition = DIA_Addon_Martin_MeetingIsRunning_Condition;
	information = DIA_Addon_Martin_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Martin_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		return TRUE;
	};
};


var int DIA_Addon_Martin_MeetingIsRunning_OneTime;

func void DIA_Addon_Martin_MeetingIsRunning_Info()
{
	if(DIA_Addon_Martin_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Cord_MeetingIsRunning_07_00 " );	// So, are you new? Welcome to the Brotherhood, brother in the Ring.
		DIA_Addon_Martin_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Cord_MeetingIsRunning_07_01 " );	// First you must go to Vatras. Maybe I'll have time for you later.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Martin_Hallo(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_Hallo_Condition;
	information = DIA_Addon_Martin_Hallo_Info;
	important = TRUE;
};


func int DIA_Addon_Martin_Hallo_Condition()
{
	if ((Npc_GetDistToWP(self, " NW_CITY_PALCAMP_15 " ) <  1000 ) && (self.aivar[AIV_TalkedToPlayer] ==  FALSE ) && (RangerMeetingRunning !=  LOG_SUCCESS ) && (SC_IsRanger ==  FALSE ) && (other.guild !=  GIL_MIL ) && ; ( other . guild !=  GIL_PAL ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Hallo_Info()
{
	AI_Output(self,other, " DIA_Addon_Martin_Hallo_07_00 " );	// Hey you! There is nothing for you to do here. Only paladins and people from the militia can be here.
};


instance DIA_Addon_Martin_WasMachstDu (C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_WasMachstDu_Condition;
	information = DIA_Addon_Martin_WasMachstDu_Info;
	description = " What is this place? " ;
};


func int DIA_Addon_Martin_WasMachstDu_Condition()
{
	if(Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 1000)
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_WasMachstDu_Info()
{
	AI_Output(other,self, " DIA_Addon_Martin_WasMachstDu_15_00 " );	// What is this place?
	AI_Output(self,other, " DIA_Addon_Martin_WasMachstDu_07_01 " );	// This is where the supplies of the paladin royal guards are stored.

	if((other.guild == GIL_NONE) && (SC_IsRanger == FALSE))
	{
		AI_Output(self,other, " DIA_Addon_Martin_WasMachstDu_07_02 " );	// I'm the quartermaster, and it's my responsibility to make sure nothing here is lost. And you don't belong here.
		AI_Output(self,other, " DIA_Addon_Martin_WasMachstDu_07_03 " );	// So don't touch anything here or you'll end up with no hands.
	};
};


instance DIA_Addon_Martin_PreTrade(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_PreTrade_Condition;
	information = DIA_Addon_Martin_PreTrade_Info;
	description = " Can you sell me some paladin items? " ;
};

func int DIA_Addon_Martin_PreTrade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_PreTrade_Info()
{
	AI_Output(other,self, " DIA_Addon_Martin_PreTrade_15_00 " );	// Can you sell me some paladin items?
	AI_Output(self,other, " DIA_Addon_Martin_PreTrade_07_01 " );	// Hmmm... (thoughtfully) Let's just say that if you compensate me for the troubles that I will have when the losses are discovered, then we can agree.
	AI_Output(other,self, " DIA_Addon_Martin_PreTrade_15_02 " );	// And things go missing often?
	AI_Output(self,other, " DIA_Addon_Martin_PreTrade_07_03 " );	// No, as long as the quartermaster says everything is fine.
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_04");	//Понимаю.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,LogText_Addon_MartinTrade);
};


instance DIA_Addon_Martin_Farm (C_Info) .
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_Farim_Condition;
	information = DIA_Addon_Martin_Farim_Info;
	description = " Farim the Fisherman is having trouble with the militia. " ;
};

func int DIA_Addon_Martin_Farim_Condition()
{
	if ((MIS_Addon_Farm_PaladinFisch == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Martin_PreTrade))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Farim_Info()
{
	AI_Output(other,self, " DIA_Addon_Martin_Farim_15_00 " );	// Fisherman Farim has trouble with the militia. He constantly takes away the entire catch.
	AI_Output(self,other, " DIA_Addon_Martin_Farim_07_01 " );	// And why should I care?
	AI_Output(other,self, " DIA_Addon_Martin_Farim_15_02 " );	// Well, you have some influence among the paladins.
	AI_Output(other,self, " DIA_Addon_Martin_Farim_15_03 " );	// Farim needs your protection. He is ready to give you part of the catch for her.
	AI_Output(self,other, " DIA_Addon_Martin_Farim_07_04 " );	// I understand what you're talking about.
	AI_Output(self,other, " DIA_Addon_Martin_Farim_07_05 " );	// Fish! As if I didn't have enough worries without it!
	AI_Output(self,other, " DIA_Addon_Martin_Farim_07_06 " );	// Tell your friend to come to me and tell me exactly what's wrong with the militia.
	AI_Output(self,other, " DIA_Addon_Martin_Farim_07_07 " );	// I'll take care of this.
	B_LogEntry(TOPIC_Addon_FarimsFish, " Quartermaster Martin will take care of this. " );
	Martin_KnowsFarim = TRUE;
	B_GivePlayerXP(XP_Addon_FarimSchutz);
};


instance DIA_Addon_Martin_Trade(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 80;
	condition = DIA_Addon_Martin_Trade_Condition;
	information = DIA_Addon_Martin_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = " What can you offer? " ;
};

func int DIA_Addon_Martin_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_PreTrade))
	{
		return TRUE;
	};
};

var int DIA_Addon_Martin_Trade_OneTime;
var int MartinHasPalLight;

func void DIA_Addon_Martin_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Addon_Martin_Trade_15_00 " );	// What can you suggest?

	if((DIA_Addon_Martin_Trade_OneTime == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)))
	{
		CreateInvItems(self,ItMw_ShortSword1,1);
		CreateInvItems(self,ItMw_1h_Mil_Sword,1);
		CreateInvItems(self,ItMw_Schwert2, 1 );
		CreateInvItems(self,ItMw_1h_Pal_Sword,1);
		CreateInvItems(self,ItMw_2h_Pal_Sword,1);
		CreateInvItems(self,ItRw_Mil_Crossbow,1);
		CreateInvItems(self,ItRw_Bolt,75);
		AI_Output(self,other, " DIA_Addon_Martin_Trade_07_01 " );	// Well, look carefully.
		DIA_Addon_Martin_Trade_OneTime = TRUE;
	};
	if((MartinHasPalLight == FALSE) && ((XARDASTELLMEOSTA == TRUE) || (KNOWWHERENERCONOMICON == TRUE)))
	{
		CreateInvItems(self,ItSc_PalLight,10);
		MartinHasPalLight = TRUE;
	};

	B_GiveTradeInv(self);
};


instance DIA_Addon_Martin_Rangerhelp(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 2;
	condition = DIA_Addon_Martin_Rangerhelp_Condition;
	information = DIA_Addon_Martin_Rangerhelp_Info;
	description = " Lares sent me! He said you could help me. " ;
};

func int DIA_Addon_Martin_Rangerhelp_Condition()
{
	if ((RangerHelp_guildMIL ==  TRUE ) && Npc_KnowsInfo(other, DIA_Addon_Martin_WasMachstYou) && (hero.guild ==  GIL_NONE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Rangerhelp_Info()
{
	AI_Output(other,self, " DIA_Addon_Martin_Rangerhelp_15_00 " );	// Lares sent me. He said that you can help me.
	AI_Output(self,other, " DIA_Addon_Martin_Rangerhelp_07_01 " );	// Yes? And what do you want from me?
	AI_Output(other,self, " DIA_Addon_Martin_Rangerhelp_15_02 " );	// I want to join the militia.
	AI_Output(self,other, " DIA_Addon_Martin_Rangerhelp_07_03 " );	// (laughs) So, you want to join our ranks? You know, we don't just take people off the street.
	AI_Output(self,other, " DIA_Addon_Martin_Rangerhelp_07_04 " );	// You may need to...
	AI_Output(other,self, " DIA_Addon_Martin_Rangerhelp_15_05 " );	// Keep your moralizing to yourself. Just tell me what you need to do in order to join the militia.
	AI_Output(self,other, " DIA_Addon_Martin_Rangerhelp_07_06 " );	// (surprised) All right. Then listen to me carefully.
	AI_Output(self,other, " DIA_Addon_Martin_Rangerhelp_07_07 " );	// I must say that the work of the quartermaster is that hard labor. Dealing with all these boxes and bags is not at all easy.
	AI_Output(self,other, " DIA_Addon_Martin_Rangerhelp_07_08 " );	// And every time I relax in a Cardiff tavern after work, someone digs through the supply crates, and the next morning I find that something is missing.
	AI_Output(self,other, " DIA_Addon_Martin_Rangerhelp_07_09 " );	// (angrily) It's rather strange that these paladins don't notice.
	AI_Output(self,other, " DIA_Addon_Martin_Rangerhelp_07_10 " );	// I'll just go nuts. I can't hang around here all night like an idiot.
	AI_Output(self,other, " DIA_Addon_Martin_Rangerhelp_07_11 " );	// You, on the other hand...
	AI_Output(other,self, " DIA_Addon_Martin_Rangerhelp_15_12 " );	// I got it. You want me to guard the crates while you drink at the tavern.
	AI_Output(self,other, " DIA_Addon_Martin_Rangerhelp_07_13 " );	// Accept or leave.
	B_LogEntry(TOPIC_Addon_RangerHelpMIL, " I have to keep an eye on Quartermaster Martin's crates. If I catch a man stealing stuff from the crates, Martin will help me join the militia. " );
};


instance DIA_Addon_Martin_Auftrag (C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 2;
	condition = DIA_Addon_Martin_Auftrag_Condition;
	information = DIA_Addon_Martin_Auftrag_Info;
	description = " Okay, I'll look after your drawers. " ;
};

func int DIA_Addon_Martin_Auftrag_Condition()
{
	if ((RangerHelp_guildMIL ==  TRUE ) && Npc_KnowsInfo(other,DIA_Addon_Martin_RangerHelp) && (hero.guild ==  GIL_NONE ))
	{
		return TRUE;
	};
};

var int MIS_Addon_Martin_GetRanger_Day;

func void DIA_Addon_Martin_Order_Info()
{
	AI_Output(other,self, " DIA_Addon_Martin_Auftrag_15_00 " );	// Okay, I'll look after your drawers.
	AI_Output(self,other, " DIA_Addon_Martin_Auftrag_07_01 " );	// Great.

	if (Wld_IsTime( 23 , 0 , 4 , 0 ))
	{
		AI_Output(self,other, " DIA_Addon_Martin_Auftrag_07_02 " );	// Then I went to the tavern. And woe to you if you lose something.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Martin_Auftrag_07_03 " );	// Come back in the evening and stand guard. I will be in the tavern at this time.
	};

	MIS_Addon_Martin_GetRangar = LOG_Running;
	MIS_Addon_Martin_GetRanger_Day = Wld_GetDay();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(MIL_321_Rangar,"PalCampKlau");
};

instance DIA_Addon_Martin_FromVatras(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_FromVatras_Condition;
	information = DIA_Addon_Martin_FromVatras_Info;
	description = " Are you looking for a man who sells weapons to bandits? " ;
};

func int DIA_Addon_Martin_FromVatras_Condition()
{
	if (Vatras_ToMartin ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_FromVatras_Info()
{
	AI_Output(other,self, " DIA_Addon_Martin_FromVatras_15_00 " );	// Are you looking for a man who sells weapons to bandits?
	AI_Output(self,other, " DIA_Addon_Martin_FromVatras_07_01 " );	// Who told you that?
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_02");	//Ватрас.
	AI_Output(self,other, " DIA_Addon_Martin_FromVatras_07_03 " );	// Clear. Well, what do you know about this case?
	AI_Output(other,self, " DIA_Addon_Martin_FromVatras_15_04 " );	// Not much, but I'll try to find out more.
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_05");	//Итак?..
};


instance DIA_Addon_Martin_TellAll(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_TellAll_Condition;
	information = DIA_Addon_Martin_TellAll_Info;
	description = " Tell me what you know about the arms dealer? " ;
};


func int DIA_Addon_Martin_TellAll_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_FromVatras))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_TellAll_Info()
{
	AI_Output(other,self, " DIA_Addon_Martin_TellAll_15_00 " );	// Tell me what you know about the arms dealer?
	AI_Output(self,other, " DIA_Addon_Martin_TellAll_07_01 " );	// We know that one of the powerful merchants living in the upper quarter is behind this.
	AI_Output(self,other, " DIA_Addon_Martin_TellAll_07_02 " );	// Some of the weapons sold were even taken from militia stocks.
	AI_Output(self,other, " DIA_Addon_Martin_TellAll_07_03 " );	// But we still don't know who exactly is in sales.
	AI_Output(self,other, " DIA_Addon_Martin_TellAll_07_04 " );	// If you're brave enough to deal with a group of at least five bandits, you might find some clues!
	B_LogEntry(TOPIC_Addon_Bandittrader, " Martin claims that the arms supplier is one of the high-powered townspeople living in the upper block. " );
};


instance DIA_Addon_Martin_AboutBandits(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_AboutBandits_Condition;
	information = DIA_Addon_Martin_AboutBandits_Info;
	description = " What is the situation with bandits? " ;
};


func int DIA_Addon_Martin_AboutBandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_TellAll))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_AboutBandits_Info()
{
	AI_Output(other,self, " DIA_Addon_Martin_AboutBandits_15_00 " );	// What's the situation with bandits?
	AI_Output(self,other, " DIA_Addon_Martin_AboutBandits_07_01 " );	// We know they're ambushing the roads that connect the town to the farms.
	AI_Output(self,other, " DIA_Addon_Martin_AboutBandits_07_02 " );	// We also know that they received a large shipment of weapons a few days ago.
	AI_Output(self,other, " DIA_Addon_Martin_AboutBandits_07_03 " );	// I think now's the time to look for clues to the identity of the trader they're collaborating with.
	MIs_Martin_FindTheBanditTrader = LOG_Running;
	B_LogEntry(TOPIC_Addon_Bandittrader, " Bandittraders are setting up ambushes on the roads between the city and the farms. Maybe there I'll find evidence pointing to a weapon supplier. " );
};


instance DIA_Addon_Martin_Fernando(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_Fernando_Condition;
	information = DIA_Addon_Martin_Fernando_Info;
	permanent = TRUE;
	description = " About the arms dealer... " ;
};


func int DIA_Addon_Martin_Fernando_Condition()
{
	if(MIs_Martin_FindTheBanditTrader == LOG_Running)
	{
		return TRUE;
	};
};


var int Martin_IrrlichtHint;

func void DIA_Addon_Martin_Fernando_Info()
{
	var int FernandoHints;
	AI_Output(other,self, " DIA_Addon_Martin_Fernando_15_00 " );	// About the arms dealer...
	if (Npc_HasItems(other,ItMw_Addon_BanditTrader) || Npc_HasItems(other,ItRi_Addon_BanditTrader) || (Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen ==  TRUE )) || (Fernando_HatsZugegeben ==  TRUE ))
	{
		AI_Output(self,other, " DIA_Addon_Martin_Fernando_07_01 " );	// What did you find out?
		FernandoHints = 0;

		if(Npc_HasItems(other,ItMw_Addon_BanditTrader) || Npc_HasItems(other,ItRi_Addon_BanditTrader) || (Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE)))
		{
			if(Npc_HasItems(other,ItMw_Addon_BanditTrader))
			{
				AI_Output(other,self, " DIA_Addon_Martin_Fernando_15_02 " );	// I found such swords from bandits. The letter 'F' is engraved on the hilt.
				FernandoHints = FernandoHints + 1;
			};
			if(Npc_HasItems(other,ItRi_Addon_BanditTrader))
			{
				AI_Output(other,self, " DIA_Addon_Martin_Fernando_15_03 " );	// I found this ring from the bandits. It points to a sea merchant.
				FernandoHints = FernandoHints + 1;
			};
			if (Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_delivery_read ==  TRUE ))
			{
				AI_Output(other,self, " DIA_Addon_Martin_Fernando_15_04 " );	// This list of weapons and other things delivered to the bandits is signed by a certain Fernando.
				FernandoHints = FernandoHints + 3;
			};
			if (Fernando_HatsGranted ==  TRUE )
			{
				AI_Output(other,self, " DIA_Addon_Martin_Fernando_15_05 " );	// And besides, Fernando, an old merchant from the upper quarter, confessed to doing business with bandits.
				FernandoHints = FernandoHints + 1;
			};
		}
		else
		{
			AI_Output(other,self, " DIA_Addon_Martin_Fernando_15_06 " );	// Fernando said he was supplying the bandits with weapons.
		};
		if(FernandoHints >= 3)
		{
			AI_Output(self,other, " DIA_Addon_Martin_Fernando_07_07 " );	// I think this is enough. So, Fernando... Well, he'll get what he deserves.
			AI_Output(self,other, " DIA_Addon_Martin_Fernando_07_08 " );	// And he was always so calm when it came to this.
			AI_Output(self,other, " DIA_Addon_Martin_Fernando_07_09 " );	// Well, now he will have to rot behind bars for a long time.
			AI_Output(self,other, " DIA_Addon_Martin_Fernando_07_10 " );	// I must say, you did a great job.
			AI_Output(self,other, " DIA_Addon_Martin_Fernando_07_11 " );	// Vatras will be pleased when he hears the news.
			B_StartOtherRoutine(Fernando,"Prison");
			Fernando_ImKnast = TRUE;
			MIs_Martin_FindTheBanditTrader = LOG_SUCCESS;
			B_LogEntry(TOPIC_Addon_Bandittrader, " Martin will make sure that Fernando gets punished. I should report this to Vatras. " );
			B_GivePlayerXP(XP_Addon_FernandoMartin);
			Npc_ExchangeRoutine(vlk_6134_valeran,"WaitInTavern");
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Martin_Fernando_07_12 " );	// And? What else?
			AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_13");	//Это все.

			if (Fernando_HatsGranted ==  TRUE )
			{
				AI_Output(self,other, " DIA_Addon_Martin_Fernando_07_14 " );	// It's good that he confessed, but without hard evidence, we can't put him behind bars.
				AI_Output(self,other, " DIA_Addon_Martin_Fernando_07_15 " );	// I don't want to make a fool of myself in front of Lord Hagen. You'll have to find some more evidence.
			}
			else
			{
				AI_Output(self,other, " DIA_Addon_Martin_Fernando_07_16 " );	// This is not enough. Your clues could point to just about any merchant in the upper quarter.
				AI_Output(self,other, " DIA_Addon_Martin_Fernando_07_17 " );	// Guess you'll have to keep tracking the bandits and tracing the path of the last batch of weapons they got.
				if(Martin_IrrlichtHint == FALSE)
				{
					AI_Output(self,other, " DIA_Addon_Martin_Fernando_07_18 " );	// Maybe you should talk to Vatras again...
					Martin_IrrlichtHint = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Martin_Fernando_15_19 " );	// Once again, what should I do?
		AI_Output(self,other, " DIA_Addon_Martin_Fernando_07_20 " );	// You must find out who is behind the supply of weapons to the bandits, and bring me evidence of his guilt.
		AI_Output(self,other, " DIA_Addon_Martin_Fernando_07_21 " );	// But it must be really hard evidence. Otherwise, I won't be able to arrest the merchant.
	};
};


instance DIA_Addon_Martin_Perm(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 90;
	condition = DIA_Addon_Martin_Perm_Condition;
	information = DIA_Addon_Martin_Perm_Info;
	permanent = TRUE;
	description = " Are all the boxes in place? " ;
};


func int DIA_Addon_Martin_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Perm_Info()
{
	AI_Output(other,self, " DIA_Addon_Martin_Perm_15_00 " );	// Are all boxes in place?
	if ((MIS_Addon_Martin_GetRunning_Day <= (Wld_GetDay() -  2 )) && (MIS_Addon_Martin_GetRunning == LOG_Running))
	{
		AI_Output(self,other, " DIA_Addon_Martin_Perm_07_01 " );	// (angrily) Damned bummer, you were supposed to be guarding those crates! A few more things are missing!
		if (Wld_IsTime( 24 , 0 , 3 , 0 ))
		{
			AI_Output(self,other, " DIA_Addon_Martin_Perm_07_02 " );	// Go to the harbor and catch the bastard who did this! You understood me?
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Martin_Perm_07_03 " );	// And tonight, when I'm gone, be careful!
		};
	}
	else if((MIS_Addon_Martin_GetRangar != 0) || (hero.guild != GIL_NONE) || (SC_IsRanger == TRUE))
	{
		AI_Output(self,other, " DIA_Addon_Martin_Perm_07_04 " );	// Come on, come on, laugh. Would you try to stand all day on the pier, trying to sort out all this chaos.
		AI_Output(self,other, " DIA_Addon_Martin_Perm_07_05 " );	// The paladins brought so much junk with them it's not even funny.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Martin_Perm_07_06 " );	// Don't touch anything or I'll call the guards. Is it clear?
	};
};


instance DIA_Addon_Martin_GotRangar(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 2;
	condition = DIA_Addon_Martin_GotRangar_Condition;
	information = DIA_Addon_Martin_GotRangar_Info;
	description = " I found out who steals things. " ;
};


func int DIA_Addon_Martin_GotRangar_Condition()
{
	if((MIS_Addon_Martin_GetRangar == LOG_Running) && (SC_GotRangar == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_GotRangar_Info()
{
	AI_Output(other,self, " DIA_Addon_Martin_GotRangar_15_00 " );	// I found out who steals things.
	AI_Output(other,self, " DIA_Addon_Martin_GotRangar_15_01 " );	// Ragnar has been digging through your crates.
	AI_Output(self,other, " DIA_Addon_Martin_GotRangar_07_02 " );	// Well, finally. Now at least I'll know who to look after. Here's the bastard! Well, if I catch him...
	AI_Output(self,other, " DIA_Addon_Martin_GotRangar_07_03 " );	// I've always wondered why paladins don't notice.
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_04");	//И? Почему?
	AI_Output(self,other, " DIA_Addon_Martin_GotRangar_07_05 " );	// It's obvious! These idiots can't tell one militia soldier from another. For them, we are all the same.
	AI_Output(self,other, " DIA_Addon_Martin_GotRangar_07_06 " );	// Good job, mate.
	AI_Output(self,other, " DIA_Addon_Martin_GotRangar_07_07 " );	// If you need anything, just say it.
	MIS_Addon_Martin_GetRangar = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Martin_GotRangar_Report);
};

instance DIA_Addon_Martin_GetMiliz(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 2;
	condition = DIA_Addon_Martin_GetMiliz_Condition;
	information = DIA_Addon_Martin_GetMiliz_Info;
	description = " You know what I need from you. " ;
};

func int DIA_Addon_Martin_GetMiliz_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Martin_GotRangar ) && ( hero . guild ==  GIL_NONE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_GetMiliz_Info()
{
	AI_Output(other,self, " DIA_Addon_Martin_GetMiliz_15_00 " );	// You know what I need from you.
	AI_Output(self,other, " DIA_Addon_Martin_GetMiliz_07_01 " );	// Oh, yes. You want to join the militia, right?
	AI_Output(self,other, " DIA_Addon_Martin_GetMiliz_07_02 " );	// Well, you've already shown me what you're capable of.
	AI_Output(self,other, " DIA_Addon_Martin_GetMiliz_07_03 " );	// Let's just say I'd rather have you on our side than anyone else's.
	AI_Output(self,other, " DIA_Addon_Martin_GetMiliz_07_04 " );	// So I'll help you. Take my letter of introduction and show it to Andre, our commander.
	CreateInvItems(self,ItWr_Martin_MilizEmpfehlung_Addon, 1 );
	B_GiveInvItems(self,other,ItWr_Martin_MilizEmpfehlung_Addon, 1 );
	AI_Output(self,other, " DIA_Addon_Martin_GetMiliz_07_05 " );	// You'll find him in the barracks. I'm sure he can find a use for you.
	B_LogEntry(TOPIC_Addon_RangerHelpMIL, " Martin gave me a letter of recommendation for Lord Andre. After reading it, Andre will accept me into the militia. You can find Andre in the barracks. " );
};

instance DIA_Addon_Martin_Coragon(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 2;
	condition = DIA_Addon_Martin_Coragon_Condition;
	information = DIA_Addon_Martin_Coragon_Info;
	permanent = FALSE;
	description = " Can you help me with one thing? " ;
};

func int DIA_Addon_Martin_Coragon_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Martin_PreTrade) == TRUE) && (MIS_CoragonFixBeer == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Coragon_Info()
{
	AI_Output(other,self, " DIA_Addon_Martin_Coragon_01_00 " );	// Can you help me with one thing?
	AI_Output(self,other, " DIA_Addon_Martin_Coragon_01_01 " );	// Depending on what it is.
	AI_Output(other,self, " DIA_Addon_Martin_Coragon_01_02 " );	// Innkeeper Koragon is in big trouble because Wirth is handing out free beer on the order of the paladins.
	AI_Output(other,self, " DIA_Addon_Martin_Coragon_01_03 " );	// He is losing customers, and therefore his income. Do you know what I'm getting at?
	AI_Output(self,other, " DIA_Addon_Martin_Coragon_01_04 " );	// (businesslike) Well, let's say. So what?
	AI_Output(other,self, " DIA_Addon_Martin_Coragon_01_05 " );	// Can you somehow influence this situation?
	AI_Output(self,other, " DIA_Addon_Martin_Coragon_01_06 " );	// Only Lord Hagen or Lord Andre can cancel a paladin order.
	AI_Output(self,other, " DIA_Addon_Martin_Coragon_01_07 " );	// I can't do this.
	AI_Output(other,self, " DIA_Addon_Martin_Coragon_01_08 " );	// Can't do anything?
	AI_Output(self,other, " DIA_Addon_Martin_Coragon_01_09 " );	// (sarcastically) Well, it all depends on what you can offer me in return.
	AI_Output(other,self, " DIA_Addon_Martin_Coragon_01_10 " );	// Would two casks of the finest beer suit you?
	AI_Output(self,other, " DIA_Addon_Martin_Coragon_01_11 " );	// (thoughtfully) Yes, this is a very interesting proposal.
	AI_Output(self,other, " DIA_Addon_Martin_Coragon_01_12 " );	// So you're saying Wirth is handing out beer in the town square?
	AI_Output(other,self,"DIA_Addon_Martin_Coragon_01_13");	//Он самый.
	AI_Output(self,other, " DIA_Addon_Martin_Coragon_01_14 " );	// Good. Give me some time - one day or so - and I'll sort out Coragon's problem.
	AI_Output(self,other, " DIA_Addon_Martin_Coragon_01_15 " );	// And then I wait for my beer! Don't forget about him.
	AI_Output(other,self,"DIA_Addon_Martin_Coragon_01_16");	//Конечно.
	MartinSpeakUpDay = Wld_GetDay();
	B_LogEntry(TOPIC_CoragonFixBeer, " Martin agreed to fix Coragon's problem in a day for two barrels of beer. I wonder how he'll do it? " );
};
