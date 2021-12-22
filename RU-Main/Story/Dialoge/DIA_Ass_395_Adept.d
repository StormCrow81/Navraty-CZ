const string Ass_395_CHECKPOINT = "PW_OSAIR_MEET_GUARD_05";

instance DIA_Ass_395_Adept_EXIT(C_Info)
{
	npc = Ass_395_Adept;
	No. = 999 ;
	condition = dia_Ass_395_Adept_exit_condition;
	information = dia_Ass_395_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_Ass_395_Adept_exit_condition()
{
	return TRUE;
};

func void dia_Ass_395_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_395_Adept_FIRSTWARN(C_Info)
{
	npc = Ass_395_Adept;
	no. = 1 ;
	condition = dia_Ass_395_Adept_firstwarn_condition;
	information = dia_Ass_395_Adept_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_395_Adept_firstwarn_condition()
{
	if(KnowPlaceMeeting == FALSE)
	{
		return TRUE;
	};
};

func void dia_Ass_395_Adept_firstwarn_info()
{
	AI_Output (self, other, " DIA_Ass_395_Adept_FirstWarn_01_00 " );	// Stop, brother! You can't go further.
	AI_Output(other,self,"DIA_Ass_395_Adept_FirstWarn_01_01");	//Why not?
	AI_Output (self, other, " DIA_Ass_395_Adept_FirstWarn_01_02 " );	// Order of Prior Osair - we're to let no one into the cave.
	AI_Output (self, other, " DIA_Ass_395_Adept_FirstWarn_01_03 " );	// So don't even try to get in, for your own sake.

	if(MIS_HaniarSecret == LOG_Running)
	{
		B_LogEntry (TOPIC_HaniarSecret, " Osair's men blocked the entrance to the foothill cave. It must have been for a reason. I need to tell Gonzalez about this. " );
	};

	KnowPlaceMeeting = TRUE;
	AI_StopProcessInfos(self);
};
