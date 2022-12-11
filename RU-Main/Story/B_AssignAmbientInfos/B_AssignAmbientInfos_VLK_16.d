

instance DIA_VLK_16_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_16_EXIT_Condition;
	information = DIA_VLK_16_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_16_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_16_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_16_JOIN_Condition;
	information = DIA_VLK_16_JOIN_Info;
	permanent = TRUE;
	description = " I want to become a citizen of this city! " ;
};


func int DIA_VLK_16_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_VLK_16_JOIN_Info()
{
	AI_Output(other,self, " DIA_VLK_16_JOIN_15_00 " );	// I want to become a citizen of this city!
	AI_Output(self,other, " DIA_VLK_16_JOIN_16_01 " );	// Will you help us defend against the orcs?
	AI_Output(self,other, " DIA_VLK_16_JOIN_16_02 " );	// If you are a citizen of Khorinis, you can join the militia - talk to one of the city guards.
};


instance DIA_VLK_16_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_16_PEOPLE_Condition;
	information = DIA_VLK_16_PEOPLE_Info;
	permanent = TRUE;
	description = " Who are the most powerful people here? " ;
};


func int DIA_VLK_16_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_PEOPLE_Info()
{
	AI_Output(other,self, " DIA_VLK_16_PEOPLE_15_00 " );	// Who are the most powerful people here?
	AI_Output(self,other, " DIA_VLK_16_PEOPLE_16_01 " );	// The Paladins who live in the upper quarter.
};


instance DIA_VLK_16_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_16_LOCATION_Condition;
	information = DIA_VLK_16_LOCATION_Info;
	permanent = TRUE;
	description = " What's interesting here? " ;
};


func int DIA_VLK_16_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_LOCATION_Info()
{
	AI_Output(other,self, " DIA_VLK_16_LOCATION_15_00 " );	// What interesting things can be found here?
	AI_Output(self,other, " DIA_VLK_16_LOCATION_16_01 " );	// In the market, you can buy almost anything.
};


instance DIA_VLK_16_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_16_STANDARD_Condition;
	information = DIA_VLK_16_STANDARD_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_VLK_16_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_STANDARD_Info()
{
	AI_Output(other, self, " DIA_VLK_16_STANDARD_15_00 " );	// What's new?
	if (chapter ==  1 )
	{
		AI_Output(self,other, " DIA_Addon_VLK_16_STANDARD_16_00 " );	// I hope the militia will finally find out where the people of Khorinis are dissapearing to.
		AI_Output(self,other, " DIA_Addon_VLK_16_STANDARD_16_01 " );	// You start to fear for your life when you hear how many people are going missing.
		if(SC_HearedAboutMissingPeople == FALSE)
		{
			Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
			B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
		};
		SC_HearedAboutMissingPeople = TRUE;
	};
	if (chapter ==  2 )
	{
		AI_Output(self,other, " DIA_VLK_16_STANDARD_16_01 " );	// Haven't you heard? Orcs are already near the city! Let's just hope the paladins have enough men.
		AI_Output(self,other, " DIA_VLK_16_STANDARD_16_02 " );	// I wonder why farmers don't come to the market anymore?
	};
	if (chapter ==  3 )
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_VLK_16_STANDARD_16_03 " );	// The mercenary who everyone thought killed Lothar turned out to be innocent. Found evidence that he was slandered. I heard about it in the market.
		}
		else
		{
			AI_Output(self,other, " DIA_VLK_16_STANDARD_16_04 " );	// This is outrageous. Onar's mercenaries killed the respected paladin Lothar in broad daylight.
			AI_Output(self,other, " DIA_VLK_16_STANDARD_16_05 " );	// But Innos will surely punish them for their sins. No one is allowed to raise a hand against a soldier of our Lord.
		};
	};
	if (chapter ==  4 )
	{
		AI_Output(self,other, " DIA_VLK_16_STANDARD_16_06 " );	// I heard that those criminals are fleeing from Onar's farm. They are said to fear the retribution of Lord Hagen's paladins, and are fleeing back to the Valley of the Mines.
	};
	if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_VLK_16_STANDARD_16_07 " );	// I heard that the paladins managed to destroy all thr terrible dragons from the Valley of Mines!
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_VLK_16_STANDARD_16_08 " );	// Orcs have invaded Khorinis and occupied the city. Now it's only a matter of time before they finish us all!
	};
};

func void B_AssignAmbientInfos_VLK_16(var C_Npc slf)
{
	dia_vlk_16_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_standard.npc = Hlp_GetInstanceID(slf);
};

