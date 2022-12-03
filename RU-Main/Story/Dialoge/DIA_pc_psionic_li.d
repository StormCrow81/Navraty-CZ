

instance DIA_LESTER_LI_EXIT(C_Info)
{
	npc = pc_psionic_li;
	nr = 999;
	condition = dia_lester_li_exit_condition;
	information = dia_lester_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_lester_li_exit_condition()
{
	return TRUE;
};

func void dia_lester_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_LI_HELLO(C_Info)
{
	npc = pc_psionic_li;
	nr = 1;
	condition = dia_lester_li_hello_condition;
	information = dia_lester_li_hello_info;
	permanent = TRUE;
	description = " Can you tell me something? " ;
};


func int dia_lester_li_hello_condition()
{
	return TRUE;
};

func void dia_lester_li_hello_info()
{
	AI_Output(other,self, " DIA_Lester_LI_Hello_15_00 " );	// Can you tell me something?
	AI_Output(self,other, " DIA_Lester_LI_Hello_13_06 " );	// Nothing at the moment. Maybe later.
};


instance DIA_PSIONIC_LI_PICKPOCKET(C_Info)
{
	npc = pc_psionic_li;
	nr = 900;
	condition = dia_psionic_li_pickpocket_condition;
	information = dia_psionic_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_psionic_li_pickpocket_condition()
{
	return  C_Robbery ( 56 , 25 );
};

func void dia_psionic_li_pickpocket_info()
{
	Info_ClearChoices(dia_psionic_li_pickpocket);
	Info_AddChoice(dia_psionic_li_pickpocket,Dialog_Back,dia_psionic_li_pickpocket_back);
	Info_AddChoice(dia_psionic_li_pickpocket,DIALOG_PICKPOCKET,dia_psionic_li_pickpocket_doit);
};

func void dia_psionic_li_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_psionic_li_pickpocket);
};

func void dia_psionic_li_pickpocket_back()
{
	Info_ClearChoices(dia_psionic_li_pickpocket);
};


instance DIA_PSIONIC_LI_REDJOINT(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_redjoint_condition;
	information = dia_psionic_li_redjoint_info;
	permanent = FALSE;
	description = " I found an unusual variety of bogweed here. " ;
};


func int dia_psionic_li_redjoint_condition()
{
	if(Npc_HasItems(hero,itpl_swampherb_02) >= 1)
	{
		return TRUE;
	};
};

func void dia_psionic_li_redjoint_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Psionic_LI_RedJoint_01_01 " );	// I found an unusual variety of bogweed here. Do you want to take a look?
	AI_Output(self,other, " DIA_Psionic_LI_RedJoint_01_02 " );	// (surprised) Unusual variety? Well, let's see.
	AI_Output(other,self,"DIA_Psionic_LI_RedJoint_01_03");	//Вот, держи.
	B_GiveInvItems(other,self,itpl_swampherb_02,1);
	AI_Output(self,other, " DIA_Psionic_LI_RedJoint_01_04 " );	// Hmmm... (carefully examining) It really looks like a swamp. Only he is... red!
	AI_Output(other,self, " DIA_Psionic_LI_RedJoint_01_05 " );	// Have you ever seen something like this?
	AI_Output(self,other, " DIA_Psionic_LI_RedJoint_01_06 " );	// No, buddy. For the first time in my life I see this!
	AI_Output(self,other, " DIA_Psionic_LI_RedJoint_01_09 " );	// It is possible, of course, that this swamp has much more mysterious properties than the usual one... But I would not rush to conclusions.
	AI_Output(self,other, " DIA_Psionic_LI_RedJoint_01_10 " );	// One thing is clear to me: this island is fraught with many surprises, since such things are found here!
	AI_Output(other,self, " DIA_Psionic_LI_RedJoint_01_11 " );	// And now what do we do with this swamp?
	AI_Output(self,other, " DIA_Psionic_LI_RedJoint_01_12 " );	// Hmmm. Well, I think we should first study this mysterious plant.
	AI_Output(self,other, " DIA_Psionic_LI_RedJoint_01_13 " );	// Perhaps its properties will be useful for some kind of business.
	AI_Output(self,other, " DIA_Psionic_LI_RedJoint_01_14 " );	// If you come across anything else like this, bring it to me!
	MIS_REDJOINT = LOG_Running;
	Log_CreateTopic(TOPIC_REDJOINT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REDJOINT,LOG_Running);
	B_LogEntry( TOPIC_REDJOINT , " I showed Lester an unusual bogweed I found on this island. He was surprised by my find and wanted to carefully study its properties, and also asked me to bring a few more similar specimens if they caught my eye. " );
};


instance DIA_PSIONIC_LI_REDJOINTMORE(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_redjointmore_condition;
	information = dia_psionic_li_redjointmore_info;
	permanent = TRUE;
	description = " I have some red bog stalks. " ;
};


func int dia_psionic_li_redjointmore_condition()
{
	if((MIS_REDJOINT == LOG_Running) && (Npc_HasItems(hero,itpl_swampherb_02) >= 1) && (TESTSWAMPHERB == FALSE))
	{
		return TRUE;
	};
};

func void dia_psionic_li_redjointmore_info()
{
	var int redjointcount;
	AI_Output(other,self, " DIA_Psionic_LI_RedJointMore_01_01 " );	// I have some red bog stalks.
	AI_Output(self,other, " DIA_Psionic_LI_RedJointMore_01_02 " );	// Good! Give them here.
	redjointcount = Npc_HasItems(other,itpl_swampherb_02);
	GLOBALREDJOINTCOUNT = GLOBALREDJOINTCOUNT + redjointcount;
	B_GiveInvItems(other,self,itpl_swampherb_02,redjointcount);
	redjointcount = redjointcount * 100;
	B_GivePlayerXP(redjointcount);
	if(GLOBALREDJOINTCOUNT >= 5)
	{
		AI_Output(self,other, " DIA_Psionic_LI_RedJointMore_01_04 " );	// Great! I think that now I have quite enough of this swamp to try to determine its properties.
		AI_Output(self,other, " DIA_Psionic_LI_RedJointMore_01_06 " );	// This will take some time...
		B_LogEntry( TOPIC_REDJOINT , " I've brought Lester enough red bogweed. It will take a little time to figure out exactly what this plant's mysterious properties are. " );
		TESTSWAMPHERB = TRUE;
		TESTSWAMPHERBTIMER = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other, " DIA_Psionic_LI_RedJointMore_01_08 " );	// Not bad at all. True, I'm afraid that for my research I need a little more of this bog.
		AI_Output(self,other, " DIA_Psionic_LI_RedJointMore_01_09 " );	// If you come across anything else like that, bring it to me.
	};
};


instance DIA_PSIONIC_LI_REDJOINTDONE(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_redjointdone_condition;
	information = dia_psionic_li_redjointdone_info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int dia_psionic_li_redjointdone_condition()
{
	if((MIS_REDJOINT == LOG_Running) && (TESTSWAMPHERB == TRUE) && (TESTSWAMPHERBREADY == FALSE))
	{
		return TRUE;
	};
};

func void dia_psionic_li_redjointdone_info()
{
	where int daynow;
	daynow = Wld_GetDay();
	AI_Output(other,self, " DIA_Psionic_LI_RedJointDone_01_00 " );	// How are you doing?
	if(TESTSWAMPHERBTIMER <= (daynow - 1))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_Psionic_LI_RedJointDone_01_01 " );	// I think I figured out what the secret of this swamp is...
		AI_Output(self,other, " DIA_Psionic_LI_RedJointDone_01_03 " );	// If it is processed properly, and then maintained in a certain proportion, then the effect of burning this herb will be simply amazing!
		AI_Output(self,other, " DIA_Psionic_LI_RedJointDone_01_04 " );	// Even the 'Northern Dark' is no match!
		B_GiveInvItems(self,other,itmi_redjoint,1);
		AI_Output(self,other, " DIA_Psionic_LI_RedJointDone_01_07 " );	// Here, take this, and you will understand everything yourself!
		B_LogEntry( TOPIC_REDJOINT , " Lester finally finished his research. He didn't go into details, but just handed me one portion of the already processed red bog. " );
		TESTSWAMPHERBREADY = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Psionic_LI_RedJointDone_01_09 " );	// I'm still working on this. So we'll talk about that later.
	};
};


instance DIA_PSIONIC_LI_REDJOINTDONEEXT(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_redjointdoneext_condition;
	information = dia_psionic_li_redjointdoneext_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_psionic_li_redjointdoneext_condition()
{
	if(MIS_REDJOINT == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_psionic_li_redjointdoneext_info()
{
	AI_Output(self,other, " DIA_Psionic_LI_RedJointDoneExt_01_01 " );	// Well, how do you like the swamp?
	AI_Output(other,self, " DIA_Psionic_LI_RedJointDoneExt_01_02 " );	// Like you said - excellent! Admittedly, I feel a little strange about all of this.
	AI_Output(self,other, " DIA_Psionic_LI_RedJointDoneExt_01_03 " );	// It's understandable... After all, this is not an ordinary swamp!
	AI_Output(self,other, " DIA_Psionic_LI_RedJointDoneExt_01_04 " );	// My advice to you: go to sleep. Everything will be removed by hand.
};


instance DIA_PSIONIC_LI_REDJOINTDONEEXTMORE(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_redjointdoneextmore_condition;
	information = dia_psionic_li_redjointdoneextmore_info;
	permanent = FALSE;
	description = " Do you still have this swamp? " ;
};


func int dia_psionic_li_redjointdoneextmore_condition()
{
	if((MIS_REDJOINT == LOG_SUCCESS) && Npc_KnowsInfo(hero,dia_psionic_li_redjointdoneext))
	{
		return TRUE;
	};
};

func void dia_psionic_li_redjointdoneextmore_info()
{
	AI_Output(other,self, " DIA_Psionic_LI_RedJointDoneExtMore_01_01 " );	// Do you still have such a swamp?
	AI_Output(self,other, " DIA_Psionic_LI_RedJointDoneExtMore_01_02 " );	// What, did you like it? This is understandable - the thing is really good.
	AI_Output(self,other, " DIA_Psionic_LI_RedJointDoneExtMore_01_03 " );	// But if I were you, I wouldn't get too carried away!
	AI_Output(self,other, " DIA_Psionic_LI_RedJointDoneExtMore_01_05 " );	// We still do not fully know how it will act in the future.
	AI_Output(self,other, " DIA_Psionic_LI_RedJointDoneExtMore_01_06 " );	// This herb may have some side effects. So it's better not to risk it.
};


instance DIA_PSIONIC_LI_MISSMYGOLD(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_missmygold_condition;
	information = dia_psionic_li_missmygold_info;
	permanent = FALSE;
	description = " You don't know anything about my gold? " ;
};


func int dia_psionic_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_psionic_li_missmygold_info()
{
	AI_Output(other,self, " DIA_Psionic_LI_MissMyGold_01_01 " );	// Know nothing about my gold?
	AI_Output(self,other, " DIA_Psionic_LI_MissMyGold_01_02 " );	// No. And what happened to him?
	AI_Output(other,self, " DIA_Psionic_LI_MissMyGold_01_03 " );	// It's gone somewhere.
	AI_Output(self,other, " DIA_Psionic_LI_MissMyGold_01_04 " );	// (surprised) Lost? But how could this happen?
	AI_Output(other,self, " DIA_Psionic_LI_MissMyGold_01_05 " );	// Here I am interested in the same question.
	AI_Output(self,other, " DIA_Psionic_LI_MissMyGold_01_06 " );	// Sorry, mate... but I can't seem to be of much help here.
	B_LogEntry( TOPIC_MISSMYGOLD , " Lester is not aware of my problem. " );
};


instance DIA_PSIONIC_LI_AWAY(C_Info)
{
	npc = pc_psionic_li;
	nr = 3;
	condition = dia_psionic_li_away_condition;
	information = dia_psionic_li_away_info;
	permanent = FALSE;
	description = " You need to go back. " ;
};


func int dia_psionic_li_away_condition()
{
	if((MIS_GATHERCREW == LOG_Running) && (LESTERLIONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_psionic_li_away_info()
{
	var int countpeopple;
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Psionic_LI_Away_01_01 " );	// You need to go back.
	AI_Output(self,other, " DIA_Psionic_LI_Away_01_02 " );	// What happened?
	AI_Output(other,self, " DIA_Psionic_LI_Away_01_03 " );	// At the next high tide, we weigh anchor.
	AI_Output(self,other, " DIA_Psionic_LI_Away_01_04 " );	// Finally! It's long overdue.
	AI_Output(self,other, " DIA_Psionic_LI_Away_01_05 " );	// I've been getting fed up with this island lately.
	B_LogEntry( TOPIC_GATHERCREW , " Lester was glad to hear of our departure from the island. " );
	LESTERLIONBOARD = TRUE;
	if((GORNLIHERE == TRUE) && (GORNLIONBOARD == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if (( MILTENLIONBOARD  ==  TRUE ) && ( MILTENLIHERE  ==  TRUE ))
	{
		countpeopple = countpeopple + 1;
	};
	if((LESTERLIONBOARD == TRUE) && (LESTERLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((DIEGOLIONBOARD == TRUE) && (DIEGOLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((ANGARLIONBOARD == TRUE) && (ANGARLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((COUNTPEOPLEONBEACH <= countpeopple) && (LICREWONBOARD == FALSE))
	{
		LICREWONBOARD = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_PSIONIC_LI_FINDMAGICORECAVE(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_findmagicorecave_condition;
	information = dia_psionic_li_findmagicorecave_info;
	permanent = FALSE;
	description = " I found a cave with magical ore deposits. " ;
};


func int dia_psionic_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_psionic_li_findmagicorecave_info()
{
	AI_Output(other,self, " DIA_Psionic_LI_FindMagicOreCave_01_01 " );	// I found a cave with magical ore deposits.
	AI_Output(self,other, " DIA_Psionic_LI_FindMagicOreCave_01_02 " );	// Really?! Then you should talk to our captain about it.
	AI_Output(self,other, " DIA_Psionic_LI_FindMagicOreCave_01_03 " );	// I think he will be interested to hear this news.
	GOTOORECAPITAN = TRUE;
};


instance DIA_PSIONIC_LI_CHANGECOURSE(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_changecourse_condition;
	information = dia_psionic_li_changecourse_info;
	permanent = FALSE;
	description = " I have one question for you. " ;
};


func int dia_psionic_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_psionic_li_changecourse_info()
{
	AI_Output(other,self, " DIA_Psionic_LI_ChangeCourse_01_02 " );	// What do you say if we go back to Khorinis?
	AI_Output(self,other, " DIA_Psionic_LI_ChangeCourse_01_03 " );	// Interesting! Even, frankly, a very unexpected proposal!
	AI_Output(self,other, " DIA_Psionic_LI_ChangeCourse_01_04 " );	// What's the matter?
	Info_ClearChoices(dia_psionic_li_changecourse);
	Info_AddChoice(dia_psionic_li_changecourse, " It's all about the magic ore. " ,dia_psionic_li_changecourse_ore);
	Info_AddChoice(dia_psionic_li_changecourse, " Gold is the main reason. " ,dia_psionic_li_changecourse_gold);
};

func void dia_psionic_li_changecourse_ore()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Psionic_LI_ChangeCourse_Ore_01_01 " );	// It's all about the magical ore we found on this island.
	AI_Output(other,self, " DIA_Psionic_LI_ChangeCourse_Ore_01_02 " );	// I think we should report it to the paladins before they finally lose this war to the orcs.
	AI_Output(self,other, " DIA_Psionic_LI_ChangeCourse_Ore_01_03 " );	// Hmmm... (thoughtfully) It turns out that the case is really serious.
	AI_Output(self,other, " DIA_Psionic_LI_ChangeCourse_Ore_01_05 " );	// But it seems to me that some pathetic handful of ore is unlikely to be able to change the situation of the paladins as a whole.
	AI_Output(self,other, " DIA_Psionic_LI_ChangeCourse_Ore_01_06 " );	// I think they lost this war a long time ago, and our efforts will most likely be in vain.
	AI_Output(self,other, " DIA_Psionic_LI_ChangeCourse_Ore_01_07 " );	// At least that's what the rumors coming from the mainland are.
	AI_Output(other,self, " DIA_Psionic_LI_ChangeCourse_Ore_01_08 " );	// Maybe so. But we still have to do our best.
	AI_Output(self,other, " DIA_Psionic_LI_ChangeCourse_Ore_01_10 " );	// Okay. If you want to know my opinion, I don't mind keeping you company.
	AI_Output(self,other, " DIA_Psionic_LI_ChangeCourse_Ore_01_11 " );	// In any case, your decisions always made sense to me, but despite this, in the end they always turned out to be correct.
	B_LogEntry( TOPIC_CHANGECOURSE , " Lester has given his consent for us to travel back to Khorinis. " );
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Time to tell our captain. " );
	};
	Info_ClearChoices(dia_psionic_li_changecourse);
};

func void dia_psionic_li_changecourse_gold()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Psionic_LI_ChangeCourse_Gold_01_01 " );	// Gold is the main reason.
	AI_Output(other,self, " DIA_Psionic_LI_ChangeCourse_Gold_01_03 " );	// The paladins will surely pay us well for the ore we found on this island.
	AI_Output(self,other, " DIA_Psionic_LI_ChangeCourse_Gold_01_04 " );	// I didn't think you liked gold so much... In my opinion, this whole idea is still too risky!
	AI_Output(self,other, " DIA_Psionic_LI_ChangeCourse_Gold_01_06 " );	// By the time we set sail for Irdorath, Khorinis was already under threat of an orc invasion!
	AI_Output(self,other, " DIA_Psionic_LI_ChangeCourse_Gold_01_08 " );	// It's possible that the orcs have already taken over the entire island.
	AI_Output(self,other, " DIA_Psionic_LI_ChangeCourse_Gold_01_10 " );	// Eh... But still, I don't mind keeping you company.
	AI_Output(self,other, " DIA_Psionic_LI_ChangeCourse_Gold_01_11 " );	// In any case, your decisions always made sense to me, but despite this, in the end they always turned out to be correct.
	B_LogEntry( TOPIC_CHANGECOURSE , " Leicester reluctantly gave his consent to go back to Khorinis. " );
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Time to tell our captain. " );
	};
	Info_ClearChoices(dia_psionic_li_changecourse);
};

