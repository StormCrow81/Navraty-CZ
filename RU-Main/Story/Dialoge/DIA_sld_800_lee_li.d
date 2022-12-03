

instance DIA_LEE_LI_EXIT(C_Info)
{
	npc = sld_800_lee_li;
	nr = 999;
	condition = dia_lee_li_exit_condition;
	information = dia_lee_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_lee_li_exit_condition()
{
	return TRUE;
};

func void dia_lee_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_LI_PERM6(C_Info)
{
	npc = sld_800_lee_li;
	nr = 2;
	condition = dia_lee_li_perm6_condition;
	information = dia_lee_li_perm6_info;
	permanent = TRUE;
	description = "Как дела у моего корабля? ";
};


func int dia_lee_li_perm6_condition()
{
	return TRUE;
};

func void dia_lee_li_perm6_info()
{
	AI_Output(other,self, " DIA_Lee_DI_PERM6_15_00 " );	// How is my ship?
	AI_Output(self,other, " DIA_Lee_DI_PERM6_04_01 " );	// Don't worry. I have everything under control.
};


instance DIA_LEE_LI_TEACH(C_Info)
{
	npc = sld_800_lee_li;
	nr = 10;
	condition = dia_lee_li_teach_condition;
	information = dia_lee_li_teach_info;
	permanent = TRUE;
	description = " I need a workout. " ;
};


func int dia_lee_li_teach_condition()
{
	return TRUE;
};

func void dia_lee_li_teach_info()
{
	AI_Output(other,self, " DIA_Lee_DI_Teach_15_00 " );	// I want to practice.
	AI_Output(self,other, " DIA_Lee_DI_Teach_04_01 " );	// What exactly do you want to improve?
	Info_ClearChoices(dia_lee_li_teach);
	Info_AddChoice(dia_lee_li_teach,Dialog_Back,dia_lee_li_teach_back);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_lee_li_teach_2h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_lee_li_teach_2h_5);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lee_li_teach_1h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lee_li_teach_1h_5);
};

func void dia_lee_li_teach_back()
{
	Info_ClearChoices(dia_lee_li_teach);
};

func void dia_lee_li_teach_1h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100))
	{
		AI_Output(self,other, " DIA_Lee_DI_Teach_1H_1_04_00 " );	// Your defense is terrible, but we'll do something about it.
	};
	Info_ClearChoices(dia_lee_li_teach);
	Info_AddChoice(dia_lee_li_teach,Dialog_Back,dia_lee_li_teach_back);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_lee_li_teach_2h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_lee_li_teach_2h_5);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lee_li_teach_1h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lee_li_teach_1h_5);
};

func void dia_lee_li_teach_1h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100))
	{
		AI_Output(self,other, " DIA_Lee_DI_Teach_1H_5_04_00 " );	// Your brushes are too tight. You should keep your weapons free.
	};
	Info_ClearChoices(dia_lee_li_teach);
	Info_AddChoice(dia_lee_li_teach,Dialog_Back,dia_lee_li_teach_back);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_lee_li_teach_2h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_lee_li_teach_2h_5);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lee_li_teach_1h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lee_li_teach_1h_5);
};

func void dia_lee_li_teach_2h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other, " DIA_DIA_Lee_DI_Teach_2H_1_04_00 " );	// Always remember: the side kick should come from the hip, not the wrist.
	};
	Info_ClearChoices(dia_lee_li_teach);
	Info_AddChoice(dia_lee_li_teach,Dialog_Back,dia_lee_li_teach_back);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_lee_li_teach_2h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_lee_li_teach_2h_5);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lee_li_teach_1h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lee_li_teach_1h_5);
};

func void dia_lee_li_teach_2h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other, " DIA_Lee_DI_Teach_2H_5_04_00 " );	// Strongest hit is useless if it goes nowhere. So try to accurately count the blows.
	};
	Info_ClearChoices(dia_lee_li_teach);
	Info_AddChoice(dia_lee_li_teach,Dialog_Back,dia_lee_li_teach_back);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_lee_li_teach_2h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_lee_li_teach_2h_5);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lee_li_teach_1h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lee_li_teach_1h_5);
};


instance DIA_LEE_LI_PICKPOCKET(C_Info)
{
	npc = sld_800_lee_li;
	nr = 900;
	condition = dia_lee_li_pickpocket_condition;
	information = dia_lee_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_lee_li_pickpocket_condition()
{
	return  C_Robbery ( 110 , 570 );
};

func void dia_lee_li_pickpocket_info()
{
	Info_ClearChoices(dia_lee_li_pickpocket);
	Info_AddChoice(dia_lee_li_pickpocket,Dialog_Back,dia_lee_li_pickpocket_back);
	Info_AddChoice(dia_lee_li_pickpocket,DIALOG_PICKPOCKET,dia_lee_li_pickpocket_doit);
};

func void dia_lee_li_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_lee_li_pickpocket);
};

func void dia_lee_li_pickpocket_back()
{
	Info_ClearChoices(dia_lee_li_pickpocket);
};


instance DIA_LEE_LI_MISSMYGOLD(C_Info)
{
	npc = sld_800_lee_li;
	nr = 2;
	condition = dia_lee_li_missmygold_condition;
	information = dia_lee_li_missmygold_info;
	permanent = FALSE;
	description = " Do you know where my gold went? " ;
};


func int dia_lee_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_lee_li_missmygold_info()
{
	AI_Output(other,self, " DIA_Lee_LI_MissMyGold_01_01 " );	// Do you know where my gold went?
	AI_Output(self,other, " DIA_Lee_LI_MissMyGold_01_02 " );	// No, man, I don't know. And no time for me to follow him.
	AI_Output(other,self,"DIA_Lee_LI_MissMyGold_01_03");	//Ясно.
	B_LogEntry( TOPIC_MISSMYGOLD , " Lee can't help me with this either. " );
};


instance DIA_LEE_LI_FINDMAGICORECAVE(C_Info)
{
	npc = sld_800_lee_li;
	nr = 2;
	condition = dia_lee_li_findmagicorecave_condition;
	information = dia_lee_li_findmagicorecave_info;
	permanent = FALSE;
	description = " I found a cave with magical ore deposits. " ;
};


func int dia_lee_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_li_findmagicorecave_info()
{
	AI_Output(other,self, " DIA_Lee_LI_FindMagicOreCave_01_01 " );	// I found a cave with magical ore deposits.
	AI_Output(self,other, " DIA_Lee_LI_FindMagicOreCave_01_02 " );	// Really? Then you should talk to our captain about it.
	AI_Output(self,other, " DIA_Lee_LI_FindMagicOreCave_01_03 " );	// I think he will be interested to hear this news.
	GOTOORECAPITAN = TRUE;
};


instance DIA_LEE_LI_CHANGECOURSE(C_Info)
{
	npc = sld_800_lee_li;
	nr = 2;
	condition = dia_lee_li_changecourse_condition;
	information = dia_lee_li_changecourse_info;
	permanent = FALSE;
	description = " We need to get back to Khorinis. " ;
};


func int dia_lee_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_lee_li_changecourse_info()
{
	AI_Output(other,self, " DIA_Lee_LI_ChangeCourse_01_00 " );	// We should head back to Khorinis.
	AI_Output(self,other, " DIA_Lee_LI_ChangeCourse_01_01 " );	// And why should we do this?
	Info_ClearChoices(dia_lee_li_changecourse);
	Info_AddChoice(dia_lee_li_changecourse, " To inform the paladins about the ore we found. " ,dia_lee_li_changecourse_ore);
	Info_AddChoice(dia_lee_li_changecourse, " For a huge pile of gold! " ,dia_lee_li_changecourse_gold);
};

func void dia_lee_li_changecourse_ore()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Lee_LI_ChangeCourse_Ore_01_01 " );	// We must help the paladins! We need to inform them about the magical ore that we found on this island.
	AI_Output(other,self, " DIA_Lee_LI_ChangeCourse_Ore_01_02 " );	// I think this will give them a slight advantage in the war against the orcs.
	AI_Output(self,other, " DIA_Lee_LI_ChangeCourse_Ore_01_03 " );	// So what? What do we care about paladins!
	AI_Output(self,other, " DIA_Lee_LI_ChangeCourse_Ore_01_04 " );	// I'm only interested in the fate of my people. I won't do anything for these idiots!
	AI_Output(other,self, " DIA_Lee_LI_ChangeCourse_Ore_01_07 " );	// Better think about the fact that by doing a similar service to the paladins, you can demand whatever you want from them.
	AI_Output(self,other, " DIA_Lee_LI_ChangeCourse_Ore_01_08 " );	// Hmmm. Very interesting. And what do you think Lord Hagen can offer me?
	AI_Output(other,self, " DIA_Lee_LI_ChangeCourse_Ore_01_09 " );	// You could demand amnesty from him for all your people.
	AI_Output(other,self, " DIA_Lee_LI_ChangeCourse_Ore_01_10 " );	// After all, most of them remained in Khorinis.
	AI_Output(self,other, " DIA_Lee_LI_ChangeCourse_Ore_01_14 " );	// (thoughtfully) Yes, you're right. Maybe this really is a chance to save my people!
	AI_Output(self,other, " DIA_Lee_LI_ChangeCourse_Ore_01_15 " );	// I should try to do my best for them.
	AI_Output(other,self, " DIA_Lee_LI_ChangeCourse_Ore_01_16 " );	// So are you with me?
	AI_Output(self,other, " DIA_Lee_LI_ChangeCourse_Ore_01_17 " );	// Good! I will go with you to Khorinis.
	B_LogEntry( TOPIC_CHANGECOURSE , " I was able to convince Lee to go back to Khorinis to help the paladins. " );
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Time to tell our captain. " );
	};
	Info_ClearChoices(dia_lee_li_changecourse);
};

func void dia_lee_li_changecourse_gold()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Lee_LI_ChangeCourse_Gold_01_01 " );	// For a huge pile of gold! Isn't that a reason to come back?
	AI_Output(self,other, " DIA_Lee_LI_ChangeCourse_Gold_01_02 " );	// Very interesting. And where are you going to look for this very pile?
	AI_Output(other,self, " DIA_Lee_LI_ChangeCourse_Gold_01_03 " );	// The paladins will give it to us when we tell them about the ore found on this island.
	AI_Output(self,other, " DIA_Lee_LI_ChangeCourse_Gold_01_07 " );	// I doubt paladins have that much gold worth returning for.
	AI_Output(self,other, " DIA_Lee_LI_ChangeCourse_Gold_01_08 " );	// Plus, there might already be Orcs in Khorinis! Which means we're just wasting our way.
	AI_Output(self,other, " DIA_Lee_LI_ChangeCourse_Gold_01_10 " );	// (seriously) I don't think our return makes any sense.
	AI_Output(self,other, " DIA_Lee_LI_ChangeCourse_Gold_01_11 " );	// This is my opinion. But the decision is up to you.
	B_LogEntry( TOPIC_CHANGECOURSE , " Lee doesn't think it makes sense to return to Khorinis. " );
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		B_LogEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Time to tell our captain. " );
	};
	Info_ClearChoices(dia_lee_li_changecourse);
};

