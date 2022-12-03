

instance DIA_PAL_7518_RITTER_EXIT(C_Info)
{
	npc = pal_7518_ritter;
	nr = 999;
	condition = dia_pal_7518_ritter_exit_condition;
	information = dia_pal_7518_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_7518_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_7518_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_7518_RITTER_PEOPLE(C_Info)
{
	npc = pal_7518_ritter;
	nr = 3;
	condition = dia_pal_7518_ritter_people_condition;
	information = dia_pal_7518_ritter_people_info;
	permanent = TRUE;
	description = " Who is your commander? " ;
};


func int dia_pal_7518_ritter_people_condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void dia_pal_7518_ritter_people_info()
{
	AI_Output(other,self, " DIA_PAL_7518_RITTER_People_01_00 " );	// Who's in charge here?
	AI_Output(self,other, " DIA_PAL_7518_RITTER_People_01_01 " );	// Our squad is now led by paladin Albert.
	AI_Output(self,other, " DIA_PAL_7518_RITTER_PEOPLE_01_02 " );	// You'll find him deep in a cave not far from here.
};


instance DIA_PAL_7518_RITTER_LOCATION(C_Info)
{
	npc = pal_7518_ritter;
	nr = 2;
	condition = dia_pal_7518_ritter_location_condition;
	information = dia_pal_7518_ritter_location_info;
	permanent = TRUE;
	description = " What can you tell us about the area? " ;
};


func int dia_pal_7518_ritter_location_condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void dia_pal_7518_ritter_location_info()
{
	AI_Output(other,self, " DIA_PAL_7518_RITTER_LOCATION_01_00 " );	// What can you tell interesting about this area?
	AI_Output(self,other, " DIA_PAL_7518_RITTER_LOCATION_01_01 " );	// Upstairs, above us is a camp of former convicts.
	AI_Output(self,other, " DIA_PAL_7518_RITTER_LOCATION_01_02 " );	// Although they do not revere Innos, they can still be dealt with.
	AI_Output(self,other, " DIA_PAL_7518_RITTER_LOCATION_01_03 " );	// Across the river is a rather dangerous forest, but there are no orcs in it!
	AI_Output(self,other, " DIA_PAL_7518_RITTER_LOCATION_01_04 " );	// They're all down on the coast - they kind of have a camp there.
};


instance DIA_PAL_7518_RITTER_STANDARD(C_Info)
{
	npc = pal_7518_ritter;
	nr = 1;
	condition = dia_pal_7518_ritter_standard_condition;
	information = dia_pal_7518_ritter_standard_info;
	permanent = TRUE;
	description = " How are things? " ;
};


func int dia_pal_7518_ritter_standard_condition()
{
	return TRUE;
};

func void dia_pal_7518_ritter_standard_info()
{
	AI_Output(other,self, " DIA_PAL_7518_RITTER_Standard_01_00 " );	// How setting?
	AI_Output(self,other, " DIA_PAL_7518_RITTER_Standard_01_01 " );	// So far everything is quiet.
};


instance DIA_PAL_7518_RITTER_GOTOKILLORCSLAVES(C_Info)
{
	npc = pal_7518_ritter;
	nr = 1;
	condition = dia_pal_7518_ritter_gotokillorcslaves_condition;
	information = dia_pal_7518_ritter_gotokillorcslaves_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_7518_ritter_gotokillorcslaves_condition()
{
	if (( MY_ORDER  == LOG_Running ) && ( GOTOKILLORCSLAVES  ==  TRUE ) && ( GOTOKILLORCSLAVESDONE  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_pal_7518_ritter_gotokillorcslaves_info()
{
	AI_Output(self,other, " DIA_PAL_7518_RITTER_GoToKillOrcSlaves_01_00 " );	// I received an order from Albert to help you with the orc squad.
	AI_Output(other,self, " DIA_PAL_7518_RITTER_GoToKillOrcSlaves_01_01 " );	// Of course! Follow me.
	AI_Output(self,other,"DIA_PAL_7518_RITTER_GoToKillOrcSlaves_01_02");	//Хорошо.
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	Npc_ExchangeRoutine(self,"FOLLOW");
	PALONEORCSLAVE = TRUE;
};


instance DIA_PAL_7518_RITTER_GOTOKILLORCSLAVESDONE(C_Info)
{
	npc = pal_7518_ritter;
	nr = 1;
	condition = dia_pal_7518_ritter_gotokillorcslavesdone_condition;
	information = dia_pal_7518_ritter_gotokillorcslavesdone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_7518_ritter_gotokillorcslavesdone_condition()
{
	if((MIS_ORCORDER == LOG_Running) && (GOTOKILLORCSLAVES == TRUE) && (PALONEORCSLAVE == TRUE) && (GOTOKILLORCSLAVESDONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_7518_ritter_gotokillorcslavesdone_info()
{
	AI_Output(self,other, " DIA_PAL_7518_RITTER_GoToKillOrcSlavesDone_01_00 " );	// Filthy orcs! (viciously) We killed them all!
	AI_Output(self,other, " DIA_PAL_7518_RITTER_GoToKillOrcSlavesDone_01_01 " );	// Now you must return to our camp and tell Albert about everything.
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"AfterBattle");
};

