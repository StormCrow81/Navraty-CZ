

instance DIA_Attila_EXIT(C_Info)
{
	npc = VLK_494_Attila;
	nr = 999;
	condition = DIA_Attila_EXIT_Condition;
	information = DIA_Attila_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Attila_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Attila_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Attila_PICKPOCKET(C_Info)
{
	npc = VLK_494_Attila;
	nr = 900;
	condition = DIA_Attila_PICKPOCKET_Condition;
	information = DIA_Attila_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Attila_PICKPOCKET_Condition()
{
	return  C_Robbery ( 55 , 100 );
};

func void DIA_Attila_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Attila_PICKPOCKET);
	Info_AddChoice(DIA_Attila_PICKPOCKET,Dialog_Back,DIA_Attila_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Attila_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Attila_PICKPOCKET_DoIt);
};

func void DIA_Attila_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Attila_PICKPOCKET);
};

func void DIA_Attila_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Attila_PICKPOCKET);
};


instance DIA_Attila_Hallo (C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_Hallo_Condition;
	information = DIA_Attila_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Attila_Hallo_Condition()
{
	if(MIS_ThiefGuild_sucked == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Attila_Hallo_Info()
{
	AI_Output(self,other, " DIA_Attila_Hallo_09_00 " );	// Ah, finally. I've been waiting for you, stranger.
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo, " What do you want from me? " ,DIA_Attila_Hallo_Was);
	Info_AddChoice(DIA_Attila_Hallo, " Who are you? " ,DIA_Attila_Hallo_Wer);
	B_GivePlayerXP(XP_Attila_MetHim);
};

func void DIA_Attila_Hello_Who()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Wer_15_00");	//Кто ты?
	AI_Output(self,other, " DIA_Attila_Hallo_Wer_09_01 " );	// My name is Attila, but does my name matter? Our names mean nothing.
	AI_Output(self,other, " DIA_Attila_Hallo_Wer_09_02 " );	// You should know this, outlander.
	Knows_Attila_Wer = TRUE;
	Info_ClearChoices(DIA_Attila_Hallo);
	if(Knows_Attila_Was == FALSE)
	{
		Info_AddChoice(DIA_Attila_Hallo, " What do you want from me? " ,DIA_Attila_Hallo_Was);
	};
	Info_AddChoice(DIA_Attila_Hallo, " What's all this farce for? " ,DIA_Attila_Hallo_Theater);
};

func void DIA_Attila_Hallo_Was()
{
	AI_Output(other,self, " DIA_Attila_Hallo_Was_15_00 " );	// What do you want from me?
	AI_Output(self,other, " DIA_Attila_Hallo_Was_09_01 " );	// I'm here to explain a few things to you. And besides that, I'm going to kill you.
	Knows_Attila_Was = TRUE;
	Info_ClearChoices(DIA_Attila_Hallo);
	if(Knows_Attila_Wer == FALSE)
	{
		Info_AddChoice(DIA_Attila_Hallo, " Who are you? " ,DIA_Attila_Hallo_Wer);
	};
	Info_AddChoice(DIA_Attila_Hallo, " Who pays you for this? " ,DIA_Attila_Hallo_Auftrag);
	Info_AddChoice(DIA_Attila_Hallo, " What's all this farce for? " ,DIA_Attila_Hallo_Theater);
};

func void DIA_Attila_Hallo_Theater()
{
	AI_Output(other,self, " DIA_Attila_Hallo_Theater_15_00 " );	// Why all this farce?
	AI_Output(self,other, " DIA_Attila_Hallo_Theater_09_01 " );	// You must not die in ignorance. Consider it a show of respect for the condemned.
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo, " I think I'll go. " ,DIA_Attila_Hallo_Ende);
	Info_AddChoice(DIA_Attila_Hallo, " Who pays you for this? " ,DIA_Attila_Hallo_Auftrag);
	Info_AddChoice(DIA_Attila_Hallo, " Why do you want to kill me? " ,DIA_Attila_Hallo_Warum);
};

func void DIA_Attila_Hello_End()
{
	AI_Output(other,self, " DIA_Attila_Hallo_Ende_15_00 " );	// I'll probably go...
	AI_Output(self,other, " DIA_Attila_Hallo_Ende_09_01 " );	// I'm afraid... I can't let you do that. Humble yourself. It's time to die.
	AI_DrawWeapon(self);
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo, " Who pays you for this? " ,DIA_Attila_Hallo_Auftrag);
	Info_AddChoice(DIA_Attila_Hallo, " Why do you want to kill me? " ,DIA_Attila_Hallo_Warum);
};

func void DIA_Attila_Hello_Order()
{
	AI_Output(other,self, " DIA_Attila_Hallo_Auftrag_15_00 " );	// Who pays you for this?
	AI_Output(self,other, " DIA_Attila_Hallo_Auftrag_09_01 " );	// My masters try to work in the shade, as do I.
	AI_Output(self,other, " DIA_Attila_Hallo_Auftrag_09_02 " );	// It's written in the terms of my contract that I have no right to divulge either their name or their residence.
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo, " Why do you want to kill me? " ,DIA_Attila_Hallo_Warum);
};

func void DIA_Attila_Hello_Why()
{
	AI_Output(other,self, " DIA_Attila_Hallo_Warum_15_00 " );	// Why do you want to kill me?
	if (Betrayal_Halvor ==  TRUE )
	{
		AI_Output(self,other, " DIA_Attila_Hallo_Warum_09_01 " );	// You betrayed Halvor! Now he is in jail. Will not work.
	};
	if(Rengaru_InKnast == TRUE)
	{
		AI_Output(self,other, " DIA_Attila_Hallo_Warum_09_02 " );	// You sold Rengar to the militia. He's just a petty thief, but you shouldn't have done that.
	};
	if (Nagur_Ausgeliefert ==  TRUE )
	{
		AI_Output(self,other, " DIA_Attila_Hallo_Warum_09_03 " );	// Nagur went to jail because of you. Some people think that this is an unforgivable mistake.
	};
	AI_Output(self,other, " DIA_Attila_Hallo_Warum_09_04 " );	// My masters are unhappy with this. To prevent you from making another mistake, they sent me.
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo, " I can give you gold. " ,DIA_Attila_Hallo_Gold);
	Info_AddChoice(DIA_Attila_Hallo, " At least let me draw my weapon. " ,DIA_Attila_Hallo_Attacke);
};

func void DIA_Attila_Hallo_Gold()
{
	AI_Output(other,self, " DIA_Attila_Hallo_Gold_15_00 " );	// I can give you gold - lots of gold.
	AI_Output(self,other, " DIA_Attila_Hallo_Gold_09_01 " );	// In vain! I didn't come here for this. The only price you will pay is your life. And you pay it right now.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Attila_Hello_Attack()
{
	AI_Output(other,self, " DIA_Attila_Hallo_Attacke_15_00 " );	// At least let me draw my weapon.
	if(Npc_HasEquippedWeapon(other) == TRUE)
	{
		AI_Output(self,other, " DIA_Attila_Hallo_Attacke_09_01 " );	// Okay, get ready for your final battle.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Attila_Hallo_Attacke_09_02 " );	// You don't have any weapons on your belt. You have very little time left, outlander. Death is near.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,2);
	};
};


instance DIA_Attila_Welcome (C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_Welcome_Condition;
	information = DIA_Attila_Welcome_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Attila_Welcome_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ThiefGuild_sucked == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Attila_Welcome_Info()
{
	AI_Output(self,other, " DIA_Attila_Willkommen_09_00 " );	// Ah, finally. I've been waiting for you, stranger.
	B_GivePlayerXP(XP_Attila_Friend);
	AI_Output(other,self, " DIA_Attila_Willkommen_15_01 " );	// Who are you and what do you want from me?
	AI_Output(self,other, " DIA_Attila_Willkommen_09_02 " );	// It doesn't matter. What matters is what you did. You remained loyal - even if you didn't know it yourself.
	AI_Output(self,other, " DIA_Attila_Willkommen_09_03 " );	// Some patrons have heard of your loyalty. And they give you a chance. So use it.
	AI_Output(other,self, " DIA_Attila_Willkommen_15_04 " );	// Hey, just tell me who they are.
	AI_Output(self,other, " DIA_Attila_Willkommen_09_05 " );	// I have a present for you. Everything else is in your hands, stranger.
	B_GiveInvItems(self,other,ItKe_ZhiefGuildKey_MIS,1);
	Attila_Key = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AFTER");
};

instance DIA_Attila_NachSchluessel (C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_NachSchluessel_Condition;
	information = DIA_Attila_NachSchluessel_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Attila_NachSchluessel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Attila_Wer) && (IS_LOVCACH == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Attila_NachSchluessel_Info()
{
	AI_Output(self,other, " DIA_Attila_NachSchluessel_09_00 " );	// My task is done - for now.
	AI_Output(self,other, " DIA_Attila_NachSchluessel_09_01 " );	// But who knows, maybe our paths will cross again...
	AI_StopProcessInfos(self);
};

instance DIA_Attila_Wer (C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_Wer_Condition;
	information = DIA_Attila_Who_Info;
	permanent = FALSE;
	description = " Who are you? " ;
};

func int DIA_Attila_Wer_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Attila_Willcome ) && ( IS_LOVCACH  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Attila_Wer_Info()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Wer_15_00");	//Кто ты?
	AI_Output(self,other, " DIA_Attila_Hallo_Wer_09_01 " );	// My name is Attila... but does my name matter? Our names mean nothing.
	AI_Output(self,other, " DIA_Attila_Hallo_Wer_09_02 " );	// You should know this, outlander.
	AI_StopProcessInfos(self);
};

instance DIA_Attila_Job (C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_Job_Condition;
	information = DIA_Attila_Job_Info;
	permanent = FALSE;
	description = " What are your duties in the guild? " ;
};

func int DIA_Attila_Job_Condition()
{
	if(IS_LOVCACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Attila_Job_Info()
{
	AI_Output(other,self, " DIA_Attila_Hallo_Job_15_00 " );	// And what are your duties in the guild?
	AI_Output(self,other, " DIA_Attila_Hallo_Job_09_01 " );	// Since you're one of us now, I'll probably tell you.
	AI_Output(self,other, " DIA_Attila_Hallo_Job_09_02 " );	// I am an intermediary between our people from above and Cassia. Almost everything goes through me.
	AI_Output(self,other, " DIA_Attila_Hallo_Job_09_03 " );	// I also deliver various kinds of messages.
};

instance DIA_Attila_CanTeach(C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_CanTeach_Condition;
	information = DIA_Attila_CanTeach_Info;
	permanent = FALSE;
	description = " What can you teach me? " ;
};

func int DIA_Attila_CanTeach_Condition()
{
	if(IS_LOVCACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Attila_CanTeach_Info()
{
	AI_Output(other,self, " DIA_Attila_Hallo_CanTeach_15_00 " );	// What can you teach me?
	AI_Output(self,other, " DIA_Attila_Hallo_CanTeach_09_01 " );	// If you want, I can show you how to use two-handed weapons better.
	AI_Output(self,other, " DIA_Attila_Hallo_CanTeach_09_02 " );	// Although thieves usually prefer swords or rapiers.
};

instance DIA_Attila_TEACH(C_Info)
{
	npc = VLK_494_Attila;
	nr = 10;
	condition = DIA_Attila_teach_condition;
	information = DIA_Attila_teach_info;
	permanent = TRUE;
	description = " I need a workout. " ;
};

func int DIA_Attila_teach_condition()
{
	if((Npc_KnowsInfo(other,DIA_Attila_CanTeach) == TRUE) && (IS_LOVCACH == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Attila_teach_info()
{
	AI_Output(other,self, " DIA_Attila_Teach_15_00 " );	// I need a workout.
	Info_ClearChoices(DIA_Attila_teach);
	Info_AddChoice(DIA_Attila_teach,Dialog_Back,DIA_Attila_teach_back);
	Info_AddChoice(DIA_Attila_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Attila_teach_2h_1);
	Info_AddChoice(DIA_Attila_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Attila_teach_2h_5);
};

func void DIA_Attila_teach_2h_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,60);
	Info_ClearChoices(DIA_Attila_teach);
	Info_AddChoice(DIA_Attila_teach,Dialog_Back,DIA_Attila_teach_back);
	Info_AddChoice(DIA_Attila_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Attila_teach_2h_1);
	Info_AddChoice(DIA_Attila_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Attila_teach_2h_5);
};

func void DIA_Attila_teach_2h_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,60);
	Info_ClearChoices(DIA_Attila_teach);
	Info_AddChoice(DIA_Attila_teach,Dialog_Back,DIA_Attila_teach_back);
	Info_AddChoice(DIA_Attila_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Attila_teach_2h_1);
	Info_AddChoice(DIA_Attila_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Attila_teach_2h_5);
};

func void DIA_Attila_teach_back()
{
	Info_ClearChoices(DIA_Attila_teach);
};
