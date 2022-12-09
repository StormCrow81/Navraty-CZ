

instance DIA_MIL_7_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_MIL_7_EXIT_Condition;
	information = DIA_MIL_7_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MIL_7_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MIL_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_7_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_MIL_7_JOIN_Condition;
	information = DIA_MIL_7_JOIN_Info;
	permanent = TRUE;
	description = " I want to join the militia! " ;
};


func int DIA_MIL_7_JOIN_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_MIL_7_JOIN_Info()
{
	AI_Output(other,self, " DIA_MIL_7_JOIN_15_00 " );	// I want to join the militia!
	if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(self,other, " DIA_MIL_7_JOIN_07_01 " );	// You're not even a citizen of Khorinis! What makes you think that Lord Andre will take you?
		AI_Output(self,other, " DIA_MIL_7_JOIN_07_02 " );	// So everyone could step in, get weapons and armor for free, and then disappear with them!
		if(C_NpcIsInQuarter(self) != Q_KASERNE)
		{
			AI_Output(other,self, " DIA_MIL_7_JOIN_15_03 " );	// But I'm serious!
			AI_Output(self,other, " DIA_MIL_7_JOIN_07_04 " );	// Don't explain it to me, try explaining it to Lord Andre. You will find him in the barracks.
		};
	}
	else
	{
		B_Say(self,other,"$ABS_GOOD");
	};
};


instance DIA_MIL_7_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_MIL_7_PEOPLE_Condition;
	information = DIA_MIL_7_PEOPLE_Info;
	permanent = TRUE;
	description = " What do you know about paladins? " ;
};


func int DIA_MIL_7_PEOPLE_Condition()
{
	if(hero.guild != GIL_PAL)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_MIL_7_PEOPLE_Info()
{
	AI_Output(other,self, " DIA_MIL_7_PEOPLE_15_00 " );	// What do you know about paladins?
	AI_Output(self,other, " DIA_MIL_7_PEOPLE_07_01 " );	// Not much. No one really knows why they are here. Even those who are part of the city guard.
	AI_Output(self,other, " DIA_MIL_7_PEOPLE_07_02 " );	// They took all the power in the city into their own hands. They expelled the head of the city from the meeting room and the judge from his chamber.
	AI_Output(self,other, " DIA_MIL_7_PEOPLE_07_03 " );	// If you're interested in my opinion - that's even good. Those pompous asses should have been taught a lesson.
};


instance DIA_MIL_7_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_MIL_7_LOCATION_Condition;
	information = DIA_MIL_7_LOCATION_Info;
	permanent = TRUE;
	description = " What can I do in the city? " ;
};


func int DIA_MIL_7_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_MIL_7_LOCATION_Info()
{
	AI_Output(other,self, " DIA_MIL_7_LOCATION_15_00 " );	// What can I do in the city?
	AI_Output(self,other, " DIA_MIL_7_LOCATION_07_01 " );	// If you don't want to end up in a gutter in a port, find a permanent job. Ask in the lower part of the city - you might be lucky.
	AI_Output(self,other, " DIA_MIL_7_LOCATION_07_02 " );	// If you plan to stay in the city for a long time, you should consider joining the militia, or at least train in martial arts.
	AI_Output(self,other, " DIA_MIL_7_LOCATION_07_03 " );	// Combat instructors in the barracks also train civilians.
	AI_Output(self,other, " DIA_MIL_7_LOCATION_07_04 " );	// Orcs will come soon, and then you will be glad every hour spent on the parade ground.
};


instance DIA_MIL_7_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_MIL_7_STANDARD_Condition;
	information = DIA_MIL_7_STANDARD_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_MIL_7_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_MIL_7_STANDARD_Info()
{
	be int randy;
	AI_Output(other, self, " DIA_MIL_7_STANDARD_15_00 " );	// What's new?
	if (chapter ==  1 )
	{
		randy = Hlp_Random( 2 );
		if(randy == 0)
		{
			AI_Output(self,other, " DIA_Addon_MIL_7_STANDARD_07_00 " );	// Citizens disappear one by one. So far, we haven't been able to figure out what's wrong. Maybe the orcs are to blame?
			if(SC_HearedAboutMissingPeople == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
				B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
			};
			SC_HearedAboutMissingPeople = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_MIL_7_STANDARD_07_01 " );	// The farmers are said to have rebelled. We just didn't have enough of that. Just in the midst of the war with the orcs!
		};
	};
	if (chapter ==  2 )
	{
		AI_Output(self,other, " DIA_MIL_7_STANDARD_07_02 " );	// The paladins must put down the farmers' rebellion. Anyone who breaks the law must be punished. Especially now that the war is on.
	};
	if (chapter ==  3 )
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_MIL_7_STANDARD_07_03 " );	// The mercenary who was accused of killing Lothar turned out to be innocent. Someone was able to prove that he was slandered.
		}
		else
		{
			AI_Output(self,other, " DIA_MIL_7_STANDARD_07_04 " );	// One of Onar's mercenaries killed the noble paladin Lothar. But this bastard managed to be grabbed and thrown into jail.
		};
	};
	if (chapter ==  4 )
	{
		AI_Output(self,other, " DIA_MIL_7_STANDARD_07_05 " );	// Some of the mercenaries have already left Onar's farm. Some problems resolve themselves.
	};
	if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_MIL_7_STANDARZ_07_06 " );	// Every day the undead attack the city. Why are we all so guilty before Innos?!
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_MIL_7_STANDARD_07_07 " );	// We don't stand a chance against the elite orcs! Oh Innos, what will happen to us?!
	};
};

func void B_AssignAmbientInfos_MIL_7(var C_Npc slf)
{
	dia_mil_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_join.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_people.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_location.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_standard.npc = Hlp_GetInstanceID(slf);
};

