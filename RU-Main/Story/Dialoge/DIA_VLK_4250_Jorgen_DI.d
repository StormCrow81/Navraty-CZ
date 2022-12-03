

instance DIA_Jorgen_DI_KAP3_EXIT (C_Info)
{
	npc = VLK_4250_Jorgen_DI;
	nr = 999;
	condition = DIA_Jorgen_DI_KAP3_EXIT_Condition;
	information = DIA_Jorgen_DI_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jorgen_DI_KAP3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jorgen_DI_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jorgen_DI_Hello (C_Info)
{
	npc = VLK_4250_Jorgen_DI;
	nr = 4;
	condition = DIA_Jorgen_DI_Hallo_Condition;
	information = DIA_Jorgen_DI_Hello_Info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};


func int DIA_Jorgen_DI_Hello_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_DI_Hello_Info()
{
	AI_Output(other,self, " DIA_Jorgen_DI_Hallo_15_00 " );	// Is everything okay?
	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other, " DIA_Jorgen_DI_Hallo_07_01 " );	// Of course - as long as these monsters don't get close to us...
	}
	else
	{
		AI_Output(self,other, " DIA_Jorgen_DI_Hallo_07_02 " );	// We won't survive the next ork attack. So hurry up - you need to get out of here.
		B_StartOtherRoutine(Jorgen_DI,"Start");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Jorgen_DI_UndeadDragonDead(C_Info)
{
	npc = VLK_4250_Jorgen_DI;
	nr = 4;
	condition = DIA_Jorgen_DI_UndeadDragonDead_Condition;
	information = DIA_Jorgen_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "The enemy is finished. " ;
};


func int DIA_Jorgen_DI_UndeadDragonDead_Condition()
{
	if((UndeadDragonIsDead == TRUE) && (DAGOTTELLALL == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self, " DIA_Jorgen_DI_UndeadDragonDead_15_00 " );	// The enemy is finished.
	AI_Output(self,other, " DIA_Jorgen_DI_UndeadDragonDead_07_01 " );	// That's good news! I hope we don't need anything else on this island?
	Info_ClearChoices(DIA_Jorgen_DI_UndeadDragonDead);
	Info_AddChoice(DIA_Jorgen_DI_UndeadDragonDead, " Wait a minute. " ,DIA_Jorgen_DI_UndeadDragonDead_moment);
	Info_AddChoice(DIA_Jorgen_DI_UndeadDragonDead, " That's it, we can go. " ,DIA_Jorgen_DI_UndeadDragonDead_over);
};

func void DIA_Jorgen_DI_UndeadDragonDead_moment()
{
	AI_Output(other,self, " DIA_Jorgen_DI_UndeadDragonDead_moment_15_00 " );	// Wait a minute. I forgot to do something.
	AI_Output(self,other, " DIA_Jorgen_DI_UndeadDragonDead_moment_07_01 " );	// Good. But hurry up.
	AI_StopProcessInfos(self);
};

func void DIA_Jorgen_DI_UndeadDragonDead_over()
{
	CAPITANORDERDIAWAY = TRUE;
	AI_Output(other,self, " DIA_Jorgen_DI_UndeadDragonDead_over_15_00 " );	// Yes, everything is fine! Let's move on.
	AI_Output(self,other, " DIA_Jorgen_DI_UndeadDragonDead_over_07_01 " );	// Great! Raise the sails - we set sail!
	AI_Output(self,other, " DIA_Jorgen_DI_UndeadDragonDead_over_07_02 " );	// And you go to sleep - a bed is prepared for you in the captain's cabin.
	AI_StopProcessInfos(self);
};

