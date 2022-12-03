

instance DIA_Khaled_EXIT(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 999;
	condition = DIA_Khaled_EXIT_Condition;
	information = DIA_Khaled_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Khaled_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Khaled_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Khaled_next;

instance DIA_Khaled_Hello (C_Info)
{
	npc = SLD_823_Khaled;
	nr = 1;
	condition = DIA_Khaled_Hallo_Condition;
	information = DIA_Khaled_Hallo_Info;
	permanent = TRUE;
	description = " Are you all right? " ;
};

func int DIA_Khaled_Hallo_Condition()
{
	if (Khaled_next ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Khaled_Hallo_Info()
{
	AI_Output(other,self, " DIA_Khaled_Hallo_15_00 " );	// Are you all right?

	if(Npc_KnowsInfo(other,DIA_Lee_WannaJoin))
	{
		AI_Output(self,other, " DIA_Khaled_Hallo_11_01 " );	// Hmm - so you want to join us, huh? Do you even have a decent weapon?
		Khaled_next = TRUE ;
		Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry(Topic_SoldierTrader, " Khaled is an arms dealer. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Khaled_Hallo_11_02 " );	// If you have something important, talk to Lee. And leave me alone.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Khaled_TRADE(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 700;
	condition = DIA_Khaled_TRADE_Condition;
	information = DIA_Khaled_TRADE_Info;
	permanent = TRUE;
	description = " What weapon can you offer me? " ;
	trade = TRUE;
};

func int DIA_Khaled_TRADE_Condition()
{
	if((Khaled_weiter == TRUE) && Wld_IsTime(7,55,23,55))
	{
		return TRUE;
	};
};

func void DIA_Khaled_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Khaled_TRADE_15_00 " );	// What weapon can you offer me?

	if((Khaled_Trade_OneTime == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		CreateInvItems(self,ItMw_1h_Sld_Sword_New,1);
		CreateInvItems(self,ItMw_2h_Sld_Sword,1);
		CreateInvItems(self,ItMw_1h_Sld_Axe,1);
		CreateInvItems(self,ItMw_Bartaxt,1);
		CreateInvItems(self,ItMw_Doppelaxt,1);
		CreateInvItems(self,ItMw_2h_Sld_Axe,1);
		CreateInvItems(self,ItMw_Streitaxt1,1);
		CreateInvItems(self,ITMW_2H_G3A_ORCAXE_02,1);
		CreateInvItems(self,ItMw_Streitaxt2,1);
		CreateInvItems(self,ItMw_Streitaxt3,1);
		CreateInvItems(self,ItMw_Kriegshammer1, 1 );
		CreateInvItems(self,ItMw_Kriegshammer2, 1 );
		CreateInvItems(self,ItMw_2H_Warhammer,1);
		CreateInvItems(self,ItRw_Bow_H_01,1);
		CreateInvItems(self,ItRw_Bow_H_02,1);
		CreateInvItems(self,ItRw_Bow_H_03,1);
		CreateInvItems(self,ItRw_Bow_H_04,1);
		CreateInvItems(self,ItRw_Crossbow_M_01,1);
		CreateInvItems(self,ItRw_Arrow,100);
		CreateInvItems(self,ItRw_Bolt,50);
		CreateInvItems(self,ItBE_Addon_SLD_01,1);
		CreateInvItems(self,ItBE_Addon_SLD_02,1);
		CreateInvItems(self,ItBE_Addon_SLD_03,1);
		Khaled_Trade_OneTime = TRUE;
		AI_Output(self,other, " DIA_Khaled_TRADE_11_01 " );	// Only the best! Yes, take a look at it.
	};

	B_GiveTradeInv(self);
};


instance DIA_Khaled_WannaJoin(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 10;
	condition = DIA_Khaled_WannaJoin_Condition;
	information = DIA_Khaled_WannaJoin_Info;
	permanent = TRUE;
	description = " Do you mind if I join you? " ;
};


func int DIA_Khaled_WannaJoin_Condition()
{
	if((Khaled_weiter == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Khaled_WannaJoin_Info()
{
	AI_Output(other,self, " DIA_Khaled_WannaJoin_15_00 " );	// Do you mind if I join you?
	AI_Output(self,other, " DIA_Khaled_WannaJoin_11_01 " );	// When you pass the test, I will vote for you.
	if((MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS) || (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS))
	{
		AI_Output(other,self, " DIA_Khaled_WannaJoin_15_02 " );	// I already passed it.
		AI_Output(self,other, " DIA_Khaled_WannaJoin_11_03 " );	// Well, that's all right then.
	};
};


instance DIA_Khaled_Where from (C_Info)
{
	npc = SLD_823_Khaled;
	nr = 3;
	condition = DIA_Khaled_Where_Condition;
	information = DIA_Khaled_Where_Info;
	permanent = FALSE;
	description = " How did you end up among the mercenaries? " ;
};


func int DIA_Khaled_Where_Condition()
{
	if(Khaled_weiter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_Where_Info()
{
	AI_Output(other, self, " DIA_Khaled_Woher_15_00 " );	// How did you end up among the mercenaries?
	AI_Output(self,other, " DIA_Khaled_Woher_11_01 " );	// I came with Silvio from the south. We were in a mercenary army that fought the orcs.
};


instance DIA_Khaled_AboutSylvio(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 4;
	condition = DIA_Khaled_AboutSylvio_Condition;
	information = DIA_Khaled_AboutSylvio_Info;
	permanent = FALSE;
	description = " What do you think of Silvio? " ;
};


func int DIA_Khaled_AboutSylvio_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Khaled_Woher))
	{
		return TRUE;
	};
};

func void DIA_Khaled_AboutSylvio_Info()
{
	AI_Output(other,self, " DIA_Khaled_AboutSylvio_15_00 " );	// What do you think of Silvio?
	AI_Output(self,other, " DIA_Khaled_AboutSylvio_11_01 " );	// This is a dangerous type! And many of the mercenaries that came with him listen to his opinion. You better not mess with him.
};


instance DIA_Khaled_AboutLee(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 5;
	condition = DIA_Khaled_AboutLee_Condition;
	information = DIA_Khaled_AboutLee_Info;
	permanent = FALSE;
	description = " What do you think of Lee? " ;
};


func int DIA_Khaled_AboutLee_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Khaled_Woher))
	{
		return TRUE;
	};
};

func void DIA_Khaled_AboutLee_Info()
{
	AI_Output(other,self, " DIA_Khaled_AboutLee_15_00 " );	// What do you think of Lee?
	AI_Output(self,other, " DIA_Khaled_AboutLee_11_01 " );	// I think the only thing Lee is really interested in is how to get off this island.
	AI_Output(self,other, " DIA_Khaled_AboutLee_11_02 " );	// He wants to get to the mainland. Looks like he's got a score with someone...
	AI_Output(self,other, " DIA_Khaled_AboutLee_11_03 " );	// But be that as it may, he is much better at his job than Silvio is capable of.
	AI_Output(self,other, " DIA_Khaled_AboutLee_11_04 " );	// He's also a good leader. Most of the time we can do whatever we want here.
};


instance DIA_Khaled_PICKPOCKET(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 900;
	condition = DIA_Khaled_PICKPOCKET_Condition;
	information = DIA_Khaled_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Khaled_PICKPOCKET_Condition()
{
	return  C_Robbery ( 78 , 85 );
};

func void DIA_Khaled_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Khaled_PICKPOCKET);
	Info_AddChoice(DIA_Khaled_PICKPOCKET,Dialog_Back,DIA_Khaled_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Khaled_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Khaled_PICKPOCKET_DoIt);
};

func void DIA_Khaled_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Khaled_PICKPOCKET);
};

func void DIA_Khaled_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Khaled_PICKPOCKET);
};

