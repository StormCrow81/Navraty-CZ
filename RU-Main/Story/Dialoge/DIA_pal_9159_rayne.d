

instance DIA_PAL_9159_RAYNE_EXIT(C_Info)
{
	npc = pal_9159_rayne;
	nr = 999;
	condition = dia_pal_9159_rayne_exit_condition;
	information = dia_pal_9159_rayne_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_9159_rayne_exit_condition()
{
	return TRUE;
};

func void dia_pal_9159_rayne_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9159_RAYNE_MATTER(C_Info)
{
	npc = pal_9159_rayne;
	nr = 1;
	condition = dia_pal_9159_rayne_matter_condition;
	information = dia_pal_9159_rayne_matter_info;
	permanent = FALSE;
	description = " Hi, who are you? " ;
};


func int dia_pal_9159_rayne_matter_condition()
{
	return TRUE;
};

func void dia_pal_9159_rayne_matter_info()
{
	AI_Output(other,self,"DIA_Pal_9159_Rayne_Matter_01_00");	//Ты кто?
	AI_Output(self,other, " DIA_Pal_9159_Rayne_Matter_01_01 " );	// My name is Rain, and if you're good with your eyes, then I think you've noticed that I'm a paladin of the king.
	AI_Output(self,other, " DIA_Pal_9159_Rayne_Matter_01_03 " );	// Lord Varus has appointed me warehouse manager here at the fort.
	AI_Output(self,other, " DIA_Pal_9159_Rayne_Matter_01_04 " );	// (annoyed) As if there's no one else to do this but me!
	AI_Output(other,self, " DIA_Pal_9159_Rayne_Matter_01_06 " );	// You don't seem to like your job very much?
	AI_Output(self,other, " DIA_Pal_9159_Rayne_Matter_01_07 " );	// And what can you like here? Every day, all I do is check the contents of these boxes.
	AI_Output(self,other, " DIA_Pal_9159_Rayne_Matter_01_13 " );	// So if you don't have any more questions for me, leave me alone and let me do my duty!
};


instance DIA_PAL_9159_RAYNE_SKLADWATCH(C_Info)
{
	npc = pal_9159_rayne;
	nr = 1;
	condition = dia_pal_9159_rayne_skladwatch_condition;
	information = dia_pal_9159_rayne_skladwatch_info;
	permanent = TRUE;
	description = " Nothing missing? " ;
};


func int dia_pal_9159_rayne_skladwatch_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9159_rayne_matter))
	{
		return TRUE;
	};
};

func void dia_pal_9159_rayne_skladwatch_info()
{
	AI_Output(other,self, " DIA_Pal_9159_Rayne_SkladWatch_01_00 " );	// Nothing missing?
	if(MIS_RAYNEHELP == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Pal_9159_Rayne_SkladWatch_01_01 " );	// Now that I have a helper, I don't have to worry about this. (laughs)
		AI_Output(self,other, " DIA_Pal_9159_Rayne_SkladWatch_01_02 " );	// Everything is fine!
	}
	else
	{
		AI_Output(self,other, " DIA_Pal_9159_Rayne_SkladWatch_01_04 " );	// Very funny, smart guy!
		AI_Output(self,other, " DIA_Pal_9159_Rayne_SkladWatch_01_05 " );	// You should have such a job - maybe then you would understand what it is.
	};
};


instance DIA_PAL_9159_RAYNE_SKLADGOODS(C_Info)
{
	npc = pal_9159_rayne;
	nr = 1;
	condition = dia_pal_9159_rayne_skladgoods_condition;
	information = dia_pal_9159_rayne_skladgoods_info;
	permanent = FALSE;
	description = " What is stored in the warehouse? " ;
};


func int dia_pal_9159_rayne_skladgoods_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9159_rayne_matter) == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_9159_rayne_skladgoods_info()
{
	AI_Output(other,self, " DIA_Pal_9159_Rayne_SkladGoods_01_00 " );	// And what is stored in the warehouse?
	AI_Output(self,other, " DIA_Pal_9159_Rayne_SkladGoods_01_03 " );	// Yes, all kinds of junk - weapons, supplies, clothes, and other nonsense.
	AI_Output(self,other, " DIA_Pal_9159_Rayne_SkladGoods_01_05 " );	// I can see from your eyes that you are a little interested in this information.
	AI_Output(self,other, " DIA_Pal_9159_Rayne_SkladGoods_01_06 " );	// But if you don't roll your lip too much, you won't get there anyway.
	AI_Output(self,other, " DIA_Pal_9159_Rayne_SkladGoods_01_08 " );	// The warehouse is closed, and the key is with Lord Varus himself.
	AI_Output(self,other, " DIA_Pal_9159_Rayne_SkladGoods_01_10 " );	// So get this idea out of your head!
	KNOWSVARUSKEY = TRUE;
};


instance DIA_PAL_9159_RAYNE_HELP(C_Info)
{
	npc = pal_9159_rayne;
	nr = 1;
	condition = dia_pal_9159_rayne_help_condition;
	information = dia_pal_9159_rayne_help_info;
	permanent = FALSE;
	description = " Do you have silver goblets? " ;
};


func int dia_pal_9159_rayne_help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pal_9159_Rayne_SkladGoods) && (MIS_FERDSILVERCUP == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_pal_9159_rayne_help_info()
{
	AI_Output(other,self, " DIA_Pal_9159_Rayne_Help_01_00 " );	// Do you have silver goblets?
	AI_Output(self,other, " DIA_Pal_9159_Rayne_Help_01_01 " );	// (thinking) Well, yes, it looks like there are a couple of pieces in stock.
	AI_Output(self,other, " DIA_Pal_9159_Rayne_Help_01_02 " );	// And why are you suddenly interested in this?
	AI_Output(other,self, " DIA_Pal_9159_Rayne_Help_01_03 " );	// Paladin Ferdinand asked me to get him one of these cups.
	AI_Output(self,other, " DIA_Pal_9159_Rayne_Help_01_10 " );	// Look, these cups are the property of the paladin order.
	AI_Output(self,other, " DIA_Pal_9159_Rayne_Help_01_11 " );	// So forget about it.
	AI_Output(other,self, " DIA_Pal_9159_Rayne_Help_01_12 " );	// Can you throw an exception?
	AI_Output(self,other, " DIA_Pal_9159_Rayne_Help_01_14 " );	// Understand - I would love to help Ferdinand, but if Varus finds out that I sell things from the warehouse - he will kill me!
	AI_Output(self,other, " DIA_Pal_9159_Rayne_Help_01_15 " );	// All they do is whine and take offense at me!
	AI_Output(self,other, " DIA_Pal_9159_Rayne_Help_01_16 " );	// Instead, it would be better if one of them volunteered to help me manage the warehouse.
	AI_Output(self,other, " DIA_Pal_9159_Rayne_Help_01_17 " );	// I just can't handle it alone. But this is of no interest to anyone.
	AI_Output(other,self, " DIA_Pal_9159_Rayne_Help_01_18 " );	// I think you could use a helper.
	AI_Output(self,other, " DIA_Pal_9159_Rayne_Help_01_19 " );	// (sadly) That's right.
	AI_Output(self,other, " DIA_Pal_9159_Rayne_Help_01_21 " );	// Just what does Varus say? I think he will not give people for this work.
	Info_ClearChoices(dia_pal_9159_rayne_help);
	Info_AddChoice(dia_pal_9159_rayne_help, " Can I help you? " ,dia_pal_9159_rayne_help_ok);
	Info_AddChoice(dia_pal_9159_rayne_help, " Then I won't interfere. " ,dia_pal_9159_rayne_help_no);
};

func void dia_pal_9159_rayne_help_ok()
{
	AI_Output(other,self, " DIA_Pal_9159_Rayne_Help_Ok_01_00 " );	// I'll think of something.
	AI_Output(self,other, " DIA_Pal_9159_Rayne_Help_Ok_01_09 " );	// Good. Maybe you can work something out.
	MIS_RAYNEHELP = LOG_Running;
	Log_CreateTopic(TOPIC_RAYNEHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RAYNEHELP,LOG_Running);
	B_LogEntry( TOPIC_RAYNEHELP , " I promised paladin Rayne to find a helper for him to work in the warehouse. " );
	Info_ClearChoices(dia_pal_9159_rayne_help);
};

func void dia_pal_9159_rayne_help_no()
{
	AI_Output(other,self, " DIA_Pal_9159_Rayne_Help_No_01_00 " );	// Then you'll have to work on your own - I won't interfere.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_No_01_01");	//Хммм...
	Info_ClearChoices(dia_pal_9159_rayne_help);
};


instance DIA_PAL_9159_RAYNE_HELPDONE(C_Info)
{
	npc = pal_9159_rayne;
	nr = 1;
	condition = dia_pal_9159_rayne_helpdone_condition;
	information = dia_pal_9159_rayne_helpdone_info;
	permanent = FALSE;
	description = " Lord Varus will send you a man. " ;
};


func int dia_pal_9159_rayne_helpdone_condition()
{
	if((MIS_RAYNEHELP == LOG_Running) && (FINDHELPERRAYNE == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9159_rayne_helpdone_info()
{
	AI_Output(other,self, " DIA_Pal_9159_Rayne_HelpDone_01_00 " );	// Lord Varus will send you a man.
	AI_Output(self,other, " DIA_Pal_9159_Rayne_HelpDone_01_04 " );	// Great! Thanks boy.
	AI_Output(self,other, " DIA_Pal_9159_Rayne_HelpDone_01_05 " );	// To be honest, I didn't even really count on your help.
	if(MIS_FERDSILVERCUP == LOG_Running)
	{
		AI_Output(self,other, " DIA_Pal_9159_Rayne_HelpDone_01_08 " );	// Here, take this silver goblet you were looking for.
		B_GiveInvItems(self,other,ItMi_SilverCup,1);
		AI_Output(self,other, " DIA_Pal_9159_Rayne_HelpDone_01_09 " );	// I think you'll need it.
	}
	else
	{
		AI_Output(self,other, " DIA_Pal_9159_Rayne_HelpDone_01_12 " );	// Here, take this plant. It is said to be extremely rare.
		B_GiveInvItems(self,other,ItPl_Perm_Herb,1);
		AI_Output(self,other, " DIA_Pal_9159_Rayne_HelpDone_01_13 " );	// I'm sure you'll need this item.
	};
	MIS_RAYNEHELP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RAYNEHELP,LOG_SUCCESS);
	B_LogEntry( TOPIC_RAYNEHELP , " Rayne was happy to know that Lord Varus would send a man to help him. " );
	Wld_InsertNpc(pal_9162_ritter,"LGR_ZUMBANVIERTEL_02");
};


instance DIA_PAL_9159_RAYNE_PICKPOCKET(C_Info)
{
	npc = pal_9159_rayne;
	nr = 900;
	condition = dia_pal_9159_rayne_pickpocket_condition;
	information = dia_pal_9159_rayne_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_pal_9159_rayne_pickpocket_condition()
{
	return  C_Robbery ( 80 , 150 );
};

func void dia_pal_9159_rayne_pickpocket_info()
{
	Info_ClearChoices(dia_pal_9159_rayne_pickpocket);
	Info_AddChoice(dia_pal_9159_rayne_pickpocket,Dialog_Back,dia_pal_9159_rayne_pickpocket_back);
	Info_AddChoice(dia_pal_9159_rayne_pickpocket,DIALOG_PICKPOCKET,dia_pal_9159_rayne_pickpocket_doit);
};

func void dia_pal_9159_rayne_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_pal_9159_rayne_pickpocket);
};

func void dia_pal_9159_rayne_pickpocket_back()
{
	Info_ClearChoices(dia_pal_9159_rayne_pickpocket);
};

