

instance DIA_PAL_12_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_PAL_12_EXIT_Condition;
	information = DIA_PAL_12_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_12_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_12_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_12_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_PAL_12_JOIN_Condition;
	information = DIA_PAL_12_JOIN_Info;
	permanent = TRUE;
	description = " I want to become a paladin! " ;
};


func int DIA_PAL_12_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_PAL_12_JOIN_Info()
{
	AI_Output(other, self, " DIA_PAL_12_JOIN_15_00 " );	// I want to become a paladin!
	AI_Output(self,other, " DIA_PAL_12_JOIN_12_01 " );	// You? Do not make me laugh! You don't even serve in the city guard.
	AI_Output(self,other, " DIA_PAL_12_JOIN_12_02 " );	// If I hadn't seen that in front of me was just a stupid hillbilly, I would have thought that you were mocking me.
	AI_Output(self,other, " DIA_PAL_12_JOIN_12_03 " );	// Only the best of the best, the most devoted followers of the king and our Lord Innos, can be accepted as paladins.
};


instance DIA_PAL_12_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_PAL_12_PEOPLE_Condition;
	information = DIA_PAL_12_PEOPLE_Info;
	permanent = TRUE;
	description = " Who's in charge here? " ;
};


func int DIA_PAL_12_PEOPLE_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_PAL_12_PEOPLE_Info()
{
	AI_Output(other,self, " DIA_PAL_12_PEOPLE_15_00 " );	// Who's in charge here?
	AI_Output(self,other, " DIA_PAL_12_PEOPLE_12_01 " );	// Honorable Lord Hagen. But Lord Andre is in charge of all matters concerning the common people.
	AI_Output(self,other, " DIA_PAL_12_PEOPLE_12_02 " );	// You'll find him in the barracks. Maybe you will be lucky and he will give you a few minutes of his precious time.
};


instance DIA_PAL_12_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_PAL_12_LOCATION_Condition;
	information = DIA_PAL_12_LOCATION_Info;
	permanent = TRUE;
	description = " What are you paladins doing here in Khorinis? " ;
};


func int DIA_PAL_12_LOCATION_Condition()
{
	if (chapter ==  1 )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_PAL_12_LOCATION_Info()
{
	AI_Output(other,self, " DIA_PAL_12_LOCATION_15_00 " );	// What are you paladins doing here in Khorinis?
	AI_Output(self,other, " DIA_PAL_12_LOCATION_12_01 " );	// People who ask such questions end their lives on the gallows before they know it.
	AI_Output(self,other, " DIA_PAL_12_LOCATION_12_02 " );	// The ONLY thing Lord Andre can't afford is to allow information about our missions to fall into the hands of spies.
	AI_Output(self,other, " DIA_PAL_12_LOCATION_12_03 " );	// So you better watch your questions.
};


instance DIA_PAL_12_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_PAL_12_STANDARD_Condition;
	information = DIA_PAL_12_STANDARD_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_PAL_12_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_12_STANDARD_Info()
{
	AI_Output(other,self, " DIA_PAL_12_STANDARD_15_00 " );	// How setting?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if (chapter <=  4 )
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other, " DIA_PAL_12_STANDARD_12_01 " );	// Now that we know we're dealing with dragons, our commander will probably do something soon.
			}
			else
			{
				AI_Output(self,other, " DIA_PAL_12_STANDARD_12_02 " );	// We still don't have any news from our squad in the Mine Valley. This is a warning sign.
			};
		};
		if (chapter ==  5 )
		{
			AI_Output(self,other, " DIA_PAL_12_STANDARZ_12_03 " );	// If not for the paladins, the city would have fallen under the onslaught of the undead hordes long ago!
		};
		if (Chapter >=  6 )
		{
			AI_Output(self,other, " DIA_PAL_12_STANDARD_12_05 " );	// Are you still asking?! Boy, look around and you'll understand!
		};
	}
	else
	{
		AI_Output(self,other, " DIA_PAL_12_STANDARD_12_04 " );	// Do you really expect me to answer this question, young man?!
	};
};

func void B_AssignAmbientInfos_PAL_12(var C_Npc slf)
{
	dia_pal_12_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_standard.npc = Hlp_GetInstanceID(slf);
};

