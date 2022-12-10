

instance DIA_BAU_13_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_13_EXIT_Condition;
	information = DIA_BAU_13_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_13_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_BAU_13_JOIN_Condition;
	information = DIA_BAU_13_JOIN_Info;
	permanent = TRUE;
	description = " Tell me more about these mercenaries! " ;
};


func int DIA_BAU_13_JOIN_Condition()
{
	if (chapter ==  1 )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_BAU_13_JOIN_Info()
{
	AI_Output(other,self, " DIA_BAU_13_JOIN_15_00 " );	// Tell me more about these mercenaries!
	AI_Output(self,other, " DIA_BAU_13_JOIN_13_01 " );	// If you have any problems with them, go to Lee. We farmers do this all the time. He keeps his people on a tight leash.
	AI_Output(self,other, " DIA_BAU_13_JOIN_13_02 " );	// If any of them misbehave too badly, they risk getting into trouble.
};


instance DIA_BAU_13_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_13_PEOPLE_Condition;
	information = DIA_BAU_13_PEOPLE_Info;
	permanent = TRUE;
	description = " Who's in charge here? " ;
};


func int DIA_BAU_13_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_PEOPLE_Info()
{
	AI_Output(other,self, " DIA_BAU_13_PEOPLE_15_00 " );	// Who's in charge here?
	AI_Output(self,other, " DIA_BAU_13_PEOPLE_13_01 " );	// If you're interested in my opinion - then the mercenaries. Of course, Onar pays them, but only Innos knows how much longer they will obey his orders.
	AI_Output(self,other, " DIA_BAU_13_PEOPLE_13_02 " );	// I wouldn't want to be in his shoes if it suddenly dawned on the mercenaries that they could do without him.
};


instance DIA_BAU_13_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_13_LOCATION_Condition;
	information = DIA_BAU_13_LOCATION_Info;
	permanent = TRUE;
	description = " What can you tell me about this area? " ;
};


func int DIA_BAU_13_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_LOCATION_Info()
{
	AI_Output(other,self, " DIA_BAU_13_LOCATION_15_00 " );	// What can you tell me about this area?
	AI_Output(self,other, " DIA_BAU_13_LOCATION_13_01 " );	// There are three farms here. Onar's farm to the east and Sekoba's to the north at the end of the valley.
	AI_Output(self,other, " DIA_BAU_13_LOCATION_13_02 " );	// In the southwest there is a passage to a high plateau. Bengar's farm is located there.
};


DIA_BAU_13_STANDARD (C_Info) instances
{
	nr = 1;
	condition = DIA_BAU_13_STANDARD_Condition;
	information = DIA_BAU_13_STANDARD_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_BAU_13_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_STANDARD_Info()
{
	AI_Output(other,self, " DIA_BAU_13_STANDARD_15_00 " );	// What's new?
	if (chapter ==  1 )
	{
		AI_Output(self,other, " DIA_BAU_13_STANDARD_13_01 " );	// Troops from the city no longer take our crops and livestock! They didn't want to play that game anymore when we started defending ourselves.
	};
	if (chapter ==  2 )
	{
		AI_Output(self,other, " DIA_BAU_13_STANDARD_13_02 " );	// Paladins from the city don't care about the fate of the farmers. If the orcs attack, we will be left to fend for ourselves.
	};
	if (chapter ==  3 )
	{
		AI_Output(self,other, " DIA_BAU_13_STANDARD_13_03 " );	// Dragons! There are rumors that dragons have appeared in the Valley of Mines. They'll get to the Passage soon!
	};
	if (chapter ==  4 )
	{
		AI_Output(self,other, " DIA_BAU_13_STANDARD_13_04 " );	// They say that the bandits from the mountains went to the Valley of Mines. No idea why.
	};
	if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_BAU_13_STANDARZ_13_05 " );	// As if you don't know?! These places are just teeming with all sorts of ghouls.
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_BAU_13_STANDARD_13_06 " );	// Orcs almost completely control this part of the island. Soon they will come here too!
	};
};

func void B_AssignAmbientInfos_BAU_13(var C_Npc slf)
{
	dia_bau_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_standard.npc = Hlp_GetInstanceID(slf);
};

