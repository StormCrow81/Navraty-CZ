

instance DIA_Kervo_EXIT(C_Info)
{
	npc = STRF_1116_Kervo;
	nr = 999;
	condition = DIA_Kervo_EXIT_Condition;
	information = DIA_Kervo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kervo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kervo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances of DIA_Kervo_WASIST (C_Info)
{
	npc = STRF_1116_Kervo;
	nr = 4;
	condition = DIA_Kervo_WASIST_Condition;
	information = DIA_Kervo_WASIST_Info;
	description = " What's wrong with you? " ;
};


func int DIA_Kervo_WASIST_Condition()
{
	return TRUE;
};

func void DIA_Kervo_WASIST_Info()
{
	AI_Output(other,self, " DIA_Kervo_WASIST_15_00 " );	// What's wrong with you?
	AI_Output(self,other, " DIA_Kervo_WASIST_13_01 " );	// Are you still asking? Just look around!
	AI_Output(self,other, " DIA_Kervo_WASIST_13_02 " );	// Those damn snitches have taken up the entire river since I got here.
	AI_Output(self,other, " DIA_Kervo_WASIST_13_03 " );	// At first there were only two of them. But yesterday I counted five already.
	AI_Output(self,other, " DIA_Kervo_WASIST_13_04 " );	// Now I don't know how I can get out of here.
};

instance DIA_Kervo_HELP (C_Info)
{
	npc = STRF_1116_Kervo;
	nr = 5;
	condition = DIA_Kervo_HILFE_Condition;
	information = DIA_Kervo_HILFE_Info;
	description = " Have you tried to get through the Passage? " ;
};

func int DIA_Kervo_HILFE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kervo_WASIST))
	{
		return TRUE;
	};
};

func void DIA_Kervo_HILFE_Info()
{
	AI_Output(other,self, " DIA_Kervo_HILFE_15_00 " );	// Have you tried to get through the Passage?
	AI_Output(self,other, " DIA_Kervo_HILFE_13_01 " );	// Do you think I'm out of my mind? Even two dozen soldiers won't get me out of here while those things are roaming around. Hate them!
	AI_Output(self,other, " DIA_Kervo_HILFE_13_02 " );	// Whenever I smell them, I break out in a cold sweat. And their grunts chill the blood in my veins.
	AI_Output(self,other, " DIA_Kervo_HILFE_13_03 " );	// If you really want to be skinned alive, you can take the risk.
	MIS_Kervo_KillLurker = LOG_Running;
	Log_CreateTopic(TOPIC_Kervo_KillLurker,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Kervo_KillLurker,LOG_Running);
	B_LogEntry(TOPIC_Kervo_KillLurker, " Kervo is terribly scared of the sniffs that roam near his cave. We should help the poor fellow! " );
	Info_ClearChoices(DIA_Kervo_HILFE);
	Info_AddChoice(DIA_Kervo_HILFE, " Ладно. Я ухожу. " ,DIA_Kervo_HILFE_tschau);
	Info_AddChoice(DIA_Kervo_HILFE, " But you can't stay here forever. " ,DIA_Kervo_HILFE_ewig);
	if(Kervo_GotStuff == TRUE)
	{
		Info_AddChoice(DIA_Kervo_HILFE, " What will you give me if I kill these creatures? " ,DIA_Kervo_HILFE_Problem);
	};
};

func void DIA_Kervo_HELP_eternal()
{
	AI_Output(other,self, " DIA_Kervo_HILFE_ewig_15_00 " );	// But you can't stay here forever.
	AI_Output(self,other, " DIA_Kervo_HILFE_ewig_13_01 " );	// I don't know what you want from me, but I can tell you one thing: you won't make me leave here.
};

var int Kervo_PromiseNugget;

func void DIA_Kervo_HELP_Problem()
{
	AI_Output(other,self, " DIA_Kervo_HILFE_Problem_15_00 " );	// What would you give me if I killed these creatures?
	AI_Output(self,other, " DIA_Kervo_HILFE_Problem_13_01 " );	// Hmm...(thoughtfully) Well, it would be enough if the shnygs just got out of the cave.

	if ((hero.guild ==  GIL_KDF ) || (hero.guild ==  GIL_KDM ) || (hero.guild ==  GIL_KDW ) || (hero.guild ==  GIL_GUR ))
	{
		AI_Output(self,other, " DIA_Kervo_HILFE_Problem_13_02 " );	// I found a pure runestone! You are a mage. I'm sure you'll find a use for it.
	}
	else
	{
		AI_Output(self,other, " DIA_Kervo_HILFE_Problem_13_03 " );	// I found a piece of ore.
	};

	AI_Output(self,other, " DIA_Kervo_HILFE_Problem_13_04 " );	// I'll give it to you.
	Kervo_PromiseNugget = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kervo_HILFE_tschau()
{
	AI_Output(other,self, " DIA_Kervo_HILFE_tschau_15_00 " );	// Okay! I'm leaving.
	AI_Output(self,other, " DIA_Kervo_HILFE_tschau_13_01 " );	// As you know. I won't hold you back!
	AI_StopProcessInfos(self);
};


instance DIA_Kervo_LurkerPlatt(C_Info)
{
	npc = STRF_1116_Kervo;
	condition = DIA_Kervo_LurkerPlatt_Condition;
	information = DIA_Kervo_LurkerPlatt_Info;
	description = " Shnygs are gone. " ;
};

func int DIA_Kervo_LurkerPlatt_Condition()
{
	if ((MIS_Kervo_KillLurker == LOG_Running) && Npc_IsDead(Kervo_Lurker1) && Npc_IsDead(Kervo_Lurker2) && Npc_IsDead(Kervo_Lurker3) && Npc_IsDead(Kervo_Lurker4) && Npc_IsDead(Kervo_Lurker5) && Npc_IsDead(Kervo_Lurker6))
	{
		return TRUE;
	};
};

func void DIA_Kervo_LurkerPlatt_Info()
{
	AI_Output(other,self, " DIA_Kervo_LurkerPlatt_15_00 " );	// Shnygov no more.
	AI_Output(self,other, " DIA_Kervo_LurkerPlatt_13_01 " );	// Great. Now I can sleep peacefully again.
	if(Kervo_PromiseNugget == TRUE)
	{
		AI_Output(self,other, " DIA_Kervo_LurkerPlatt_13_02 " );	// Here's the promised thing.
		if ((hero.guild ==  GIL_KDF ) || (hero.guild ==  GIL_KDM ) || (hero.guild ==  GIL_KDW ) || (hero.guild ==  GIL_GUR ))
		{
			B_GiveInvItems(self,other,ItMi_RuneBlank,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItMi_Nugget,1);
		};
	};
	B_GivePlayerXP(XP_KervoKillLurker);
	MIS_Kervo_KillLurker = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Kervo_KillLurker,LOG_SUCCESS);
	B_LogEntry(TOPIC_Kervo_KillLurker, " Now Kervo can breathe easy! All the snags are dead. " );
};

instance DIA_Kervo_VERGISSES(C_Info)
{
	npc = STRF_1116_Kervo;
	condition = DIA_Kervo_VERGISSES_Condition;
	information = DIA_Kervo_VERGISSES_Info;
	permanent = TRUE;
	description = " Are you going to the Passage now? " ;
};


func int DIA_Kervo_VERGISSES_Condition()
{
	if(MIS_Kervo_KillLurker == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Kervo_VERGISSES_Info()
{
	AI_Output(other,self, " DIA_Kervo_VERGISSES_15_00 " );	// Are you going to the Passage now?
	AI_Output(self,other, " DIA_Kervo_VERGISSES_13_01 " );	// Forget it, man. If they catch me, they will make me work in the mine again. I will stay here.
	AI_StopProcessInfos(self);
};

instance DIA_Kervo_PICKPOCKET(C_Info)
{
	npc = STRF_1116_Kervo;
	nr = 900;
	condition = DIA_Kervo_PICKPOCKET_Condition;
	information = DIA_Kervo_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Kervo_PICKPOCKET_Condition()
{
	return  C_Robbery ( 34 , 10 );
};

func void DIA_Kervo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kervo_PICKPOCKET);
	Info_AddChoice(DIA_Kervo_PICKPOCKET,Dialog_Back,DIA_Kervo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kervo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Kervo_PICKPOCKET_DoIt);
};

func void DIA_Kervo_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Kervo_PICKPOCKET);
};

func void DIA_Kervo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kervo_PICKPOCKET);
};

