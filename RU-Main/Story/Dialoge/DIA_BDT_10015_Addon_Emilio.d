
instance DIA_Addon_Emilio_EXIT(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 999;
	condition = DIA_Addon_Emilio_EXIT_Condition;
	information = DIA_Addon_Emilio_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Emilio_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Emilio_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Emilio_PICKPOCKET(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 900;
	condition = DIA_Addon_Emilio_PICKPOCKET_Condition;
	information = DIA_Addon_Emilio_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Emilio_PICKPOCKET_Condition()
{
	return  C_Robbery ( 76 , 112 );
};

func void DIA_Addon_Emilio_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Emilio_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Emilio_PICKPOCKET,Dialog_Back,DIA_Addon_Emilio_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Emilio_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Emilio_PICKPOCKET_DoIt);
};

func void DIA_Addon_Emilio_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Emilio_PICKPOCKET);
};

func void DIA_Addon_Emilio_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Emilio_PICKPOCKET);
};


instance DIA_Addon_BDT_10015_Emilio_Hi(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 1;
	condition = DIA_Addon_Emilio_Hi_Condition;
	information = DIA_Addon_Email_Hi_Info;
	permanent = FALSE;
	description = " You look like a miner. " ;
};


func int DIA_Addon_Emilio_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Emilio_Hi_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10015_Emilio_Hi_15_00 " );	// You look like a miner.
	AI_Output(self,other, " DIA_Addon_BDT_10015_Emilio_Hi_10_01 " );	// I am a miner. It's backbreaking work but its all I know.
	if(SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry(TOPIC_Addon_RavenKDW,LogText_Addon_RavensGoldmine);
		B_LogEntry(TOPIC_Addon_Sklaven,LogText_Addon_RavensGoldmine);
		B_LogEntry(TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};


instance DIA_Addon_BDT_10015_Emilio_Gold(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 2;
	condition = DIA_Addon_Emilio_Gold_Condition;
	information = DIA_Addon_Emilio_Gold_Info;
	permanent = FALSE;
	description = " Where does the gold you mine go to? " ;
};


func int DIA_Addon_Emilio_Gold_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_BDT_10015_Emilio_Hi ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Emilio_Gold_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10015_Emilio_Gold_15_00 " );	// Where does the gold you mine go?
	AI_Output(self,other, " DIA_Addon_BDT_10015_Emilio_Gold_10_01 " );	// Torus collects it and distributes it. No one is allowed to take what he has found.
	AI_Output(self,other, " DIA_Addon_BDT_10015_Emilio_Gold_10_02 " );	// Everyone gets their share - thus, even the guards and hunters are not deprived.
	AI_Output(self,other, " DIA_Addon_BDT_10015_Emilio_Gold_10_03 " );	// I think this is a good system. Since this rule was introduced, the number of deaths has decreased, and the miners still get more than those who do not work in the mine.
};


instance DIA_Addon_BDT_10015_Emilio_Stein(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 3;
	condition = DIA_Addon_Emilio_Stein_Condition;
	information = DIA_Addon_Emilio_Stein_Info;
	permanent = FALSE;
	description = " What is this red gem system? " ;
};


func int DIA_Addon_Emilio_Stein_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Emilio_Jetzt ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Emilio_Stein_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10015_Emilio_Stein_15_00 " );	// What is this red stone system?
	AI_Output(self,other, " DIA_Addon_BDT_10015_Emilio_Stein_10_01 " );	// Torus and Esteban came up with it.
	AI_Output(self,other, " DIA_Addon_BDT_10015_Emilio_Stein_10_02 " );	// Torus takes care of the distribution of the gold, while Esteban organizes the workers for the mine.
	AI_Output(self,other, " DIA_Addon_BDT_10015_Emilio_Stein_10_03 " );	// Of course he doesn't want to run to Torus every time someone goes into the mine.
	AI_Output(self,other, " DIA_Addon_BDT_10015_Emilio_Stein_10_04 " );	// That's why he gives the workers one of these red stone tiles, and Thorus then knows exactly who to let in. It's like a pass.
};


var int Emilio_Switch;

instance DIA_Addon_Emilio_Attentat (C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 4;
	condition = DIA_Addon_Emilio_Attentat_Condition;
	information = DIA_Addon_Emilio_Attentat_Info;
	permanent = TRUE;
	description = " What do you know about the attack? " ;
};


func int DIA_Addon_Emilio_Attentat_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Emilio_VonEmilio ) && Npc_IsDead ( Sign ) )
	{
		return  FALSE ;
	}
	else if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	}
	else
	{
		return  FALSE ;
	};
	return  FALSE ;
};

func void DIA_Addon_Emilio_Attentat_Info()
{
	AI_Output(other,self, " DIA_Addon_Emilio_Attentat_15_00 " );	// What do you know about the attack?
	if(Emilio_Switch == 0)
	{
		AI_Output(self,other, " DIA_Addon_Emilio_Attentat_10_01 " );	// Hey man, I don't know nothin'!
		Emilio_Switch = 1;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Emilio_Attentat_10_02 " );	// NOTHIN' AT ALL!
		Emilio_Switch = 0;
	};
};


instance DIA_Addon_BDT_10015_Emilio_Senyan (C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 1;
	condition = DIA_Addon_Emilio_Senyan_Condition;
	information = DIA_Addon_Emilio_Senyan_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Emilio_Senyan_Condition()
{
	if (Npc_IsDead(Senyan))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Emilio_Senyan_Info()
{
	if(Senyan_Called == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_BDT_10015_Emilio_Senyan_10_00 " );	// Tell me, why did Senyan shout?
		AI_Output(other,self, " DIA_Addon_BDT_10015_Emilio_Senyan_15_01 " );	// Unpaid debts.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_BDT_10015_Emilio_Senyan_10_02 " );	// You killed Senyan didn't you?
	};
	AI_Output(other,self, " DIA_Addon_BDT_10015_Emilio_Senyan_15_03 " );	// You have a problem with that?
	AI_Output(self,other, " DIA_Addon_BDT_10015_Emilio_Senyan_10_04 " );	// Nope, not a one.
	AI_Output(self,other, " DIA_Addon_BDT_10015_Emilio_Senyan_10_05 " );	// He was Esteban's lackey. He got what was comin' to him.
	Senyan_CONTRA = LOG_SUCCESS;
	B_LogEntry(Topic_Addon_Esteban, " Emilio is not on Esteban's side. " );
};


instance DIA_Addon_Emilio_Now (C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 5;
	condition = DIA_Addon_Emilio_Now_Condition;
	information = DIA_Addon_Emilio_Now_Info;
	permanent = FALSE;
	description = " Why aren't you in the mine right now? " ;
};


func int DIA_Addon_Emilio_Now_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_BDT_10015_Emilio_Hi ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Emilio_Now_Info()
{
	AI_Output(other,self, " DIA_Addon_Emilio_Jetzt_15_00 " );	// Why aren't you in the mine right now?
	AI_Output(self,other, " DIA_Addon_Emilio_Jetzt_10_01 " );	// I was there long enough and worked hard until I was exhausted. Now I need to rest for a few days.
	AI_Output(self,other, " DIA_Addon_Emilio_Jetzt_10_02 " );	// Before I get the next red stone.
};


instance DIA_Addon_Emilio_VonEmilio (C_Info);
{
	npc = BDT_10015_Addon_Emilio;
	nr = 6;
	condition = DIA_Addon_Emilio_VonEmilio_Condition;
	information = DIA_Addon_Emilio_VonEmilio_Info;
	permanent = FALSE;
	description = " Lennar told me about you... " ;
};


func int DIA_Addon_Emilio_VonEmilio_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Emilio_Jetzt ) && Npc_KnowsInfo ( other , DIA_Addon_Lennar_Attachment ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Emilio_VonEmilio_Info()
{
	AI_Output(other,self, " DIA_Addon_Emilio_VonEmilio_15_00 " );	// Lennar told me about you...
	AI_Output(self,other, " DIA_Addon_Emilio_VonEmilio_10_01 " );	// Lennar? This guy is an idiot. You probably noticed.
	AI_Output(other,self, " DIA_Addon_Emilio_VonEmilio_15_02 " );	// He said you haven't been in the mine since the attack happened.
	AI_Output(self,other, " DIA_Addon_Emilio_VonEmilio_10_03 " );	// I... don't know anything about that!
	if ( ! Npc_IsDead(Senyan))
	{
		AI_Output(self,other, " DIA_Addon_Emilio_VonEmilio_10_04 " );	// You work with Senyang!
		AI_Output(self,other, " DIA_Addon_Emilio_VonEmilio_10_05 " );	// And you're both in cahoots with Esteban! I heard exactly what you were talking about!
		AI_Output(self,other, " DIA_Addon_Emilio_VonEmilio_10_06 " );	// So far, Esteban hasn't helped us in any way. Why should I trust his people?
		AI_Output(self,other, " DIA_Addon_Emilio_VonEmilio_10_07 " );	// Leave me alone!
		AI_StopProcessInfos(self);
	};
	B_LogEntry(Topic_Addon_Esteban, " Emilio thinks Lennar is an idiot. " );
};


instance DIA_Addon_Emilio_HilfMir(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 7;
	condition = DIA_Addon_Emilio_HilfMir_Condition;
	information = DIA_Addon_Emilio_HilfMir_Info;
	permanent = FALSE;
	description = " Help me find out who organized the attack! " ;
};


func int DIA_Addon_Emilio_HilfMir_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Emilio_VonEmilio ) && Npc_IsDead ( Sign ) )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Emilio_HilfMir_Info()
{
	AI_Output(other,self, " DIA_Addon_Emilio_HilfMir_15_00 " );	// Help me figure out who orchestrated the attack!
	AI_Output(self,other, " DIA_Addon_Emilio_HilfMir_10_01 " );	// No! I don't want to get involved!
	AI_Output(other,self, " DIA_Addon_Emilio_HilfMir_15_02 " );	// Even if an idiot like Lennar notices that you're acting strange, it won't be long before Esteban notices.
	AI_Output(self,other, " DIA_Addon_Emilio_HilfMir_10_03 " );	// I... damn! I will tell you one name. And nothing more.
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_04");	//I'm listening.
	AI_Output(self,other, " DIA_Addon_Emilio_HilfMir_10_05 " );	// Huno... talk to Huno. He might know something about all this.
	Emilio_TellAll = TRUE;
	B_LogEntry(Topic_Addon_Esteban, " Emilio finally gave a name: Huno. " );
};


instance DIA_Addon_Emilio_GegenEsteban (C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 8;
	condition = DIA_Addon_Emilio_GegenEsteban_Condition;
	information = DIA_Addon_Emilio_GegenEsteban_Info;
	permanent = FALSE;
	description = " What do you have against Esteban? " ;
};


func int DIA_Addon_Emilio_GegenEsteban_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_BDT_10015_Emilio_Senyan ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Emilio_GegenEsteban_Info()
{
	AI_Output(other,self, " DIA_Addon_Emilio_GegenEsteban_15_00 " );	// What do you have against Esteban?
	AI_Output(self,other, " DIA_Addon_Emilio_GegenEsteban_10_01 " );	// All that pig thinks about is money.
	AI_Output(self,other, " DIA_Addon_Emilio_GegenEsteban_10_02 " );	// Every few days one of us gets eaten by crawlers.
	AI_Output(self,other, " DIA_Addon_Emilio_GegenEsteban_10_03 " );	// But Esteban doesn't even think about sending a few fighters into the mine.
	AI_Output(self,other, " DIA_Addon_Emilio_GegenEsteban_10_04 " );	// And why? Because Raven, his personal guard and Esteban couldn't fucking care less about us.
	AI_Output(self,other, " DIA_Addon_Emilio_GegenEsteban_10_05 " );	// It's easier for them to let us all die!
};


instance DIA_Addon_BDT_10015_Emilio_Mine(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 9;
	condition = DIA_Addon_Emilio_Mine_Condition;
	information = DIA_Addon_Emilio_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Emilio_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Emilio_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other, " DIA_Addon_BDT_10015_Emilio_Mine_10_00 " );	// So you're in charge now. That's good.
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Emilio_Hacker(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 9;
	condition = DIA_Addon_Emilio_Hacker_Condition;
	information = DIA_Addon_Emilio_Hacker_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Addon_Emilio_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_09_PICK") <= 500)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Emilio_Hacker_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10004_Emilio_Hacker_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Addon_BDT_10004_Emilio_Hacker_10_01 " );	// My feet are killing me.
};
