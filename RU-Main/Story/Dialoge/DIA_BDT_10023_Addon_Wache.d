
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
	AI_Output(self,other, " DIA_Addon_10023_Wache_Hi_11_00 " );	// Hey, where are you going? Do you want to get into that passage?
	AI_Output(other,self, " DIA_Addon_10023_Wache_Hi_15_01 " );	// Well, yes, why not?
	AI_Output(self,other, " DIA_Addon_10023_Wache_Hi_11_02 " );	// There's also a group of slaves. I don't mind if you go there, but don't beat them to the point where they can't work.
	AI_Output(self,other, " DIA_Addon_10023_Wache_Hi_11_03 " );	// After all, we don't want them to just sit there. They have to mine gold.
	AI_Output(other,self, " DIA_Addon_10023_Wache_Hi_15_04 " );	// Clear. And who ordered it?
	AI_Output(self,other, " DIA_Addon_10023_Wache_Hi_11_05 " );	// This is a direct order from Bloodwin.
	AI_Output(other,self, " DIA_Addon_10023_Wache_Hi_15_06 " );	// I thought Raven was in charge here.
	AI_Output(self,other, " DIA_Addon_10023_Wache_Hi_11_07 " );	// True - but he doesn't need the slaves anymore, he gave them to Bloodwin.
	Pardos.attribute[ATR_HITPOINTS] = 70;
	B_LogEntry(TOPIC_Addon_Sklaven, " Raven doesn't need any more slaves. They belong to Bloodwin now. " );
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
	AI_Output(other,self, " DIA_Addon_10023_Wache_go_15_00 " );	// Let them go!

	if(PrisonGuard_Rules == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_10023_Wache_go_11_01 " );	// Listen. Bloodwin is in command here. The slaves belong to him, so only he has the right to let them go.
		AI_Output(self,other, " DIA_Addon_10023_Wache_go_11_02 " );	// Well, Torus also has a chance to put in a good word. And you?
		PrisonGuard_Rules = TRUE;
		B_LogEntry(TOPIC_Addon_Sklaven, " Only Bladwin and Thorus have the right to free slaves. " );
	};

	AI_Output(self,other, " DIA_Addon_10023_Wache_go_11_03 " );	// Do you have any right to this?
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
	Info_AddChoice(DIA_Addon_10023_Wache_go,Dialog_Back,DIA_Addon_10023_Wache_go_BACK);

	if(Npc_KnowsInfo(other,DIA_Addon_Thorus_Answer))
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go, " I talked to Thorus. " ,DIA_Addon_10023_Wache_go_Thorus);
	}
	else if(Npc_IsDead(Bloodwyn) && (Npc_HasItems(other,ItMi_Addon_Bloodwyn_Kopf) >= 1))
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go, " (show Bloodwin's head) " ,DIA_Addon_10023_Wache_go_Blood);
	}
	else
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go, " I decide WHO goes to the mine! " ,DIA_Addon_10023_Wache_go_WER);
	};
};

func void DIA_Addon_10023_Wache_go_BACK()
{
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
};

func void DIA_Addon_10023_Wache_go_WER()
{
	AI_Output(other,self, " DIA_Addon_10023_Wache_go_WER_15_00 " );	// I decide WHO goes to the mine!
	AI_Output(self,other, " DIA_Addon_10023_Wache_go_WER_11_01 " );	// You're doing Esteban's work. So you have NO right to interfere. Free!
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
};

var int guard_once;

func void DIA_Addon_10023_Wache_go_Blood()
{
	AI_Output(other,self, " DIA_Addon_10023_Wache_go_Blood_15_00 " );	// Here. It's enough?
	AI_Output(self,other, " DIA_Addon_10023_Wache_go_Blood_11_01 " );	// Take away! I don't even want to see it.
	AI_Output(other,self, " DIA_Addon_10023_Wache_go_Blood_15_02 " );	// You'd better release the slaves NOW.
	AI_Output(self,other, " DIA_Addon_10023_Wache_go_Blood_11_03 " );	// Wait a minute. Bloodwin isn't the only one who decides here. Until I have an order from Torus, I will not let anyone go.

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
			AI_Output(self,other, " DIA_Addon_10023_Wache_go_Blood_11_05 " );	// Yes, but I also said that I won't let anyone go without orders from Torus.
			AI_Output(other,self, " DIA_Addon_10023_Wache_go_Blood_15_06 " );	// Are you the kind of guy who can't even urinate without being ordered to?
			guard_once = TRUE ;
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_10023_Wache_go_Blood_11_07 " );	// I told you...
			AI_Output(other,self, " DIA_Addon_10023_Wache_go_Blood_15_08 " );	// ...that's enough, then I know.
		};

		Info_ClearChoices(DIA_Addon_10023_Wache_go);
	};
};

func void DIA_Addon_10023_Wache_go_Thorus()
{
	AI_Output(other,self, " DIA_Addon_10023_Wache_go_Thorus_15_00 " );	// I've spoken to Torus. He ordered the release of the slaves.
	AI_Output(self,other, " DIA_Addon_10023_Wache_go_Thorus_11_01 " );	// Well, if Thorus ordered. But I ask myself why he would need it.
	AI_Output(other,self, " DIA_Addon_10023_Wache_go_Thorus_15_02 " );	// ...you don't seem to get paid to ask questions.
	AI_Output(self,other, " DIA_Addon_10023_Wache_go_Thorus_11_03 " );	// Okay, okay. I am now, as you know, not needed here, so I'll go eat a piece of meat.
	Ready_Togo = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SOUP");
};
