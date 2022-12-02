

instance DIA_Sergio_EXIT(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 999;
	condition = DIA_Sergio_EXIT_Condition;
	information = DIA_Sergio_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sergio_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sergio_EXIT_Info()
{
	if(Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	{
		AI_Output(self,other, " DIA_Sergio_EXIT_04_00 " );	// May Innos light your path.
	};
	AI_StopProcessInfos(self);
};


instances DIA_Sergio_WELCOME (C_Info)
{
	npc = PAL_299_Sergio;
	nr = 5;
	condition = DIA_Sergio_WELCOME_Condition;
	information = DIA_Sergio_WELCOME_Info;
	important = TRUE;
};


func int DIA_Sergio_WELCOME_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && (Npc_KnowsInfo(other,DIA_Sergio_Isgaroth) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sergio_WELCOME_Info()
{
	AI_Output(self,other, " DIA_Sergio_WELCOME_04_00 " );	// May Innos be with you, how can I help you?
};


instance DIA_Sergio_Isgaroth(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 2;
	condition = DIA_Sergio_Isgaroth_Condition;
	information = DIA_Sergio_Isgaroth_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sergio_Isgaroth_Condition()
{
	if(Npc_KnowsInfo(hero,PC_PrayShrine_Paladine) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Isgaroth_Info()
{
	AI_Output(self,other, " DIA_Sergio_Isgaroth_04_00 " );	// You prayed for my comrades. I am grateful to you for this. Tell me what can I do for you.
	Info_ClearChoices(DIA_Sergio_Isgaroth);
	Info_AddChoice(DIA_Sergio_Isgaroth, " How about a small donation? " ,DIA_Sergio_Isgaroth_Spende);
	Info_AddChoice(DIA_Sergio_Isgaroth, " Could you share your combat experience? " ,DIA_Sergio_Isgaroth_XP);
};

func void DIA_Sergio_Isgaroth_Spende()
{
	AI_Output(other,self, " DIA_Sergio_Isgaroth_Spende_15_00 " );	// How about a small donation?
	AI_Output(self,other, " DIA_Sergio_Isgaroth_Spende_04_01 " );	// May this gold serve you well.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	Info_ClearChoices(DIA_Sergio_Isgaroth);
};

func void DIA_Sergio_Isgaroth_XP()
{
	AI_Output(other,self, " DIA_Sergio_Isgaroth_XP_15_00 " );	// Could you share your combat experience?
	AI_Output(self,other, " DIA_Sergio_Isgaroth_XP_04_01 " );	// When you fight, make sure no one can attack you from behind.
	other.HitChance[NPC_TALENT_2H] = other.HitChance[NPC_TALENT_2H] + 2;
	AI_Print(PRINT_Learn2H);
	Info_ClearChoices(DIA_Sergio_Isgaroth);
};


instance DIA_Sergio_Task (C_Info)
{
	npc = PAL_299_Sergio;
	nr = 3;
	condition = DIA_Sergio_Task_Condition;
	information = DIA_Sergio_Task_Info;
	description = " I need access to the library. " ;
};


func int DIA_Sergio_Task_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Sergio_Isgaroth))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Task_Info()
{
	AI_Output(other,self, " DIA_Sergio_Aufgabe_15_00 " );	// I need access to the library.
	AI_Output(self,other, " DIA_Sergio_Aufgabe_04_01 " );	// Well, I can't give you access. To do this, you must first complete your tasks.
	AI_Output(self,other, " DIA_Sergio_Aufgabe_04_02 " );	// But I can help you. Go to Master Ysgaroth and talk to him. I heard he needed help and was going to help him myself, but I'm giving you the task.
	Sergio_Sends = TRUE;
	Wld_InsertNpc(BlackWolf,"NW_PATH_TO_MONASTER_AREA_01");
	Log_CreateTopic(Topic_IsgarothWolf,LOG_MISSION);
	Log_SetTopicStatus(Topic_IsgarothWolf,LOG_Running);
	B_LogEntry(Topic_IsgarothWolf, " Master Isgaroth needs help at the chapel. I must find him. " );
};


instance DIA_Sergio_WHAT(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 3;
	condition = DIA_Sergio_WHAT_Condition;
	information = DIA_Sergio_WHAT_Info;
	description = " What are you doing here? " ;
};


func int DIA_Sergio_WHAT_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Sergio_WHAT_Info()
{
	AI_Output(other,self, " DIA_Sergio_WHAT_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Sergio_WHAT_04_01 " );	// I pray to Innos to strengthen my hand and my will.
	AI_Output(self,other, " DIA_Sergio_WHAT_04_02 " );	// Then I will be ready for any danger and destroy all his enemies with his name on my lips.
	AI_Output(other,self, " DIA_Sergio_WHAT_15_03 " );	// What enemies?
	AI_Output(self,other, " DIA_Sergio_WHAT_04_04 " );	// All those who oppose the will of Innos. It doesn't matter if it's a human or a summoned being.
};


instances DIA_Sergio_Babo (C_Info)
{
	npc = PAL_299_Sergio;
	nr = 3;
	condition = DIA_Sergio_Babo_Condition;
	information = DIA_Sergio_Babo_Info;
	description = " Could you give Babo some training? " ;
};


func int DIA_Sergio_Babo_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Babo_Anliegen))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Babo_Info()
{
	AI_Output(other,self, " DIA_Sergio_Babo_15_00 " );	// Could you give Babo some training?
	AI_Output(self,other, " DIA_Sergio_Babo_04_01 " );	// Why doesn't he ask himself?
	AI_Output(other,self, " DIA_Sergio_Babo_15_02 " );	// I think he's shy.
	AI_Output(self,other, " DIA_Sergio_Babo_04_03 " );	// I understand. Well, if it means that much to him, I will train him every morning for two hours. We will start at 5 am. You can give it to him.
	Npc_ExchangeRoutine(self,"TRAIN");
	B_StartOtherRoutine(Babo,"TRAIN");
	B_LogEntry(Topic_BaboTrain, " Sergio agreed to train with Babo for two hours every morning. " );
};


instance DIA_Sergio_WHY(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 4;
	condition = DIA_Sergio_WHY_Condition;
	information = DIA_Sergio_WHY_Info;
	description = " Why aren't you with other paladins? " ;
};


func int DIA_Sergio_WHY_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Sergio_WELCOME) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void DIA_Sergio_WHY_Info()
{
	AI_Output(other,self, " DIA_Sergio_WHY_15_00 " );	// Why aren't you with other paladins?
	AI_Output(self,other, " DIA_Sergio_WHY_04_01 " );	// It may seem a little strange that I'm here, but we must not forget that we paladins also serve the magicians, as they preach the will of Innos.
	AI_Output(self,other, " DIA_Sergio_WHY_04_02 " );	// We paladins are warriors of Innos. His will is the law for us. At the moment, I'm waiting for new orders from the mages.
};


instance DIA_Sergio_ORDERS(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 10;
	condition = DIA_Sergio_ORDERS_Condition;
	information = DIA_Sergio_ORDERS_Info;
	permanent = TRUE;
	description = " Have you received your new orders yet? " ;
};


func int DIA_Sergio_ORDERS_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Sergio_WHY) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void DIA_Sergio_ORDERS_Info()
{
	AI_Output(other,self, " DIA_Sergio_ORDERS_15_00 " );	// Have you received new orders yet?
	AI_Output(self,other, " DIA_Sergio_ORDERS_04_01 " );	// Not yet, and I have time to find strength in prayers.
};


instances of DIA_Sergio_Start (C_Info)
{
	npc = PAL_299_Sergio;
	nr = 10;
	condition = DIA_Sergio_Start_Condition;
	information = DIA_Sergio_Start_Info;
	permanent = FALSE;
	description = " You must accompany me to the Passage. " ;
};


func int DIA_Sergio_Start_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (Sergio_Follow == TRUE) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Start_Info()
{
	AI_Output(other,self, " DIA_Sergio_Start_15_00 " );	// You must accompany me to the Passage.
	AI_Output(self,other, " DIA_Sergio_Start_04_01 " );	// Okay, I'll do it. I know the way, follow me.
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	self.npcType = NPCTYPE_FRIEND;
	Npc_ExchangeRoutine(self,"GUIDE");
};


instances of DIA_Sergio_Guide (C_Info)
{
	npc = PAL_299_Sergio;
	nr = 10;
	condition = DIA_Sergio_Guide_Condition;
	information = DIA_Sergio_Guide_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Sergio_Guide_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") > 1000))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Guide_Info()
{
	AI_Output(other,self, " DIA_Sergio_Guide_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Sergio_Guide_04_01 " );	// I must escort you to the Passage. But the most dangerous part of the journey only begins there.
	AI_Output(self,other, " DIA_Sergio_Guide_04_02 " );	// But let's not waste time
	AI_StopProcessInfos(self);
};


instances of DIA_Sergio_Ende (C_Info)
{
	npc = PAL_299_Sergio;
	nr = 2;
	condition = DIA_Sergio_Ende_Condition;
	information = DIA_Sergio_Ende_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sergio_Ende_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Ende_Info()
{
	AI_Output(self,other, " DIA_Sergio_Ende_04_00 " );	// We've arrived. Whatever awaits you in the Valley of Mines, I hope you find your way back.
	AI_Output(other,self, " DIA_Sergio_Ende_15_01 " );	// Don't be afraid - I'll be back.
	AI_Output(self,other, " DIA_Sergio_Ende_04_02 " );	// Go with Innos. May he not leave you defenseless.
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instances of DIA_Sergio_Perm (C_Info)
{
	npc = PAL_299_Sergio;
	nr = 2;
	condition = DIA_Sergio_Perm_Condition;
	information = DIA_Sergio_Perm_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sergio_Perm_Condition()
{
	if ((Chapter >=  3 ) && (Chapter <  6 ) && (other.guild !=  GIL_KDF )) .
	{
		return TRUE;
	};
};

func void DAY_Sergio_Perm_Info()
{
	if(other.guild == GIL_PAL)
	{
		if (Chapter >=  4 )
		{
			AI_Output(self,other, " DIA_Sergio_Perm_04_02 " );	// For Innos, brother.
		}
		else
		{
			AI_Output(self,other, " DIA_Sergio_Perm_04_00 " );	// Praise to Innos, brother. If you've come to learn anything about the consecration of the sword, speak to Marduk.
		};
	}
	else if((other.guild == GIL_DJG) || (other.guild == GIL_SLD))
	{
		AI_Output(self,other, " DIA_Sergio_Perm_04_01 " );	// I heard about you. You are the farm boy who was in the Valley of Mines. My regards.
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_Sergio_Perm_04_03 " );	// My respect, venerable waterbender.
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other, " DIA_Sergio_Perm_04_04 " );	// Although I can't stomach you, necromancers, but still - (through my teeth) my respect.
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_Sergio_Perm_04_05 " );	// I've already heard about you. You're the fellow from the Brotherhood that was in the mine valley. My respect!
	}
	else
	{
		AI_Output(self,other, " DIA_Sergio_Perm_04_06 " );	// Greetings, wanderer.
	};
	AI_StopProcessInfos(self);
};

instances DIA_Sergio_PICKPOCKET (C_Info)
{
	npc = PAL_299_Sergio;
	nr = 900;
	condition = DIA_Sergio_PICKPOCKET_Condition;
	information = DIA_Sergio_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};

func int DIA_Sergio_PICKPOCKET_Condition()
{
	if((self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Sergio_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sergio_PICKPOCKET);
	Info_AddChoice(DIA_Sergio_PICKPOCKET,Dialog_Back,DIA_Sergio_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sergio_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Sergio_PICKPOCKET_DoIt);
};

func void DIA_Sergio_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 100)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 2;
		}
		else
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		B_GiveInvItems(self,hero,ItKe_Innos_MIS,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Sergio_PICKPOCKET);
	}
	else
	{
		Print ( " Required Agility: 150 " );

		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Sergio_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sergio_PICKPOCKET);
};


instance DIA_SERGIO_TELLSERGIO (C_Info)
{
	npc = PAL_299_Sergio;
	nr = 49;
	condition = dia_sergio_tellsergio_condition;
	information = dia_sergio_tellsergio_info;
	permanent = FALSE;
	important = TRUE;
};


func int day_sergio_tellsergio_condition()
{
	if((MIS_FARIONTEST == LOG_Running) && (SERGIOISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void day_sergio_tellsergio_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_Sergio_TellSergio_01_00 " );	// What are you doing here?! Get out of here immediately!
	AI_Output(self,other, " DIA_Sergio_TellSergio_01_02 " );	// I want to be here all alone.
	AI_Output(self,other, " DIA_Sergio_TellSergio_01_03 " );	// And anyway, why did you come here?
	AI_Output(other,self, " DIA_Sergio_TellSergio_01_04 " );	// I've come to help you.
	AI_Output(self,other, " DIA_Sergio_TellSergio_01_05 " );	// No one can help me anymore... (doomed) My fate is predetermined! Not even death can change that.
	AI_Output(other,self, " DIA_Sergio_TellSergio_01_06 " );	// That's where you're wrong. Only your death can ease your suffering!
	AI_Output(self,other, " DIA_Sergio_TellSergio_01_07 " );	// What? (angrily) How do you know what can and what can't?
	AI_Output(other,self, " DIA_Sergio_TellSergio_01_08 " );	// Trust me, I know that. As well as who you are destined to become after her.
	AI_Output(self,other, " DIA_Sergio_TellSergio_01_09 " );	// What are you talking about?
	AI_Output(other,self, " DIA_Sergio_TellSergio_01_10 " );	// Stop it! You know very well what I mean.
	AI_Output(other,self, " DIA_Sergio_TellSergio_01_11 " );	// After death, you are destined to become one of the Shadow Lords, and this is just the beginning of the nightmare that awaits you.
	AI_Output(self,other, " DIA_Sergio_TellSergio_01_13 " );	// Hmmm. Well, you are indeed right.
	AI_Output(self,other, " DIA_Sergio_TellSergio_01_14 " );	// But it won't change anything anyway. The power of Darkness has almost completely taken over me, and I no longer have the strength to resist it.
	AI_Output(self,other, " DIA_Sergio_TellSergio_01_15 " );	// Soon I will move into the world of shadows, and my place will be taken by the one who is destined for it. And you can't stop it!
	AI_Output(self,other, " DIA_Sergio_TellSergio_01_17 " );	// You have no idea what power you dare to challenge.
	AI_Output(self,other, " DIA_Sergio_TellSergio_01_18 " );	// But don't worry! I will give you a chance to feel all her wrath on yourself!
	AI_Output(other,self, " DIA_Sergio_TellSergio_01_19 " );	// Well, try it.
	AI_Output(self,other, " DIA_Sergio_TellSergio_01_20 " );	// (angrily) Die!
	self.aivar[ 93 ] = FALSE ;
	self.aivar[AIV_DropDeadAndKill] = TRUE ;
	B_LogEntry( TOPIC_FARIONTEST , " Looks like I'm a little late - Sergio is no longer what he used to be. Darkness has completely taken over his mind. I think it's time to fix the situation. " );
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

