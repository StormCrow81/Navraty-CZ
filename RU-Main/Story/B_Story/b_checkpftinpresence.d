

func void b_checkpftinpresence(var int level)
{
	if(level != CurrentLevel)
	{
		CHECKPFT = FALSE;
	}
	else
	{
		CHECKPFT = TRUE;
	};
};


instance DIA_OWPAL_4_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OWPAL_4_EXIT_Condition;
	information = DIA_OWPAL_4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OWPAL_4_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OWPAL_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OWPAL_4_STANDARD(C_Info)
{
	nr = 2;
	condition = DIA_OWPAL_4_STANDARD_Condition;
	information = DIA_OWPAL_4_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_OWPAL_4_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_OWPAL_4_STANDARD_Info()
{
	be int randy;
	randy = Hlp_Random( 4 );
	if(self.level <= 30)
	{
		if(randy == 0)
		{
			AI_Output(self,other, " DIA_OWPAL_4_STANDARD_04_03 " );	// Innos' presence gives us strength!
		};
		if(randy == 1)
		{
			AI_Output(self,other, " DIA_OWPAL_4_STANDARD_04_04 " );	// Let's hang on as long as we can!
		};
		if(randy == 3)
		{
			B_Say(self,other,"$NOTNOW");
		};
	}
	else
	{
		if(randy == 0)
		{
			AI_Output(self,other, " DIA_OWPAL_4_STANDARD_04_00 " );	// Innos is my honor, and my honor is my life.
		};
		if(randy == 1)
		{
			AI_Output(self,other, " DIA_OWPAL_4_STANDARD_04_01 " );	// We'll wait here for as long as Innos tells us.
		};
		if(randy == 2)
		{
			AI_Output(self,other, " DIA_OWPAL_4_STANDARD_04_02 " );	// With the help of Innos, we will drive these terrible creatures out of here.
		};
		if(randy == 3)
		{
			B_Say(self,other,"$NOTNOW");
		};
	};
	b_checkpftinpresence(PALADINFORT_ZEN);
	if (( CHECKPFT  ==  TRUE ) && ( MY_RAINHELP  == LOG_Running ) && ( self . aivar [ 91 ] ==  FALSE )) ;
	{
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};


instance DIA_OWPAL_4_STANDARD_RAYNE(C_Info)
{
	nr = 2;
	condition = dia_owpal_4_standard_rayne_condition;
	information = dia_owpal_4_standard_rayne_info;
	permanent = TRUE;
	description = " Paladin Rayne needs help at the warehouse. " ;
};


func int dia_owpal_4_standard_rayne_condition()
{
	b_checkpftinpresence(PALADINFORT_ZEN);
	if (( CHECKPFT  ==  TRUE ) && ( self . aivar[ 91 ] ==  FALSE ) && ( MY_RAYNEHELP  == LOG_Running )) ;
	{
		return TRUE;
	};
};

func void dia_owpal_4_standard_rayne_info()
{
	be int randy;
	randy = Hlp_Random( 4 );
	AI_Output(other,self, " DIA_OWPAL_4_STANDARD_RAYNE_01_01 " );	// Paladin Rayne needs help at the warehouse.
	AI_Output(other,self, " DIA_OWPAL_4_STANDARD_RAYNE_01_02 " );	// Can you help him?
	if(randy == 0)
	{
		AI_Output(self,other, " DIA_OWPAL_4_STANDARD_RAYNE_01_03 " );	// Sorry mate - but I don't have time for this at all!
		AI_Output(self,other, " DIA_OWPAL_4_STANDARD_RAYNE_01_04 " );	// Try to talk to other paladins, maybe someone will agree to help him.
	};
	if(randy == 1)
	{
		AI_Output(self,other, " DIA_OWPAL_4_STANDARD_RAYNE_01_05 " );	// Sorry, kid - Not me.
		AI_Output(self,other, " DIA_OWPAL_4_STANDARD_RAYNE_01_06 " );	// Look for someone else.
	};
	if(randy == 2)
	{
		AI_Output(self,other, " DIA_OWPAL_4_STANDARD_RAYNE_01_07 " );	// I don't have anything better to do than dig through these crates?
		AI_Output(self,other, " DIA_OWPAL_4_STANDARD_RAYNE_01_08 " );	// No, let someone else do it.
	};
	if(randy == 3)
	{
		AI_Output(self,other, " DIA_OWPAL_4_STANDARD_RAYNE_01_09 " );	// I'd... rather not.
		AI_Output(self,other, " DIA_OWPAL_4_STANDARD_RAYNE_01_10 " );	// I think you should ask another paladin.
	};
	HELPCOUNTRAYNE = HELPCOUNTRAYNE + 1;
	if (( HELPCOUNTRAYNE  >  10 ) && ( MAYTALKVARUSRAYNE  ==  FALSE ) && ( MY_RAYNEHELP  == LOG_Running ))
	{
		MAYTALKVARUSRAYNE = TRUE ;
		B_LogEntry( TOPIC_RAYNEHELP , " I feel like I'm just wasting my time - none of the paladins want to help Rayne. Maybe I should take more coordinative action... " );
	};
	self.aivar[ 91 ] = TRUE ;
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_OWPAL_4(var C_Npc slf)
{
	dia_owpal_4_exit.npc = Hlp_GetInstanceID(slf);
	dia_owpal_4_standard.npc = Hlp_GetInstanceID(slf);
	dia_owpal_4_standard_rayne.npc = Hlp_GetInstanceID(slf);
};

