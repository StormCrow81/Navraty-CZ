

instance DIA_PAL_4_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_PAL_4_EXIT_Condition;
	information = DIA_PAL_4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_4_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_4_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_PAL_4_JOIN_Condition;
	information = DIA_PAL_4_JOIN_Info;
	permanent = TRUE;
	description = " How do I become a paladin? " ;
};


func int DIA_PAL_4_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_JOIN_Info()
{
	AI_Output(other,self, " DIA_PAL_4_JOIN_15_00 " );	// How do I become a paladin?
	AI_Output(self,other, " DIA_PAL_4_JOIN_04_01 " );	// If you're really serious, you should first enlist in the service of the paladins.
	AI_Output(self,other, " DIA_PAL_4_JOIN_04_02 " );	// Go to the barracks and talk to Lord Andre. Try joining the militia.
	AI_Output(self,other, " DIA_PAL_4_JOIN_04_03 " );	// Perhaps there you will have a chance to prove yourself.
};


instance DIA_PAL_4_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_PAL_4_PEOPLE_Condition;
	information = DIA_PAL_4_PEOPLE_Info;
	permanent = TRUE;
	description = " Who's in charge here? " ;
};


func int DIA_PAL_4_PEOPLE_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_PEOPLE_Info()
{
	AI_Output(other,self, " DIA_PAL_4_PEOPLE_15_00 " );	// Who's in charge here?
	AI_Output(self,other, " DIA_PAL_4_PEOPLE_04_01 " );	// Lord Hagen is the commander-in-chief of all troops on this island. He occupies the mayor's house while we are stationed here.
	AI_Output(self,other, " DIA_PAL_4_PEOPLE_04_02 " );	// But he's very busy. If you need anything, go to the barracks and talk to Lord Andre.
};


instance DIA_PAL_4_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_PAL_4_LOCATION_Condition;
	information = DIA_PAL_4_LOCATION_Info;
	permanent = TRUE;
	description = " What are you paladins doing here in Khorinis? " ;
};


func int DIA_PAL_4_LOCATION_Condition()
{
	if (chapter ==  1 )
	{
		return TRUE;
	};
};

func void DIA_PAL_4_LOCATION_Info()
{
	AI_Output(other,self, " DIA_PAL_4_LOCATION_15_00 " );	// What are you paladins doing here in Khorinis?
	AI_Output(self,other, " DIA_PAL_4_LOCATION_04_01 " );	// That's need-to-know, and you do not.
};


instance DIA_PAL_4_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_PAL_4_STANDARD_Condition;
	information = DIA_PAL_4_STANDARD_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_PAL_4_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_4_STANDARD_Info()
{
	AI_Output(other,self, " DIA_PAL_4_STANDARD_15_00 " );	// What's new?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if (chapter <=  4 )
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other, " DIA_PAL_4_STANDARD_04_01 " );	// Now that we know we're dealing with dragons, our commander will probably do something soon.
			}
			else
			{
				AI_Output(self,other, " DIA_PAL_4_STANDARD_04_02 " );	// We still don't have any news from our squad in the Mine Valley. This is very troubling.
			};
		};
		if (chapter ==  5 )
		{
			AI_Output(self,other, " DIA_PAL_4_STANDARD_04_03 " );	// O Praise to Innos! The dragon threat is no more. Now we only have to take care of the orcs to get to the ore.
		};
		if (Chapter >=  6 )
		{
			AI_Output(self,other, " DIA_PAL_4_STANDARD_04_05 " );	// We will stand here to the last! We have nowhere else to go anyway.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_PAL_4_STANDARD_04_04 " );	// I don't have time to discuss the rumors flying around the city.
	};
};

func void B_AssignAmbientInfos_PAL_4(var C_Npc slf)
{
	dia_pal_4_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_standard.npc = Hlp_GetInstanceID(slf);
};

