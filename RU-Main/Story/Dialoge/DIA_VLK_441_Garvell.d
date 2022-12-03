

instance DIA_Garvell_EXIT(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 999;
	condition = DIA_Garvell_EXIT_Condition;
	information = DIA_Garvell_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garvell_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Garvell_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Garvell_GREET(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_GREET_Condition;
	information = DIA_Garvell_GREET_Info;
	description = " What are you doing here? " ;
};


func int DIA_Garvell_GREET_Condition()
{
	if (Wld_IsTime( 5 , 0 , 19 , 0 ))
	{
		return TRUE;
	};
};

func void DIA_Garvell_GREET_Info()
{
	AI_Output(other, self, " DIA_Garvell_GREET_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Garvell_GREET_04_01 " );	// I'm building a ship because I want to get out of here - and the sooner the better.
	AI_Output(self,other, " DIA_Garvell_GREET_04_02 " );	// But judging by the way things are going, this ship will never be finished.
};


instance DIA_Garvell_Urgent (C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_eilig_Condition;
	information = DIA_Garvell_Urgent_Info;
	description = " Why are you in such a hurry? " ;
};


func int DIA_Garvell_eilig_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_GREET))
	{
		return TRUE;
	};
};

func void DIA_Garvell_urgently_Info()
{
	AI_Output(other,self, " DIA_Garvell_eilig_15_00 " );	// Why are you in such a hurry?
	AI_Output(self,other, " DIA_Garvell_eilig_04_01 " );	// Soon the orcs will come and burn the city to the ground.
	AI_Output(other,self, " DIA_Garvell_eilig_15_02 " );	// Why do you think so?
	AI_Output(self,other, " DIA_Garvell_eilig_04_03 " );	// Boy, do you see that paladins are everywhere now? Why do you think they are here?
	AI_Output(self,other, " DIA_Garvell_eilig_04_04 " );	// I plant you. They are here because the orcs will soon attack us. And that won't make us happy.
};


instance DIA_Garvell_Schiff(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 99;
	condition = DIA_Garvell_Schiff_Condition;
	information = DIA_Garvell_Schiff_Info;
	description = " Why can't you finish the ship? " ;
};


func int DIA_Garvell_Schiff_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_GREET))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Schiff_Info()
{
	AI_Output(other,self, " DIA_Garvell_Schiff_15_00 " );	// Why can't you finish the ship?
	AI_Output(self,other, " DIA_Garvell_Schiff_04_01 " );	// Oh, we have a thousand problems. The skeleton is not yet very stable and there are not enough boards for sheathing.
	AI_Output(self,other, " DIA_Garvell_Schiff_04_02 " );	// I have almost no money left to buy materials, and the last batch was all eaten by a bug.
	AI_Output(self,other, " DIA_Garvell_Schiff_04_03 " );	// My guys aren't very efficient. One wants to build a fast ship, while the other only cares about the carving that will be installed on the bow of the ship.
	AI_Output(self,other, " DIA_Garvell_Schiff_04_04 " );	// Like we have nothing else to do!
	AI_Output(self,other, " DIA_Addon_Garvell_Schiff_04_00 " );	// Plus, one of my boyfriends just stopped coming to work. I'm beginning to fear that this will further delay construction.
};

instance DIA_Garvell_HelpPath(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 99;
	condition = DIA_Garvell_HelpPath_Condition;
	information = DIA_Garvell_HelpPath_Info;
	description = " Can I help speed up the construction of the ship? " ;
};

func int DIA_Garvell_HelpPath_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_Schiff) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Garvell_HelpPath_Info()
{
	AI_Output(other,self, " DIA_Garvell_HelpPath_01_00 " );	// Can I help speed up the construction of the ship?
	AI_Output(self,other, " DIA_Garvell_HelpPath_01_01 " );	// Yes, I could use new tools.
	AI_Output(self,other, " DIA_Garvell_HelpPath_01_02 " );	// (thoughtfully) Let's say two hammers and a new saw would come in handy.
	AI_Output(self,other, " DIA_Garvell_HelpPath_01_03 " );	// Also, we're out of resin, which we usually use to seal ship seams.
	AI_Output(self,other, " DIA_Garvell_HelpPath_01_04 " );	// So if you can get all these things for me, I'd really appreciate it!
	AI_Output(other,self, " DIA_Garvell_HelpPath_01_05 " );	// Okay, I'll look for them for you.
	MIS_GarvellTools = LOG_Running;
	Log_CreateTopic(TOPIC_GarvellTools,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GarvellTools,LOG_Running);
	B_LogEntry(TOPIC_GarvellTools, " Garvell needs new tools - two hammers and a saw. Also, he could use resin to grease the seams of the future ship. " );
};

instance DIA_Garvell_HelpPath_Done(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 99;
	condition = DIA_Garvell_HelpPath_Done_Condition;
	information = DIA_Garvell_HelpPath_Done_Info;
	description = " Here's everything you asked for. " ;
};

func int DIA_Garvell_HelpPath_Done_Condition()
{
	if ((MIS_GarvellTools == LOG_Running) && (Npc_HasItems(other,ItMy_Hammer) >=  2 ) && (Npc_HasItems(other,ItMy_Saw) >=  1 ) && (Npc_HasItems(other,ItMy_Pitch) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_Garvell_HelpPath_Done_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Garvell_HelpPath_Done_01_00 " );	// Here's everything you asked for.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItMi_Hammer,2);
	Npc_RemoveInvItems(hero,ItMi_Saw,1);
	Npc_RemoveInvItems(hero,ItMi_Pitch,1);
	AI_Output(self,other, " DIA_Garvell_HelpPath_Done_01_01 " );	// Great, mate! With them, our work will go much faster.
	AI_Output(self,other, " DIA_Garvell_HelpPath_Done_01_02 " );	// Here, take this gold as a reward.
	B_GiveInvItems(self,other,ItMi_Gold,50);
	AI_Output(self,other, " DIA_Garvell_HelpPath_Done_01_03 " );	// You honestly deserve it!
	AI_Output(other,self,"DIA_Garvell_HelpPath_Done_01_04");	//Спасибо.
	MIS_GarvellTools = LOG_Success;
	Log_SetTopicStatus(TOPIC_GarvellTools,LOG_Success);
	B_LogEntry(TOPIC_GarvellTools, " I brought Garvell the tools he needs. " );
};

instance DIA_Addon_Garvell_MissingPeople(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 5;
	condition = DIA_Addon_Garvell_MissingPeople_Condition;
	information = DIA_Addon_Garvell_MissingPeople_Info;
	description = " Have you lost your worker? " ;
};

func int DIA_Addon_Garvell_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_Schiff) && (SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garvell_MissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Garvell_MissingPeople_15_00 " );	// Have you lost your worker?
	AI_Output(self,other, " DIA_Addon_Garvell_MissingPeople_04_01 " );	// Yes! His name was Monty. He seemed to have vanished into thin air.
	AI_Output(self,other, " DIA_Addon_Garvell_MissingPeople_04_02 " );	// This lazy pig is probably chilling out on some farm right now. There was no need to pay him an advance.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople, " Garvell is complaining about his worker Monty, who didn't show up for work a few days ago. Garvell thinks Monty ran away to the farmers. " );
	Info_ClearChoices(DIA_Addon_Garvell_MissingPeople);
	Info_AddChoice(DIA_Addon_Garvell_MissingPeople, " I heard other people were missing too. " ,DIA_Addon_Garvell_MissingPeople_more);
	if(SCKnowsFarimAsWilliamsFriend == FALSE)
	{
		Info_AddChoice(DIA_Addon_Garvell_MissingPeople, " When was the last time you saw Monty? " ,DIA_Addon_Garvell_MissingPeople_wo);
	};
};

func void DIA_Addon_Garvell_MissingPeople_more()
{
	AI_Output(other,self, " DIA_Addon_Garvell_MissingPeople_more_15_00 " );	// I heard that other people were missing too.
	AI_Output(self,other, " DIA_Addon_Garvell_MissingPeople_more_04_01 " );	// What am I talking about! Bad times have come...
	AI_Output(self,other, " DIA_Addon_Garvell_MissingPeople_more_04_02 " );	// Fisherman Farim told me a similar story. His friend William is missing.
	AI_Output(self,other, " DIA_Addon_Garvell_MissingPeople_more_04_03 " );	// I'm pretty sure the orcs are behind this.
	SCKnowsFarimAsWilliamsFriend = TRUE;
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople, " Fisherman Farim seems to know something about the disappearance of his friend William. " );
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	Log_AddEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamMissing);
	Info_AddChoice(DIA_Addon_Garvell_MissingPeople,Dialog_Back,DIA_Addon_Garvell_MissingPeople_BACK);
	if (Farim.aivar[AIV_TalkedToPlayer] ==  FALSE )
	{
		Info_AddChoice(DIA_Addon_Garvell_MissingPeople, " Where can I find this Farim? " ,DIA_Addon_Garvell_MissingPeople_Farim);
	};
};

func void DIA_Addon_Garvell_MissingPeople_BACK()
{
	Info_ClearChoices(DIA_Addon_Garvell_MissingPeople);
};

func void DIA_Addon_Garvell_MissingPeople_Farim()
{
	AI_Output(other,self, " DIA_Addon_Garvell_MissingPeople_Farim_15_00 " );	// Where can I find this Farim?
	AI_Output(self,other, " DIA_Addon_Garvell_MissingPeople_Farim_04_01 " );	// He's a fisherman. I think you'll find it near the paladin supply depot. But I'm not sure.
	B_LogEntry(TOPIC_Addon_WhoStolePeople, " Farim's hut is near the paladin's provisions store. " );
};

func void DIA_Addon_Garvell_MissingPeople_wo()
{
	AI_Output(other,self, " DIA_Addon_Garvell_MissingPeople_wo_15_00 " );	// When was the last time you saw Monty?
	AI_Output(self,other, " DIA_Addon_Garvell_MissingPeople_wo_04_01 " );	// (angrily) The first time he didn't bother to come to work was two days ago.
};


instance DIA_Garvell_ReturnMonty(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 99;
	condition = DIA_Garvell_ReturnMonty_Condition;
	information = DIA_Garvell_ReturnMonty_Info;
	description = " How are things going? " ;
};


func int DIA_Garvell_ReturnMonty_Condition()
{
	if((Npc_GetDistToWP(Monty_NW,"NW_CITY_HABOUR_WERFT_IN_01") <= 1000) && (MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garvell_ReturnMonty_Info()
{
	AI_Output(other,self, " DIA_Addon_Garvell_ReturnMonty_15_00 " );	// How are things going?
	AI_Output(self,other, " DIA_Addon_Garvell_ReturnMonty_04_01 " );	// Monty is back! Now he is studying the drawings.
	AI_Output(self,other, " DIA_Addon_Garvell_ReturnMonty_04_02 " );	// Maybe now we can build a ship...
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Garvell_MISSION(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_MISSION_Condition;
	information = DIA_Garvell_MISSION_Info;
	permanent = FALSE;
	description = " Is there anything I can help you with? " ;
};


func int DIA_Garvell_MISSION_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Garvell_eilig ) && ( Chapter <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Garvell_MISSION_Info()
{
	AI_Output(other,self, " DIA_Garvell_MISSION_15_00 " );	// Is there anything I can do to help?
	AI_Output(self,other, " DIA_Garvell_MISSION_04_01 " );	// Yes, you can. Find out what the paladins are planning. I want to know why they are here.
	AI_Output(self,other, " DIA_Garvell_MISSION_04_02 " );	// And I need to know if the orcs are really going to attack us and how far from the city they are.
	AI_Output(self,other, " DIA_Garvell_MISSION_04_03 " );	// One of these abominations was seen quite near the city.
	AI_Output(self,other, " DIA_Garvell_MISSION_04_04 " );	// Just give me all the info you can get.
	AI_Output(self,other, " DIA_Garvell_Add_04_00 " );	// I need to know how much time I have left to build the ship.
	MIS_Garvell_Infos = LOG_Running;
	Knows_Ork = TRUE;
	Log_CreateTopic(TOPIC_Garvell,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Garvell,LOG_Running);
	B_LogEntry(TOPIC_Garvell, " Garvell wants to get information about the orcs and wants to know why the paladins are in town. " );
};

func void B_GarvellWeiter()
{
	AI_Output(self,other, " DIA_Garvell_Weiter_04_00 " );	// Good. If you find out anything else, let me know.
};

func void B_GarvellSuccess()
{
	AI_Output(self,other, " DIA_Garvell_Success_04_00 " );	// Thanks for the info. Apparently, we have as much time as we want to build a ship.
	MIS_Garvell_Infos = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Garvell,LOG_SUCCESS);
	B_LogEntry(TOPIC_Garvell, " I told Garvell what I could find out about paladins. " );
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Garvell_Orks(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 3;
	condition = DIA_Garvell_Orks_Condition;
	information = DIA_Garvell_Orks_Info;
	permanent = FALSE;
	description = " I have information about orcs. " ;
};


func int DIA_Garvell_Orks_Condition()
{
	if((MIS_Garvell_Infos == LOG_Running) && (Knows_Paladins >= 1))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Orks_Info()
{
	AI_Output(other,self, " DIA_Garvell_Orks_15_00 " );	// I have information about orcs.
	AI_Output(self,other,"DIA_Garvell_Orks_04_01");	//Выкладывай.
	AI_Output(other,self, " DIA_Garvell_Orks_15_02 " );	// They're stuck in Mining Valley, and it looks like they're going to stay there.
	AI_Output(other,self, " DIA_Garvell_Orks_15_03 " );	// To make it safe here, paladins guard the Passage.
	B_LogEntry(TOPIC_Garvell, " I informed Garvell that some of the paladins had gone to the Valley of Mines. " );
	Tell_Garvell = Tell_Garvell + 1;
	B_GivePlayerXP(XP_Ambient);

	if(Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};


instance DIA_Garvell_Paladine(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_Paladine_Condition;
	information = DIA_Garvell_Paladine_Info;
	permanent = FALSE;
	description = " I know why paladins are here. " ;
};


func int DIA_Garvell_Paladine_Condition()
{
	if((MIS_Garvell_Infos == LOG_Running) && (KnowsPaladins_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Paladine_Info()
{
	AI_Output(other,self, " DIA_Garvell_Paladine_15_00 " );	// I know why paladins are here.
	AI_Output(self,other, " DIA_Garvell_Paladine_04_01 " );	// True? Tell me!
	AI_Output(other,self, " DIA_Garvell_Paladine_15_02 " );	// The paladins are here to mine the magic ore in the Vale of Mines, not because they expect the orcs to attack the city.
	AI_Output(other,self, " DIA_Garvell_Paladine_15_03 " );	// Once they mine the ore, they will return to the mainland.
	B_LogEntry(TOPIC_Garvell, " I told Garvell why the paladins came to the island. " );
	Tell_Garvell = Tell_Garvell + 1;
	B_GivePlayerXP(XP_Ambient);

	if(Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};


instance DIA_Garvell_City(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 4;
	condition = DIA_Garvell_City_Condition;
	information = DIA_Garvell_City_Info;
	permanent = FALSE;
	description = " As for the orc near the city... " ;
};


func int DIA_Garvell_City_Condition()
{
	if((MIS_Garvell_Infos == LOG_Running) && (Knows_Paladins >= 2))
	{
		return TRUE;
	};
};

func void DIA_Garvell_City_Info()
{
	AI_Output(other,self, " DIA_Garvell_City_15_00 " );	// As for the orc near the city...
	AI_Output(self,other,"DIA_Garvell_City_04_01");	//Дааа?..
	AI_Output(other,self, " DIA_Garvell_City_15_02 " );	// Don't worry about him. The city guard will take care of him.
	B_LogEntry(TOPIC_Garvell, " I told Garvell not to worry about the orcs for now. " );
	Tell_Garvell = Tell_Garvell + 1;
	B_GivePlayerXP(XP_Ambient);

	if(Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};


instance DIA_Garvell_Perm(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 13;
	condition = DIA_Garvell_Perm_Condition;
	information = DIA_Garvell_Perm_Info;
	permanent = TRUE;
	description = " What's going on in the harbor? " ;
};


func int DIA_Garvell_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_MISSION))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Perm_Info()
{
	AI_Output(other,self, " DIA_Garvell_Perm_15_00 " );	// What's going on in the harbor?
	if(MIS_Garvell_Infos != LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Garvell_Perm_04_01 " );	// The orcs are breathing down our backs, and you ask about the harbor?
		AI_Output(other,self, " DIA_Garvell_Perm_15_02 " );	// I just wanted...
		AI_Output(self,other, " DIA_Garvell_Perm_04_03 " );	// The biggest problem is that there aren't enough ships in the harbor to get us out of here.
		AI_Output(self,other, " DIA_Garvell_Perm_04_04 " );	// To be honest, there's only one ship here, and it belongs to the paladins. And they certainly won't let us use it.
	}
	else
	{
		AI_Output(self,other, " DIA_Garvell_Perm_04_05 " );	// Look around, nothing has been happening here for a long time.
	};
};
