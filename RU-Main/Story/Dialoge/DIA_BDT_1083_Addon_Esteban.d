
instance DIA_Addon_Esteban_EXIT(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 999;
	condition = DIA_Addon_Esteban_EXIT_Condition;
	information = DIA_Addon_Esteban_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Esteban_EXIT_Condition()
{
	if(Bodyguard_Killer == FALSE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Esteban_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Esteban_PICKPOCKET(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 900;
	condition = DIA_Addon_Esteban_PICKPOCKET_Condition;
	information = DIA_Addon_Esteban_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Esteban_PICKPOCKET_Condition()
{
	return  C_Robbery ( 105 , 500 );
};

func void DIA_Addon_Esteban_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Esteban_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Esteban_PICKPOCKET,Dialog_Back,DIA_Addon_Esteban_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Esteban_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Esteban_PICKPOCKET_DoIt);
};

func void DIA_Addon_Esteban_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Esteban_PICKPOCKET);
};

func void DIA_Addon_Esteban_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Esteban_PICKPOCKET);
};


instance DIA_Addon_Esteban_Hi (C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 2;
	condition = DIA_Addon_Esteban_Hi_Condition;
	information = DIA_Addon_Esteban_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Esteban_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DAY_Addon_Esteban_Hi_Info()
{
	AI_Output(self,other, " DIA_Addon_Esteban_Hi_07_00 " );	// So you're the guy who fought his way into the camp.
	AI_Output(other,self, " DIA_Addon_Esteban_Hi_15_01 " );	// Rumors spread fast...
	AI_Output(self,other, " DIA_Addon_Esteban_Hi_07_02 " );	// Franco was a tough nut to crack. Nobody wanted to mess with him. Nobody - except you.
	AI_Output(self,other, " DIA_Addon_Esteban_Hi_07_03 " );	// Just to make things clear right away - if you try to do the same to me, I'll kill you.
};


instance DIA_Addon_Esteban_Mine(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 3;
	condition = DIA_Addon_Esteban_Mine_Condition;
	information = DIA_Addon_Esteban_Mine_Info;
	permanent = FALSE;
	description = " I want to get into the mine! " ;
};


func int DIA_Addon_Esteban_Mine_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Stephen_Hi ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Esteban_Mine_Info()
{
	AI_Output(other,self, " DIA_Addon_Esteban_Mine_15_00 " );	// I want to get into the mine!
	AI_Output(self,other, " DIA_Addon_Esteban_Mine_07_01 " );	// Of course. Then you've come to the right place with the right person.
	AI_Output(self,other, " DIA_Addon_Esteban_Mine_07_02 " );	// Because everyone who digs in the mine keeps a fair share of the gold.
	AI_Output(self,other, " DIA_Addon_Esteban_Mine_07_03 " );	// And I'm giving out red stones, one of which you'll need for Thorus to let you in.
};


instance DIA_Addon_Esteban_Rot(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 3;
	condition = DIA_Addon_Esteban_Rot_Condition;
	information = DIA_Addon_Esteban_Rot_Info;
	permanent = FALSE;
	description = " Give me one of those red gems. " ;
};


func int DIA_Addon_Esteban_Rot_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Mine))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Esteban_Rot_Info()
{
	AI_Output(other,self, " DIA_Addon_Esteban_Rot_15_00 " );	// Give me one of the red stones.
	AI_Output(self,other, " DIA_Addon_Esteban_Rot_07_01 " );	// Ok, but it's not free.
	AI_Output(self,other, " DIA_Addon_Esteban_Rot_07_02 " );	// I usually ask for a portion of the gold the miner gets for his work.
	AI_Output(self,other, " DIA_Addon_Esteban_Rot_07_03 " );	// How much do you know about how to mine gold?
	if(Hero_HackChance > 25)
	{
		AI_Output(self,other, " DIA_Addon_Esteban_Rot_07_04 " );	// You must have mastered a few tricks, right?
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Esteban_Rot_07_05 " );	// You don't seem to know anything about mining.
	};
	AI_Output(self,other, " DIA_Addon_Esteban_Rot_07_06 " );	// If I give you a red stone, it won't be because you're such a good miner.
	AI_Output(self,other, " DIA_Addon_Esteban_Rot_07_07 " );	// No, I have another job for you...
};


instance DIA_Addon_Esteban_MIS(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 4;
	condition = DIA_Addon_Esteban_MIS_Condition;
	information = DIA_Addon_Esteban_MIS_Info;
	permanent = FALSE;
	description = " What job? " ;
};


func int DIA_Addon_Esteban_MIS_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Stephen_Rot ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Esteban_MIS_Info()
{
	AI_Output(other,self, " DIA_Addon_Esteban_MIS_15_00 " );	// What job?
	AI_Output(self,other, " DIA_Addon_Esteban_MIS_07_01 " );	// One of the bandits wanted to kill me. But instead my guards killed HIM.
	AI_Output(other,self, " DIA_Addon_Esteban_MIS_15_02 " );	// He wanted to take your place?
	AI_Output(self,other, " DIA_Addon_Esteban_MIS_07_03 " );	// He was just a fool! A mindless killer. It would never have crossed his mind to attack me.
	AI_Output(self,other, " DIA_Addon_Esteban_MIS_07_04 " );	// He was doing it as a job - someone sent him to do it...
	AI_Output(other,self, " DIA_Addon_Esteban_MIS_15_05 " );	// So I need to find who's behind all this?
	AI_Output(self,other, " DIA_Addon_Esteban_MIS_07_06 " );	// Whoever sent the killer will pay. Find him and I'll give you a pass to the mine.
	if ( ! Npc_IsDead( Senyan ) && Npc_KnowsInfo ( other , DIA_Addon_BDT_1084_Senyan_Hi )) .
	{
		AI_Output(other,self, " DIA_Addon_Esteban_MIS_15_07 " );	// Senyan sent me to you on this matter.
		AI_Output(self,other, " DIA_Addon_Esteban_MIS_07_08 " );	// Senyan? He also works for me. I told him to look both ways.
	};
	MIS_Judas = LOG_Running;
	Log_CreateTopic(Topic_Addon_Esteban,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Esteban,LOG_Running);
	B_LogEntry(Topic_Addon_Esteban, " There was an attempt on Esteban's life. I need to find out who is behind this. " );
};


instances of DIA_Addon_Esteban_Kerl (C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_Kerl_Condition;
	information = DIA_Addon_Esteban_Kerl_Info;
	permanent = FALSE;
	description = " What do I need to do? " ;
};


func int DIA_Addon_Esteban_Kerl_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Kerl_Info()
{
	AI_Output(other,self, " DIA_Addon_Esteban_Kerl_15_00 " );	// And what should I do?
	AI_Output(self,other, " DIA_Addon_Esteban_Kerl_07_01 " );	// Everyone in the camp knows about it. That's why you're playing open.
	AI_Output(self,other, " DIA_Addon_Esteban_Kerl_07_02 " );	// Try to figure out who's on my side and who's against me, and don't let the guys fool you!
	AI_Output(self,other, " DIA_Addon_Esteban_Kerl_07_03 " );	// Talk to Snaf. That fat fuck knows a lot.
	B_LogEntry(Topic_Addon_Esteban, " To find the culprit, I have to talk to the people in the camp and find out which side they are on. Snaf can help me - he knows a lot. " );
};


instance DIA_Addon_Esteban_Armor(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 9;
	condition = DIA_Addon_Esteban_Armor_Condition;
	information = DIA_Addon_Esteban_Armor_Info;
	permanent = FALSE;
	description = " I need better armor. " ;
};


func int DIA_Addon_Esteban_Armor_Condition()
{
	if ( Cheap_Armor ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Armor_Info()
{
	AI_Output(other,self, " DIA_Addon_Esteban_Armor_15_00 " );	// I need better armor.
	AI_Output(self,other, " DIA_Addon_Esteban_Armor_07_01 " );	// Why? You already have decent armor, its enough for now!
	if(MIS_Judas == LOG_Running)
	{
		AI_Output(self,other, " DIA_Addon_Esteban_Armor_07_02 " );	// If you complete my task, we'll talk about it...
	};
};


instance DIA_Addon_Esteban_Auftrag (C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 99;
	condition = DIA_Addon_Esteban_Auftrag_Condition;
	information = DIA_Addon_Esteban_Auftrag_Info;
	permanent = TRUE;
	description = " Regarding the task... " ;
};


func int DIA_Addon_Esteban_Auftrag_Condition()
{
	if(((MIS_Judas == LOG_Running) || (MIS_Judas == LOG_SUCCESS)) && (Bodyguard_Killer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Auftrag_Info()
{
	AI_Output(other,self, " DIA_Addon_Esteban_Auftrag_15_00 " );	// About the task...
	AI_Output(self,other, " DIA_Addon_Esteban_Auftrag_07_01 " );	// Look, I have other things to do.

	if(MIS_Judas == LOG_SUCCESS)
	{
		AI_Output(other,self, " DIA_Addon_Esteban_Auftrag_15_02 " );	// I thought you'd be wondering who orchestrated the attack...
		AI_Output(self,other, " DIA_Addon_Esteban_Auftrag_07_03 " );	// And who was it Tell me his name and my guys will bring me his guts...
		AI_Output(other,self, " DIA_Addon_Esteban_Auftrag_15_04 " );	// The trader Fisk organized it. At the moment he is sitting in a bar, drinking and suspecting nothing...
		AI_Output(self,other, " DIA_Addon_Esteban_Auftrag_07_05 " );	// HA! Great job, son. My guards will take care of it.
		AI_TurnToNPC(self,Wache_01);
		AI_Output(self,other, " DIA_Addon_Esteban_Auftrag_07_06 " );	// You heard what he said guys. Go and grab Fisk.
		AI_TurnToNPC(self,other);
		Bodyguard_Killer = TRUE;
		AI_StopProcessInfos(self);
		B_StartOtherRoutine(BDT_10005_Addon_Wache_02,"AMBUSH");
		B_StartOtherRoutine(BDT_10005_Addon_Wache_02,"AMBUSH");
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Esteban_Auftrag_07_07 " );	// Come back when you figure out who's behind the attack.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Addon_Esteban_Away(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_Away_Condition;
	information = DIA_Addon_Esteban_Away_Info;
	permanent = FALSE;
	description = " And what will happen now? " ;
};

func int DIA_Addon_Esteban_Away_Condition()
{
	if(Bodyguard_Killer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Away_Info()
{
	AI_Output(other,self, " DIA_Addon_Esteban_Away_15_00 " );	// What will happen now?
	AI_Output(self,other, " DIA_Addon_Esteban_Away_07_01 " );	// What will happen now? I'll tell you what will happen now.
	AI_Output(self,other, " DIA_Addon_Esteban_Away_07_02 " );	// Fisk will die a painful death. And the whole camp will know why.
	AI_Output(self,other, " DIA_Addon_Esteban_Away_07_03 " );	// I'tll send a clear message.
};


instance DIA_Addon_Esteban_Stone(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_Stone_Condition;
	information = DIA_Addon_Esteban_Stone_Info;
	permanent = FALSE;
	description = " Can I get a red gem now? " ;
};


func int DIA_Addon_Esteban_Stone_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Stephen_Away ) && ( Bodyguard_Killer ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Stone_Info()
{
	AI_Output(other,self, " DIA_Addon_Esteban_Stone_15_00 " );	// Can I get a red stone now?
	AI_Output(self,other, " DIA_Addon_Esteban_Stone_07_01 " );	// You did a good job. You have nothing to do in the mine.
	AI_Output(self,other, " DIA_Addon_Esteban_Stone_07_02 " );	// I can use you to better advantage. You will stay in the camp and continue to work for me.
	AI_Teleport(BDT_10005_Addon_Wache_02,"BL_INN_OUTSIDE_01");
	AI_Teleport(BDT_1081_Addon_Wache_01,"BL_INN_OUTSIDE_02");
};


instance DIA_Addon_Esteban_not(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_not_Condition;
	information = DIA_Addon_Esteban_not_Info;
	permanent = FALSE;
	description = " I'll think about it. " ;
};


func int DIA_Addon_Esteban_not_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Stone))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_not_Info()
{
	AI_Output(other,self, " DIA_Addon_Esteban_not_15_00 " );	// I'll think about it.
	AI_Output(self,other, " DIA_Addon_Esteban_not_07_01 " );	// You forgot who you're talking to. I'm in charge here, and you'll to do what I say.
	AI_Output(self,other, " DIA_Addon_Esteban_not_07_02 " );	// And I said that you would work for me, not for anyone else. Clear?
};


instance DIA_Addon_Esteban_fight(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 6;
	condition = DIA_Addon_Esteban_fight_Condition;
	information = DIA_Addon_Esteban_fight_Info;
	permanent = FALSE;
	description = " Do you want to fool me? " ;
};


func int DIA_Addon_Esteban_fight_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Stone))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_fight_Info()
{
	AI_Output(other,self, " DIA_Addon_Esteban_fight_15_00 " );	// I never wanted to work for you.
	AI_Output(self,other, " DIA_Addon_Esteban_fight_07_01 " );	// Not everyone gets an offer like this. But if you don't like it, you are free to leave the camp.
	AI_Output(other,self, " DIA_Addon_Esteban_fight_15_02 " );	// Or maybe you will keep your word and give me a red stone?
	AI_Output(self,other, " DIA_Addon_Esteban_fight_07_03 " );	// Hey! One more word and my guards will...
	AI_Output(other,self, " DIA_Addon_Esteban_fight_15_04 " );	// What guards?...
	AI_Output(self,other, " DIA_Addon_Esteban_fight_07_05 " );	// What?! What the fuck?!
	Bodyguard_Killer = FALSE;
	AI_StopProcessInfos(self);
	B_KillNpc(BDT_10005_Addon_Wache_02);
	B_KillNpc(BDT_1081_Addon_Wache_01);
	B_Attack(self,other,AR_NONE,1);
};


instances of DIA_Addon_Esteban_Duell (C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 99;
	condition = DIA_Addon_Esteban_Duell_Condition;
	information = DIA_Addon_Esteban_Duell_Info;
	permanent = FALSE;
	description = " Give the stone here NOW, or I'll take it myself! " ;
};


func int DIA_Addon_Esteban_Duell_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Stephen_Rot ) && ( Bodyguard_Killer !=  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Duell_Info()
{
	AI_Output(other,self, " DIA_Addon_Esteban_Duell_15_00 " );	// Get me that rock, or I take it!
	AI_Output(self,other, " DIA_Addon_Esteban_Duell_07_01 " );	// Those were your last words? Very strange.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);

	if (Npc_IsDead(BDT_10005_Addon_Wache_02) ==  FALSE )
	{
		B_Attack(BDT_10005_Addon_Wache_02,other,AR_NONE,1);
	};
	if (Npc_IsDead(BDT_1081_Addon_Wache_01) ==  FALSE )
	{
		B_Attack(BDT_1081_Addon_Wache_01,other,AR_NONE,1);
	};
};
