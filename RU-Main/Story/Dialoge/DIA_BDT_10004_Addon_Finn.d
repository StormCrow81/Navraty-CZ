var int FindTellFT;

instance DIA_Addon_Finn_EXIT(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 999;
	condition = DIA_Addon_Finn_EXIT_Condition;
	information = DIA_Addon_Finn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Finn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Finn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Finn_PICKPOCKET(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 900;
	condition = DIA_Addon_Finn_PICKPOCKET_Condition;
	information = DIA_Addon_Finn_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Finn_PICKPOCKET_Condition()
{
	return  C_Robbery ( 35 , 50 );
};

func void DIA_Addon_Finn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Finn_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Finn_PICKPOCKET,Dialog_Back,DIA_Addon_Finn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Finn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Finn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Finn_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Finn_PICKPOCKET);
};

func void DIA_Addon_Finn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Finn_PICKPOCKET);
};


instance DIA_Addon_Finn_Hacker(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 9;
	condition = DIA_Addon_Finn_Hacker_Condition;
	information = DIA_Addon_Finn_Hacker_Info;
	permanent = TRUE;
	description = " Back at work? " ;
};


func int DIA_Addon_Finn_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_06") <= 500)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Finn_Hacker_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10004_Finn_Hacker_15_00 " );	// Back at work?
	AI_Output(self,other, " DIA_Addon_BDT_10004_Finn_Hacker_07_01 " );	// Yes, I want to pick every last piece of gold from this mine.
};


instance DIA_Addon_Finn_Hi (C_Info) .
{
	npc = BDT_10004_Addon_Finn;
	nr = 1;
	condition = DIA_Addon_Finn_Hi_Condition;
	information = DIA_Addon_Finn_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Finn_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Finn_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Finn_Hi_15_00");	//Greetings!
	AI_Output(self,other, " DIA_Addon_BDT_10004_Finn_Hi_07_01 " );	//What do you want?
};


instance DIA_Addon_Finn_Hacke (C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 2;
	condition = DIA_Addon_Finn_Hacke_Condition;
	information = DIA_Addon_Finn_Hacke_Info;
	permanent = FALSE;
	description = " Where can I get a pickaxe? " ;
};


func int DIA_Addon_Finn_Hacke_Condition()
{
	return TRUE;
};

func void DIA_Addon_Finn_Hacke_Info()
{
	AI_Output(other,self, " DIA_Addon_Finn_Hacke_15_00 " );	// Where can I get a pickaxe?
	AI_Output(self,other, " DIA_Addon_Finn_Hacke_07_01 " );	// Ask the blacksmith, Huno. But having a pick does not give you the right to enter the mine.
	AI_Output(self,other, " DIA_Addon_Finn_Hacke_07_02 " );	// If you want to enter, you need to talk to Esteban.
	AI_Output(self,other, " DIA_Addon_Finn_Hacke_07_03 " );	// And you don't even have to try to talk to Torus - he will let you in only if you have a red stone.
};


instance DIA_Addon_Finn_Esteban(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 3;
	condition = DIA_Addon_Finn_Esteban_Condition;
	information = DIA_Addon_Finn_Esteban_Info;
	permanent = FALSE;
	description = " Tell me what you think of Esteban? " ;
};


func int DIA_Addon_Finn_Esteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Hacke))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Finn_Esteban_Info()
{
	AI_Output(other,self, " DIA_Addon_Finn_Esteban_15_00 " );	// Tell me what do you think of Esteban?
	AI_Output(self,other, " DIA_Addon_Finn_Esteban_07_01 " );	// He's the boss here... he's... a good guy, very smart miner.
	AI_Output(self,other, " DIA_Addon_Finn_Esteban_07_02 " );	// He always sends the right guys down here. Those who know their stuff, I mean.
};


instance DIA_Addon_Finn_Profi (C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 4;
	condition = DIA_Addon_Finn_Profi_Condition;
	information = DIA_Addon_Finn_Profi_Info;
	permanent = FALSE;
	description = " Do you know this business? " ;
};


func int DIA_Addon_Finn_Profi_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Finn_Stephen ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Finn_Profi_Info()
{
	AI_Output(other,self, " DIA_Addon_Finn_Profi_15_00 " );	// Do you know this business?
	AI_Output(self,other, " DIA_Addon_Finn_Profi_07_01 " );	// I'm the best at it!
};


instance DIA_Addon_BDT_10004_Finn_Mine(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 5;
	condition = DIA_Addon_Finn_Mine_Condition;
	information = DIA_Addon_Finn_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Finn_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other, " DIA_Addon_BDT_10004_Finn_Mine_07_00 " );	// Of course, boss. Do you want the best people to work in the mine? Then I'll get back to business...
	AI_Output(self,other, " DIA_Addon_BDT_10004_Finn_Mine_07_01 " );	// One more thing. This is a secret of the miners.
	AI_Output(self,other, " DIA_Addon_BDT_10004_Finn_Mine_07_02 " );	// Try this from now on.
	AI_Output(self,other, " DIA_Addon_BDT_10004_Finn_Mine_07_03 " );	// If you dig a couple of times with no visible results, try running the end of your pick along the rock.
	AI_Output(self,other, " DIA_Addon_BDT_10004_Finn_Mine_07_04 " );	// If you're lucky, you'll end up with several pieces of stone at a time this way.
	Knows_Truemmerschlag = TRUE;
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};

instance DIA_Addon_Finn_Gold(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 6;
	condition = DIA_Addon_Finn_Gold_Condition;
	information = DIA_Addon_Finn_Gold_Info;
	permanent = TRUE;
	description = " Teach me how to mine gold. " ;
};

func int DIA_Addon_Finn_Gold_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Finn_Profi ) && ( Hero_HackChance <  100 )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Gold_Info()
{
	if(KNOWHOWPICKGOLD == TRUE)
	{
		AI_Output(other,self, " DIA_Addon_Scatty_teach_15_00 " );	// Tell me more about how to dig for gold.
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Finn_Gold_07_04 " );	// Teach me how to mine gold.
	};

	Info_ClearChoices(DIA_Addon_Finn_Gold);
	Info_AddChoice(DIA_Addon_Finn_Gold,Dialog_Back,DIA_Addon_Finn_Gold_Back);
	Info_AddChoice(DIA_Addon_Finn_Gold,b_buildlearnstringforgoldhunt( " Cost of selection " ,B_GetLearnCostTalent(other, NPC_TALENT_GOLDWORK , 1 )),DIA_Addon_Finn_Gold_GOLDWORK);
};

func void DIA_Addon_Finn_Gold_Back()
{
	Info_ClearChoices(DIA_Addon_Finn_Gold);
};

func void DIA_Addon_Finn_Gold_GOLDWORK()
{
	if(b_teachplayertalentgoldhunt(self,other,NPC_TALENT_GOLDWORK))
	{
		if(FINNTEACHMOREGOLD == FALSE)
		{
			AI_Output(self,other, " DIA_Addon_Finn_Gold_07_00 " );	// Well, one more thing to know. Gold is not an ore. There is a big difference.
			AI_Output(self,other, " DIA_Addon_Finn_Gold_07_01 " );	// I mean no woman would wear a necklace of ore lumps around her neck.
			AI_Output(self,other, " DIA_Addon_Finn_Gold_07_02 " );	// When you dig, go from top to bottom. So the nuggets will be easier to remove.
			AI_Output(self,other, " DIA_Addon_Finn_Gold_07_03 " );	// There are miners who do the opposite, but it's much more difficult.
			FINNTEACHMOREGOLD = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Finn_Gold_07_05 " );	// No problem! Listen here...
		};
	};

	Info_ClearChoices(DIA_Addon_Finn_Gold);
};

instance DIA_Addon_Finn_ein (C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 7;
	condition = DIA_Addon_Finn_ein_Condition;
	information = DIA_Addon_Finn_ein_Info;
	permanent = TRUE;
	description = " Can you rate my gold mining skills? " ;
};


func int DIA_Addon_Finn_ein_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Finn_Profi ) && ( KNOWHOWPICKGOLD  ==  TRUE ))
	{
		return TRUE;
	};
};


var int Finn_once;
var int Finn_Congratulations;

func void DIA_Addon_Finn_ein_Info()
{
	var string concatText;
	AI_Output(other,self, " DIA_Addon_Finn_ein_15_00 " );	// Can you rate my skills as a miner?
	if (Finn_once ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Finn_ein_07_01 " );	// Of course. I've been doing this for over 35 years. There's nothing about this job I don't know!
		Finn_once = TRUE ;
	};
	AI_Output(self,other, " DIA_Addon_Finn_ein_07_02 " );	// As for you, you are...
	if(Hero_HackChance < 20)
	{
		AI_Output(self,other, " DIA_Addon_Finn_ein_07_03 " );	// a complete Johnny Newcome .
	}
	else if(Hero_HackChance < 35)
	{
		AI_Output(self,other, " DIA_Addon_Finn_ein_07_04 " );	// a decent recruit.
	}
	else if(Hero_HackChance < 50)
	{
		AI_Output(self,other, " DIA_Addon_Finn_ein_07_05 " );	// an experienced undergrounder.
	}
	else if(Hero_HackChance < 65)
	{
		AI_Output(self,other, " DIA_Addon_Finn_ein_07_06 " );	// a real miner.
	}
	else if(Hero_HackChance < 80)
	{
		AI_Output(self,other, " DIA_Addon_Finn_ein_07_07 " );	// a damn good miner.
	}
	else if(Hero_HackChance < 95)
	{
		AI_Output(self,other, " DIA_Addon_Finn_ein_07_08 " );	// a great miner.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Finn_ein_07_09 " );	// a true underground savage
		if (Finn_Congratulations ==  FALSE )
		{
			AI_Output(self,other, " DIA_Addon_Finn_ein_07_10 " );	// That way you're as good as me. Hearty congratulations, partner!
			B_GivePlayerXP(200);
			Snd_Play("LevelUP");
			Finn_Congratulations = TRUE ;
		};
	};
	concatText = ConcatStrings( " Gold mining level: " ,IntToString(Hero_HackChance));
	AI_Print(concatText);
};


instance DIA_Addon_Finn_Attentat(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 8;
	condition = DIA_Addon_Finn_Attentat_Condition;
	information = DIA_Addon_Finn_Attentat_Info;
	permanent = FALSE;
	description = " About the assassination attempt on Esteban... " ;
};


func int DIA_Addon_Finn_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Finn_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other, " DIA_Addon_Finn_Attentat_07_00 " );	// Yes?
	AI_Output(other,self, " DIA_Addon_Finn_Attentat_15_01 " );	// Do you have any idea who is behind all this?
	AI_Output(self,other, " DIA_Addon_Finn_Attentat_07_02 " );	// Why are you doing this?
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	Info_AddChoice(DIA_Addon_Finn_Attentat, " I want to talk to him... " ,DIA_Addon_Finn_Attentat_WannaTalk);
	Info_AddChoice(DIA_Addon_Finn_Attentat, " Esteban doesn't want to see him alive anymore! " ,DIA_Addon_Finn_Attentat_ForTheBoss);
};

func void B_Addon_Finn_TellAll()
{
	AI_Output(self,other, " DIA_Addon_Finn_TellAll_07_00 " );	// When the attack happened, I was about to take my pick from Huno the blacksmith.
	AI_Output(self,other, " DIA_Addon_Finn_TellAll_07_01 " );	// But he wasn't there.
	AI_Output(other,self,"DIA_Addon_Finn_TellAll_15_02");	//And?
	AI_Output(self,other, " DIA_Addon_Finn_TellAll_07_03 " );	// And usually he's ALWAYS there. Very suspicious if you ask me.
	Finn_TellAll = TRUE;

	if (FinnTellFT ==  FALSE )
	{
		B_LogEntry(Topic_Addon_Esteban, " Finn says that Huno was absent at the time of the assassination. " );
		FindTellFT = TRUE ;
	};
};

func void DIA_Addon_Finn_Attentat_ForTheBoss()
{
	AI_Output(other,self, " DIA_Addon_Finn_ForTheBoss_15_00 " );	// Esteban wants his would-be assassin on a cross!
	AI_Output(self,other, " DIA_Addon_Finn_ForTheBoss_07_01 " );	// Oh! Are you working for the boss?
	AI_Output(self,other, " DIA_Addon_Finn_ForTheBoss_07_02 " );	// Then I'll tell you what I know.
	B_Addon_Finn_TellAll();
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
};

func void DIA_Addon_Finn_Attentat_WannaTalk()
{
	AI_Output(other,self, " DIA_Addon_Finn_WannaTalk_15_00 " );	// I just want to talk to him...
	AI_Output(self,other, " DIA_Addon_Finn_WannaTalk_07_01 " );	// Yes? And what about?
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	Info_AddChoice(DIA_Addon_Finn_Attentat, " You shouldn't care! " ,DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice(DIA_Addon_Finn_Attentat, " I have interesting information for him! " ,DIA_Addon_Finn_Attentat_HaveInfos);
	Info_AddChoice(DIA_Addon_Finn_Attentat, " I want to kill Esteban and am looking for an ally! " ,DIA_Addon_Finn_Attentat_KillEsteban);
};

func void DIA_Addon_Finn_Attentat_KillEsteban()
{
	AI_Output(other,self, " DIA_Addon_Finn_KillEsteban_15_00 " );	// I want to eliminate Esteban, and I need an ally!
	AI_Output(self,other, " DIA_Addon_Finn_KillEsteban_07_01 " );	// I'm not going to get involved in this business!
	Finn_Petzt = TRUE ;
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Finn_Attentat_HaveInfos()
{
	AI_Output(other,self, " DIA_Addon_Finn_HaveInfos_15_00 " );	// I have information for him that might be interesting!
	AI_Output(self,other, " DIA_Addon_Finn_HaveInfos_07_01 " );	// You're in cahoots with whoever did this, right?
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	Info_AddChoice(DIA_Addon_Finn_Attentat, " I want to kill Esteban and am looking for an ally! " ,DIA_Addon_Finn_Attentat_KillEsteban);
	Info_AddChoice(DIA_Addon_Finn_Attentat, " You shouldn't care! " ,DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice(DIA_Addon_Finn_Attentat, " No way! " ,DIA_Addon_Finn_Attentat_NoNo);
};

func void DIA_Addon_Finn_Attentat_NoNo()
{
	AI_Output(other,self, " DIA_Addon_Finn_NoNo_15_00 " );	// Of course not!
	AI_Output(self,other, " DIA_Addon_Finn_NoNo_07_01 " );	// Good! I will tell you what I know.
	B_Addon_Finn_TellAll();
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
};

func void DIA_Addon_Finn_Attentat_ForgetIt()
{
	AI_Output(other,self, " DIA_Addon_Finn_ForgetIt_15_00 " );	// It's none of your business!
	AI_Output(self,other, " DIA_Addon_Finn_ForgetIt_07_01 " );	// Yes? Well then I don't know anything about it.
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
};


instance DIA_Addon_Finn_Again(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 9;
	condition = DIA_Addon_Finn_Again_Condition;
	information = DIA_Addon_Finn_Again_Info;
	permanent = TRUE;
	description = " And again about the attack... " ;
};


func int DIA_Addon_Finn_Again_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Finn_Attack ) &&  ! Npc_IsDead ( Stephen ) ) ;
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Finn_Again_Info()
{
	AI_Output(other,self, " DIA_Addon_Finn_Again_15_00 " );	// And again about the attack...

	if(Finn_TellAll == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Finn_Again_07_01 " );	// I've already told you everything I know.
		Info_ClearChoices(DIA_Addon_Finn_Again);
		Info_AddChoice(DIA_Addon_Finn_Again,"Good",DIA_Addon_Finn_Again_Exit);
		Info_AddChoice(DIA_Addon_Finn_Again, " Tell me!" ,DIA_Addon_Finn_Again_Nochmal);
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Finn_Again_07_02 " );	// Leave me alone with this nonsense!
		AI_StopProcessInfos(self);
	};
};

func void DIA_Addon_Finn_Again_Exit()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_Exit_15_00");	//Hmm... Fine.
	Info_ClearChoices(DIA_Addon_Finn_Again);
};

func void DIA_Addon_Finn_Again_Again()
{
	AI_Output(other,self, " DIA_Addon_Finn_Again_Nochmal_15_00 " );	// Then tell me again!
	B_Addon_Finn_TellAll();
	Info_ClearChoices(DIA_Addon_Finn_Again);
};
