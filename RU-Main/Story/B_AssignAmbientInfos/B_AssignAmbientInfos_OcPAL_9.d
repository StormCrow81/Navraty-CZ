

instance DIA_OCPAL_9_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OCPAL_9_EXIT_Condition;
	information = DIA_OCPAL_9_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OCPAL_9_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_9_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCPAL_9_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_OCPAL_9_PEOPLE_Condition;
	information = DIA_OCPAL_9_PEOPLE_Info;
	permanent = TRUE;
	description = " Who's in charge here? " ;
};


func int DIA_OCPAL_9_PEOPLE_Condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_OCPAL_9_PEOPLE_Info()
{
	AI_Output(other,self, " DIA_OCPAL_9_PEOPLE_15_00 " );	// Who's in charge here?
	AI_Output(self,other, " DIA_OCPAL_9_PEOPLE_09_01 " );	// Garond. But I don't envy the man.
};


instance DIA_OCPAL_9_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_OCPAL_9_LOCATION_Condition;
	information = DIA_OCPAL_9_LOCATION_Info;
	permanent = TRUE;
	description = " What do you know about this valley? " ;
};


func int DIA_OCPAL_9_LOCATION_Condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_OCPAL_9_LOCATION_Info()
{
	AI_Output(other,self, " DIA_OCPAL_9_LOCATION_15_00 " );	// What do you know about this valley?
	AI_Output(self,other, " DIA_OCPAL_9_LOCATION_09_01 " );	// Well, that the orcs built a big defensive wall. Behind this wall there is a place where they can moor their ships.
	AI_Output(self,other, " DIA_OCPAL_9_LOCATION_09_02 " );	// I hope the orcs don't bring up their main force too quickly. For me, those that are already here are more than enough.
};


instance DIA_OCPAL_9_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_OCPAL_9_STANDARD_Condition;
	information = DIA_OCPAL_9_STANDARD_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_OCPAL_9_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_9_STANDARD_Info()
{
	AI_Output(other,self, " DIA_OCPAL_4_STANDARD_15_00 " );	// How are you?
	if (chapter <=  3 )
	{
		AI_Output(self,other, " DIA_OCPAL_4_STANDARD_09_01 " );	// The dragons attacked us again! But Innos protected us in this battle. Beliar's creatures will pay dearly for this!
	};
	if (chapter ==  4 )
	{
		if(MIS_KilledDragons < 4)
		{
			AI_Output(self,other, " DIA_OCPAL_4_STANDARD_09_02 " );	// Dragon hunters! They should have sent us paladins!
		}
		else
		{
			AI_Output(self,other, " DIA_OCPAL_4_STANDARD_09_03 " );	// Now that we've got rid of the dragons, we can deal with the orcs!
		};
	};
	if (chapter ==  5 )
	{
		if(MIS_OCGateOpen == FALSE)
		{
			AI_Output(self,other, " DIA_OCPAL_4_STANDARD_09_04 " );	// We need to get the ore to the ship and get out of this cursed land.
		}
		else
		{
			AI_Output(self,other, " DIA_OCPAL_4_STANDARD_09_05 " );	// Betrayal! The gate could not be opened! Death to traitors!
		};
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_OCPAL_4_STANDARD_09_06 " );	// After the castle fell, there is little hope left. Now only a miracle can save us!
	};
};

func void B_AssignAmbientInfos_OCPAL_9(var C_Npc slf)
{
	dia_ocpal_9_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_people.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_location.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_standard.npc = Hlp_GetInstanceID(slf);
};

