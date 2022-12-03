

instance DIA_Addon_Patrick_EXIT(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 999;
	condition = DIA_Addon_Patrick_EXIT_Condition;
	information = DIA_Addon_Patrick_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Patrick_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Patrick_Hi(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_Hi_Condition;
	information = DIA_Addon_Patrick_Hi_Info;
	permanent = FALSE;
	description = " I was sent by the waterbenders. I have come to free you. " ;
};


func int DIA_Addon_Patrick_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_Hi_Info()
{
	AI_Output(other,self, " DIA_Addon_Patrick_Hi_15_00 " );	// The waterbenders sent me. I have come to free you.
	AI_Output(self,other, " DIA_Addon_Patrick_Hi_07_01 " );	// True? Why should I trust you?
	AI_Output(other,self, " DIA_Addon_Patrick_Hi_15_02 " );	// Do you want to get out of here or not?
	AI_Output(self,other, " DIA_Addon_Patrick_Hi_07_03 " );	// Of course I want to, but...
	AI_Output(other,self, " DIA_Addon_Patrick_Hi_15_04 " );	// Vatras sent me. If that doesn't convince you, you can stay in this hole to rot.
	AI_Output(self,other, " DIA_Addon_Patrick_Hi_07_05 " );	// Okay, okay, I believe you.
	AI_Output(other,self, " DIA_Addon_Patrick_Hi_15_06 " );	// Really? Wow, it happened faster than I thought. Okay, now we need a plan.
	AI_Output(self,other, " DIA_Addon_Patrick_Hi_07_07 " );	// Trying to escape would be too risky. William has already tried. Now he's dead...
	AI_Output(self,other, " DIA_Addon_Patrick_Hi_07_08 " );	// The captives are mostly peasants. They trust me, but they will not dare to escape.
	Info_ClearChoices(DIA_Addon_Patrick_Hi);
	Info_AddChoice(DIA_Addon_Patrick_Hi, " How do you imagine? Should I convince Raven to release you? " ,DIA_Addon_Patrick_Hi_Raven);
	Info_AddChoice(DIA_Addon_Patrick_Hi, " Do I need to kill every last bandit? " ,DIA_Addon_Patrick_Hi_Kill);
};

func void B_Say_Patrick_Plan()
{
	AI_Output(self,other, " DIA_Addon_Patrick_Plan_07_00 " );	// So we have only one way out.
	AI_Output(self,other, " DIA_Addon_Patrick_Plan_07_01 " );	// You have to make sure the guards let us through. Then we'll leave.
	AI_Output(other,self, " DIA_Addon_Patrick_Plan_15_02 " );	// Okay, I'll take care of it. Tell the others to get ready.
	B_LogEntry(TOPIC_Addon_Sklaven, "The slaves will not dare to escape. I must find a peaceful way to get them out of the camp. " );
};

func void DIA_Addon_Patrick_Hi_Raven()
{
	AI_Output(other,self, " DIA_Addon_Patrick_Hi_Raven_15_00 " );	// How do you imagine it? Should I convince Raven to release you?
	AI_Output(self,other, " DIA_Addon_Patrick_Hi_Raven_07_01 " );	// (chuckles) Not a bad idea.
	B_Say_Patrick_Plan();
	Info_ClearChoices(DIA_Addon_Patrick_Hi);
};

func void DIA_Addon_Patrick_Hi_Kill()
{
	AI_Output(other,self, " DIA_Addon_Patrick_Hi_Kill_15_00 " );	// Do I need to kill every single bandit?
	AI_Output(self,other, " DIA_Addon_Patrick_Hi_Kill_07_01 " );	// (frightened) That would be crazy!
	B_Say_Patrick_Plan();
	Info_ClearChoices(DIA_Addon_Patrick_Hi);
};


instance DIA_Addon_Patrick_ready(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_ready_Condition;
	information = DIA_Addon_Patrick_ready_Info;
	permanent = FALSE;
	description = " It's all right. You can go. " ;
};


func int DIA_Addon_Patrick_ready_Condition()
{
	if (((Ready_Togo ==  TRUE ) && Npc_KnowsInfo(other,DIA_Addon_Patrick_Hi)) || (Npc_IsDead(PrisonGuard) && Npc_IsDead ( Bloodwyn) && Npc_KnowsInfo (other,DIA_Addon_Thorus_Answered) ) || Npc_IsDead(PrisonGuard)))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Patrick_ready_Info()
{
	AI_Output(other,self, " DIA_Addon_Patrick_ready_15_00 " );	// All is well. You may go.
	AI_Output(self,other, " DIA_Addon_Patrick_ready_07_01 " );	// Great! I know a cave in the swamp where we can hide. But what should we do next?
	AI_Output(other,self, " DIA_Addon_Patrick_ready_15_02 " );	// Go southwest. After leaving the swamp, you will find the ruins of an ancient temple. The waterbenders set up camp there.
	AI_Output(other,self, " DIA_Addon_Patrick_ready_15_03 " );	// They'll tell you how to get out of this valley.
	AI_Output(self,other, " DIA_Addon_Patrick_ready_07_04 " );	// Thank you, thank you very much. We are all indebted to you...
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_05");	//Не за что.
	slave_escape = TRUE ;
	B_GivePlayerXP(XP_Addon_Escape);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLUCHT");
	B_StartOtherRoutine(Telbor, " ESCAPE " );
	B_StartOtherRoutine(Tonak,"FLUCHT");
	B_StartOtherRoutine(Pardos,"FLUCHT");
	B_StartOtherRoutine(Monty,"FLUCHT");
	B_StartOtherRoutine(Buddler_1,"WORK");
	B_StartOtherRoutine(Buddler_2,"WORK");
	B_StartOtherRoutine(Buddler_3,"WORK");
};


instance DIA_Addon_Patrick_Killer(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_Killer_Condition;
	information = DIA_Addon_Patrick_Killer_Info;
	permanent = FALSE;
	description = " I've dealt with the guard. You may go. " ;
};


func int DIA_Addon_Patrick_Killer_Condition()
{
	if ( Npc_IsDead ( PrisonGuard ) && ( Ready_Togo ==  FALSE ) && Npc_KnowsInfo ( other , DIA_Addon_Patrick_Hi ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Patrick_Killer_Info()
{
	AI_Output(other,self, " DIA_Addon_Patrick_Killer_15_00 " );	// I dealt with the guard. You may go.
	AI_Output(self,other, " DIA_Addon_Patrick_Killer_07_01 " );	// And what will happen to us when we leave the mine? The remaining guards will kill us. No, it's too risky.
};


instance DIA_Addon_Patrick_Hoehle(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_Hoehle_Condition;
	information = DIA_Addon_Patrick_Hoehle_Info;
	permanent = TRUE;
	description = " Do you want to leave here? " ;
};


func int DIA_Addon_Patrick_Hoehle_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_BL_HOEHLE_04") <= 1000)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Patrick_Hoehle_Info()
{
	AI_Output(other,self, " DIA_Addon_Patrick_Hoehle_15_00 " );	// You don't want to leave here?
	AI_Output(self,other, " DIA_Addon_Patrick_Hoehle_07_01 " );	// Of course we do. But we are waiting for the right moment.
};

