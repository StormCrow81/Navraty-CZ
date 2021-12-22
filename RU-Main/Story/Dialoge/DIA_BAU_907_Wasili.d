
instance DIA_Wasili_EXIT(C_Info)
{
	npc = BAU_907_ Arrival;
	No. = 999 ;
	condition = DIA_Wive_EXIT_Condition;
	information = DIA_Wasili_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wasili_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wasili_EXIT_Info ()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wasili_HALLO (C_Info)
{
	npc = BAU_907_ Arrival;
	no. = 1 ;
	condition = DIA_Wasili_HALLO_Condition;
	information = DIA_Wasili_HALLO_Info;
	permanent = FALSE ;
	important = TRUE;
};


func int DIA_Wasili_HALLO_Condition ()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wasili_HALLO_Info ()
{
	AI_Output (self, other, " DIA_Wasili_HALLO_01_00 " );	// Don't even think about touching anything here. We don't need some clumsy oaf stomping around.
};


instance DIA_Wasili_Job(C_Info)
{
	npc = BAU_907_ Arrival;
	no. = 1 ;
	condition = DIA_Wasili_Job_Condition;
	information = DIA_Wasili_Job_Info;
	permanent = FALSE ;
	description = " What are you doing? " ;
};


func int DIA_Wasili_Job_Condition()
{
	return TRUE;
};

func void DIA_Wasili_Job_Info()
{
	AI_Output (other, self, " DIA_Wasili_Job_15_00 " );	// What are you doing?
	AI_Output (self, other, " DIA_Wasili_Job_01_01 " );	// Onar wants me to spend my days looking after his things.
	AI_Output (self, other, " DIA_Wasili_Job_01_02 " );	// He is afraid that something will get stolen. If I were in his place, I would also worry.
	AI_Output (self, other, " DIA_Wasili_Job_01_03 " );	// Most of the mercenaries he hired are former prisoners from the colony.
	AI_Output (self, other, " DIA_Wasili_Job_01_04 " );	// They're ready to swipe anything that isn't nailed down in the blink of an eye.
};


instance DIA_Wasili_Sammler (C_Info)
{
	npc = BAU_907_ Arrival;
	No. = 4 ;
	condition = DIA_Wasili_Sammler_Condition;
	information = DIA_Wasili_Sammler_Info;
	permanent = FALSE ;
	description = " There's a lot of stuff around here. " ;
};


func int DIA_Wasili_Sammler_Condition()
{
	return TRUE;
};

func void DIA_Wasili_Sammler_Info ()
{
	AI_Output (other, self, " DIA_Wasili_Sammler_15_00 " );	// There's a lot of stuff around here.
	AI_Output (self, other, " DIA_Wasili_Sammler_01_01 " );	// That's for sure, and a lot of it is very valuable. Onar is something of a collector.
	AI_Output (self, other, " DIA_Wasili_Sammler_01_02 " );	// Me, I'm a simple guy who likes simple things. Nothing as flashy as all this.
	AI_Output (other, self, " DIA_Wasili_Sammler_15_03 " );	// Like what?
	AI_Output (self, other, " DIA_Wasili_Sammler_01_04 " );	// I collect old coins.
	MIS_Will_BringOldCoin = LOG_Running;
};


instance DIA_Wasili_FirstOldCoin(C_Info)
{
	npc = BAU_907_ Arrival;
	No. = 5 ;
	condition = DIA_Wasili_FirstOldCoin_Condition;
	information = DIA_Wasili_FirstOldCoin_Info;
	permanent = TRUE;
	description = " I have an antique coin. " ;
};


var int Wasili_BringOldCoin_NoMore;

func int DIA_Wasili_FirstOldCoin_Condition()
{
	if((MIS_Wasili_BringOldCoin == LOG_Running) && (WasilisOldCoinOffer == 0) && (Npc_HasItems(other,ItMi_OldCoin) >= 1) && (Wasili_BringOldCoin_NoMore == FALSE))
	{
		return TRUE;
	};
};


var int WasilisOldCoinOffer;
var int FirstOldCoin_angebotenXP_OneTime;
var int DIA_Wasili_FirstOldCoin_mehr_OneTime;

func void DIA_Wasili_FirstOldCoin_Info()
{
	AI_Output (other, self, " DIA_Wasili_FirstOldCoin_15_00 " );	// I have an old coin here.

	if(FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_01");	//Mmm. Show me?
	};

	B_GiveInvItems(other,self,ItMi_OldCoin,1);

	if(FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
		AI_Output (self, other, " DIA_Wasili_FirstOldCoin_01_02 " );	// This particular coin isn't worth much.
	};
	if(DIA_Wasili_FirstOldCoin_mehr_OneTime == FALSE)
	{
		AI_Output (self, other, " DIA_Wasili_FirstOldCoin_01_03 " );	// I will pay you one gold piece for it.
	}
	else
	{
		AI_Output (self, other, " DIA_Wasili_FirstOldCoin_01_04 " );	// You know I'm willing to pay for it. One gold coin. And not a single coin more!
	};
	Info_ClearChoices(DIA_Wasili_FirstOldCoin);
	Info_AddChoice (DIA_Wasili_FirstOldCoin, " No, I'd better keep it for myself. " , DIA_Wasili_FirstOldCoin_nein);
	Info_AddChoice (DIA_Wasili_FirstOldCoin, " It's not enough. How about two? " , DIA_Wasili_FirstOldCoin_mehr);
	Info_AddChoice(DIA_Wasili_FirstOldCoin,"Deal.",DIA_Wasili_FirstOldCoin_ok);
	if(FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
		B_GivePlayerXP(XP_BringOldCoin);
		FirstOldCoin_angebotenXP_OneTime = TRUE;
	};
};

func void DIA_Wasili_FirstOldCoin_ok()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_ok_15_00");	//Deal.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_01");	//Good!

	if(WasilisOldCoinOffer == 2)
	{
		AI_Output (self, other, " DIA_Wasili_FirstOldCoin_ok_01_02 " );	// Here are two gold coins.
	}
	else
	{
		AI_Output (self, other, " DIA_Wasili_FirstOldCoin_ok_01_03 " );	// If you find more old coins, you know where to find me.
		SubmitOldCoinOffer = 1 ;
	};
	CreateInvItems(self,ItMi_Gold,WasilisOldCoinOffer);
	B_GiveInvItems(self,other,ItMi_Gold,WasilisOldCoinOffer);
	Info_ClearChoices(DIA_Wasili_FirstOldCoin);
};

func void DIA_Wasili_FirstOldCoin_mehr()
{
	AI_Output (other, self, " DIA_Wasili_FirstOldCoin_mehr_15_00 " );	// This is not enough. How about two?

	if(RhetorikSkillValue[1] >= 20)
	{
		AI_Output (self, other, " DIA_Wasili_FirstOldCoin_mehr_01_02 " );	// Ahhh, damn ... (annoyed) Okay! Two gold coins for every antique coin you bring me.
		SubmitOldCoinOffer = 2 ;
		Info_AddChoice (DIA_Wasili_FirstOldCoin, " In that case, three would be better! " , DIA_Wasili_FirstOldCoin_ZumTeufel);
	}
	else
	{
		AI_Output (self, other, " DIA_Wasili_FirstOldCoin_mehr_01_01 " );	// I'm not soft in the head! Get out.
		DIA_Wasili_FirstOldCoin_mehr_OneTime = TRUE;
		B_GiveInvItems(self,other,ItMi_OldCoin,1);
		AI_StopProcessInfos(self);
	};
};

func void DIA_Wasili_FirstOldCoin_nein()
{
	AI_Output (other, self, " DIA_Wasili_FirstOldCoin_nein_15_00 " );	// No, I'd rather keep it for myself.
	AI_Output (self, other, " DIA_Wasili_FirstOldCoin_nein_01_01 " );	// It's useless to you. You'll be back.
	B_GiveInvItems(self,other,ItMi_OldCoin,1);
	SubmitOldCoinOffer = 0 ;
	Info_ClearChoices(DIA_Wasili_FirstOldCoin);
};

func void DIA_Wasili_FirstOldCoin_ZumTeufel()
{
	AI_Output (other, self, " DIA_Wasili_FirstOldCoin_ZumTeufel_15_00 " );	// In that case, three would be nice!
	AI_Output (self, other, " DIA_Wasili_FirstOldCoin_ZumTeufel_01_01 " );	// Go to hell, you greedy bastard.
	AI_StopProcessInfos(self);
	Arrive_BringOldCoin_NoMore = TRUE ;
	SubmitOldCoinOffer = 0 ;
};

instance DIA_Will_BringOldCoin (C_Info)
{
	npc = BAU_907_ Arrival;
	No. = 5 ;
	condition = DIA_Will_BringOldCoin_Condition;
	information = DIA_Wasili_BringOldCoin_Info;
	permanent = TRUE;
	description = " Do you need more antique coins? " ;
};

func int DIA_Wasili_BringOldCoin_Condition ()
{
	if((WasilisOldCoinOffer > 0) && (Npc_HasItems(other,ItMi_OldCoin) >= 1) && (Wasili_BringOldCoin_NoMore == FALSE))
	{
		return TRUE;
	};
};


var int OldCoinCounter;

func void DIA_Wasili_BringOldCoin_Info ()
{
	var int OldCoinCount;
	var int XP_BringOldCoins;
	var int OldCoinGeld;
	AI_Output (other, self, " DIA_Wasili_BringOldCoin_15_00 " );	// Looking for more antique coins?
	AI_Output (self, other, " DIA_Wasili_BringOldCoin_01_01 " );	// Of course. Do you have more?
	OldCoinCount = Npc_HasItems(other,ItMi_OldCoin);

	if(OldCoinCount == 1)
	{
		AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_02");	//One.
		B_GivePlayerXP(XP_BringOldCoin);
		B_GiveInvItems(other,self,ItMi_OldCoin,1);
		OldCoinCounter = OldCoinCounter + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_03");	//Several.
		B_GiveInvItems(other,self,ItMi_OldCoin,OldCoinCount);
		XP_BringOldCoins = OldCoinCount * XP_BringOldCoin;
		OldCoinCounter = OldCoinCounter + OldCoinCount;
		B_GivePlayerXP(XP_BringOldCoins);
	};
	AI_Output (self, other, " DIA_Wasili_BringOldCoin_01_04 " );	// Thanks! Here's your money. Bring me whatever you find.
	OldCoinGeld = OldCoinCount * SubmitOldCoinOffer;
	CreateInvItems(self,ItMi_Gold,OldCoinGeld);
	B_GiveInvItems(self,other,ItMi_Gold,OldCoinGeld);
	Npc_RemoveInvItems(self,ItMi_OldCoin,Npc_HasItems(self,ItMi_OldCoin));
};


instance DIA_Wasili_PERM(C_Info)
{
	npc = BAU_907_ Arrival;
	NO = 900 ;
	condition = DIA_Wasili_PERM_Condition;
	information = DIA_Wasili_PERM_Info;
	permanent = TRUE;
	description = " Has anyone tried to steal anything? " ;
};


func int DIA_Wasili_PERM_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_Wasili_Job))
	{
		return TRUE;
	};
};

func void DIA_Wasili_PERM_Info ()
{
	AI_Output (other, self, " DIA_Wasili_PERM_15_00 " );	// Nobody tried to steal anything?

	if(Kapitel <= 2)
	{
		if(PETZCOUNTER_Farm_Theft > 0)
		{
			AI_Output (self, other, " DIA_Wasili_PERM_01_01 " );	// You mean besides you?
		};
		AI_Output (self, other, " DIA_Wasili_PERM_01_02 " );	// There were a few wannabe thieves, but I caught them all!
	};
	if(Kapitel == 3)
	{
		AI_Output (self, other, " DIA_Wasili_PERM_01_03 " );	// A few days ago, one of the mercenaries sneaked into the house.
		AI_Output (self, other, " DIA_Wasili_PERM_01_04 " );	// He was wearing a black hooded cassock so I couldn't identify him.
		AI_Output (self, other, " DIA_Wasili_PERM_01_05 " );	// But I saw him run away.
	};
	if(Kapitel == 4)
	{
		AI_Output (self, other, " DIA_Wasili_perm_01_06 " );	// Not recently, no.
	};
	if(Kapitel >= 5)
	{
		AI_Output (self, other, " DIA_Wasili_perm_01_07 " );	// The mercenaries seem to be preparing to leave the camp.
		AI_Output (self, other, " DIA_Wasili_perm_01_08 " );	// I wouldn't be surprised if Lee and his boys leave the island tonight.
	};
};


instance DIA_Wasili_PICKPOCKET (C_Info)
{
	npc = BAU_907_ Arrival;
	NO = 900 ;
	condition = DIA_Wasili_PICKPOCKET_Condition;
	information = DIA_Wasili_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Wasili_PICKPOCKET_Condition ()
{
	return  C_Beklauen ( 55 , 90 );
};

func void DIA_Wasili_PICKPOCKET_Info ()
{
	Info_ClearChoices (DIA_ Arrival_PICKPOCKET);
	Info_AddChoice (DIA_Welcome_PICKPOCKET, Dialog_Back, DIA_Welcome_PICKPOCKET_BACK);
	Info_AddChoice (DIA_Wive_PICKPOCKET, DIALOG_PICKPOCKET , DIA_Wive_PICKPOCKET_DoIt);
};

func void DIA_Wasili_PICKPOCKET_DoIt ()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_ Arrival_PICKPOCKET);
};

func void DIA_Wasili_PICKPOCKET_BACK ()
{
	Info_ClearChoices (DIA_ Arrival_PICKPOCKET);
};
