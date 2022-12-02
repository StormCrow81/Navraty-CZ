

instance DIA_None_101_Mario_EXIT(C_Info)
{
	npc = None_101_Mario;
	nr = 999;
	condition = DIA_None_101_Mario_EXIT_Condition;
	information = DIA_None_101_Mario_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_None_101_Mario_EXIT_Condition()
{
	return TRUE;
};

func void DIA_None_101_Mario_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_None_101_Mario_Job(C_Info)
{
	npc = None_101_Mario;
	nr = 4;
	condition = DIA_None_101_Mario_Job_Condition;
	information = DIA_None_101_Mario_Job_Info;
	permanent = TRUE;
	description = "Что ты делаешь здесь?";
};


func int DIA_None_101_Mario_Job_Condition()
{
	if ((Capital ==  5 ) && (MIS_SCKnowsWayToIrdorath ==  FALSE ) && (Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Job_Info()
{
	AI_Output(other,self, " DIA_None_101_Mario_Job_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_None_101_Mario_Job_07_01 " );	// I hope some ship will come soon, and I will hire myself on it.
	AI_Output(self,other, " DIA_None_101_Mario_Job_07_02 " );	// This loitering around is already getting on my nerves.
};


instance DIA_None_101_Mario_YouNeedMe(C_Info)
{
	npc = None_101_Mario;
	nr = 4;
	condition = DIA_None_101_Mario_YouNeedMe_Condition;
	information = DIA_None_101_Mario_YouNeedMe_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_None_101_Mario_YouNeedMe_Condition()
{
	if ((Captain ==  5 ) && (MY_SCKnowsWayToIrdorath ==  TRUE ) && (SCGotCaptain ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YouNeedMe_Info()
{
	AI_Output(self,other, " DIA_None_101_Mario_YouNeedMe_07_00 " );	// I heard you're recruiting your ship?
	AI_Output(other,self,"DIA_None_101_Mario_YouNeedMe_15_01");	//И?
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_02");	//Я готов!
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew, " Mario is an ex-sailor, he spoke to me in the port tavern. He wants to sail on a ship. " );
};


instance DIA_None_101_Mario_WhyNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 5;
	condition = DIA_None_101_Mario_WhyNeedYou_Condition;
	information = DIA_None_101_Mario_WhyNeedYou_Info;
	permanent = FALSE;
	description = " Why should I take you? " ;
};


func int DIA_None_101_Mario_WhyNeedYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyNeedYou_Info()
{
	AI_Output(other,self, " DIA_None_101_Mario_WhyNeedYou_15_00 " );	// Why should I take you?
	AI_Output(self,other, " DIA_None_101_Mario_WhyNeedYou_07_01 " );	// It's simple. Because you need me.
	AI_Output(self,other, " DIA_None_101_Mario_WhyNeedYou_07_02 " );	// I... I was a lieutenant in the Royal Navy.
	AI_Output(self,other, " DIA_None_101_Mario_WhyNeedYou_07_03 " );	// I served as a sailor on the 'King Rhobar' and the 'Pride of Myrtana'.
	AI_Output(self,other, " DIA_None_101_Mario_WhyNeedYou_07_04 " );	// At the Battle of the Eastern Archipelago, I personally sent a couple of dozen orcs back to the realm of Beliar.
	AI_Output(self,other, " DIA_None_101_Mario_WhyNeedYou_07_05 " );	// Unfortunately, there were too few of us left when our flagship sank and we had to retreat.
};


instance DIA_None_101_Mario_WhyHere(C_Info)
{
	npc = None_101_Mario;
	nr = 7;
	condition = DIA_None_101_Mario_WhyHere_Condition;
	information = DIA_None_101_Mario_WhyHere_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_None_101_Mario_WhyHere_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_None_101_Mario_WhyNeedYou ) && ( Mario_IsOnBoard ==  FALSE )) .
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyHere_Info()
{
	AI_Output(other,self, " DIA_None_101_Mario_WhyHere_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_None_101_Mario_WhyHere_07_01 " );	// The fleet had to flee, and we lost our pay.
	AI_Output(self,other, " DIA_None_101_Mario_WhyHere_07_02 " );	// After my beaching, I got stuck in this hole, and now I'm looking for a new ship.
};


instance DIA_None_101_Mario_Abilities(C_Info)
{
	npc = None_101_Mario;
	nr = 8;
	condition = DIA_None_101_Mario_Abilities_Condition;
	information = DIA_None_101_Mario_Abilities_Info;
	permanent = FALSE;
	description = " What can you do? " ;
};


func int DIA_None_101_Mario_Abilities_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_None_101_Mario_WhyNeedYou ) && ( Mario_IsOnBoard ==  FALSE )) .
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Abilities_Info()
{
	AI_Output(other,self, " DIA_None_101_Mario_Abilities_15_00 " );	// What can you do?
	AI_Output(self,other, " DIA_None_101_Mario_Abilities_07_01 " );	// I'm trained in boarding and close combat, and I'm an accurate shot with the ship's cannon.
	AI_Output(self,other, " DIA_None_101_Mario_Abilities_07_02 " );	// I'm sure I can teach you something along the way.
	B_LogEntry(Topic_Crew, " Mario seems to have eaten the dog when it comes to naval combat. Maybe he can teach me something. " );
};


instance DIA_None_101_Mario_YourPrice(C_Info)
{
	npc = None_101_Mario;
	nr = 9;
	condition = DIA_None_101_Mario_YourPrice_Condition;
	information = DIA_None_101_Mario_YourPrice_Info;
	permanent = FALSE;
	description = " What do you want for this? " ;
};


func int DIA_None_101_Mario_YourPrice_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YourPrice_Info()
{
	AI_Output(other,self, " DIA_None_101_Mario_YourPrice_15_00 " );	// What do you want for this?
	AI_Output(self,other, " DIA_None_101_Mario_YourPrice_07_01 " );	// What do I want? Yes, I'd be happy to just get out of here.
	AI_Output(self,other, " DIA_None_101_Mario_YourPrice_07_02 " );	// I'll help you, and you'll help me get out of this hole.
};


instance DIA_None_101_Mario_CouldBeDangerous(C_Info)
{
	npc = None_101_Mario;
	nr = 10;
	condition = DIA_None_101_Mario_CouldBeDangerous_Condition;
	information = DIA_None_101_Mario_CouldBeDangerous_Info;
	permanent = FALSE;
	description = " Travel can be dangerous. " ;
};


func int DIA_None_101_Mario_CouldBeDangerous_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YourPrice) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_CouldBeDangerous_Info()
{
	AI_Output(other,self, " DIA_None_101_Mario_CouldBeDangerous_15_00 " );	// Travel can be dangerous.
	AI_Output(self,other, " DIA_None_101_Mario_CouldBeDangerous_07_01 " );	// I'm used to danger. When you are away from home, every day is full of dangers for you.
	AI_Output(self,other, " DIA_None_101_Mario_CouldBeDangerous_07_02 " );	// Any storm can be your last, and monsters from the deep can swallow your ship whole.
	AI_Output(self,other, " DIA_None_101_Mario_CouldBeDangerous_07_03 " );	// Not to mention Ork galleys. Trust me, I'm not afraid of anything. A sailor who is afraid is doomed to death.
};


instance DIA_None_101_Mario_DontNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 13;
	condition = DIA_None_101_Mario_DontNeedYou_Condition;
	information = DIA_None_101_Mario_DontNeedYou_Info;
	permanent = FALSE;
	description = " I don't need you. " ;
};


func int DIA_None_101_Mario_DontNeedYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_DontNeedYou_Info()
{
	AI_Output(other,self, " DIA_None_101_Mario_DontNeedYou_15_00 " );	// I don't need you.
	AI_Output(self,other, " DIA_None_101_Mario_DontNeedYou_07_01 " );	// I'm the best sailor you can find here.
	AI_Output(self,other, " DIA_None_101_Mario_DontNeedYou_07_02 " );	// I don't think you know much about navigation.
	AI_Output(self,other, " DIA_None_101_Mario_DontNeedYou_07_03 " );	// So think twice before trusting anyone.
};


instance DIA_None_101_Mario_NeedGoodMen(C_Info)
{
	npc = None_101_Mario;
	nr = 2;
	condition = DIA_None_101_Mario_NeedGoodMen_Condition;
	information = DIA_None_101_Mario_NeedGoodMen_Info;
	permanent = FALSE;
	description = " I will always find a place for good people. " ;
};


func int DIA_None_101_Mario_NeedGoodMen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_NeedGoodMen_Info()
{
	AI_Output(other,self, " DIA_None_101_Mario_NeedGoodMen_15_00 " );	// I will always find a place for good people.
	AI_Output(self,other, " DIA_None_101_Mario_NeedGoodMen_07_01 " );	// Sure, see you on the ship.
	B_GivePlayerXP(XP_Crewmember_Success);
	Mario_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_Mario_LeaveMyShip(C_Info)
{
	npc = None_101_Mario;
	nr = 11;
	condition = DIA_Mario_LeaveMyShip_Condition;
	information = DIA_Mario_LeaveMyShip_Info;
	permanent = TRUE;
	description = " I still can't take you with me! " ;
};


func int DIA_Mario_LeaveMyShip_Condition()
{
	if((Mario_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mario_LeaveMyShip_Info()
{
	AI_Output(other,self, " DIA_Mario_LeaveMyShip_15_00 " );	// I realized that I don't need you!
	AI_Output(self,other, " DIA_Mario_LeaveMyShip_07_01 " );	// As you say. You know where to look for me!
	Mario_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Mario_StillNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 11;
	condition = DIA_Mario_StillNeedYou_Condition;
	information = DIA_Mario_StillNeedYou_Info;
	permanent = TRUE;
	description = " I still need you! " ;
};


func int DIA_Mario_StillNeedYou_Condition()
{
	if(((Mario_IsOnBoard == LOG_OBSOLETE) || (Mario_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mario_StillNeedYou_Info()
{
	AI_Output(other,self, " DIA_Mario_StillNeedYou_15_00 " );	// I still need you!
	if(Mario_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other, " DIA_Mario_StillNeedYou_07_01 " );	// I knew! See you on the ship!
		Mario_IsOnBoard = LOG_SUCCESS;
		Crewmember_Count = Crewmember_Count + 1;
		AI_StopProcessInfos(self);
		if(MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Mario_StillNeedYou_07_02 " );	// You can't treat me like that. I didn't care about you!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_MARIO_PICKPOCKET(C_Info)
{
	npc = None_101_Mario;
	nr = 900;
	condition = DIA_MARIO_PICKPOCKET_Condition;
	information = DIA_MARIO_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_MARIO_PICKPOCKET_Condition()
{
	return  C_Robbery ( 71 , 220 );
};

func void DIA_MARIO_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_mario_pickpocket);
	Info_AddChoice(dia_mario_pickpocket,Dialog_Back,dia_mario_pickpocket_back);
	Info_AddChoice(dia_mario_pickpocket,DIALOG_PICKPOCKET,DIA_MARIO_PICKPOCKET_DoIt);
};

func void DIA_MARIO_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(dia_mario_pickpocket);
};

func void dia_mario_pickpocket_back()
{
	Info_ClearChoices(dia_mario_pickpocket);
};

// ------------------- epic dungeon -------------- ------------------------------

instance DIA_NONE_1813_Ilesil_EXIT(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 999;
	condition = DIA_NONE_1813_Ilesil_EXIT_Condition;
	information = DIA_NONE_1813_Ilesil_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NONE_1813_Ilesil_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_1813_Ilesil_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1813_Ilesil_Job(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Job_Condition;
	information = DIA_NONE_1813_Ilesil_Job_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_Job_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Job_Info()
{
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Job_15_00 " );	// Well, well... Another lost soul. What are you looking for here, wanderer?
};

instance DIA_NONE_1813_Ilesil_WhoYou(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_WhoYou_Condition;
	information = DIA_NONE_1813_Ilesil_WhoYou_Info;
	permanent = FALSE;
	description = " Who are you? " ;
};

func int DIA_NONE_1813_Ilesil_WhoYou_Condition()
{
	return TRUE;
};

func void DIA_NONE_1813_Ilesil_WhoYou_Info()
{
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_WhoYou_15_00 " );	// Who are you and what are you doing here?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhoYou_15_01 " );	// My name is Ile'Sil. I'm here looking for answers, just like you.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_WhoYou_15_02 " );	// And how long have you been looking for them?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhoYou_15_03 " );	// I don't know exactly. Since I got here, time has almost stopped for me.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhoYou_15_04 " );	// I know it sounds pretty weird, but... you'll see for yourself soon enough.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_WhoYou_15_05 " );	// Actually, I wasn't going to stay here long.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhoYou_15_06 " );	// You just arrived and you already want to leave? I'm afraid to upset you: you can't just leave here.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_WhoYou_15_07 " );	// What do you mean?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhoYou_15_08 " );	// There's no way out of here!
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_WhoYou_15_09 " );	// (to himself) I seem to be in trouble again.
};

instance DIA_NONE_1813_Ilesil_WhatPlace(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_WhatPlace_Condition;
	information = DIA_NONE_1813_Ilesil_WhatPlace_Info;
	permanent = FALSE;
	description = " What is this place? " ;
};

func int DIA_NONE_1813_Ilesil_WhatPlace_Condition()
{
	if(Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_WhoYou) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_WhatPlace_Info()
{
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_WhatPlace_15_00 " );	// What is this place?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhatPlace_15_01 " );	// I don't know much more about him than you do.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhatPlace_15_02 " );	// But if I were given the choice to define this place myself, I would call it the Realm of Lost Souls.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_WhatPlace_15_03 " );	// Why exactly?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhatPlace_15_04 " );	// Anyone who gets here is forever lost in the cycle of events of this world. And his soul will be forever doomed to wander here.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_WhatPlace_15_05 " );	// But you've been here a long time, haven't you?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhatPlace_15_06 " );	// When you're chained to one place, it doesn't matter. Don't ask me about it, I still have nothing to say.
};

instance DIA_NONE_1813_Ilesil_WhyNotRun(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_WhyNotRun_Condition;
	information = DIA_NONE_1813_Ilesil_WhyNotRun_Info;
	permanent = FALSE;
	description = " And you didn't try to get out of here? " ;
};

func int DIA_NONE_1813_Ilesil_WhyNotRun_Condition()
{
	if(Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_WhoYou) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_WhyNotRun_Info()
{
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_WhyNotRun_15_00 " );	// And you didn't try to get out of here?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyNotRun_15_01 " );	// Tried. But only once. At that time, I reached about that big stone.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_WhyNotRun_15_02 " );	// And then what?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyNotRun_15_03 " );	// Then, apparently, I died. I remember something huge jumped out from behind that rock and attacked me.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyNotRun_15_04 " );	// And then everything is as if in darkness. Only terrible pain all over my body!
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_WhyNotRun_15_05 " );	// So you're a ghost?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyNotRun_15_06 " );	// Now I don't even know who I am. But maybe you can help me find the answer to this question.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_WhyNotRun_15_07 " );	// Possibly. But I won't promise anything yet.
};

instance DIA_NONE_1813_Ilesil_WhyComeHere(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_WhyComeHere_Condition;
	information = DIA_NONE_1813_Ilesil_WhyComeHere_Info;
	permanent = FALSE;
	description = " Why did you even come here? " ;
};

func int DIA_NONE_1813_Ilesil_WhyComeHere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_WhoYou) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_WhyComeHere_Info()
{
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_WhyComeHere_15_00 " );	// Why did you even come here?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_01 " );	// I'm not here of my own free will. This is my crazy brother!
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_WhyComeHere_15_02 " );	// Did you have a brother?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_03 " );	// His name was Il'Kirith. We were both hunters.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_04 " );	// When fear gripped us all and the general madness began, he said he knew a safe place to hide.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_WhyComeHere_15_05 " );	// Wait. What madness are you talking about?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_06 " );	// Oh, yes... After all, so much time has passed since then, and you, of course, could not have known about what happened then.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_WhyComeHere_15_07 " );	// I wouldn't mind knowing about it now.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_08 " );	// Then I'll start from the beginning. We have nowhere to hurry now.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_09 " );	// The place you came from was once a most beautiful valley called Adaros.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_10 " );	// It was inhabited by many people who worshiped Adanos, the god of Water and Balance.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_11 " );	// By the way, it was there, according to our priests, that he first set foot on the land of people.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_12 " );	// After which Adanos blessed her and my people who lived in this valley.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_WhyComeHere_15_13 " );	// Some of this I already know. What happened next?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_14 " );	// One fine day, our lands were suddenly overrun by hordes of terrible monsters and the undead.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_15 " );	// I don't know who or what caused it, but those were awful days! A lot of people died.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_16 " );	// To avoid the same fate, my brother led me here.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_17 " );	// In appearance, this place resembled a temple, similar to those that we built ourselves.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_18 " );	// But as soon as we entered there, unprecedented creatures climbed on us from all sides.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_19 " );	// We fought back as best we could, but at some point it turned out that we had nowhere else to retreat. We were cornered on all sides.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_20 " );	// And then my brother accidentally spotted what looked like a magical portal in the corner of the room.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_21 " );	// We didn't have a choice. We both jumped into it, and that's how I ended up in this very place.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_22 " );	// And after that, I realized that all the vile creatures that flooded our valley came to us just from this portal.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_23 " );	// But who could then know about it.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_WhyComeHere_15_24 " );	// And what about your brother?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_25 " );	// He wasn't around. Once here alone, I decided to immediately go in search of him.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_26 " );	// Only now they ended at about that large stone that you see ahead. As is my life.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_27 " );	// Since then, I have not given up hope of finding out what became of my brother.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_WhyComeHere_15_28 " );	// But I'm afraid my hopes are no longer destined to come true. So much time has passed since then...
};

instance DIA_NONE_1813_Ilesil_SeekBro(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_SeekBro_Condition;
	information = DIA_NONE_1813_Ilesil_SeekBro_Info;
	permanent = FALSE;
	description = " I could look for your brother. " ;
};

func int DIA_NONE_1813_Ilesil_SeekBro_Condition()
{
	if((Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_WhyComeHere) == TRUE) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_WhyNotRun) == TRUE) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_WhatPlace) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_SeekBro_Info()
{
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_SeekBro_15_00 " );	// I could look for your brother.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_SeekBro_15_01 " );	// Are you offering to help me? It is worthy of respect.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_SeekBro_15_02 " );	// But this is a very dangerous place. Death is everywhere here!
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_SeekBro_15_03 " );	// I've dealt with critters and worse. Yes, and will you help me?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_SeekBro_15_04 " );	// Anything I can. But you will have to fight all the evil creatures that inhabit this island alone.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_SeekBro_15_05 " );	// What's stopping you from taking part in this?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_SeekBro_15_06 " );	// For a very long time, some unknown magical force has chained me to this place.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_SeekBro_15_07 " );	// It's not easy to explain in words, but I feel it with my whole body when I try to move somewhere to the side.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_SeekBro_15_08 " );	// So I'll stay here for now and just watch you.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_SeekBro_15_09 " );	// If you manage to get deep into the island, then perhaps there you can find the answer to this question.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_SeekBro_15_10 " );	// And then we'll continue our search together.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_SeekBro_15_11 " );	// Well, okay. What did your brother look like? Did he have anything on him that would help identify him?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_SeekBro_15_12 " );	// At the time of our parting, he was wearing panther-skin hunting armor and a chitin sword, which our father gave him before his death.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_SeekBro_15_13 " );	// That's all I remember about him.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_SeekBro_15_14 " );	// Okay, I'll remember that. Let's hope that in addition to your brother, we will also find a way out of here.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_SeekBro_15_15 " );	// I don't really want to be stuck here for all eternity.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_SeekBro_15_16 " );	// You are very brave and courageous, wanderer. Hope luck is on your side.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_SeekBro_15_17 " );	// Take this medallion. It will protect you from the deadly effects of the local climate.
	B_GiveInvItems(self,other,ItMi_IlisilAmulet,1);
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_SeekBro_15_18 " );	// Thank you. Now it's time for me to go.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_SeekBro_15_19 " );	// Take care of yourself.
	EpicJorneyStart = TRUE;
	MIS_Miss_Brother = LOG_Running;
	Log_CreateTopic(TOPIC_Miss_Brother,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Miss_Brother,LOG_Running);
	B_LogEntry(TOPIC_Miss_Brother,"Following into the mysterious portal, at the exit from it I met an unusual ghost named Ile'Sil. He told me his story in which he and his brother Il'Kirith tried to hide in this portal from the monsters pursuing them. However they separated during the teleportation, and Ile'Sil never found out what became of his brother.I decided to help this ghost find Il'Cirith, or at least what was left of him.Besides, I'll have to find a way to get yourself out of this place, since, according to Ile'Sil, this is not possible.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(PaleCrawler,"LOSTVALLEY_PALECRAWLER");
};

instance DIA_NONE_1813_Ilesil_FirstBossDown(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_FirstBossDown_Condition;
	information = DIA_NONE_1813_Ilesil_FirstBossDown_Info;
	permanent = FALSE;
	description = " Looks like I killed the monster that attacked you. " ;
};

func int DIA_NONE_1813_Ilesil_FirstBossDown_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (PaleCrawlerIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_FirstBossDown_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_FirstBossDown_15_00 " );	// Looks like I finished off the monster that attacked you.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_FirstBossDown_15_01 " );	// True? And what was this creature?
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_FirstBossDown_15_02 " );	// Sort of like a creeper, only much more dangerous than its cousins.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_FirstBossDown_15_03 " );	// Who would have thought... And you seem to be a good fighter, since you managed to defeat him.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_FirstBossDown_15_04 " );	// Who knows - maybe we do have some chance of success.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_FirstBossDown_15_05 " );	// What odds are you talking about?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_FirstBossDown_15_06 " );	// You - get out of here, and I - to find my brother and forever rest my soul.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_FirstBossDown_15_07 " );	// I understand. Then it's time for me to move on.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_FirstBossDown_15_08 " );	// Okay, just be careful! I'm sure that crawler is nothing compared to what lies ahead for you.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_FirstBossDown_15_09 " );	// We'll see.
	ReadyForBoss2 = TRUE;
	B_LogEntry(TOPIC_Miss_Brother, " Ile'Sil was encouraged by the fact that I managed to finish off the monster that attacked him. However, he warned that much more difficult tests awaited me. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(WinterPlague, " LOSTVALLEY_WINTERPLAGUE " );
};

instance DIA_NONE_1813_Ilesil_SecondBossDown(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_SecondBossDown_Condition;
	information = DIA_NONE_1813_Ilesil_SecondBossDown_Info;
	permanent = FALSE;
	description = " Look what I found. " ;
};

func int DIA_NONE_1813_Ilesil_SecondBossDown_Condition()
{
	if ((MY_Miss_Brother == LOG_Running) && (AraharPlagueIsDead ==  TRUE ) && (Npc_HasItems(other,ItMy_AraharEye_Unknown) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_SecondBossDown_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_SecondBossDown_15_00 " );	// Look what I found.
	B_GiveInvItems(other,self,ItMi_ArahArEye_Unknown, 1 );
	Npc_RemoveInvItems(self,ItMi_ArahArEye_Unknown,1);
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_SecondBossDown_15_01 " );	// Interesting item... Looks a bit like someone's eye. Where did you find him?
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_SecondBossDown_15_02 " );	// Looks like it belonged to a powerful lich who guarded what looked like a graveyard not far from here.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_SecondBossDown_15_03 " );	// And this thing just lay in his chest.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_SecondBossDown_15_04 " );	// We must assume that he did not just keep it there. There must be reasons.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_SecondBossDown_15_05 " );	// And can you find them?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_SecondBossDown_15_06 " );	// Possibly. Staying in the form of the undead sometimes gives its advantages. Sometimes we are able to see things that a living person could not see.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_SecondBossDown_15_07 " );	// Then take a closer look at this item and try to understand what's so special about it.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_SecondBossDown_15_08 " );	// I'll do that. But it will take some time.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_SecondBossDown_15_09 " );	// Well, we've got plenty of time, so I'm not rushing you.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_SecondBossDown_15_10 " );	// What are you going to do?
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_SecondBossDown_15_11 " );	// I'll look around near that cemetery. Maybe there's something else of interest there.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_SecondBossDown_15_12 " );	// Good. In the meantime, I'll take care of this... eye.
	ReadyForBoss3 = TRUE;
	B_LogEntry(TOPIC_Miss_Brother, " I brought Ile'Sil a strange eye-like item I found in a powerful lich's chest. Ile'Sil promised to study it and find out what it is for. But it will take some time. I'd better look around the old cemeteries. Maybe I'll be lucky enough to find something else interesting. " );
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1813_Ilesil_ThirdBossDown(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_ThirdBossDown_Condition;
	information = DIA_NONE_1813_Ilesil_ThirdBossDown_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_ThirdBossDown_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (LookAtDemonAltar == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_ThirdBossDown_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_ThirdBossDown_15_01 " );	// Ah, it's you... I've been waiting for you.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_ThirdBossDown_15_02 " );	// Any news?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_ThirdBossDown_15_03 " );	// Let's start with you. What did you find out?
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_ThirdBossDown_15_04 " );	// Nothing special. Not far from the cemetery, I found only an old magic altar. And a couple of ghosts that guarded it.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_ThirdBossDown_15_05 " );	// And what did he look like?
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_ThirdBossDown_15_06 " );	// It was all covered with ancient runes, and in the middle it had such a round notch, like a sacrificial cup.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_ThirdBossDown_15_07 " );	// Is that all?
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_ThirdBossDown_15_08 " );	// Yes. And what's with the eye?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_ThirdBossDown_15_09 " );	// As far as I understand, this item is a kind of key.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_ThirdBossDown_15_11 " );	// At least the memories I've been able to extract from him clearly bear this out.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_ThirdBossDown_15_12 " );	// If this is a key, then there must be a chest.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_ThirdBossDown_15_13 " );	// Don't take everything so literally. By this word, I meant that this object can affect the surrounding objects in a special way.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_ThirdBossDown_15_14 " );	// Okay, so what do we do with it now?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_ThirdBossDown_15_15 " );	// You said you found some sacrificial altar. Try using this item on him.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_ThirdBossDown_15_16 " );	// Maybe something worthwhile will come out of this.
	B_GiveInvItems(self,other,ItMi_ArahArEye, 1 );
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_ThirdBossDown_15_17 " );	// And if not?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_ThirdBossDown_15_18 " );	// Then we'll think further.
	ReadyForBoss4 = TRUE;
	B_LogEntry(TOPIC_Miss_Brother, " Ile'Sil gave me back the Strange Eye and asked me to use it on the altar the ghosts were guarding. I hope something comes of this. " );
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1813_Ilesil_IsFree(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_IsFree_Condition;
	information = DIA_NONE_1813_Ilesil_IsFree_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_IsFree_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (LookAtDemonAltar == TRUE) && (SoulKeeperIsDead == TRUE) && (IlesilIsFree == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_IsFree_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_IsFree_15_01 " );	// I see that you still somehow managed to free me from the magical bonds.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_IsFree_15_02 " );	// Apparently - since you're here. How are you feeling?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_IsFree_15_03 " );	// Better, much better. The last years of being in this place were simply unbearable.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_IsFree_15_04 " );	// But now at one point, all of a sudden it's over.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_IsFree_15_05 " );	// I freed your soul, but I'm afraid it won't be enough to bring you back to life.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_IsFree_15_06 " );	// You've already done a lot for me. For which I am very grateful to you.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_IsFree_15_07 " );	// Just let's not get distracted by pleasantries.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_IsFree_15_08 " );	// We need to get out of here somehow. Do you have any thoughts on this?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_IsFree_15_09 " );	// Hmmm... This place stinks of curses. Very strong and very evil!
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_IsFree_15_10 " );	// I think if we manage to find its source, then we will find the answer to this question.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_IsFree_15_11 " );	// What about your brother? Is there anything here that would help us in our search?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_IsFree_15_12 " );	// No. Nothing.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_IsFree_15_13 " );	// Okay. Where to go next?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_IsFree_15_14 " );	// Let me take a look around...
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_IsFree_15_15 " );	// Okay, I think we have a couple of minutes.
	IlesilCount = TRUE;
	B_LogEntry(TOPIC_Miss_Brother, " Ile'Sil's soul is free, and now he can move freely around the island. Now we need to decide what to do next. Ile'Sil asked for some time to look around. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SearchPlace");
};

instance DIA_NONE_1813_Ilesil_Move(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Move_Condition;
	information = DIA_NONE_1813_Ilesil_Move_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_Move_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (IlesilCountDone == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Move_Info()
{
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Move_15_01 " );	// Well, did you find anything?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Move_15_02 " );	// See that temple on the mountain?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Move_15_03 " );	// The dark magic of this place comes from exactly where.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Move_15_04 " );	// How do you know this?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Move_15_05 " );	// I don't know it, but I feel it.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Move_15_06 " );	// Then let's not waste time and go there now.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Move_15_07 " );	// Looks like this is the only thing left to do. Just be careful. The way there must be well guarded.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Move_15_08 " );	// Let's find out at the same time. Let's go!
	ReadyForBoss5 = TRUE;
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	B_LogEntry(TOPIC_Miss_Brother, " We need to get to the temple in the center of the island, from where dark magic is spreading all over the island. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowTemple");
};

instance DIA_NONE_1813_Ilesil_FireCave(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_FireCave_Condition;
	information = DIA_NONE_1813_Ilesil_FireCave_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_FireCave_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (ReadyForBoss5 == TRUE) && (Npc_GetDistToWP(self,"WDS_LAVA_CEMETRY_07") < 1000))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_FireCave_Info()
{
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_FireCave_15_01 " );	// You won't get through here.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_FireCave_15_02 " );	// I already noticed this. And what are we going to do now?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_FireCave_15_03 " );	// See that little altar next to the bars? I am sure that he is the key to the clue.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_FireCave_15_04 " );	// Try to use it somehow. Perhaps this will give the desired effect.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_FireCave_15_05 " );	// I'll be waiting for you on the opposite side of the aisle. As you can see, being a ghost is sometimes very convenient.
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	WaitForHero = TRUE;
	B_LogEntry(TOPIC_Miss_Brother, " We were blocked by a massive gate. Ile'Sil advised me to use the altar next to it. It will be waiting for me on the opposite side of the passage. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaitForHero");
};

instance DIA_NONE_1813_Ilesil_NextMove(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_NextMove_Condition;
	information = DIA_NONE_1813_Ilesil_NextMove_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_NextMove_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (FiarasIsDead == TRUE) && (FiarasHeartInPlace == TRUE))
	{
		if((Hlp_GetHeroStatus() != HERO_THREATENED) && (Hlp_GetHeroStatus() != HERO_FIGHTING))
		{
			return TRUE;
		};
	};
};

func void DIA_NONE_1813_Ilesil_NextMove_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_NextMove_15_01 " );	// I see you managed to get here after all.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_NextMove_15_02 " );	// What is this place?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_NextMove_15_03 " );	// I don't know. But it somehow reminds me of a circle of druids.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_NextMove_15_04 " );	// Only the druids themselves are not visible. And instead of them, a bunch of undead.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_NextMove_15_05 " );	// Anyway, this place has a very strong magical aura. I think we need to look around there before continuing on.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_NextMove_15_06 " );	// To me, we're just wasting time. The temple is near!
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_NextMove_15_07 " );	// You may be right, but something tells me it's better to take a look at this place.
	SearchCircle = TRUE;
	B_LogEntry(TOPIC_Miss_Brother, " After passing the mountain pass, I met Ile'Sil again. He was waiting for me in a rather strange place. According to him, it has a powerful magical aura. Ile'Sel suggested that we look around here. It's a waste of time in my opinion, though the advice of a ghost is still worth listening to ... " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InspectCircle");
};

instance DIA_NONE_1813_Ilesil_EnterHram(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_EnterHram_Condition;
	information = DIA_NONE_1813_Ilesil_EnterHram_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_EnterHram_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (EkronIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_EnterHram_Info()
{
	B_GivePlayerXP(1500);
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_EnterHram_15_01 " );	// Your fight with that pile of wood... it was incredible.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_EnterHram_15_02 " );	// To be honest, I was hoping for your help.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_EnterHram_15_03 " );	// Forgive me, my friend... But what can a simple ghost do against such a concentration of hatred and malice.  
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_EnterHram_15_04 " );	// Plus, I'm part of this place. Which means I can't resist his will for long.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_EnterHram_15_05 " );	// Okay, let's forget about it. What's ahead?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_EnterHram_15_06 " );	// We have almost reached the temple. But powerful ghosts block the entrance there.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_EnterHram_15_07 " );	// I feel them. I feel their pain, fear and hatred! They are already waiting for you.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_EnterHram_15_08 " );	// Then don't make them wait.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_EnterHram_15_09 " );	// By the way, we didn't find out anything about your brother on the way here.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_EnterHram_15_10 " );	// You're right... But I think the answer to this question is already somewhere nearby. Perhaps he is hidden inside this temple.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_EnterHram_15_11 " );	// So we need to get there.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_EnterHram_15_12 " );	// We have no other way.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_EnterHram_15_13 " );	// Okay, let's go then.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_EnterHram_15_14 " );	// You go... and I'll stay here. And I will watch you.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_EnterHram_15_15 " );	// But why?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_EnterHram_15_16 " );	// I can't get close to these ghosts. If they see me, they'll instantly understand what's going on.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_EnterHram_15_17 " );	// And then everything will be over for me. They will devour my soul and turn my bones to dust.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_EnterHram_15_18 " );	// Then wait here. I'll be back soon.
	B_LogEntry(TOPIC_Miss_Brother, " We almost made it to the temple. According to Ile'Sil, some powerful ghosts are guarding the entrance to it. Ile'Sil himself does not dare come close to them, because they will destroy him. Which means that all I have to do the work again ... " );
	ReadyForBoss6 = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Skeleton_Bro_Dex,"LV_SKELETON_DEX_01");
	Wld_InsertNpc(Skeleton_Bro_Str,"LV_SKELETON_STR_01");
	Wld_InsertNpc(Skeleton_Bro_Mag, " LV_SKELETON_MAG_01 " );
};

instance DIA_NONE_1813_Ilesil_OpenHram(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_OpenHram_Condition;
	information = DIA_NONE_1813_Ilesil_OpenHram_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_OpenHram_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (SkelBrosFightWin == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_OpenHram_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHram_15_01 " );	// So, we have reached the temple. I didn't think we could make it.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_OpenHram_15_02 " );	// It's too early to rejoice. Now you have to somehow get into it. Any thoughts on this?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHram_15_03 " );	// Most likely, these stone switches open the entrance to it.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_OpenHram_15_04 " );	// There are quite a few of them.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHram_15_05 " );	// And, most likely, they need to be rotated in the correct sequence.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_OpenHram_15_06 " );	// Which one exactly?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHram_15_07 " );	// This is unknown to me. You will have to find out for yourself. I hope you're lucky...
	StartLvStory = TRUE;
	B_LogEntry(TOPIC_Miss_Brother, " The entrance to the temple was locked with a strong grate. According to Ile'Sil, you can open it by using the stone switches located on a small area in front of the temple. You'll have to rack your brains to figure out in what order to activate them. " ) ;
	AI_StopProcessInfos(self);
};

var int NeedIlesilStory;
var int HintIlesilDone;

instance DIA_NONE_1813_Ilesil_OpenHramHint(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_OpenHramHint_Condition;
	information = DIA_NONE_1813_Ilesil_OpenHramHint_Info;
	permanent = FALSE;
	description = " (ask about music stands). " ;
};

func int DIA_NONE_1813_Ilesil_OpenHramHint_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (StartLvStoryFR == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_OpenHramHint_Info()
{
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_OpenHramHint_15_01 " );	// See those ancient music stands all over the temple square? In each of them some strange records are made.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHramHint_15_02 " );	// (thoughtfully) Perhaps these are clues that will help open the entrance to the temple. Tell me what exactly is written in them?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHramHint_15_03 " );	// Only as precisely as possible, down to the last word. Otherwise, we will not be able to understand their correct meaning.
	Info_ClearChoices(DIA_NONE_1813_Ilesil_OpenHramHint);

	if((LV_Story_01 == TRUE) && (LV_Story_02 == TRUE) && (LV_Story_03 == TRUE) && (LV_Story_04 == TRUE) && (LV_Story_05 == TRUE) && (LV_Story_06 == TRUE))
	{
		Info_AddChoice(DIA_NONE_1813_Ilesil_OpenHramHint, " Вот, слушай... " ,DIA_NONE_1813_Ilesil_OpenHramHint_Yes);
	};

	Info_AddChoice(DIA_NONE_1813_Ilesil_OpenHramHint, " Unfortunately, I haven't read all of them yet. " ,DIA_NONE_1813_Ilesil_OpenHramHint_No);
};

instance DIA_NONE_1813_Ilesil_OpenHramHintAgain(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_OpenHramHintAgain_Condition;
	information = DIA_NONE_1813_Ilesil_OpenHramHintAgain_Info;
	permanent = TRUE;
	description = " About those inscriptions... " ;
};

func int DIA_NONE_1813_Ilesil_OpenHramHintAgain_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (StartLvStoryFR == TRUE) && (NeedIlesilStory == TRUE) && (HintIlesilDone == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_OpenHramHintAgain_Info()
{
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_OpenHramHintAgain_15_01 " );	// About those inscriptions...
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHramHintAgain_15_02 " );	// Have you read them all?
	Info_ClearChoices(DIA_NONE_1813_Ilesil_OpenHramHintAgain);

	if((LV_Story_01 == TRUE) && (LV_Story_02 == TRUE) && (LV_Story_03 == TRUE) && (LV_Story_04 == TRUE) && (LV_Story_05 == TRUE) && (LV_Story_06 == TRUE))
	{
		Info_AddChoice(DIA_NONE_1813_Ilesil_OpenHramHintAgain, " Вот, слушай... " ,DIA_NONE_1813_Ilesil_OpenHramHint_Yes);
	};

	Info_AddChoice(DIA_NONE_1813_Ilesil_OpenHramHintAgain, " Sorry, I haven't read all of them yet. " ,DIA_NONE_1813_Ilesil_OpenHramHint_No);
};

func void DIA_NONE_1813_Ilesil_OpenHramHint_Yes()
{
	PlayVideo("RET2_BlackScreen.bik");
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_01 " );	// That, in fact, is all that was written there.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_02 " );	// (thoughtfully) The ancients were good at hiding the true meaning in words.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_03 " );	// It would take you forever to unravel this mystery. But I'll still try to help you.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_04 " );	// Would be nice.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_05 " );	// So, apparently, each of these stone switches means one of the cardinal directions.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_06 " );	// And the text is the clue to their alternate use.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_07 " );	// This is something to think about... Give me some time to think.
	B_LogEntry(TOPIC_Miss_Brother, " It will take Ile'Sil some time to decipher these secret writings of the ancients. I hope he succeeds. " );
	HintIlesilDone = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TransText");
};

func void DIA_NONE_1813_Ilesil_OpenHramHint_No()
{
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_OpenHramHint_No_15_01 " );	// Unfortunately, I haven't fully read them yet.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHramHint_No_15_02 " );	// Then I can't help you.

	if(NeedIlesilStory == FALSE)
	{
		B_LogEntry(TOPIC_Miss_Brother, " I need to read all the inscriptions on the ancient music stands so that Ile'Sil can understand their meaning. " );
		NeedIlesilStory = TRUE;
	};

	AI_StopProcessInfos(self);
};

instance DIA_NONE_1813_Ilesil_OpenHramHintDone(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_OpenHramHintDone_Condition;
	information = DIA_NONE_1813_Ilesil_OpenHramHintDone_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_OpenHramHintDone_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (HintIlesilDone == TRUE) && (IlesilCountNextDone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_OpenHramHintDone_Info()
{
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHramHintDone_15_01 " );	// I think I understood something from what is said in the records.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHramHintDone_15_02 " );	// The rock closest to the grate points north.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHramHintDone_15_03 " );	// But the first one in the sequence faces southeast.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHramHintDone_15_04 " );	// The third is to the southwest, the fifth clearly points to the north, and the eighth is to the south.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHramHintDone_15_05 " );	// You'll have to find the rest of the stones in the sequence yourself.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_OpenHramHintDone_15_06 " );	// Well, at least something. Thank you.
	B_LogEntry(TOPIC_Miss_Brother, " According to Ile'Sil, the closest stone to the grate points north. The third one is southwest, the fifth one is north, and the eighth one is south. I'll have to find the rest of the stones in the sequence myself... " ) ;
};

instance DIA_NONE_1813_Ilesil_OpenHramDone(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_OpenHramDone_Condition;
	information = DIA_NONE_1813_Ilesil_OpenHramDone_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_OpenHramDone_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (OpenHramDone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_OpenHramDone_Info()
{
	B_GivePlayerXP(2000);
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHramDone_15_01 " );	// The temple grate is open. You just have to follow inside.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_OpenHramDone_15_02 " );	// Won't you come with me?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHramDone_15_03 " );	// I'll stay outside. This place is too dangerous for me.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_OpenHramDone_15_04 " );	// You say that like you could die one more time.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHramDone_15_05 " );	// After you returned my soul to me, after so many years of oblivion and meaningless existence, I regained a taste for life.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHramDone_15_06 " );	// And I don't want to lose him again...
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_OpenHramDone_15_07 " );	// I understand you. Okay, stay here if you want. And I have to go.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_OpenHramDone_15_08 " );	// Good luck wanderer...
	B_LogEntry(TOPIC_Miss_Brother, " Ile'Sil stayed outside the temple, afraid to go inside. I'll have to do this if I want to get out of here. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Skeleton_Lord_LV,"LOSTVALLEY_CHELDRAK");
};

instance DIA_NONE_1813_Ilesil_Die(C_Info)
{
	npc = Ilesil_Evil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Die_Condition;
	information = DIA_NONE_1813_Ilesil_Die_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_Die_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (FinalDialogeLv == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Die_Info()
{
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_15_01 " );	// Finally, after so many hundreds of years of waiting and hardship...
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Die_15_02 " );	// Are you there?! But you said that this place is dangerous for you.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_15_03 " );	// It was dangerous as long as the Chel'Drak was alive.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_15_04 " );	// But now, thanks to you, his spirit is dead. Which means I can do what I came here for.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_15_05 " );	// And you will help me with this.
};


instance DIA_NONE_1813_Ilesil_Die_Ans_01(C_Info)
{
	npc = Ilesil_Evil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Die_Ans_01_Condition;
	information = DIA_NONE_1813_Ilesil_Die_Ans_01_Info;
	permanent = FALSE;
	description = " When you say help, do you mean your brother? " ;
};

func int DIA_NONE_1813_Ilesil_Die_Ans_01_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_Die) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Die_Ans_01_Info()
{
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Die_Ans_01_15_01 " );	// Speaking of help, you probably mean your brother?
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Die_Ans_01_15_02 " );	// But we never found him.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_01_15_03 " );	// The problem was not to find it, but to get to it.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Die_Ans_01_15_04 " );	// What do you mean by that?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_01_15_05 " );	// Turn around - and you will understand everything.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_01_15_06 " );	// Those frozen remains in the arms of Beliar's statue are my brother, Il'Kirith.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_01_15_07 " );	// But soon he will be by my side again. And your soul will help me bring him back to life.
};

instance DIA_NONE_1813_Ilesil_Die_Ans_02(C_Info)
{
	npc = Ilesil_Evil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Die_Ans_02_Condition;
	information = DIA_NONE_1813_Ilesil_Die_Ans_02_Info;
	permanent = FALSE;
	description = " How did you know about the Chel'Drak? " ;
};

func int DIA_NONE_1813_Ilesil_Die_Ans_02_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_Die) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Die_Ans_02_Info()
{
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Die_Ans_02_15_01 " );	// How did you know about the Chel'Drak? After all, you've never been to church.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_02_15_02 " );	// So it is. The ancients diligently made sure that no one else could penetrate here.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_02_15_03 " );	// But unlike many, you succeeded.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Die_Ans_02_15_04 " );	// And what, there were others who tried to get here?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_02_15_05 " );	// Believe me, there were plenty of them. But they are all long dead... and you are not.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_02_15_06 " );	// Apparently, the gods are quite favorable to you, wanderer. However, it still won't save you.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_02_15_07 " );	// Beliar will gladly take your soul into his arms, - naturally, in exchange for the soul of my brother.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_02_15_08 " );	// A fair and profitable deal, isn't it?
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Die_Ans_02_15_09 " );	// I don't think so.
};

instance DIA_NONE_1813_Ilesil_Die_Ans_03(C_Info)
{
	npc = Ilesil_Evil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Die_Ans_03_Condition;
	information = DIA_NONE_1813_Ilesil_Die_Ans_03_Info;
	permanent = FALSE;
	description = " Who are you anyway? " ;
};

func int DIA_NONE_1813_Ilesil_Die_Ans_03_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_Die_Ans_01) == TRUE) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_Die_Ans_02) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Die_Ans_03_Info()
{
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Die_Ans_03_15_01 " );	// Who are you anyway?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_03_15_02 " );	// Someone you'd be better off not dating at all.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_03_15_03 " );	// My brother Il'Kirith and I were once powerful Shadowlords.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_03_15_04 " );	// For many years we both faithfully served Beliar. And then... then this deceitful little god just betrayed us.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Die_Ans_03_15_05 " );	// Beliar betrayed you? It looks like him.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_03_15_06 " );	// After our large army devastated the sacred lands of Adanos, my brother and I, instead of the reward he promised, received from him only eternal exile and oblivion.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_03_15_07 " );	// And all because Adanos, in his desire to take revenge on Beliar, set out to destroy one of his chosen ones.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_03_15_08 " );	// The dark god decided that my brother and I were no longer of any value to him and simply gave us into the hands of Adanos.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_03_15_09 " );	// He, in turn, imprisoned my brother in this temple, and took my soul from me and doomed me to eternal suffering here.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Die_Ans_03_15_10 " );	// I didn't expect anything else from him. True, I do not quite understand how you could get to the plateau of the Ancients.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Die_Ans_03_15_11 " );	// Yes, and bring along a huge army of vile creatures.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_03_15_12 " );	// This was pretty simple. The greed and stupidity of the Architects themselves helped us in this.
	B_LogEntry(TOPIC_Miss_Brother, " Ile'Sil was not who he claimed to be. He and his brother once served Beliar, and it was on his orders that they destroyed the people of the Builders on the plateau. After which Adanos imprisoned them forever in this place. " );
};

instance DIA_NONE_1813_Ilesil_Die_Ans_04(C_Info)
{
	npc = Ilesil_Evil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Die_Ans_04_Condition;
	information = DIA_NONE_1813_Ilesil_Die_Ans_04_Info;
	permanent = FALSE;
	description = " Tell me about it. " ;
};

func int DIA_NONE_1813_Ilesil_Die_Ans_04_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_Die_Ans_03) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Die_Ans_04_Info()
{
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Die_Ans_04_15_01 " );	// Tell me about it.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_04_15_02 " );	// In his sacred land, Adanos once hid a very powerful artifact created by Beliar himself for his soul eater, the demon S'enyak.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Die_Ans_04_15_03 " );	// You mean Beliar's Claw?
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_04_15_04 " );	// Yes. He gave the sword to one of his chosen ones - Er'Hazir, so that he would guard it.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_04_15_05 " );	// After Er'Hazir's death, the sword was buried with him in one of the temples of Adanos in the valley.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_04_15_06 " );	// The architects found this temple and took the Claw for themselves, believing that it would grant them power and authority.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_04_15_07 " );	// But they couldn't even imagine what this weapon was capable of.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_04_15_08 " );	// The claw was not only a powerful sword capable of absorbing the souls of the dead, but also the key to the realm of Beliar himself!
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_04_15_09 " );	// Upon learning that the sword was in the hands of mere mortals, Beliar took advantage of this opportunity.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_04_15_10 " );	// He forced its owner to use the power of the sword and thereby open a magical portal through which we led our army.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_04_15_11 " );	// Having learned about such a treacherous betrayal, Adanos first cursed his beloved people, and then completely washed away their remnants from the face of the earth.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_04_15_12 " );	// And with the help of the Talon sealed the place where we are now.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_04_15_13 " );	// By the way, you should have the sword now. Otherwise you would never have made it here.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Die_Ans_04_15_14 " );	// That's right. I have a claw.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_04_15_15 " );	// It won't be long. When I take your soul and free my brother, I will put this weapon to better use.
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Die_Ans_04_15_16 " );	// Well, we'll see about that later.
};

instance DIA_NONE_1813_Ilesil_Die_Ans_05(C_Info)
{
	npc = Ilesil_Evil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Die_Ans_05_Condition;
	information = DIA_NONE_1813_Ilesil_Die_Ans_05_Info;
	permanent = FALSE;
	description = " I'll have to finish what Adanos started. " ;
};

func int DIA_NONE_1813_Ilesil_Die_Ans_05_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_Die_Ans_03) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Die_Ans_05_Info()
{
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Die_Ans_05_15_01 " );	// I'll have to finish what Adanos started.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_05_15_02 " );	// Do you hope to defeat me, fool? How unwise of you.
	AI_Output(self,other, " DIA_NONE_1813_Ilesil_Die_Ans_05_15_03 " );	// Even now, after so many years of captivity, I can crush you with a single blow!
	AI_Output(other,self, " DIA_NONE_1813_Ilesil_Die_Ans_05_15_04 " );	// Well, try it.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_05_15_05");	//(...яростно вопит)
	AI_StopProcessInfos(self);
	self.flags = 0;
	self.aivar[AIV_EnemyOverride] = FALSE ;
	IlesilCanFight = TRUE;
};
