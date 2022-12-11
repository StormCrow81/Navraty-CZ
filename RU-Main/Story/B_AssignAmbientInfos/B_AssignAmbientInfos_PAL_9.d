

instance DIA_PAL_9_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_PAL_9_EXIT_Condition;
	information = DIA_PAL_9_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_9_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_9_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_PAL_9_JOIN_Condition;
	information = DIA_PAL_9_JOIN_Info;
	permanent = TRUE;
	description = " How do I become a paladin? " ;
};


func int DIA_PAL_9_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_PAL_9_JOIN_Info()
{
	AI_Output(other,self, " DIA_PAL_9_JOIN_15_00 " );	// How do I become a paladin?
	AI_Output(self,other, " DIA_PAL_9_JOIN_09_01 " );	// Only those who have proven their commitment to the service of Innos or the king can become a paladin!
	AI_Output(self,other, " DIA_PAL_9_JOIN_09_02 " );	// Put simply, only the best of the best can become paladins. You still have a long way to go, my boy!
};


instance DIA_PAL_9_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_PAL_9_PEOPLE_Condition;
	information = DIA_PAL_9_PEOPLE_Info;
	permanent = TRUE;
	description = " Who's in charge here? " ;
};


func int DIA_PAL_9_PEOPLE_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_PAL_9_PEOPLE_Info()
{
	AI_Output(other,self, " DIA_PAL_9_PEOPLE_15_00 " );	// Who's in charge here?
	AI_Output(self,other, " DIA_PAL_9_PEOPLE_09_01 " );	// Lord Hagen.
	AI_Output(other,self,"DIA_PAL_9_PEOPLE_15_02");	//И?
	AI_Output(self,other, " DIA_PAL_9_PEOPLE_09_03 " );	// He is the supreme commander of this entire island.
};


instance DIA_PAL_9_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_PAL_9_LOCATION_Condition;
	information = DIA_PAL_9_LOCATION_Info;
	permanent = TRUE;
	description = " Why did the paladins come to Khorinis? " ;
};


func int DIA_PAL_9_LOCATION_Condition()
{
	if (chapter ==  1 )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_PAL_9_LOCATION_Info()
{
	AI_Output(other,self, " DIA_PAL_9_LOCATION_15_00 " );	// Why did the paladins come to Khorinis?
	AI_Output(self,other, " DIA_PAL_9_LOCATION_09_01 " );	// It's none of your business, mate! It is enough for you to know that we serve Innos and the king, unquestioningly!
};


instance DIA_PAL_9_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_PAL_9_STANDARD_Condition;
	information = DIA_PAL_9_STANDARD_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_PAL_9_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_9_STANDARD_Info()
{
	AI_Output(other,self,"DIA_PAL_9_STANDARD_15_00");	//How are you?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if (chapter <=  4 )
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other, " DIA_PAL_9_STANDARD_09_01 " );	// Now that we know we're dealing with dragons, our commander will probably do something soon.
			}
			else
			{
				AI_Output(self,other, " DIA_PAL_9_STANDARD_09_02 " );	// Still no word from our squad in the Valley of Mines. It is... concerning.
			};
		};
		if (chapter ==  5 )
		{
			AI_Output(self,other, " DIA_PAL_9_STANDARZ_09_03 " );	// The dragon threat is gone, only to be replaced by a plague of the undead!
		};
		if (Chapter >=  6 )
		{
			AI_Output(self,other, " DIA_PAL_9_STANDARD_09_05 " );	// We won't just give up! The orcs will get theirs, you can be sure.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_PAL_9_STANDARD_09_04 " );	// If you don't have anything else to say, get the fuck outta here!
	};
};

func void B_AssignAmbientInfos_PAL_9(var C_Npc slf)
{
	dia_pal_9_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_standard.npc = Hlp_GetInstanceID(slf);
};

