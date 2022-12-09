
instance DIA_Addon_10023_Wache_EXIT(C_Info)
{
	npc = BDT_10023_Addon_Wache;
	nr = 999;
	condition = DIA_Addon_10023_Wache_EXIT_Condition;
	information = DIA_Addon_10023_Wache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10023_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10023_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_10023_Wache_Hi(C_Info)
{
	npc = BDT_10023_Addon_Wache;
	nr = 2;
	condition = DIA_Addon_10023_Wache_Hi_Condition;
	information = DIA_Addon_10023_Wache_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_10023_Wache_Hi_Condition()
{
	if(Npc_GetDistToNpc(self,other) <= 300)
	{
		return TRUE;
	};
};

func void DIA_Addon_10023_Wache_Hi_Info()
{
	AI_Output(self,other, " DIA_Addon_10023_Wache_Hi_11_00 " );	// Hey, where are you going? Do you want to get into the passage?
	AI_Output(other,self, " DIA_Addon_10023_Wache_Hi_15_01 " );	// Maybe. You got a problem with that?
	AI_Output(self,other, " DIA_Addon_10023_Wache_Hi_11_02 " );	// I don't mind if you go in there, but don't hurt the slaves to the point where they can't work.
	AI_Output(self,other, " DIA_Addon_10023_Wache_Hi_11_03 " );	// After all, we can't have them lying about. They have to mine gold. Clear?
	AI_Output(other,self, " DIA_Addon_10023_Wache_Hi_15_04 " );	// Clear. Who ordered this?
	AI_Output(self,other, " DIA_Addon_10023_Wache_Hi_11_05 " );	// This is a direct order from Bloodwyn.
	AI_Output(other,self, " DIA_Addon_10023_Wache_Hi_15_06 " );	// I thought Raven was in charge around here.
	AI_Output(self,other, " DIA_Addon_10023_Wache_Hi_11_07 " );	// He is - but he doesn't need the slaves anymore, he gave them to Bloodwyn.
	Pardos.attribute[ATR_HITPOINTS] = 70;
	B_LogEntry(TOPIC_Addon_Sklaven, " Raven doesn't need any more slaves. They belong to Bloodwyn now. " );
};


var int PrisonGuard_Rules;

instance DIA_Addon_10023_Wache_go(C_Info)
{
	npc = BDT_10023_Addon_Wache;
	nr = 99;
	condition = DIA_Addon_10023_Wache_go_Condition;
	information = DIA_Addon_10023_Wache_go_Info;
	permanent = TRUE;
	description = " Let them go! " ;
};

func int DIA_Addon_10023_Wache_go_Condition()
{
	if(Ready_Togo == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_10023_Wache_go_Info()
{
	AI_Output(other,self, " DIA_Addon_10023_Wache_go_15_00 " );	// Let the slaves go!

	if(PrisonGuard_Rules == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_10023_Wache_go_11_01 " );	// Bloodwyn is in command here. The slaves belong to him, they live or die at his command.
		AI_Output(self,other, " DIA_Addon_10023_Wache_go_11_02 " );	// Well, Thorus also has a say over them, actually.
		PrisonGuard_Rules = TRUE;
		B_LogEntry(TOPIC_Addon_Sklaven, " Only Bloodwyn and Thorus have the right to free slaves. " );
	};

	AI_Output(self,other, " DIA_Addon_10023_Wache_go_11_03 " );	// Do you have any say in this?
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
	Info_AddChoice(DIA_Addon_10023_Wache_go,Dialog_Back,DIA_Addon_10023_Wache_go_BACK);

	if(Npc_KnowsInfo(other,DIA_Addon_Thorus_Answer))
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go, " I talked to Thorus. " ,DIA_Addon_10023_Wache_go_Thorus);
	}
	else if(Npc_IsDead(Bloodwyn) && (Npc_HasItems(other,ItMi_Addon_Bloodwyn_Kopf) >= 1))
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go, " (show Bloodwyn's head) " ,DIA_Addon_10023_Wache_go_Blood);
	}
	else
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go, " I decide who goes to the mine from now on! " ,DIA_Addon_10023_Wache_go_WER);
	};
};

func void DIA_Addon_10023_Wache_go_BACK()
{
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
};

func void DIA_Addon_10023_Wache_go_WER()
{
	AI_Output(other,self, " DIA_Addon_10023_Wache_go_WER_15_00 " );	// I decide who goes to the mine from now on!
	AI_Output(self,other, " DIA_Addon_10023_Wache_go_WER_11_01 " );	// You're just another lackey for Esteban! 
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
};

var int guard_once;

func void DIA_Addon_10023_Wache_go_Blood()
{
	AI_Output(other,self, " DIA_Addon_10023_Wache_go_Blood_15_00 " );	// Here. Enough for you?
	AI_Output(self,other, " DIA_Addon_10023_Wache_go_Blood_11_01 " );	// Take it away! I'm gonna puke.
	AI_Output(other,self, " DIA_Addon_10023_Wache_go_Blood_15_02 " );	// You'd better release the slaves, get me?
	AI_Output(self,other, " DIA_Addon_10023_Wache_go_Blood_11_03 " );	// Wait a minute. Bloodwyn wasn't the only one who decides here. Until I have an order from Thorus, I will not let anyone go.

	if(Npc_KnowsInfo(other,DIA_Addon_Thorus_Answer))
	{
		Info_ClearChoices(DIA_Addon_10023_Wache_go);
		Info_AddChoice(DIA_Addon_10023_Wache_go, " I talked to Thorus. " ,DIA_Addon_10023_Wache_go_Thorus);
	}
	else
	{
		if (guard_once ==  FALSE )
		{
			AI_Output(other,self, " DIA_Addon_10023_Wache_go_Blood_15_04 " );	// But you just said that the slaves belong to Bloodwyn.
			AI_Output(self,other, " DIA_Addon_10023_Wache_go_Blood_11_05 " );	// Yes, but I also said that I won't let anyone go without orders from Thorus.
			AI_Output(other,self, " DIA_Addon_10023_Wache_go_Blood_15_06 " );	// Are you the kind of guy who can't even take a piss without being ordered to?
			guard_once = TRUE ;
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_10023_Wache_go_Blood_11_07 " );	// I already told you...
			AI_Output(other,self, " DIA_Addon_10023_Wache_go_Blood_15_08 " );	// ...FINE, I heard you.
		};

		Info_ClearChoices(DIA_Addon_10023_Wache_go);
	};
};

func void DIA_Addon_10023_Wache_go_Thorus()
{
	AI_Output(other,self, " DIA_Addon_10023_Wache_go_Thorus_15_00 " );	// I've spoken to Thorus. He ordered the release of the slaves.
	AI_Output(self,other, " DIA_Addon_10023_Wache_go_Thorus_11_01 " );	// Well, if Thorus says so. Why would he want this though?
	AI_Output(other,self, " DIA_Addon_10023_Wache_go_Thorus_15_02 " );	// ...you don't get paid to ask questions do you?
	AI_Output(self,other, " DIA_Addon_10023_Wache_go_Thorus_11_03 " );	// I guess not. I'm gonna go get some food. This place can rot for all I care
	Ready_Togo = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SOUP");
};
