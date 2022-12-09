

instance DIA_OCPAL_4_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OCPAL_4_EXIT_Condition;
	information = DIA_OCPAL_4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OCPAL_4_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCPAL_4_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_OCPAL_4_PEOPLE_Condition;
	information = DIA_OCPAL_4_PEOPLE_Info;
	permanent = TRUE;
	description = " Who's in charge here? " ;
};


func int DIA_OCPAL_4_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_4_PEOPLE_Info()
{
	AI_Output(other, self, " DIA_OCPAL_4_PEOPLE_15_00 " );	// Who's in charge here?
	AI_Output(self,other, " DIA_OCPAL_4_PEOPLE_04_01 " );	// Commander Garond. You will find him in the biggest building of the castle.
};


instance DIA_OCPAL_4_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_OCPAL_4_LOCATION_Condition;
	information = DIA_OCPAL_4_LOCATION_Info;
	permanent = TRUE;
	description = " What can you tell me about the Valley of Mines? " ;
};


func int DIA_OCPAL_4_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_4_LOCATION_Info()
{
	AI_Output(other,self, " DIA_OCPAL_4_LOCATION_15_00 " );	// What can you tell me about the Valley of Mines?
	AI_Output(self,other, " DIA_OCPAL_4_LOCATION_04_01 " );	// As far as I know, there are several mines here, if they are not already captured by the orcs.
	AI_Output(self,other, " DIA_OCPAL_4_LOCATION_04_02 " );	// Miners who work in the mines are mostly convicts, but there are also a few paladins among them.
};


instance DIA_OCPAL_4_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_OCPAL_4_STANDARD_Condition;
	information = DIA_OCPAL_4_STANDARD_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_OCPAL_4_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_4_STANDARD_Info()
{
	AI_Output(other,self, " DIA_OCPAL_4_STANDARD_15_00 " );	// How are you?
	if (chapter <=  3 )
	{
		AI_Output(self,other, " DIA_OCPAL_4_STANDARD_04_01 " );	// Orcs have surrounded us! But we will defend ourselves to the last man! And Innos will help us against the dragons!
	};
	if (chapter ==  4 )
	{
		if(MIS_KilledDragons < 4)
		{
			AI_Output(self,other, " DIA_OCPAL_4_STANDARD_04_02 " );	// I think the orc attack won't be long in coming. Where are the damn reinforcements?
			if(other.guild == GIL_DJG)
			{
				AI_Output(self,other, " DIA_OCPAL_4_STANDARD_04_03 " );	// I hope you don't seriously think that you dragon hunters really have a chance against ALL dragons?
			}
			else
			{
				AI_Output(self,other, " DIA_OCPAL_4_STANDARD_04_04 " );	// These so-called dragon hunters can't do much!
			};
		}
		else
		{
			AI_Output(self,other, " DIA_OCPAL_4_STANDARD_04_05 " );	// Glory to Innos! Those damned creatures have been destroyed!
		};
	};
	if (chapter ==  5 )
	{
		if(MIS_OCGateOpen == FALSE)
		{
			AI_Output(self,other, " DIA_OCPAL_4_STANDARD_04_06 " );	// The death of the dragons didn't seem to make much of an impression on the orcs. And why, in the name of Innos, do they not leave? This is some kind of devilry!
		}
		else
		{
			AI_Output(self,other, " DIA_OCPAL_4_STANDARD_04_07 " );	// Those damn gates are jammed. Orcs are rushing into the castle, and nothing will stop them.
			AI_Output(self,other, " DIA_OCPAL_4_STANDARD_04_08 " );	// Someone needs to inform Lord Hagen. He is needed HERE and now.
		};
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_OCPAL_4_STANDARD_04_09 " );	// The fortress is taken by the orcs! Few survived.
	};
};

func void B_AssignAmbientInfos_OCPAL_4(var C_Npc slf)
{
	dia_ocpal_4_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_4_people.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_4_location.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_4_standard.npc = Hlp_GetInstanceID(slf);
};

