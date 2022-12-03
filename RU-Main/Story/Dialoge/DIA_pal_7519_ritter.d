

instance DIA_PAL_7519_RITTER_EXIT(C_Info)
{
	npc = pal_7519_ritter;
	nr = 999;
	condition = dia_pal_7519_ritter_exit_condition;
	information = dia_pal_7519_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_7519_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_7519_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_7519_RITTER_PEOPLE(C_Info)
{
	npc = pal_7519_ritter;
	nr = 3;
	condition = dia_pal_7519_ritter_people_condition;
	information = dia_pal_7519_ritter_people_info;
	permanent = TRUE;
	description = " Who is your commander? " ;
};


func int dia_pal_7519_ritter_people_condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void dia_pal_7519_ritter_people_info()
{
	AI_Output(other,self, " DIA_PAL_7519_RITTER_People_01_00 " );	// Who is your commander?
	AI_Output(self,other, " DIA_PAL_7519_RITTER_People_01_01 " );	// Our squad is now led by paladin Albert.
	AI_Output(self,other, " DIA_PAL_7519_RITTER_PEOPLE_01_02 " );	// You'll find him deep in a cave not far from here.
};


instance DIA_PAL_7519_RITTER_LOCATION(C_Info)
{
	npc = pal_7519_ritter;
	nr = 2;
	condition = dia_pal_7519_ritter_location_condition;
	information = dia_pal_7519_ritter_location_info;
	permanent = TRUE;
	description = " What can you tell us about the area? " ;
};


func int dia_pal_7519_ritter_location_condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void dia_pal_7519_ritter_location_info()
{
	AI_Output(other,self, " DIA_PAL_7519_RITTER_LOCATION_01_00 " );	// What can you tell interesting about this area?
	AI_Output(self,other, " DIA_PAL_7519_RITTER_LOCATION_01_01 " );	// Upstairs, above us is a camp of former convicts.
	AI_Output(self,other, " DIA_PAL_7519_RITTER_LOCATION_01_02 " );	// Although they do not revere Innos, they can still be dealt with.
	AI_Output(self,other, " DIA_PAL_7519_RITTER_LOCATION_01_03 " );	// Across the river is a rather dangerous forest, but there are no orcs in it!
	AI_Output(self,other, " DIA_PAL_7519_RITTER_LOCATION_01_04 " );	// They're all down on the coast - they kind of have a camp there.
};


instance DIA_PAL_7519_RITTER_STANDARD(C_Info)
{
	npc = pal_7519_ritter;
	nr = 1;
	condition = dia_pal_7519_ritter_standard_condition;
	information = dia_pal_7519_ritter_standard_info;
	permanent = TRUE;
	description = " How are things? " ;
};


func int dia_pal_7519_ritter_standard_condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void dia_pal_7519_ritter_standard_info()
{
	AI_Output(other,self, " DIA_PAL_7519_RITTER_Standard_01_00 " );	// How setting?
	AI_Output(self,other, " DIA_PAL_7519_RITTER_Standard_01_01 " );	// So far everything is quiet.
};


instance DIA_PAL_7519_RITTER_GOTOKILLORCSLAVES(C_Info)
{
	npc = pal_7519_ritter;
	nr = 1;
	condition = dia_pal_7519_ritter_gotokillorcslaves_condition;
	information = dia_pal_7519_ritter_gotokillorcslaves_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_7519_ritter_gotokillorcslaves_condition()
{
	if (( MY_ORDER  == LOG_Running ) && ( GOTOKILLORCSLAVES  ==  TRUE ) && ( GOTOKILLORCSLAVESDONE  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_pal_7519_ritter_gotokillorcslaves_info()
{
	AI_Output(self,other, " DIA_PAL_7519_RITTER_GoToKillOrcSlaves_01_00 " );	// Albert ordered me to go with you in search of a detachment of orcs.
	AI_Output(other,self, " DIA_PAL_7519_RITTER_GoToKillOrcSlaves_01_01 " );	// That's right. Extra help won't hurt me.
	AI_Output(self,other, " DIA_PAL_7519_RITTER_GoToKillOrcSlaves_01_02 " );	// Good! Then my sword is at your disposal.
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	Npc_ExchangeRoutine(self,"FOLLOW");
	PALTWOORCSLAVE = TRUE;
};


instance DIA_PAL_7519_RITTER_GOTOKILLORCSLAVESDONE(C_Info)
{
	npc = pal_7519_ritter;
	nr = 1;
	condition = dia_pal_7519_ritter_gotokillorcslavesdone_condition;
	information = dia_pal_7519_ritter_gotokillorcslavesdone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_7519_ritter_gotokillorcslavesdone_condition()
{
	if (( MY_ORCORDER  == LOG_Running ) && ( GOTOKILLORCSLAVES  ==  TRUE ) && ( PALTWOORCSLAVE  ==  TRUE ) && ( GOTOKILLORCSLAVESDONE  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_pal_7519_ritter_gotokillorcslavesdone_info()
{
	AI_Output(self,other, " DIA_PAL_7519_RITTER_GoToKillOrcSlavesDone_01_00 " );	// You need to get back to camp - Albert needs to know what happened here!
	AI_Output(other,self, " DIA_PAL_7519_RITTER_GoToKillOrcSlavesDone_01_01 " );	// Of course.
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"AfterBattle");
};

