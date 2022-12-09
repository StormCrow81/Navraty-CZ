

instance DIA_BAU_16_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_16_EXIT_Condition;
	information = DIA_BAU_16_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_16_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_16_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_BAU_16_JOIN_Condition;
	information = DIA_BAU_16_JOIN_Info;
	permanent = TRUE;
	description = " Tell me more about these mercenaries! " ;
};


func int DIA_BAU_16_JOIN_Condition()
{
	if (chapter ==  1 )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_BAU_16_JOIN_Info()
{
	AI_Output(other,self, " DIA_BAU_16_JOIN_15_00 " );	// Tell me more about these mercenaries!
	AI_Output(self,other, " DIA_BAU_16_JOIN_16_01 " );	// They roam around the farm, fighting sometimes, and they think it's funny.
};


instance DIA_BAU_16_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_16_PEOPLE_Condition;
	information = DIA_BAU_16_PEOPLE_Info;
	permanent = TRUE;
	description = " Who's in charge here? " ;
};


func int DIA_BAU_16_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_PEOPLE_Info()
{
	AI_Output(other,self, " DIA_BAU_16_PEOPLE_15_00 " );	// Who's in charge here?
	AI_Output(self,other, " DIA_BAU_16_PEOPLE_16_01 " );	// Mercenaries, of course.
	AI_Output(self,other, " DIA_BAU_16_PEOPLE_16_02 " );	// Onar pays them, but most of the time they do whatever they want.
};


instance DIA_BAU_16_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_16_LOCATION_Condition;
	information = DIA_BAU_16_LOCATION_Info;
	permanent = TRUE;
	description = " What can you tell me about this quarter? " ;
};


func int DIA_BAU_16_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_LOCATION_Info()
{
	AI_Output(other,self, " DIA_BAU_16_LOCATION_15_00 " );	// What can you tell interesting about this area?
	AI_Output(self,other, " DIA_BAU_16_LOCATION_16_01 " );	// There are three farms here. Onar's farm is to the east, and Sekoba's is to the north of the valley.
	AI_Output(self,other, " DIA_BAU_16_LOCATION_16_02 " );	// From here, a stone staircase leads to the mountains in the southwest. Bengar's farm is located there.
};


DIA_BAU_16_STANDARD (C_Info) instances
{
	nr = 1;
	condition = DIA_BAU_16_STANDARD_Condition;
	information = DIA_BAU_16_STANDARD_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_BAU_16_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_STANDARD_Info()
{
	AI_Output(other,self, " DIA_BAU_16_STANDARD_15_00 " );	// What's new?
	if (chapter ==  1 )
	{
		AI_Output(self,other, " DIA_BAU_16_STANDARD_16_01 " );	// Soldiers from the city no longer take our livestock and crops! We don't play these games anymore. Now we are able to protect ourselves!
	};
	if (chapter ==  2 )
	{
		AI_Output(self,other, " DIA_BAU_16_STANDARD_16_02 " );	// They say that an army of evil is gathering in the Valley of Mines. They will be here soon.
	};
	if (chapter ==  3 )
	{
		AI_Output(self,other, " DIA_BAU_16_STANDARD_16_03 " );	// I heard that dragons have appeared in the Valley of Mines. But I don't really believe it.
	};
	if (chapter ==  4 )
	{
		AI_Output(self,other, " DIA_BAU_16_STANDARD_16_04 " );	// Some of the mercenaries left here. I don't even know if that's good or bad.
	};
	if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_BAU_16_STANDARZ_16_05 " );	// The undead have taken over all of Khorinis! Now even a step is dangerous to step outside the farm.
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_BAU_16_STANDARD_16_06 " );	// Paladins didn't stand a chance. The orcs crushed their defenses in a matter of minutes. What will happen to us?!
	};
};

func void B_AssignAmbientInfos_BAU_16(var C_Npc slf)
{
	dia_bau_16_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_standard.npc = Hlp_GetInstanceID(slf);
};

