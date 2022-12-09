

instance DIA_OCVLK_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OCVLK_1_EXIT_Condition;
	information = DIA_OCVLK_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OCVLK_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCVLK_1_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_OCVLK_1_PEOPLE_Condition;
	information = DIA_OCVLK_1_PEOPLE_Info;
	permanent = TRUE;
	description = " Who's in charge here? " ;
};


func int DIA_OCVLK_1_PEOPLE_Condition()
{
	if ((Chapter <=  4 ) && (MIS_KilledDragons <  4 ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_OCVLK_1_PEOPLE_Info()
{
	AI_Output(other,self, " DIA_OCVLK_1_PEOPLE_15_00 " );	// Who's in charge here?
	AI_Output(self,other, " DIA_OCVLK_1_PEOPLE_01_01 " );	// Commander Garond. But since the situation worsened, he did not leave the throne room. I'm afraid this won't end well.
};


instance DIA_OCVLK_1_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_OCVLK_1_LOCATION_Condition;
	information = DIA_OCVLK_1_LOCATION_Info;
	permanent = TRUE;
	description = " What do you know about the Valley of Mines? " ;
};


func int DIA_OCVLK_1_LOCATION_Condition()
{
	if ((Chapter <=  4 ) && (MIS_KilledDragons <  4 ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_OCVLK_1_LOCATION_Info()
{
	AI_Output(other,self, " DIA_OCVLK_1_LOCATION_15_00 " );	// What do you know about the Valley of Mines?
	AI_Output(self,other, " DIA_OCVLK_1_LOCATION_01_01 " );	// As far as I know, a few of our guys are in the mines and still mining ore.
	AI_Output(self,other, " DIA_OCVLK_1_LOCATION_01_02 " );	// I wouldn't want to trade places with them. The whole valley is teeming with orcs. Not to mention dragons.
};


instance DIA_OCVLK_1_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_OCVLK_1_STANDARD_Condition;
	information = DIA_OCVLK_1_STANDARD_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_OCVLK_1_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_1_STANDARD_Info()
{
	AI_Output(other,self, " DIA_OCVLK_1_STANDARD_15_00 " );	// How are you?
	if (chapter <=  3 )
	{
		AI_Output(self,other, " DIA_OCVLK_1_STANDARD_01_01 " );	// Orcs cornered us like they wanted! None of us can survive without reinforcements! I'm surprised the dragons haven't finished us off yet.
	};
	if (chapter ==  4 )
	{
		if(MIS_KilledDragons < 4)
		{
			AI_Output(self,other, " DIA_OCVLK_1_STANDARD_01_02 " );	// At least we'll finally get reinforcements soon.
		}
		else
		{
			AI_Output(self,other, " DIA_OCVLK_1_STANDARD_01_03 " );	// I heard the dragons were destroyed? Glory to Innos!
		};
	};
	if (chapter ==  5 )
	{
		if(MIS_OCGateOpen == FALSE)
		{
			AI_Output(self,other, " DIA_OCVLK_1_STANDARD_01_04 " );	// All that damned ore. We needed to dump all our ore reserves from the walls of the fortress. Maybe then the orcs would leave us alone.
		}
		else
		{
			AI_Output(self,other, " DIA_OCVLK_1_STANDARD_01_05 " );	// Those idiotic crates they hastily piled in front of the entrance won't be able to stop the orcs!
		};
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_OCVLK_1_STANDARD_01_06 " );	// Worse than ever! But we will fight to the last!
	};
};

func void B_AssignAmbientInfos_OCVLK_1(var C_Npc slf)
{
	dia_ocvlk_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_people.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_location.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_standard.npc = Hlp_GetInstanceID(slf);
};

