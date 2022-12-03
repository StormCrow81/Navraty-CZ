

instance DIA_Jack_DI_EXIT(C_Info)
{
	npc = VLK_444_Jack_DI;
	nr = 999;
	condition = DIA_Jack_DI_EXIT_Condition;
	information = DIA_Jack_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jack_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_DI_GREET (C_Info)
{
	npc = VLK_444_Jack_DI;
	nr = 4;
	condition = DIA_Jack_DI_GREET_Condition;
	information = DIA_Jack_DI_GREET_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Jack_DI_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Jack_DI_GREET_OneTime;

func void DIA_Jack_DI_GREET_Info()
{
	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other, " DIA_Jack_DI_GREET_14_00 " );	// I hope you know what you're doing, mate.
		AI_Output(other, self, " DIA_Jack_DI_GREET_15_01 " );	// This won't take long.
		AI_Output(self,other, " DIA_Jack_DI_GREET_14_02 " );	// Be careful, and come back safe and sound.
		AI_StopProcessInfos(self);
	}
	else
	{
		if(DIA_Jack_DI_GREET_OneTime == FALSE)
		{
			AI_Output(other,self, " DIA_Jack_DI_GREET_15_03 " );	// What are you doing here?
			B_GivePlayerXP(XP_Ambient);
			DIA_Jack_DI_GREET_OneTime = TRUE;
		};
		AI_Output(self,other, " DIA_Jack_DI_GREET_14_04 " );	// If this hell falls on us again, I'll get the ship out of here. With you or without you! You heard?
		AI_Output(other,self, " DIA_Jack_DI_GREET_15_05 " );	// Don't talk nonsense. I can handle everything.
		AI_Output(self,other, " DIA_Jack_DI_GREET_14_06 " );	// Then hurry up.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	};
};

instance DIA_Jack_DI_UndeadDragonDead(C_Info)
{
	npc = VLK_444_Jack_DI;
	nr = 4;
	condition = DIA_Jack_DI_UndeadDragonDead_Condition;
	information = DIA_Jack_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = " I did it. I destroyed the enemy! " ;
};

func int DIA_Jack_DI_UndeadDragonDead_Condition()
{
	if((UndeadDragonIsDead == TRUE) && (DAGOTTELLALL == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self, " DIA_Jack_DI_UndeadDragonDead_15_00 " );	// I did it. I destroyed the enemy!
	AI_Output(self,other, " DIA_Jack_DI_UndeadDragonDead_14_01 " );	// I hoped everything would end well. But I have to admit, I haven't been so sure the last few hours.
	AI_Output(self,other, " DIA_Jack_DI_UndeadDragonDead_14_02 " );	// Can we finally set sail?
	Info_ClearChoices(DIA_Jack_DI_UndeadDragonDead);
	Info_AddChoice(DIA_Jack_DI_UndeadDragonDead, " Wait a moment " ,DIA_Jack_DI_UndeadDragonDead_moment);
	Info_AddChoice(DIA_Jack_DI_UndeadDragonDead, " Yes. Let's finish this. " ,DIA_Jack_DI_UndeadDragonDead_over);
};

func void DIA_Jack_DI_UndeadDragonDead_moment()
{
	AI_Output(other,self, " DIA_Jack_DI_UndeadDragonDead_moment_15_00 " );	// Wait a moment. There is one more thing I must do.
	AI_Output(self,other, " DIA_Jack_DI_UndeadDragonDead_moment_14_01 " );	// Then hurry up. I don't want to catch scurvy here.
	AI_StopProcessInfos(self);
};

func void DIA_Jack_DI_UndeadDragonDead_over()
{
	CAPITANORDERDIAWAY = TRUE;
	AI_Output(other,self, " DIA_Jack_DI_UndeadDragonDead_over_15_00 " );	// Yes! Let's sail away.
	AI_Output(self,other, " DIA_Jack_DI_UndeadDragonDead_over_14_01 " );	// If you're sure you've got everything, then go to the captain's quarters and sleep there. You will need it.
	AI_StopProcessInfos(self);
};
