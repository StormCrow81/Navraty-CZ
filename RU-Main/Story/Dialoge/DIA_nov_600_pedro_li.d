

instance DIA_PEDRO_LI_EXIT (C_Info)
{
	npc = nov_600_pedro_li;
	nr = 999;
	condition = dia_pedro_li_exit_condition;
	information = dia_pedro_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pedro_li_exit_condition()
{
	return TRUE;
};

func void day_pedro_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PEDRO_LI_MISSMYGOLD (C_Info)
{
	npc = nov_600_pedro_li;
	nr = 2;
	condition = dia_pedro_li_missmygold_condition;
	information = dia_pedro_li_missmygold_info;
	permanent = FALSE;
	description = " It probably doesn't make sense to ask you... " ;
};


func int dia_pedro_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void day_pedro_li_missmygold_info()
{
	AI_Output(other,self, " DIA_Pedro_LI_MissMyGold_01_01 " );	// It probably doesn't make sense to ask you...
	AI_Output(self,other, " DIA_Pedro_LI_MissMyGold_01_02 " );	// (confused) About what?
	AI_Output(other,self, " DIA_Pedro_LI_MissMyGold_01_03 " );	// About my missing gold.
	AI_Output(self,other, " DIA_Pedro_LI_MissMyGold_01_04 " );	// (fearful) Sorry, I don't know anything about this.
	AI_Output(other,self, " DIA_Pedro_LI_MissMyGold_01_05 " );	// I thought so.
	B_LogEntry( TOPIC_MISSMYGOLD , " As I thought, Pedro doesn't know anything about my missing gold. " );
};


instance DIA_PEDRO_LI_CHANGECOURSE (C_Info)
{
	npc = nov_600_pedro_li;
	nr = 2;
	condition = dia_pedro_li_changecourse_condition;
	information = dia_pedro_li_changecourse_info;
	permanent = FALSE;
	description = " How about going back to Khorinis? " ;
};


func int dia_pedro_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pedro_li_changecourse_info()
{
	AI_Output(other,self, " DIA_Pedro_LI_ChangeCourse_01_00 " );	// We must return to Khorinis again.
	AI_Output(self,other, " DIA_Pedro_LI_ChangeCourse_01_01 " );	// (frightened) What?! But do we really need to do this?
	AI_Output(other,self, " DIA_Pedro_LI_ChangeCourse_01_02 " );	// The only thing I can tell from your eyes is that you seem to be very frightened by this news.
	AI_Output(self,other, " DIA_Pedro_LI_ChangeCourse_01_03 " );	// You're right. After all, my return to Khorinis can only mean death for me.
	AI_Output(self,other, " DIA_Pedro_LI_ChangeCourse_01_04 " );	// (doomed) The mages of the monastery will never forgive me for my betrayal. And hardly anyone wants to stand up for me.
	Info_ClearChoices(dia_pedro_li_changecourse);
	Info_AddChoice(dia_pedro_li_changecourse, " I'm sure I can help you with this. " ,dia_pedro_li_changecourse_ok);
	Info_AddChoice(dia_pedro_li_changecourse, " Your betrayal has no excuse! " ,dia_pedro_li_changecourse_death);
};

func void dia_pedro_li_changecourse_ok()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Pedro_LI_ChangeCourse_Ok_01_00 " );	// I'm sure I can help you with this.
	AI_Output(self,other, " DIA_Pedro_LI_ChangeCourse_Ok_01_01 " );	// Are you serious? But how?
	AI_Output(other,self, " DIA_Pedro_LI_ChangeCourse_Ok_01_02 " );	// I'll try to explain to Pyrokar and the other Firebenders that this is not your fault.
	AI_Output(other,self, " DIA_Pedro_LI_ChangeCourse_Ok_01_03 " );	// Surely they themselves understand that the acolyte would not be able to resist dark magic.
	AI_Output(other,self, " DIA_Pedro_LI_ChangeCourse_Ok_01_04 " );	// You were just obsessed then, and could not be aware of what you were doing.
	AI_Output(self,other, " DIA_Pedro_LI_ChangeCourse_Ok_01_05 " );	// Yes... (regretfully) I didn't know what I was doing.
	AI_Output(self,other, " DIA_Pedro_LI_ChangeCourse_Ok_01_07 " );	// Okay, thank you. Hope you can help me.
	B_LogEntry( TOPIC_CHANGECOURSE , " I reassured Pedro that if we went back to Khorinis, I would intercede for him with the Firebenders. " );
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Time to tell our captain. " );
	};
	MIS_HELPPEDRO = LOG_Running;
	Log_CreateTopic(TOPIC_HELPPEDRO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPPEDRO,LOG_Running);
	B_LogEntry( TOPIC_HELPPEDRO , " I promised Acolyte Pedro that I would intercede for him if we ever decided to return to Khorinis. That seemed to calm him down a bit. " );
	Info_ClearChoices(dia_pedro_li_changecourse);
};

func void dia_pedro_li_changecourse_death()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Pedro_LI_ChangeCourse_Death_01_00 " );	// There is no excuse for your betrayal!
	AI_Output(self,other, " DIA_Pedro_LI_ChangeCourse_Death_01_01 " );	// But it's not my fault! I was just forced to do it.
	AI_Output(other,self, " DIA_Pedro_LI_ChangeCourse_Death_01_02 " );	// This is what you'll be telling Pirokar and the other Firebenders when you get back to the monastery.
	AI_Output(other,self, " DIA_Pedro_LI_ChangeCourse_Death_01_03 " );	// I'm sure they'll be very happy to have you back.
	AI_Output(self,other, " DIA_Pedro_LI_ChangeCourse_Death_01_05 " );	// Oh no! Innos, why do I suffer so much?
	B_LogEntry( TOPIC_CHANGECOURSE , " I told Pedro that he might not be able to count on my help if we decided to go back to Khorinis. So I don't think he was very happy with my idea. " );
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Time to tell our captain. " );
	};
	Info_ClearChoices(dia_pedro_li_changecourse);
};

