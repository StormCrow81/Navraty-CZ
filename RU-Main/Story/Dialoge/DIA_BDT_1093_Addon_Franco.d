
instance DIA_Addon_Franco_EXIT(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 999;
	condition = DIA_Addon_Franco_EXIT_Condition;
	information = DIA_Addon_Franco_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Franco_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Franco_EXIT_Info()
{
	if ((Franco_Exit ==  FALSE ) && (MY_HelpLogan == LOG_Running))
	{
		AI_Output(self,other, " DIA_Addon_Franco_EXIT_08_00 " );	// Don't get lost, or you'll feed the swamps.
		Franco_Exit = TRUE;
	};
	AI_StopProcessInfos(self);
};

instance DIA_Franco_PICKPOCKET(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 900;
	condition = DIA_Franco_PICKPOCKET_Condition;
	information = DIA_Franco_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his amulet) " ;
};

func int DIA_Franco_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItAm_Addon_Franco) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Franco_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Franco_PICKPOCKET);
	Info_AddChoice(DIA_Franco_PICKPOCKET,Dialog_Back,DIA_Franco_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Franco_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Franco_PICKPOCKET_DoIt);
};

func void DIA_Franco_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		B_GiveInvItems(self,other,ItAm_Addon_Franco,1);
		B_GivePlayerXP(XP_Ambient);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		Info_ClearChoices(DIA_Franco_PICKPOCKET);
	}
	else
	{
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Franco_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Franco_PICKPOCKET);
};


instance DIA_Addon_Franco_HI(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 1;
	condition = DIA_Addon_Franco_HI_Condition;
	information = DIA_Addon_Franco_HI_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Franco_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Franco_HI_Info()
{
	Log_CreateTopic(Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Franco,LOG_Running);
	B_LogEntry(Topic_Addon_Franco, " If I complete Franco's tasks, he will let me into the camp. " );
	AI_Output(self,other, " DIA_Addon_Franco_HI_08_00 " );	// Hey, what are you doing here? Do you want to go to camp?
	AI_Output(other,self,"DIA_Addon_Franco_HI_15_01");	//Ah, I...
	AI_Output(self,other, " DIA_Addon_Franco_HI_08_02 " );	// I don't care who you are. My name is Franco. I am in command here.
	AI_Output(self,other, " DIA_Addon_Franco_HI_08_03 " );	// If you do a good job, I'll send you to camp.
	if(Ramon_News == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Franco_HI_08_04 " );	// Guard Ramon can tell you if the camp needs new people. Talk to him.
		B_LogEntry(Topic_Addon_Franco, " I should ask Ramon if we need more people at the camp. " );
	};
};


instance DIA_Addon_Franco_Hai (C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 2;
	condition = DIA_Addon_Franco_Hai_Condition;
	information = DIA_Addon_Franco_Hai_Info;
	permanent = FALSE;
	description = " Thorus needs a new man. " ;
};


func int DIA_Addon_Franco_Hai_Condition()
{
	if(Ramon_News == TRUE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Franco_Hai_Info()
{
	AI_Output(other,self, " DIA_Addon_Franco_Hai_15_00 " );	// Thorus needs a new man.
	AI_Output(self,other, " DIA_Addon_Franco_Hai_08_01 " );	// Okay, I'll take care of it.
	AI_Output(other,self, " DIA_Addon_Franco_Hai_15_02 " );	// Wait a minute, what about me?
	AI_Output(self,other, " DIA_Addon_Franco_Hai_08_03 " );	// You haven't done anything yet.
	AI_Output(other,self, " DIA_Addon_Franco_Hai_15_04 " );	// I've done quite a lot, but you don't know about it.
	AI_Output(self,other, " DIA_Addon_Franco_Hai_08_05 " );	// Okay. Do you need a chance? You will receive it. Get your ass to Logan. He was injured by swamp sharks.
	AI_Output(self,other, " DIA_Addon_Franco_Hai_08_06 " );	// Help him deal with the monsters and consider yourself accepted.
	B_LogEntry(Topic_Addon_Franco, " Franco wants me to help Logan. " );
};


instance DIA_Addon_Franco_Wo(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 3;
	condition = DIA_Addon_Franco_Wo_Condition;
	information = DIA_Addon_Franco_Wo_Info;
	permanent = FALSE;
	description = " Where can I find Logan? " ;
};


func int DIA_Addon_Franco_Wo_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Franco_Hai ) &&  ! Npc_IsDead ( Logan ) && ( MIS_HelpLogan ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Franco_Wo_Info()
{
	AI_Output(other,self, " DIA_Addon_Franco_Wo_15_00 " );	// Where can I find Logan?
	AI_Output(self,other, " DIA_Addon_Franco_Wo_08_01 " );	// If you are facing the entrance to the camp, then you should go to the left, along the cliff. To meet with Logan, go a little deeper into the swamp.
	AI_StopProcessInfos(self);
};


instances of DIA_Addon_Franco_tot (C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 5;
	condition = DIA_Addon_Franco_tot_Condition;
	information = DIA_Addon_Franco_tot_Info;
	permanent = FALSE;
	description = " Logan is dead. " ;
};


func int DIA_Addon_Franco_tot_Condition()
{
	if ((MIS_HelpLogan !=  LOG_SUCCESS ) && Npc_IsDead(Logan) && Npc_KnowsInfo(other,DIA_Addon_Franco_Hai))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Franco_tot_Info()
{
	AI_Output(other,self, " DIA_Addon_Franco_tot_15_00 " );	// Logan is dead.
	AI_Output(self,other, " DIA_Addon_Franco_tot_08_01 " );	// Damn! He was our best hunter. Beliar's balls!
	AI_Output(self,other, " DIA_Addon_Franco_tot_08_02 " );	// Okay. But I have already sent a replacement to the camp.
	if(MIS_HlpLogan == LOG_Running)
	{
		MIS_HlpLogan = LOG_OBSOLETE;
	};
};


instance DIA_Addon_Franco_HaiSuccess(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 6;
	condition = DIA_Addon_Franco_HaiSuccess_Condition;
	information = DIA_Addon_Franco_HaiSuccess_Info;
	permanent = FALSE;
	description = " I helped Logan. " ;
};


func int DIA_Addon_Franco_HaiSuccess_Condition()
{
	if ((MIS_HelpLogan ==  LOG_SUCCESS ) && Npc_KnowsInfo(other,DIA_Addon_Franco_Hai))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Franco_HaiSuccess_Info()
{
	AI_Output(other,self, " DIA_Addon_Franco_HaiSuccess_15_00 " );	// I helped Logan.
	if (Npc_IsDead(Login))
	{
		AI_Output(other,self, " DIA_Addon_Franco_HaiSuccess_15_01 " );	// But he didn't survive.
	};
	AI_Output(self,other, " DIA_Addon_Franco_HaiSuccess_08_02 " );	// So, you've defeated the swamp creatures. Therefore, you are useful ... at least more useful than most of the local bums.
	B_GivePlayerXP(XP_Addon_HlpLogan);
	B_LogEntry(Topic_Addon_Franco, " Helping Logan alone wasn't enough to get him to the camp. " );
};


instance DIA_Addon_Franco_Mis2(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 7;
	condition = DIA_Addon_Franco_Mis2_Condition;
	information = DIA_Addon_Franco_Mis2_Info;
	permanent = FALSE;
	description = " Can I go to the camp now? " ;
};


func int DIA_Addon_Franco_Mis2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_HaiSuccess) || Npc_KnowsInfo(other,DIA_Addon_Franco_tot))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Franco_Mis2_Info()
{
	AI_Output(other,self, " DIA_Addon_Franco_MIS2_15_00 " );	// Can I get to the camp now?
	AI_Output(self,other, " DIA_Addon_Franco_MIS2_08_01 " );	// Look, I need you to do one more errand for me.
	AI_Output(self,other, " DIA_Addon_Franco_MIS2_08_02 " );	// A few days ago I sent Edgor to the swamp.
	AI_Output(self,other, " DIA_Addon_Franco_MIS2_08_03 " );	// He was supposed to get me an ancient stone tablet. But no one has seen him since.
	AI_Output(self,other, " DIA_Addon_Franco_MIS2_08_04 " );	// Find out what he's doing and bring me the damn stone!
	MIS_HlpEdgor = LOG_Running;
	Log_CreateTopic(Topic_Addon_Stoneplate,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Stoneplate,LOG_Running);
	B_LogEntry(Topic_Addon_Stoneplate, " Franco needs the stone tablet that Edgor was supposed to bring him. Now its my problem. " );
	B_LogEntry(Topic_Addon_Franco, " Franco wants me to help Edgor. " );
};


instance DIA_Addon_Franco_While(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 8;
	condition = DIA_Addon_Franco_While_Condition;
	information = DIA_Addon_Franco_While_Info;
	permanent = FALSE;
	description = " What about gold? " ;
};


func int DIA_Addon_Franco_While_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_HaiSuccess))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Franco_While_Info()
{
	AI_Output(other,self, " DIA_Addon_Franco_While_15_00 " );	// What about gold?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_01");	//What?
	AI_Output(other,self, " DIA_Addon_Franco_While_15_02 " );	// What will I get for my work in the swamp?
	AI_Output(self,other, " DIA_Addon_Franco_While_08_03 " );	// Oh, you need gold? Well, of course! How much do you want? Fifty nuggets? One hundred? I'll give you as much as you can carry...
	AI_Output(self,other, " DIA_Addon_Franco_While_08_04 " );	// Who the fuck do you think you are?! Are you trying to make a fool out of me?!
	AI_Output(self,other, " DIA_Addon_Franco_While_08_05 " );	// Move your ass and do as you're told! Otherwise gold will be the least of your problems!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Franco_WOEDGOR(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 9;
	condition = DIA_Addon_Franco_WOEDGOR_Condition;
	information = DIA_Addon_Franco_WOEDGOR_Info;
	permanent = TRUE;
	description = " Where can I find this Edgor? " ;
};


func int DIA_Addon_Franco_WOEDGOR_Condition()
{
	if((MIS_HlpEdgor == LOG_Running) && (Npc_HasItems(other,ItMi_Addon_Stone_04) < 1))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Franco_WOEDGOR_Info()
{
	AI_Output(other,self, " DIA_Addon_Franco_WOEDGOR_15_00 " );	// (sigh) And where can I find this Edgor?
	AI_Output(self,other, " DIA_Addon_Franco_WOEDGOR_08_01 " );	// Do you want the easy way or the fast way?
	Info_ClearChoices(DIA_Addon_Franco_WOEDGOR);
	Info_AddChoice(DIA_Addon_Franco_WOEDGOR, " I'm taking the fast route. " ,DIA_Addon_Franco_WOEDGOR_Fast);
	Info_AddChoice(DIA_Addon_Franco_WOEDGOR, " Tell me the easy way. " ,DIA_Addon_Franco_WOEDGOR_Easy);
};

func void B_Addon_Franco_There()
{
	AI_Output(self,other, " DIA_Addon_Franco_There_08_00 " );	// There are ruins everywhere. He must be in there somewhere.
	AI_Output(self,other, " DIA_Addon_Franco_There_08_01 " );	// I think he was smart enough to make a fire. I assume you know what fire is?
};

func void DIA_Addon_Franco_WOEDGOR_Easy()
{
	AI_Output(other,self, " DIA_Addon_Franco_WOEDGOR_Easy_15_00 " );	// Tell me the easy way.
	AI_Output(self,other, " DIA_Addon_Franco_WOEDGOR_Easy_08_01 " );	// Follow the path leading to the main gate. There you will meet Sancho.
	AI_Output(self,other, " DIA_Addon_Franco_WOEDGOR_Easy_08_02 " );	// From there, go left along the wooden path.
	B_Addon_Franco_There();
	Info_ClearChoices(DIA_Addon_Franco_WOEDGOR);
};

func void DIA_Addon_Franco_WOEDGOR_Fast()
{
	AI_Output(other,self, " DIA_Addon_Franco_WOEDGOR_Fast_15_00 " );	// I'm taking the fast path.
	AI_Output(self,other, " DIA_Addon_Franco_WOEDGOR_Fast_08_01 " );	// Good. Walk diagonally to the left from here. Head deep into the swamp, bypassing the wooden path.
	B_Addon_Franco_There();
	Info_ClearChoices(DIA_Addon_Franco_WOEDGOR);
};


instance DIA_Addon_Franco_tafel (C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 10;
	condition = DIA_Addon_Franco_tafel_Condition;
	information = DIA_Addon_Franco_tafel_Info;
	permanent = FALSE;
	description = " Here is your stone tablet. " ;
};


func int DIA_Addon_Franco_tafel_Condition()
{
	if ((Npc_HasItems(other,ItMy_Addon_Stone_04) >=  1 ) && (MY_HelpEdgor == LOG_Running))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Franco_tafel_Info()
{
	AI_Output(other,self, " DIA_Addon_Franco_tafel_15_00 " );	// Here's your stone tablet.
	B_GiveInvItems(other,self,ItMi_Addon_Stone_04,1);
	AI_Output(self,other, " DIA_Addon_Franco_tafel_08_01 " );	// Very good. Raven will be pleased.
	MIS_HlpEdgor = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_HlpEdgor);
	B_LogEntry(Topic_Addon_Franco, " I brought Franco his stone tablet. " );
};


instance DIA_Addon_Franco_SomeoneAnderen (C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 11;
	condition = DIA_Addon_Franco_SomeoneAnderen_Condition;
	information = DIA_Addon_Franco_SomeoneAnderen_Info;
	permanent = FALSE;
	description = " Well, now I finally get to the camp? " ;
};


func int DIA_Addon_Franco_SomeoneAnderen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_tafel))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Franco_SomeoneAnderen_Info()
{
	AI_Output(other,self, " DIA_Addon_Franco_JemandAnderen_15_00 " );	// Well, now I finally get to enter the camp?
	if ( ! Npc_IsDead(Login))
	{
		AI_Output(self,other, " DIA_Addon_Franco_JemandAnderen_08_01 " );	// No, I already sent Logan there. He was ahead of you on the list.
		Logan_Inside = TRUE;
		AI_Teleport(Logan,"BL_INN_CORNER_02");
		B_StartOtherRoutine(Logan,"LAGER");
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Franco_JemandAnderen_08_02 " );	// No, I already sent another person to the camp.
	};
	AI_Output(self,other, " DIA_Addon_Franco_JemandAnderen_08_03 " );	// And no more people are needed in the camp.
	AI_Output(self,other, " DIA_Addon_Franco_JemandAnderen_08_04 " );	// Now that Logan is no longer here, I can use you instead.
	B_LogEntry(Topic_Addon_Franco, " Franco won't let me into the camp. I think I'll have to deal with him... " );
};


instance DIA_Addon_Franco_Fight(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 12;
	condition = DIA_Addon_Franco_Fight_Condition;
	information = DIA_Addon_Franco_Fight_Info;
	permanent = TRUE;
	description = " Let me into the camp immediately! " ;
};


func int DIA_Addon_Franco_Fight_Condition()
{
	return TRUE;
};

func void DIA_Addon_Franco_Fight_Info()
{
	AI_Output(other,self, " DIA_Addon_Franco_Fight_15_00 " );	// Let me into the camp immediately!
	AI_Output(self,other, " DIA_Addon_Franco_Fight_08_01 " );	// What if I refuse?
	Info_ClearChoices(DIA_Addon_Franco_Fight);
	Info_AddChoice(DIA_Addon_Franco_Fight,"Hey, no problem. Just joking...",DIA_Addon_Franco_Fight_Nothing);
	Info_AddChoice(DIA_Addon_Franco_Fight, " Then you'll regret it. " ,DIA_Addon_Franco_Fight_Duel);
};

func void DIA_Addon_Franco_Fight_Duel()
{
	AI_Output(other,self, " DIA_Addon_Franco_Fight_Duel_15_00 " );	// Then you'll regret it.
	AI_Output(self,other, " DIA_Addon_Franco_Fight_Duel_08_01 " );	// Are you threatening me? Are you threatening me? I'll have to teach you a lesson...
	Info_ClearChoices(DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Addon_Franco_Fight_Nothing()
{
	AI_Output(other,self, " DIA_Addon_Franco_Fight_Nothing_15_00 " );	// Hey, no problem. Just joking...
	AI_Output(self,other, " DIA_Addon_Franco_Fight_Nothing_08_01 " );	// That's right.
	Info_ClearChoices(DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Franco_Pig(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 13;
	condition = DIA_Addon_Franco_Pig_Condition;
	information = DIA_Addon_Franco_Pig_Info;
	permanent = TRUE;
	description = " Pig! I'll kill you! " ;
};


func int DIA_Addon_Franco_Pig_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Addon_Franco_SomeoneAnderen))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Franco_Pig_Info()
{
	AI_Output(other,self, " DIA_Addon_Franco_Pig_15_00 " );	// I guess I'll just have to deal with you.
	AI_Output(self,other, " DIA_Addon_Franco_Pig_08_01 " );	// Oh, you pathetic bastard! You dare to threaten me? You'll get it now!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};
