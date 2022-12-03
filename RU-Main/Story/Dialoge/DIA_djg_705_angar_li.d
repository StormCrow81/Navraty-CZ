

instance DIA_ANGAR_LI_EXIT(C_Info)
{
	npc = djg_705_angar_li;
	nr = 999;
	condition = dia_angar_li_exit_condition;
	information = dia_angar_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_angar_li_exit_condition()
{
	return TRUE;
};

func void dia_angar_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_LI_PICKPOCKET(C_Info)
{
	npc = djg_705_angar_li;
	nr = 900;
	condition = dia_angar_li_pickpocket_condition;
	information = dia_angar_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_angar_li_pickpocket_condition()
{
	return  C_Robbery ( 47 , 45 );
};

func void dia_angar_li_pickpocket_info()
{
	Info_ClearChoices(dia_angar_li_pickpocket);
	Info_AddChoice(dia_angar_li_pickpocket,Dialog_Back,dia_angar_li_pickpocket_back);
	Info_AddChoice(dia_angar_li_pickpocket,DIALOG_PICKPOCKET,dia_angar_li_pickpocket_doit);
};

func void dia_angar_li_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_angar_li_pickpocket);
};

func void dia_angar_li_pickpocket_back()
{
	Info_ClearChoices(dia_angar_li_pickpocket);
};


instance DIA_ANGAR_LI_FOUNDAMULETT(C_Info)
{
	npc = djg_705_angar_li;
	nr = 7;
	condition = dia_angar_li_foundamulett_condition;
	information = dia_angar_li_foundamulett_info;
	description = " I found your amulet. " ;
};


func int dia_angar_li_foundamulett_condition()
{
	if (Npc_HasItems(other,ItAm_Mana_Angar_MIS) && Npc_KnowsInfo(other,DIA_Angar_WIEKOMMSTDUHIER) && (DJG_AngarGotAmulett ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_angar_li_foundamulett_info()
{
	B_AngarsAmuletSend();
};


instance DIA_ANGAR_LI_MISSMYGOLD ( C_Info ) ;
{
	npc = djg_705_angar_li;
	nr = 2;
	condition = dia_angar_li_missmygold_condition;
	information = dia_angar_li_missmygold_info;
	permanent = FALSE;
	description = " I have one question. " ;
};


func int dia_angar_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_angar_li_missmygold_info()
{
	AI_Output(other,self, " DIA_Angar_LI_MissMyGold_01_03 " );	// Do you happen to know where my gold went?
	AI_Output(self,other, " DIA_Angar_LI_MissMyGold_01_04 " );	// (surprised) Gold? No mate, I don't know.
	AI_Output(self,other, " DIA_Angar_LI_MissMyGold_01_05 " );	// You know I don't care much for that sort of thing.
	B_LogEntry( TOPIC_MISSMYGOLD , " Kor Angar doesn't know where my gold went. " );
};


instance DIA_ANGAR_LI_HELLO(C_Info)
{
	npc = djg_705_angar_li;
	nr = 1;
	condition = dia_angar_li_hello_condition;
	information = dia_angar_li_hello_info;
	permanent = TRUE;
	description = " How are things? " ;
};


func int dia_angar_li_hello_condition()
{
	return TRUE;
};

func void dia_angar_li_hello_info()
{
	AI_Output(other,self, " DIA_Angar_LI_Hello_01_01 " );	// How setting?
	AI_Output(self,other, " DIA_Angar_LI_Hello_01_02 " );	// So far everything is quiet. But if I were you, I would still not go far into the depths of this island.
	AI_Output(self,other, " DIA_Angar_LI_Hello_01_03 " );	// It is not yet known what kind of creatures are found there.
};


instance DIA_ANGAR_LI_HEADPAIN(C_Info)
{
	npc = djg_705_angar_li;
	nr = 3;
	condition = dia_angar_li_headpain_condition;
	information = dia_angar_li_headpain_info;
	permanent = FALSE;
	description = " Do you have any more headaches? " ;
};


func int dia_angar_li_headpain_condition()
{
	return TRUE;
};

func void dia_angar_li_headpain_info()
{
	AI_Output(other,self, " DIA_Angar_LI_HeadPain_01_01 " );	// Don't you have headaches anymore?
	AI_Output(self,other, " DIA_Angar_LI_HeadPain_01_02 " );	// No, everything is fine. As soon as we sailed from Irdorath, they completely disappeared.
	AI_Output(other,self, " DIA_Angar_LI_HeadPain_01_03 " );	// How are you on this island?
	AI_Output(self,other, " DIA_Angar_LI_HeadPain_01_04 " );	// Here I feel even much better than in our swamp camp.
	AI_Output(self,other, " DIA_Angar_LI_HeadPain_01_05 " );	// Although, I think it's too early to relax - it is not known what awaits us ahead.
};


instance HEALTHY (C_Info)
{
	npc = djg_705_angar_li;
	nr = 3;
	condition = dia_angar_li_away_condition;
	information = dia_angar_li_away_info;
	permanent = FALSE;
	description = " Come back on board! " ;
};


func int dia_angar_li_away_condition()
{
	if((MIS_GATHERCREW == LOG_Running) && (ANGARLIONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_li_away_info()
{
	var int countpeople;
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Angar_LI_Away_01_01 " );	// Get back on board!
	AI_Output(self,other, " DIA_Angar_LI_Away_01_02 " );	// What happened?
	AI_Output(other,self, " DIA_Angar_LI_Away_01_03 " );	// Our ship is ready to sail, and we'll weigh anchor at the first tide.
	AI_Output(self,other, " DIA_Angar_LI_Away_01_04 " );	// I thought we'd be here a little longer.
	AI_Output(other,self, " DIA_Angar_LI_Away_01_05 " );	// Is something wrong?
	AI_Output(self,other, " DIA_Angar_LI_Away_01_08 " );	// This is the first place I've been able to finally find serenity and peace in recent times.
	AI_Output(self,other, " DIA_Angar_LI_Away_01_09 " );	// So I wouldn't mind staying here for a couple more days.
	AI_Output(self,other, " DIA_Angar_LI_Away_01_11 " );	// Okay. Hope I come back here...
	B_LogEntry( TOPIC_GATHERCREW , " I told the Angar that we were leaving the island. He was a little upset by this. " );
	ANGARLIONBOARD = TRUE;
	if((GORNLIHERE == TRUE) && (GORNLIONBOARD == TRUE))
	{
		countpeople = countpeople + 1;
	};
	if (( MILTENLIONBOARD  ==  TRUE ) && ( MILTENLIHERE  ==  TRUE ))
	{
		countpeople = countpeople + 1;
	};
	if((LESTERLIONBOARD == TRUE) && (LESTERLIHERE == TRUE))
	{
		countpeople = countpeople + 1;
	};
	if((DIEGOLIONBOARD == TRUE) && (DIEGOLIHERE == TRUE))
	{
		countpeople = countpeople + 1;
	};
	if((ANGARLIONBOARD == TRUE) && (ANGARLIHERE == TRUE))
	{
		countpeople = countpeople + 1;
	};
	if((COUNTPEOPLEONBEACH <= countpeople) && (LICREWONBOARD == FALSE))
	{
		LICREWONBOARD = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_LI_FINDMAGICORECAVE(C_Info)
{
	npc = djg_705_angar_li;
	nr = 2;
	condition = dia_angar_li_findmagicorecave_condition;
	information = dia_angar_li_findmagicorecave_info;
	permanent = FALSE;
	description = " I found a cave with magical ore deposits. " ;
};


func int dia_angar_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_li_findmagicorecave_info()
{
	AI_Output(other,self, " DIA_Angar_LI_FindMagicOreCave_01_01 " );	// I found a cave with magical ore deposits.
	AI_Output(self,other, " DIA_Angar_LI_FindMagicOreCave_01_02 " );	// True? I think you should tell the captain about this.
	GOTOORECAPITAN = TRUE;
};


instance DIA_ANGAR_LI_CHANGECOURSE(C_Info)
{
	npc = djg_705_angar_li;
	nr = 2;
	condition = dia_angar_li_changecourse_condition;
	information = dia_angar_li_changecourse_info;
	permanent = FALSE;
	description = " We must return to Khorinis again. " ;
};


func int dia_angar_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_angar_li_changecourse_info()
{
	AI_Output(other,self, " DIA_Angar_LI_ChangeCourse_01_00 " );	// We must return to Khorinis again.
	AI_Output(self,other, " DIA_Angar_LI_ChangeCourse_01_01 " );	// To Khorinis? But why?
	Info_ClearChoices(dia_angar_li_changecourse);
	Info_AddChoice(dia_angar_li_changecourse, " I need to speak to Lord Hagen urgently! " ,dia_angar_li_changecourse_ore);
	Info_AddChoice(dia_angar_li_changecourse, " It's all about gold. " ,dia_angar_li_changecourse_gold);
};

func void dia_angar_li_changecourse_ore()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Angar_LI_ChangeCourse_Ore_01_01 " );	// I need to speak to Lord Hagen urgently!
	AI_Output(other,self, " DIA_Angar_LI_ChangeCourse_Ore_01_02 " );	// We need to inform the paladins about the magical ore we found on this island.
	AI_Output(other,self, " DIA_Angar_LI_ChangeCourse_Ore_01_03 " );	// This news should help them in their war against the orcs.
	AI_Output(self,other, " DIA_Angar_LI_ChangeCourse_Ore_01_04 " );	// This seems to be a very good reason indeed.
	AI_Output(self,other, " DIA_Angar_LI_ChangeCourse_Ore_01_05 " );	// And I think you're right in doing just that.
	AI_Output(self,other, " DIA_Angar_LI_ChangeCourse_Ore_01_06 " );	// In addition, recently I myself began to worry about the fate of my brothers who remained on that island.
	AI_Output(self,other, " DIA_Angar_LI_ChangeCourse_Ore_01_07 " );	// They'll probably have to fight those green-skinned creatures soon as well, and something tells me I shouldn't remain indifferent to their fate.
	AI_Output(other,self, " DIA_Angar_LI_ChangeCourse_Ore_01_08 " );	// So you're with me?
	AI_Output(self,other, " DIA_Angar_LI_ChangeCourse_Ore_01_09 " );	// Yes. I won't mind if we return to Khorinis.
	B_LogEntry( TOPIC_CHANGECOURSE , " Angar agrees to travel back to Khorinis to inform the paladins about the magic ore. " );
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Time to tell our captain. " );
	};
	Info_ClearChoices(dia_angar_li_changecourse);
};

func void dia_angar_li_changecourse_gold()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Angar_LI_ChangeCourse_Gold_01_01 " );	// It's all about the gold.
	AI_Output(other,self, " DIA_Angar_LI_ChangeCourse_Gold_01_02 " );	// We need to inform the paladins about the magical ore we found on this island.
	AI_Output(other,self, " DIA_Angar_LI_ChangeCourse_Gold_01_03 " );	// I'm sure it would be nice to make money on this whole thing. What do you say?
	AI_Output(self,other, " DIA_Angar_LI_ChangeCourse_Gold_01_04 " );	// I don't think this is a good idea.
	AI_Output(self,other, " DIA_Angar_LI_ChangeCourse_Gold_01_05 " );	// For me, it's better not to risk it once again for a handful of gold coins.
	AI_Output(other,self, " DIA_Angar_LI_ChangeCourse_Gold_01_07 " );	// So you're against it?
	AI_Output(self,other, " DIA_Angar_LI_ChangeCourse_Gold_01_08 " );	// I'm not interested in gold. And I'm not likely to change my mind.
	B_LogEntry( TOPIC_CHANGECOURSE , " Angar is not interested in the idea of ​​going back to Khorinis for a small pile of gold. " );
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		B_LogEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Time to tell our captain. " );
	};
	Info_ClearChoices(dia_angar_li_changecourse);
};

