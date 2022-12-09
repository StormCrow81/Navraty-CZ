

instance DIA_MIL_6_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_MIL_6_EXIT_Condition;
	information = DIA_MIL_6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MIL_6_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MIL_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_6_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_MIL_6_JOIN_Condition;
	information = DIA_MIL_6_JOIN_Info;
	permanent = TRUE;
	description = " What do I need to do to join the militia? " ;
};


func int DIA_MIL_6_JOIN_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_MIL_6_JOIN_Info()
{
	AI_Output(other,self, " DIA_MIL_6_JOIN_15_00 " );	// What do I need to do to join the militia?
	AI_Output(self,other, " DIA_MIL_6_JOIN_06_01 " );	// Go to Lord Andre and talk to him. Since the paladins came to the city, he has been in command of the entire militia.
	if(C_NpcIsInQuarter(self) != Q_KASERNE)
	{
		AI_Output(self,other, " DIA_MIL_6_JOIN_06_02 " );	// You'll find him in the barracks. He is almost always there.
	};
};


instance DIA_Addon_MIL_6_MissingPeople(C_Info)
{
	nr = 2;
	condition = DIA_Addon_MIL_6_MissingPeople_Condition;
	information = DIA_Addon_MIL_6_MissingPeople_Info;
	permanent = TRUE;
	description = " I heard that several townspeople have disappeared. " ;
};


func int DIA_Addon_MIL_6_MissingPeople_Condition()
{
	if((Kapitel == 1) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_MIL_6_MissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_MIL_6_MissingPeople_15_00 " );	// I heard that several townspeople disappeared.
	AI_Output(self,other, " DIA_Addon_MIL_6_MissingPeople_06_01 " );	// And I recently heard rumors about people disappearing.
	AI_Output(self,other, " DIA_Addon_MIL_6_MissingPeople_06_02 " );	// I can't even imagine how this can be explained.
	AI_Output(self,other, " DIA_Addon_MIL_6_MissingPeople_06_03 " );	// And there's nothing we can do but keep our eyes open and do our duty as guards.
};


instance DIA_MIL_6_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_MIL_6_PEOPLE_Condition;
	information = DIA_MIL_6_PEOPLE_Info;
	permanent = TRUE;
	description = " Tell me about these paladins. " ;
};


func int DIA_MIL_6_PEOPLE_Condition()
{
	if(hero.guild != GIL_PAL)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_MIL_6_PEOPLE_Info()
{
	AI_Output(other, self, " DIA_MIL_6_PEOPLE_15_00 " );	// Tell me about these paladins.
	AI_Output(self,other, " DIA_MIL_6_PEOPLE_06_01 " );	// Ever since the paladins arrived in Khorinis, they've been staying in the upper quarter of the city.
	AI_Output(self,other, " DIA_MIL_6_PEOPLE_06_02 " );	// They don't let anyone in there anymore. Except for the citizens of the city and the militia, of course.
	AI_Output(self,other, " DIA_MIL_6_PEOPLE_06_03 " );	// There are also a few paladins guarding their ship in the harbor. But they are not particularly inclined to talk.
};


instance DIA_MIL_6_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_MIL_6_LOCATION_Condition;
	information = DIA_MIL_6_LOCATION_Info;
	permanent = TRUE;
	description = " What do I need to know about this city? " ;
};


func int DIA_MIL_6_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_MIL_6_LOCATION_Info()
{
	AI_Output(other,self, " DIA_MIL_6_LOCATION_15_00 " );	// What do I need to know about this city?
	AI_Output(self,other, " DIA_MIL_6_LOCATION_06_01 " );	// Paladins control the entire city. The militia is completely subordinate to them.
	AI_Output(self,other, " DIA_MIL_6_LOCATION_06_02 " );	// Lord Andre commands the militia, and at the same time he acts as a judge.
	AI_Output(self,other, " DIA_MIL_6_LOCATION_06_03 " );	// If you happen to break the law, you will have to face him.
	AI_Output(self,other, " DIA_MIL_6_LOCATION_06_04 " );	// But he's a pretty lenient judge, as far as I know. Usually the offenders get off with only a fine.
};


instance DIA_MIL_6_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_MIL_6_STANDARD_Condition;
	information = DIA_MIL_6_STANDARD_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_MIL_6_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_MIL_6_STANDARD_Info()
{
	AI_Output(other,self, " DIA_MIL_6_STANDARD_15_00 " );	// What's new?
	if (chapter ==  1 )
	{
		AI_Output(self,other, " DIA_MIL_6_STANDARD_06_01 " );	// Recently, the city is just flooded with all sorts of rabble.
		AI_Output(self,other, " DIA_MIL_6_STANDARD_06_02 " );	// Theft has become unbearable. Lord Andre suspects that this is the work of the gang.
		AI_Output(self,other, " DIA_MIL_6_STANDARD_06_03 " );	// Not so long ago, we turned the entire port block upside down, but found nothing.
	};
	if (chapter ==  2 )
	{
		AI_Output(self,other, " DIA_MIL_6_STANDARD_06_04 " );	// Looks like we've got the bandit issue under control. Raids happen less and less.
	};
	if (chapter ==  3 )
	{
		AI_Output(self,other, " DIA_MIL_6_STANDARD_06_05 " );	// The situation in the city is getting worse and worse. And all because of this rabble that flooded the city. Last night I followed a man in a black cassock upstairs.
		AI_Output(self,other, " DIA_MIL_6_STANDARD_06_06 " );	// I'm sure he's up to something bad. But when I approached him at the town hall, he simply disappeared. A very suspicious person...
	};
	if (chapter ==  4 )
	{
		AI_Output(self,other, " DIA_MIL_6_STANDARD_06_07 " );	// Lord Hagen is said to have hired mercenaries to fight the dragons. I don't care, although I myself would not mind fighting a dragon.
	};
	if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_MIL_6_STANDARZ_06_08 " );	// The city is being besieged by the undead! We are all having a hard time.
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_MIL_6_STANDARD_06_09 " );	// Damned orcs! You should have seen what a massacre they made in the city!
	};
};

func void B_AssignAmbientInfos_MIL_6(var C_Npc slf)
{
	dia_mil_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_join.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_people.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_location.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_standard.npc = Hlp_GetInstanceID(slf);
};

