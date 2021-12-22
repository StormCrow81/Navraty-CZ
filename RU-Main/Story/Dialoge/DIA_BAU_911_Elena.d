instance DIA_Elena_EXIT(C_Info)
{
	npc = BAU_911_Elena;
	No. = 999 ;
	condition = DIA_Elena_EXIT_Condition;
	information = DIA_Elena_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Elena_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Elena_EXIT_Info ()
{
	AI_StopProcessInfos(self);
};


instance DIA_Elena_HALLO (C_Info)
{
	npc = BAU_911_Elena;
	no. = 1 ;
	condition = DIA_Elena_HALLO_Condition;
	information = DIA_Elena_HALLO_Info;
	permanent = FALSE ;
	description = " Hello, beautiful. " ;
};


func int DIA_Elena_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Elena_HELLO_Info()
{
	AI_Output (other, self, " DIA_Elena_HALLO_15_00 " );	// Hello, beautiful.
	if(other.guild == GIL_NONE)
	{
		AI_Output (self, other, " DIA_Elena_HALLO_16_01 " );	// Hmm. Where did you come from?
	}
	else
	{
		AI_Output (self, other, " DIA_Elena_HALLO_16_02 " );	// What do you need?
	};
};


instance DIA_Elena_Aufstand (C_Info)
{
	npc = BAU_911_Elena;
	no. = 2 ;
	condition = DIA_Elena_Aufstand_Condition;
	information = DIA_Elena_Aufstand_Info;
	permanent = FALSE ;
	description = " They say you rebelled against the king? " ;
};


func int DIA_Elena_Aufstand_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Elena_Aufstand_Info ()
{
	AI_Output (other, self, " DIA_Elena_Aufstand_15_00 " );	// They say you rebelled against the king?
	AI_Output (self, other, " DIA_Elena_Aufstand_16_01 " );	// My father decided it was time to defend himself.
	if(other.guild != GIL_MIL)
	{
		AI_Output (self, other, " DIA_Elena_Aufstand_16_02 " );	// The militia never helped us. They only came here to pick up provisions.
	};
};


instance DIA_Elena_Arbeit (C_Info)
{
	npc = BAU_911_Elena;
	No. = 3 ;
	condition = DIA_Elena_Arbeit_Condition;
	information = DIA_Elena_Work_Info;
	permanent = FALSE ;
	description = " Is there any work here on the farm? " ;
};


func int DIA_Elena_Arbeit_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Elena_Arbeit_Info ()
{
	AI_Output (other, self, " DIA_Elena_Arbeit_15_00 " );	// Is there any work here on the farm?
	AI_Output (self, other, " DIA_Elena_Arbeit_16_01 " );	// My father pays well everyone who helps protect the farm.
	AI_Output (self, other, " DIA_Elena_Arbeit_16_02 " );	// Are you interested in this? You don't look like a person used to working in the field.
	AI_Output (other, self, " DIA_Elena_Arbeit_15_03 " );	// How much does your father pay?
	AI_Output (self, other, " DIA_Elena_Arbeit_16_04 " );	// You'd better discuss this with him.
	AI_Output (self, other, " DIA_Elena_Arbeit_16_05 " );	// All I know is that the mercenaries are paid daily.
};


instance DIA_Elena_Regeln(C_Info)
{
	npc = BAU_911_Elena;
	No. = 4 ;
	condition = DIA_Elena_Regeln_Condition;
	information = DIA_Elena_Regeln_Info;
	permanent = FALSE ;
	description = " Are there any rules that I need to follow? " ;
};


func int DIA_Elena_Regeln_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Elena_Regeln_Info ()
{
	AI_Output (other, self, " DIA_Elena_Regeln_15_00 " );	// Are there any rules here that I need to follow?
	AI_Output (self, other, " DIA_Elena_Regeln_16_01 " );	// Don't touch what doesn't belong to you.
	AI_Output (self, other, " DIA_Elena_Regeln_16_02 " );	// Don't stick your nose into other people's business.
	AI_Output (self, other, " DIA_Elena_Regeln_16_03 " );	// And if you feel like fighting, fight the mercenaries.
	AI_Output (self, other, " DIA_Elena_Regeln_16_04 " );	// If you start a fight with the farmers, everyone here will be against you.
};


instance DIA_Elena_AUFGABE (C_Info)
{
	npc = BAU_911_Elena;
	No. = 5 ;
	condition = DIA_Elena_AUFGABE_Condition;
	information = DIA_Elena_AUFGABE_Info;
	permanent = FALSE ;
	description = " What do you do? " ;
};


func int DIA_Elena_AUFGABE_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Elena_AUFGABE_Info ()
{
	AI_Output (other, self, " DIA_Elena_AUFGABE_15_00 " );	// What are you doing?
	AI_Output (self, other, " DIA_Elena_AUFGABE_16_01 " );	// I sell what we grow on the farm. If you want to buy anything, let me know.
	AI_Output (self, other, " DIA_Elena_AUFGABE_16_02 " );	// But I want to warn you. I do not like to bargain and will not tolerate theft. Clear?
	Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader, " Elena sells goods at Onara 's farm. " );
};


var int Elena_Trade_mit_mir;

instance DIA_Elena_TRADE(C_Info)
{
	npc = BAU_911_Elena;
	No. = 7 ;
	condition = DIA_Elena_TRADE_Condition;
	information = DIA_Elena_TRADE_Info;
	permanent = TRUE;
	description = " Show me your products! " ;
	trade = TRUE;
};


func int DIA_Elena_TRADE_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Elena_AUFGABE) || (Elena_Trade_mit_mir ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Elena_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	AI_Output (other, self, " DIA_Elena_TRADE_15_00 " );	// Show me your items!
	AI_Output(self,other,"DIA_Elena_TRADE_16_01");	//Take your pick.
	B_GiveTradeInv(self);
};


instance DIA_Elena_PERM(C_Info)
{
	npc = BAU_911_Elena;
	NO = 900 ;
	condition = DIA_Elena_PERM_Condition;
	information = DIA_Elena_PERM_Info;
	permanent = TRUE;
	description = " Anything interesting lately? " ;
};


func int DIA_Elena_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Elena_PERM_Info()
{
	AI_Output (other, self, " DIA_Elena_PERM_15_00 " );	// Anything interesting lately?
	if(Kapitel <= 1)
	{
		AI_Output (self, other, " DIA_Elena_PERM_16_01 " );	// A few days ago my father announced that we could no longer sell anything to the city.
		AI_Output (self, other, " DIA_Elena_PERM_16_02 " );	// So I am now on the farm all the time and only sell goods here.
		Elena_Trade_mit_mir = TRUE ;
	}
	else if(Kapitel == 2)
	{
		AI_Output (self, other, " DIA_Elena_PERM_16_03 " );	// Militia attacks on neighboring farms are happening more and more often. It's only a matter of time before my father intervenes.
	}
	else if(Kapitel == 3)
	{
		AI_Output (self, other, " DIA_Elena_PERM_16_04 " );	// Life has become so dangerous here. No one dares to stray far from their field. None of us have been in the city for a long time.
	}
	else if(Kapitel == 4)
	{
		AI_Output (self, other, " DIA_Elena_PERM_16_05 " );	// The mercenaries are getting more and more nervous. But since Silvio left with his men, they seem to have calmed down a bit.
	}
	else
	{
		AI_Output (self, other, " DIA_Elena_PERM_16_06 " );	// Everyone is just talking about the imminent attack of the orcs. But I don't really believe it will happen. I think we are safe here on the farm.
	};
};


instance DIA_Elena_MINENANTEIL(C_Info)
{
	npc = BAU_911_Elena;
	no. = 2 ;
	condition = DIA_Elena_MINENANTEIL_Condition;
	information = DIA_Elena_MINENANTEIL_Info;
	description = " Are you selling stocks? " ;
};


func int DIA_Elena_MINENANTEIL_Condition ()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && Npc_KnowsInfo(other,DIA_Elena_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Elena_MINENANTEIL_Info ()
{
	AI_Output (other, self, " DIA_Elena_MINENANTEIL_15_00 " );	// Are you selling shares in any mines?
	AI_Output (self, other, " DIA_Elena_MINENANTEIL_16_01 " );	// So what? I bought them myself from another merchant.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Elena_PICKPOCKET(C_Info)
{
	npc = BAU_911_Elena;
	NO = 900 ;
	condition = DIA_Elena_PICKPOCKET_Condition;
	information = DIA_Elena_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Elena_PICKPOCKET_Condition()
{
	return  C_Beklauen ( 30 , 35 );
};

func void DIA_Elena_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Elena_PICKPOCKET);
	Info_AddChoice (DIA_Elena_PICKPOCKET, Dialog_Back, DIA_Elena_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Elena_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Elena_PICKPOCKET_DoIt);
};

func void DIA_Elena_PICKPOCKET_DoIt ()
{
	B_Beklauen ();
	Info_ClearChoices(DIA_Elena_PICKPOCKET);
};

func void DIA_Elena_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Elena_PICKPOCKET);
};
