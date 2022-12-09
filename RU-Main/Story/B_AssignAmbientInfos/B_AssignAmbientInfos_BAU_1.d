

instance DIA_BAU_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_1_EXIT_Condition;
	information = DIA_BAU_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_1_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_BAU_1_JOIN_Condition;
	information = DIA_BAU_1_JOIN_Info;
	permanent = TRUE;
	description = " Tell me more about these mercenaries. " ;
};


func int DIA_BAU_1_JOIN_Condition()
{
	if (chapter ==  1 )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_BAU_1_JOIN_Info()
{
	AI_Output(other, self, " DIA_BAU_1_JOIN_15_00 " );	// Tell me more about these mercenaries.
	AI_Output(self,other, " DIA_BAU_1_JOIN_01_01 " );	// I can only advise you to stay away from them.
	AI_Output(self,other, " DIA_BAU_1_JOIN_01_02 " );	// If one of them doesn't like your face, they can punch you in the nose without hesitation.
	AI_Output(self,other, " DIA_BAU_1_JOIN_01_03 " );	// Of course, after that you can complain to Lee, but the nose will already be broken.
};


instance DIA_BAU_1_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_1_PEOPLE_Condition;
	information = DIA_BAU_1_PEOPLE_Info;
	permanent = TRUE;
	description = " Who's in charge here? " ;
};


func int DIA_BAU_1_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_PEOPLE_Info()
{
	AI_Output(other,self, " DIA_BAU_1_PEOPLE_15_00 " );	// Who's in charge here?
	AI_Output(self,other, " DIA_BAU_1_PEOPLE_01_01 " );	// This is Onar's farm. Here he makes all the decisions.
	AI_Output(self,other, " DIA_BAU_1_PEOPLE_01_02 " );	// Let me give you some advice: don't get into a fight with his mercenaries. These guys are not to be trifled with.
	AI_Output(self,other, " DIA_BAU_1_PEOPLE_01_03 " );	// Silvio is generally a notorious bandit. But their leader, Lee, is a perfectly normal guy.
};


instance DIA_BAU_1_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_1_LOCATION_Condition;
	information = DIA_BAU_1_LOCATION_Info;
	permanent = TRUE;
	description = " What's interesting here? " ;
};


func int DIA_BAU_1_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_LOCATION_Info()
{
	AI_Output(other, self, " DIA_BAU_1_LOCATION_15_00 " );	// What's interesting here?
	AI_Output(self,other, " DIA_BAU_1_LOCATION_01_01 " );	// There are only fields and farms here. And a handful of mercenaries. But almost all of them are in the east, on Onar's farm.
	AI_Output(self,other, " DIA_BAU_1_LOCATION_01_02 " );	// Secoba's farm is to the north, but they only go there to collect rent.
	AI_Output(self,other, " DIA_BAU_1_LOCATION_01_03 " );	// To the south is a passage to Bengar's farm.
};


instances of DIA_BAU_1_STANDARD (C_Info)
{
	nr = 1;
	condition = DIA_BAU_1_STANDARD_Condition;
	information = DIA_BAU_1_STANDARD_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_BAU_1_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_STANDARD_Info()
{
	AI_Output(other,self, " DIA_BAU_1_STANDARD_15_00 " );	// What's new?
	if (chapter ==  1 )
	{
		AI_Output(self,other, " DIA_BAU_1_STANDARD_01_01 " );	// Onar hired mercenaries to protect him from the city's militia. If not for the mercenaries, they would have taken everything from us, to the last sheep!
	};
	if (chapter ==  2 )
	{
		AI_Output(self,other, " DIA_BAU_1_STANDARD_01_02 " );	// Not much. As always, the same problems. Militia, orcs and field predators.
	};
	if (chapter ==  3 )
	{
		AI_Output(self,other, " DIA_BAU_1_STANDARD_01_03 " );	// Strange things are happening here. A few days ago I saw a figure in black. It wasn't a person.
	};
	if (chapter ==  4 )
	{
		AI_Output(self,other, " DIA_BAU_1_STANDARD_01_04 " );	// More and more orcs appear here. Sometimes it seems to me that for every orc killed, two more appear.
	};
	if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_BAU_1_STANDARZ_01_05 " );	// This undead is driving me crazy! If this continues, we will all have a hard time.
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_BAU_1_STANDARD_01_06 " );	// Orcs have captured Khorinis! Now we all will soon come to an end!
	};
};

func void B_AssignAmbientInfos_BAU_1(var C_Npc slf)
{
	dia_bau_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_standard.npc = Hlp_GetInstanceID(slf);
};

