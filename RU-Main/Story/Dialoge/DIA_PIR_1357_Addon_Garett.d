

instance DIA_Addon_Garett_EXIT(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 999;
	condition = DIA_Addon_Garett_EXIT_Condition;
	information = DIA_Addon_Garett_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Garett_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Garett_PICKPOCKET(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 900;
	condition = DIA_Addon_Garett_PICKPOCKET_Condition;
	information = DIA_Addon_Garett_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Garett_PICKPOCKET_Condition()
{
	return  C_Robbery ( 36 , 55 );
};

func void DIA_Addon_Garett_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Garett_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Garett_PICKPOCKET,Dialog_Back,DIA_Addon_Garett_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Garett_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Garett_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garett_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Garett_PICKPOCKET);
};

func void DIA_Addon_Garett_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Garett_PICKPOCKET);
};


instance DIA_Addon_Garet_Hire (C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 1;
	condition = DIA_Addon_Garett_Hire_Condition;
	information = DIA_Addon_Garett_Hire_Info;
	important = TRUE;
};


func int DIA_Addon_Garett_Hire_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Addon_Greg_ClearCanyon == LOG_Running))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Garett_Hire_Info()
{
	AI_Output(self,other, " DIA_Addon_Garett_Anheuern_09_00 " );	// Don't even ask me to join your group.
	AI_Output(self,other, " DIA_Addon_Garett_Anheuern_09_01 " );	// What do you think will happen here if I leave?
	AI_Output(self,other, " DIA_Addon_Garett_Anheuern_09_02 " );	// There won't be a single crate left when I get back!
	AI_Output(self,other, " DIA_Addon_Garett_Anheuern_09_03 " );	// No, I have to stay here and guard our supplies.
};


instance DIA_Addon_Garett_Hello(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 1;
	condition = DIA_Addon_Garett_Hello_Condition;
	information = DIA_Addon_Garett_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Garett_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (MIS_Addon_Greg_ClearCanyon != LOG_Running))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Garett_Hello_Info()
{
	AI_Output(self,other, " DIA_Addon_Garett_Hello_09_00 " );	// Well, well. New face. I hope you're not one of those dirty bandits?
	AI_Output(self,other, " DIA_Addon_Garett_Hello_09_01 " );	// My name is Garett. If you need anything, ask me.
	AI_Output(self,other, " DIA_Addon_Garett_Hello_09_02 " );	// I can get almost anything. Wine, guns, whatever you might need.
	AI_Output(self,other, " DIA_Addon_Garett_Hello_09_03 " );	// Except moonshine. If you need moonshine, go to Samuel.
	Log_CreateTopic(Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
};


instance DIA_Addon_Garett_Samuel(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 2;
	condition = DIA_Addon_Garett_Samuel_Condition;
	information = DIA_Addon_Garett_Samuel_Info;
	permanent = FALSE;
	description = " Who is Samuel? " ;
};


func int DIA_Addon_Garett_Samuel_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Garett_Hello ) && ( Samuel . aivar [ AIV_ TalkedToPlayer ] ==  FALSE )) .
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Garett_Samuel_Info()
{
	AI_Output(other,self, " DIA_Addon_Garett_Samuel_15_00 " );	// Who is Samuel?
	AI_Output(self,other, " DIA_Addon_Garett_Samuel_09_01 " );	// Our moonshiner. He has a cave on the shore, not far from the camp.
	AI_Output(self,other, " DIA_Addon_Garett_Samuel_09_02 " );	// Just follow the coast to the north and you will find it.
	AI_Output(self,other, " DIA_Addon_Garett_Samuel_09_03 " );	// I would advise you to stock up on grog.
	AI_Output(self,other, " DIA_Addon_Garett_Samuel_09_04 " );	// Not all of our guys are friendly to newcomers, I hope you understand me.
	AI_Output(self,other, " DIA_Addon_Garett_Samuel_09_05 " );	// A bottle or two of grog can work wonders!
	B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};


instance DIA_Addon_Garett_Warez(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 3;
	condition = DIA_Addon_Garett_Warez_Condition;
	information = DIA_Addon_Garett_Warez_Info;
	description = " Where do you get your products from? " ;
};


func int DIA_Addon_Garett_Warez_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_Warez_Info()
{
	AI_Output(other,self, " DIA_Addon_Garett_Warez_15_00 " );	// Where do you get your goods from?
	AI_Output(self,other, " DIA_Addon_Garett_Warez_09_01 " );	// When Skip travels to Khorinis, he always brings a lot of things from there.
	AI_Output(self,other, " DIA_Addon_Garett_Warez_09_02 " );	// Until recently, he sold some of them directly to bandits.
	AI_Output(self,other, " DIA_Addon_Garett_Warez_09_03 " );	// But now we are at war with the bandits, so all the goods end up with me.
};


instance DIA_Addon_Garett_Bandits(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 3;
	condition = DIA_Addon_Garett_Bandits_Condition;
	information = DIA_Addon_Garett_Bandits_Info;
	description = " What do you know about these bandits? " ;
};


func int DIA_Addon_Garett_Bandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Warez))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Garett_Bandits_Info()
{
	AI_Output(other,self, " DIA_Addon_Garett_Bandits_15_00 " );	// What do you know about bandits?
	AI_Output(self,other, " DIA_Addon_Garett_Bandits_09_01 " );	// You'd better ask Skip about that.
	AI_Output(self,other, " DIA_Addon_Garett_Bandits_09_02 " );	// He's been around quite a bit with this gang.
	AI_Output(self,other, " DIA_Addon_Garett_Bandits_09_03 " );	// And now Greg ordered us to kill every bandit approaching the camp.
};


instance DIA_Addon_Garett_Greg(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 4;
	condition = DIA_Addon_Garett_Greg_Condition;
	information = DIA_Addon_Garett_Greg_Info;
	permanent = FALSE;
	description = " Your captain is Greg. What is he like? " ;
};


func int DIA_Addon_Garett_Greg_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_Greg_Info()
{
	AI_Output(other,self, " DIA_Addon_Garett_Greg_15_00 " );	// Your Captain Greg. What is he?
	AI_Output(self,other, " DIA_Addon_Garett_Greg_09_01 " );	// Don't mess with this old sea dog.
	AI_Output(self,other, " DIA_Addon_Garett_Greg_09_02 " );	// Plus, he's greedy to the point of impossibility.
	AI_Output(self,other, " DIA_Addon_Garett_Greg_09_03 " );	// Francis, his treasurer, pays us just the right amount to keep us from rioting.
	AI_Output(self,other, " DIA_Addon_Garett_Greg_09_04 " );	// And if we come across something really valuable, the captain immediately takes it for himself.
	AI_Output(self,other, " DIA_Addon_Garett_Greg_09_05 " );	// Once on a royal frigate, I found a golden compass.
	AI_Output(self,other, " DIA_Addon_Garett_Greg_09_06 " );	// Of course that bastard Greg took it from me.
	AI_Output(self,other, " DIA_Addon_Garett_Greg_09_07 " );	// He must have buried it somewhere. He does this with all his treasures.
};


instance DIA_Addon_Garett_Tips(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 5;
	condition = DIA_Addon_Garett_Tips_Condition;
	information = DIA_Addon_Garett_Tips_Info;
	description = " Where could he have buried your compass? " ;
};


func int DIA_Addon_Garett_Tips_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Garett_Tips_Info()
{
	AI_Output(other,self, " DIA_Addon_Garett_Tips_15_00 " );	// Where could he have buried your compass?
	AI_Output(self,other, " DIA_Addon_Garett_Tips_09_01 " );	// Greg once told me that the compass is guarded by Death itself. And then he laughed.
	AI_Output(other,self, " DIA_Addon_Garett_Tips_15_02 " );	// Anything else?
	AI_Output(self,other, " DIA_Addon_Garett_Tips_09_03 " );	// There is a cove to the south that can only be reached by sea.
	AI_Output(self,other, " DIA_Addon_Garett_Tips_09_04 " );	// Greg often goes there, Maybe you can find something there.
	AI_Output(self,other, " DIA_Addon_Garett_Tips_09_05 " );	// Once I tried to explore this place myself, but it turned out to be infested with monsters.
	AI_Output(self,other, " DIA_Addon_Garett_Tips_09_06 " );	// If you do decide to go there, don't forget your pickaxe.
	MIS_ADDON_GARett_BringKompass = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_Kompass,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kompass,LOG_Running);
	B_LogEntry(TOPIC_Addon_Kompass, " Greg took the precious compass from Garrett. Garrett thinks Greg buried it somewhere on the south beach. " );
};

instance DIA_Addon_Garett_Tips_Next(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 5;
	condition = DIA_Addon_Garett_Tips_Next_Condition;
	information = DIA_Addon_Garett_Tips_Next_Info;
	description = " Greg's treasure is guarded by death itself? " ;
};

func int DIA_Addon_Garett_Tips_Next_Condition()
{
	if(MIS_ADDON_GARett_BringKompass == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Tips_Next_Info()
{
	AI_Output(other,self, " DIA_Addon_Garett_Tips_Next_01_00 " );	// What did Greg mean when he said that the treasure is guarded by Death itself?
	AI_Output(self,other, " DIA_Addon_Garett_Tips_Next_01_01 " );	// Rumor has it that this treasure is cursed! And it is guarded by people whom Greg himself once killed.
	AI_Output(self,other, " DIA_Addon_Garett_Tips_Next_01_02 " );	// So be very careful if you go there.
};

instance DIA_Addon_Garett_GiveKompass(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 6;
	condition = DIA_Addon_Garett_GiveKompass_Condition;
	information = DIA_Addon_Garett_GiveKompass_Info;
	permanent = FALSE;
	description = " Here's your compass. " ;
};

func int DIA_Addon_Garett_GiveKompass_Condition()
{
	if((Npc_HasItems(other,ItMI_Addon_Kompass_Mis) >= 1) && (MIS_ADDON_GARett_BringKompass == LOG_Running))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Garett_GiveKompass_Info()
{
	AI_Output(other,self, " DIA_Addon_Garett_GiveKompass_15_00 " );	// Here's your compass.
	if(B_GiveInvItems(other,self,ItMI_Addon_Kompass_Mis,1))
	{
		Npc_RemoveInvItems(self,ItMI_Addon_Kompass_Mis,1);
	};
	AI_Output(self,other, " DIA_Addon_Garett_GiveKompass_09_01 " );	// (joyfully) Yes, it's him! I never thought that I would see him again.
	AI_Output(self,other, " DIA_Addon_Garett_GiveKompass_09_02 " );	// Thanks mate!
	if(Npc_HasItems(self,ItBe_Addon_Prot_EdgPoi) > 0)
	{
		AI_Output(self,other, " DIA_Addon_Garett_GiveKompass_09_03 " );	// Greg won't get it this time.
		AI_Output(self,other, " DIA_Addon_Garett_GiveKompass_09_04 " );	// Reward this belt. This is one of my most valuable things.
		B_GiveInvItems(self,other,ItBe_Addon_Prot_EdgPoi,1);
	}
	else  if (self.aivar[AIV_DefeatedByPlayer] ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Garett_GiveKompass_09_05 " );	// Remember, you bought the belt from me.
		AI_Output(self,other, " DIA_Addon_Garett_GiveKompass_09_06 " );	// You paid a fair amount for it... No, of course it's worth the money. Basically, you can take them back.
		B_GiveInvItems(self,other,ItMi_Gold,Value_ItBE_Addon_Prot_EdgPoi);
	};
	B_LogEntry(TOPIC_Addon_Kompass, " Garrett was very happy when I returned the compass to him. " );
	MIS_ADDON_GARett_BringKompass = LOG_SUCCESS;
	B_GivePlayerXP(XP_ADDON_Garett_Bring_Kompass);
};


instance DIA_Addon_Garett_Francis(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 7;
	condition = DIA_Addon_Garett_Francis_Condition;
	information = DIA_Addon_Garett_Francis_Info;
	permanent = FALSE;
	description = " What can you tell me about Francis? " ;
};


func int DIA_Addon_Garett_Francis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Garett_Francis_Info()
{
	AI_Output(other,self, " DIA_Addon_Garett_Francis_15_00 " );	// What can you tell me about Francis?
	AI_Output(self,other, " DIA_Addon_Garett_Francis_09_01 " );	// When Greg is away, he stays in charge.
	AI_Output(self,other, " DIA_Addon_Garett_Francis_09_02 " );	// But to be honest, he's no leader.
	AI_Output(self,other, " DIA_Addon_Garett_Francis_09_03 " );	// He can't even get Morgan to get his lazy ass off the bed.
	AI_Output(self,other, " DIA_Addon_Garett_Francis_09_04 " );	// Only Henry and his guys are doing something useful now.
	AI_Output(self,other, " DIA_Addon_Garett_Francis_09_05 " );	// The rest are just messing around.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Garett_Francis_09_06 " );	// Hope Greg comes back soon.
		AI_Output(self,other, " DIA_Addon_Garett_Francis_09_07 " );	// He will show these lazy people what's what.
	};
};


instance DIA_Addon_Garett_PERM(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 99;
	condition = DIA_Addon_Garett_PERM_Condition;
	information = DIA_Addon_Garett_PERM_Info;
	permanent = TRUE;
	description = " Any news? " ;
};

func int DIA_Addon_Garett_PERM_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_PERM_Info()
{
	AI_Output(other,self, " DIA_Addon_Garett_PERM_15_00 " );	// Any news?

	if(GregIsBack == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Garett_PERM_09_02 " );	// Nothing interesting has happened since Greg left.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Garett_PERM_09_01 " );	// After Greg returned, everything started to return to normal.
	};
};

instance DIA_Addon_Garett_Trade(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 888;
	condition = DIA_Addon_Garett_Trade_Condition;
	information = DIA_Addon_Garett_Trade_Info;
	permanent = TRUE;
	description = " Let's get down to business! " ;
	trade = TRUE;
};

func int DIA_Addon_Garett_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Hello) == TRUE)
	{
		return TRUE;
	};

	return  FALSE ;
};


var int garretarrowsday;

func void DIA_Addon_Garett_Trade_Info()
{
	var int Garett_Random;
	where int daynow;
	var int bolzenamount;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	Garett_Random = Hlp_Random( 3 );

	if(Garett_Random == 0)
	{
		B_Say(other,self,"$TRADE_1");
	}
	else if(Garett_Random == 1)
	{
		B_Say(other,self,"$TRADE_2");
	}
	else
	{
		B_Say(other,self,"$TRADE_3");
	};

	daynow = Wld_GetDay();

	if(GARRETARROWSDAY < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (GARRETARROWSDAY < (daynow - 1)))
		{
			bolzenamount = (Kapitel * 100) + (10 * (daynow - GARRETARROWSDAY - 1));
			if(bolzenamount > Npc_HasItems(self,ItRw_Bolt))
			{
				CreateInvItems(self,ItRw_Bolt,bolzenamount - Npc_HasItems(self,ItRw_Bolt));
			};
			if(bolzenamount > Npc_HasItems(self,ItRw_Arrow))
			{
				CreateInvItems(self,ItRw_Arrow,bolzenamount - Npc_HasItems(self,ItRw_Arrow));
			};
			GARRETARROWSDAY = daynow;
		};
	};

	B_GiveTradeInv(self);
};

