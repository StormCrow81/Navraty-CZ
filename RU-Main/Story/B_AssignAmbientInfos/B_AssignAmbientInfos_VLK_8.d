

instance DIA_VLK_8_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_8_EXIT_Condition;
	information = DIA_VLK_8_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_8_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_8_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_8_JOIN_Condition;
	information = DIA_VLK_8_JOIN_Info;
	permanent = TRUE;
	description = " I want to become a citizen of this city! " ;
};


func int DIA_VLK_8_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_VLK_8_JOIN_Info()
{
	AI_Output(other,self, " DIA_VLK_8_JOIN_15_00 " );	// I want to become a citizen of this city!
	AI_Output(self,other, " DIA_VLK_8_JOIN_08_01 " );	// Why are you telling me this? Go to one of the master craftsmen in the lower part of the city. Maybe, if you're lucky, one of them needs an apprentice.
	AI_Output(self,other, " DIA_VLK_8_JOIN_08_02 " );	// Otherwise, you'll have to go to the mayor to register you as a citizen.
	AI_Output(self,other, " DIA_VLK_8_JOIN_08_03 " );	// But for now, you can forget about it. Since the paladins came, he doesn't decide anything anymore.
	AI_Output(self,other, " DIA_VLK_8_JOIN_08_04 " );	// And their leader, Lord Hagen, certainly doesn't have time for such trifles.
};


instance DIA_VLK_8_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_8_PEOPLE_Condition;
	information = DIA_VLK_8_PEOPLE_Info;
	permanent = TRUE;
	description = " Who are the most powerful citizens of this city? " ;
};


func int DIA_VLK_8_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_PEOPLE_Info()
{
	AI_Output(other, self, " DIA_VLK_8_PEOPLE_15_00 " );	// Who are the most powerful citizens of this city?
	AI_Output(self,other, " DIA_VLK_8_PEOPLE_08_01 " );	// Except for the paladins... master artisans from the lower part of the city. They are very influential.
};


instance DIA_VLK_8_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_8_LOCATION_Condition;
	information = DIA_VLK_8_LOCATION_Info;
	permanent = TRUE;
	description = " What's interesting here? " ;
};


func int DIA_VLK_8_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_LOCATION_Info()
{
	AI_Output(other,self, " DIA_VLK_8_LOCATION_15_00 " );	// What interesting things can be seen here?
	AI_Output(self,other, " DIA_VLK_8_LOCATION_08_01 " );	// The large ship that the paladins used to sail to the harbor. This is a huge ship! You definitely need to take a look at it.
	AI_Output(self,other, " DIA_VLK_8_LOCATION_08_02 " );	// But I doubt they'll let you on board. Paladins guard this ship better than royal diamonds.
	AI_Output(self,other, " DIA_VLK_8_LOCATION_08_03 " );	// Which is not surprising. This is the only sea vessel for many miles around.
};


instance DIA_VLK_8_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_8_STANDARD_Condition;
	information = DIA_VLK_8_STANDARD_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_VLK_8_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_STANDARD_Info()
{
	AI_Output(other,self, " DIA_VLK_8_STANDARD_15_00 " );	// What's new?
	if (chapter ==  1 )
	{
		AI_Output(self,other, " DIA_Addon_VLK_8_STANDARD_08_00 " );	// Everyone is worried.
		AI_Output(self,other, " DIA_Addon_VLK_8_STANDARD_08_01 " );	// It was not enough that the paladins settled here like at home, now people are constantly disappearing in the most strange way.
		AI_Output(self,other, " DIA_Addon_VLK_8_STANDARD_08_02 " );	// Time for the militia to finally do something about this.
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
		AI_Output(self,other, " DIA_VLK_8_STANDARD_08_01 " );	// Everyone is waiting for the paladins to announce why they're here. I believe it's because of the orcs. They will surely attack us soon!
		AI_Output(self,other, " DIA_VLK_8_STANDARD_08_02 " );	// Paladins may be blessed by Innos, but when the orc hordes show up here, I think we'll all be in trouble.
	};
	if (chapter ==  3 )
	{
		AI_Output(self,other, " DIA_VLK_8_STANDARD_08_03 " );	// I heard that the paladins are only here to dig all the ore out of the island. For the war on the mainland, they say.
		AI_Output(self,other, " DIA_VLK_8_STANDARD_08_04 " );	// Do you understand what this means? The king won't even lift a finger if we all die here during an orc attack.
		AI_Output(self,other, " DIA_VLK_8_STANDARD_08_05 " );	// I'll try to get on the ship when the paladins raise anchor.
	};
	if (chapter ==  4 )
	{
		AI_Output(self,other, " DIA_VLK_8_STANDARD_08_06 " );	// They say that the orcs will fly here on huge dragons, the size of half the city! We don't stand a chance!
	};
	if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_VLK_8_STANDARD_08_07 " );	// People talk that the dragons have been defeated. Is it true?
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_VLK_8_STANDARD_08_08 " );	// Better don't ask!
	};
};

func void B_AssignAmbientInfos_VLK_8(var C_Npc slf)
{
	dia_vlk_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_standard.npc = Hlp_GetInstanceID(slf);
};

