
instance DIA_Rukhar_EXIT(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 999;
	condition = DIA_Rukhar_EXIT_Condition;
	information = DIA_Rukhar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rukhar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rukhar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rukhar_HELLO (C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 4;
	condition = DIA_Rukhar_HALLO_Condition;
	information = DIA_Rukhar_HELLO_Info;
	description = " How's the beer here? " ;
};


func int DIA_Rukhar_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Rukhar_HELLO_Info()
{
	AI_Output(other,self, " DIA_Rukhar_HALLO_15_00 " );	// How's the beer here?
	AI_Output(self,other, " DIA_Rukhar_HALLO_12_01 " );	// Not the best, but you can't be too picky these days.
};


instance DIA_Rukhar_WASMACHSTDU (C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 5;
	condition = DIA_Rukhar_WASMACHSTDU_Condition;
	information = DIA_Rukhar_WASMACHSTDU_Info;
	description = " What are you doing here? " ;
};


func int DIA_Rukhar_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rukhar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_WASMACHSTDU_Info()
{
	AI_Output(other,self, " DIA_Rukhar_WASMACHSTDU_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Rukhar_WASMACHSTDU_12_01 " );	// Until a few weeks ago, I worked like a slave on Onar's farm.
	AI_Output(self,other, " DIA_Rukhar_WASMACHSTDU_12_02 " );	// But one day I realized that I couldn't stand it anymore and ran away.
	AI_Output(self,other, " DIA_Rukhar_WASMACHSTDU_12_03 " );	// I'm my own boss now. Everything that belongs to me is in this chest. And I don't need anything else.
	AI_Output(self,other, " DIA_Rukhar_WASMACHSTDU_12_04 " );	// Say, might you be interested in a friendly contest?
	Log_CreateTopic(TOPIC_Wettsaufen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wettsaufen,LOG_Running);
	B_LogEntry(TOPIC_Wettsaufen, " You can bet in the tavern. " );
};


instance DIA_Rukhar_COMPETITION (C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 3;
	condition = DIA_Rukhar_WETTKAMPF_Condition;
	information = DIA_Rukhar_COMPETITION_Info;
	description = " What is this contest? " ;
};


func int DIA_Rukhar_COMPETITION_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rukhar_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_COMPETITION_Info()
{
	AI_Output(other,self, " DIA_Rukhar_WETTKAMPF_15_00 " );	// What is this contest?
	AI_Output(self,other, " DIA_Rukhar_WETTKAMPF_12_01 " );	// I call it 'Drowner'!
	AI_Output(self,other, " DIA_Rukhar_WETTKAMPF_12_02 " );	// The rules are very simple.
	AI_Output(self,other, " DIA_Rukhar_WETTKAMPF_12_03 " );	// We take turns ordering a glass of this excellent beer offered by this old eccentric.
	AI_Output(self,other, " DIA_Rukhar_WETTKAMPF_12_04 " );	// Each mug needs to be drained so well that the table stays dry when turned upside down.
	AI_Output(self,other, " DIA_Rukhar_WETTKAMPF_12_05 " );	// Whoever lasts the longest wins. The loser pays for the beer and the bet. Well? You got the balls?
	AI_Output(other,self, " DIA_Rukhar_WETTKAMPF_15_06 " );	// Maybe later when I'm not in such a hurry.
};


instance DIA_Rukhar_HOLERANDOLPH(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 3;
	condition = DIA_Rukhar_HOLERANDOLPH_Condition;
	information = DIA_Rukhar_HOLERANDOLPH_Info;
	description = " Can I bet on someone else? " ;
};


func int DIA_Rukhar_HOLERANDOLPH_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Rukhar_WETTKAMPF))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_HOLERANDOLPH_Info()
{
	AI_Output(other,self, " DIA_Rukhar_HOLERANDOLPH_15_00 " );	// Can I bet on someone else?
	AI_Output(self,other, " DIA_Rukhar_HOLERANDOLPH_12_01 " );	// Of course. If you find anyone with the courage to face me, I'll take your bet.
	AI_Output(self,other, " DIA_Rukhar_HOLERANDOLPH_12_02 " );	// Everyone puts the same stakes in the pot. Winner takes all! The size of the bet depends only on the size of your wallet.
	AI_Output(self,other, " DIA_Rukhar_HOLERANDOLPH_12_03 " );	// Bring me someone who dares to face me, and I'll take your bet.
	B_LogEntry(TOPIC_Wettsaufen, " RuKhar calls this game DROWNER. No thanks, I'm not interested. I'll find someone else to compete for the hangover of the century. " );
};


instance DIA_Rukhar_RANDOLPHWILL(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 3;
	condition = DIA_Rukhar_RANDOLPHWILL_Condition;
	information = DIA_Rukhar_RANDOLPHWILL_Info;
	permanent = TRUE;
	description = " I've found a man who wants to test himself against you. " ;
};


var int DIA_Rukhar_RANDOLPHWILL_noPerm;

func int DIA_Rukhar_RANDOLPHWILL_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Randolph_GEGENWEN ) && Npc_KnowsInfo ( other , DIA_Randolph_HOLERANDOLPH ) && ( DIA_Randolph_RandolphWILL_noPerm ==  FALSE )) .
	{
		return TRUE;
	};
};

func void DIA_Rukhar_RANDOLPHWILL_Info()
{
	AI_Output(other,self, " DIA_Rukhar_RANDOLPHWILL_15_00 " );	// I found a man who wants to test himself against you.
	AI_Output(self,other, " DIA_Rukhar_RANDOLPHWILL_12_01 " );	// Who is this?
	AI_Output(other,self, " DIA_Rukhar_RANDOLPHWILL_15_02 " );	// Randolph.
	AI_Output(self,other, " DIA_Rukhar_RANDOLPHWILL_12_03 " );	// Ho, ho, ho... Randolph the braggart?! OK then. Why not?
	AI_Output(self,other, " DIA_Rukhar_RANDOLPHWILL_12_04 " );	// Send that slug to me and place your bet.
	AI_Output(self,other, " DIA_Rukhar_RANDOLPHWILL_12_05 " );	// You can set it up again after 2 days at the earliest. Who knows? Maybe you'll be lucky and he'll sober up in time.
	AI_Output(self,other, " DIA_Rukhar_RANDOLPHWILL_12_06 " );	// What's your bet?
	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice(DIA_Route_RANDOLPHWILL, " Zero " ,DIA_Root_RANDOLPHWILL_nix);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"100",DIA_Rukhar_RANDOLPHWILL_100);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"50",DIA_Rukhar_RANDOLPHWILL_50);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"20",DIA_Rukhar_RANDOLPHWILL_20);
	Info_AddChoice(DIA_Choice_RANDOLPHWILL, "10" ,DIA_Choice_RANDOLPHWILL_10);
};

func void DIA_Rukhar_RANDOLPHWILL_accept()
{
	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	AI_Output(self,other, " DIA_Rukhar_RANDOLPHWILL_annehmen_12_00 " );	// I'll take your bet and hold it until the contest is over, okay?
	DAY_OUT_RANDOLPHWILL_noPerm = TRUE ;
};

func void DIA_Rukhar_RANDOLPHWILL_more()
{
	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice(DIA_Route_RANDOLPHWILL, " Zero " ,DIA_Root_RANDOLPHWILL_nix);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"100",DIA_Rukhar_RANDOLPHWILL_100);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"50",DIA_Rukhar_RANDOLPHWILL_50);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"20",DIA_Rukhar_RANDOLPHWILL_20);
	Info_AddChoice(DIA_Choice_RANDOLPHWILL, "10" ,DIA_Choice_RANDOLPHWILL_10);
};

func void DIA_Rukhar_RANDOLPHWILL_nix()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_nix_15_00");	//Zero.
	AI_Output(self,other, " DIA_Rukhar_RANDOLPHWILL_nix_12_01 " );	// Then we'd better forget it.
	AI_StopProcessInfos(self);
};

func void DIA_Rukhar_RANDOLPHWILL_10()
{
	AI_Output(other,self, " DIA_Rukhar_RANDOLPHWILL_10_15_00 " );	// Ten gold.
	AI_Output(self,other, " DIA_Rukhar_RANDOLPHWILL_10_12_01 " );	// Come on, you must be joking. A few more gold won't ruin you.
	Rukhar_deployment = 10 ;
	Rukhar_profit = 20 ;
	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, " (choose another bet) " ,DIA_Rukhar_RANDOLPHWILL_mehr);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, " (accept bet) " ,DIA_Rukhar_RANDOLPHWILL_annehmen);
};

func void DIA_Rukhar_RANDOLPHWILL_20()
{
	AI_Output(other,self, " DIA_Rukhar_RANDOLPHWILL_20_15_00 " );	// Twenty.
	AI_Output(self,other, " DIA_Rukhar_RANDOLPHWILL_20_12_01 " );	// If you want to bet, then do it like a man.
	Rukhar_deployment = 20 ;
	Rukhar_profit = 40 ;
	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, " (choose another bet) " ,DIA_Rukhar_RANDOLPHWILL_mehr);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, " (accept bet) " ,DIA_Rukhar_RANDOLPHWILL_annehmen);
};

func void DIA_Rukhar_RANDOLPHWILL_50()
{
	AI_Output(other,self, " DIA_Rukhar_RANDOLPHWILL_50_15_00 " );	// Fifty!
	AI_Output(self,other, " DIA_Rukhar_RANDOLPHWILL_50_12_01 " );	// Don't be shy! You can afford more.
	Rukhar_deployment = 50 ;
	Rukhar_profit = 100 ;
	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, " (choose another bet) " ,DIA_Rukhar_RANDOLPHWILL_mehr);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, " (accept bet) " ,DIA_Rukhar_RANDOLPHWILL_annehmen);
};

func void DIA_Rukhar_RANDOLPHWILL_100()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_100_15_00");	//One hundred!
	AI_Output(self,other, " DIA_Rukhar_RANDOLPHWILL_100_12_01 " );	// That's more like it!
	Rukhar_deployment = 100 ;
	Rukhar_profit = 200 ;
	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, " (choose another bet) " ,DIA_Rukhar_RANDOLPHWILL_mehr);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, " (accept bet) " ,DIA_Rukhar_RANDOLPHWILL_annehmen);
};


instance DIA_Rukhar_ICHSEHEDICH (C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 3;
	condition = DIA_Rukhar_ICHSEHEDICH_Condition;
	information = DIA_Rukhar_ICHSEHEDICH_Info;
	permanent = TRUE;
	description = " Here's my bet. " ;
};


var int DIA_Rukhar_ICHSEHEDICH_noPerm;

func int DIA_Rukhar_ICHSEHEDICH_Condition()
{
	if ((DIA_Removal_ICHSEHEDICH_noPerm ==  FALSE ) && (DIA_Removal_RANDOLPHWILL_noPerm ==  TRUE ) && (Removal_Einsatz !=  0 )) ;
	{
		return TRUE;
	};
};

func void DIA_Rukhar_ICHSEHEDICH_Info()
{
	AI_Output(other,self, " DIA_Rukhar_ICHSEHEDICH_15_00 " );	// Here's my bet.
	if (B_GiveInvItems(other,self,ItMi_Gold,Rukhar_Einsatz))
	{
		AI_Output(self,other, " DIA_Rukhar_ICHSEHEDICH_12_01 " );	// Good. Don't delay, bring Randolph here soon.
		DIA_Rukhar_ICHSEHEDICH_noPerm = TRUE ;
		MIS_Rukhar_Competition = LOG_Running;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self,other, " DIA_Rukhar_ICHSEHEDICH_12_02 " );	// Very funny. Come back when you have the money.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Rukhar_GELDZURUECK(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 3;
	condition = DIA_Rukhar_GELDZURUECK_Condition;
	information = DIA_Rukhar_GELDZURUECK_Info;
	permanent = TRUE;
	description = " I want my money back. " ;
};


func int DIA_Rukhar_GELDZURUECK_Condition()
{
	if ((MIS_Rukhar_Competition ==  LOG_SUCCESS ) && (Rukhar_Won_Competition ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_GELDZURUECK_Info()
{
	AI_Output(other,self, " DIA_Rukhar_GELDZURUECK_15_00 " );	// I want my money back.
	AI_Output(self,other, " DIA_Rukhar_GELDZURUECK_12_01 " );	// Gaming debt is a debt of honor, mate. You should have thought about this before.
	AI_StopProcessInfos(self);
};


DIA_Rukhar_HAENSELN (C_Info) instances
{
	npc = BAU_973_Rukhar;
	nr = 3;
	condition = DIA_Rukhar_HAENSELN_Condition;
	information = DIA_Rukhar_HAENSELN_Info;
	permanent = TRUE;
	description = " Looks like you bit off more than you can chew. " ;
};

func int DIA_Rukhar_HAENSELN_Condition()
{
	if ((MIS_Rukhar_Competition ==  LOG_SUCCESS ) && (Rukhar_Won_Competition ==  FALSE ) && (DIA_Rukhar_HAENSELN_nureimalgeld ==  FALSE ))
	{
		return TRUE;
	};
};


var int DIA_Rukhar_HAENSELN_nureimalgeld;

func void DIA_Rukhar_HAENSELN_Info()
{
	AI_Output(other,self, " DIA_Rukhar_HAENSELN_15_00 " );	// Looks like you bit off more than you can chew.

	if (DIA_Rukhar_HAENSELN_nureimalgeld ==  FALSE )
	{
		AI_Output(self,other, " DIA_Rukhar_HAENSELN_12_01 " );	// Here's your money, and I won't say another word.
		B_GivePlayerXP(XP_Rukhar_Lost);
		IntToFloat(Rukhar_Profit);
		CreateInvItems(self,ItMi_Gold,Rukhar_Profit);
		B_GiveInvItems(self,other,ItMi_Gold,Rukhar_Profit);
		DIA_Rukhar_HAENSELN_nureimalgeld = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Rukhar_HAENSELN_12_02 " );	// I'll get even with you, I swear it.
	};

	AI_StopProcessInfos(self);
};


instance DIA_Rukhar_Perm(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 7;
	condition = DIA_Rukhar_Perm_Condition;
	information = DIA_Rukhar_Perm_Info;
	permanent = TRUE;
	description = " Did anything interesting happen? " ;
};


func int DIA_Rukhar_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rukhar_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_Perm_Info()
{
	AI_Output(other,self, " DIA_Rukhar_Perm_15_00 " );	// Did anything interesting happen?
	AI_Output(self,other, " DIA_Rukhar_Perm_12_01 " );	// Nothing that I know about. Nobody tells me anything.
};


instance DIA_Rukhar_PICKPOCKET(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 900;
	condition = DIA_Rukhar_PICKPOCKET_Condition;
	information = DIA_Rukhar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Rukhar_PICKPOCKET_Condition()
{
	return  C_Robbery ( 26 , 30 );
};

func void DIA_Rukhar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rukhar_PICKPOCKET);
	Info_AddChoice(DIA_Rukhar_PICKPOCKET,Dialog_Back,DIA_Rukhar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rukhar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rukhar_PICKPOCKET_DoIt);
};

func void DIA_Rukhar_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Rukhar_PICKPOCKET);
};

func void DIA_Rukhar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rukhar_PICKPOCKET);
};
