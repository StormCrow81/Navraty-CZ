

instance DIA_Orc_8568_NagDumgar_EXIT(C_Info)
{
	npc = Orc_8568_NagDumgar;
	condition = DIA_Orc_8568_NagDumgar_exit_condition;
	information = DIA_Orc_8568_Dumgar_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8568_NagDumgar_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8568_NagDumgar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8568_NagDumgar_Hello(C_Info)
{
	npc = Orc_8568_NagDumgar;
	condition = DIA_Orc_8568_NagDumgar_Hello_condition;
	information = DIA_Orc_8568_Dumgar_Hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8568_NagDumgar_Hello_condition()
{
	if ((MIS_Done == LOG_Running) && (DoneInsertDone ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Orc_8568_NagDumgar_Hello_info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other, " DIA_Orc_8568_NagDumgar_Hello_Info_18_01 " );	// Another stupid critter to come here to find his death here!
	AI_Output(self,other, " DIA_Orc_8568_NagDumgar_Hello_Info_18_02 " );	// Then consider that you have already found it, miserable person. For she be in front of you!
	AI_Output(other,self, " DIA_Orc_8568_NagDumgar_Hello_Info_18_03 " );	// Hmmm. So you are that terrible Nag-Dumgar?
	AI_Output(self,other, " DIA_Orc_8568_NagDumgar_Hello_Info_18_04 " );	// (fiercely) To be the one.
	AI_Output(other,self, " DIA_Orc_8568_NagDumgar_Hello_Info_18_05 " );	// Well, it's good that I didn't have to look for you for a long time.
	AI_Output(other,self, " DIA_Orc_8568_NagDumgar_Hello_Info_18_06 " );	// Although I met demons and more terrible than you - the same Sleeper.
	AI_Output(self,other, " DIA_Orc_8568_NagDumgar_Hello_Info_18_07 " );	// WHAT?! How dare you mention my master's name, you wretch!
	AI_Output(other,self, " DIA_Orc_8568_NagDumgar_Hello_Info_18_08 " );	// Your master, through my efforts, has long gone to where he belongs. And soon you too will follow him!
	AI_Output(self,other, " DIA_Orc_8568_NagDumgar_Hello_Info_18_10 " );	//Arghhh...(violently ) I WILL DESTROY YOU, POOR WORM!
	B_LogEntry(TOPIC_NagDumgar, " I've found Nag-Dumgar. All that's left to do is gut him and you can return to Ur-Thrall. " );
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE ;
};
