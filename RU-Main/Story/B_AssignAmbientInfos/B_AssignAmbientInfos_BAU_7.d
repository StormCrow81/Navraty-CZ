

instance DIA_BAU_7_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_7_EXIT_Condition;
	information = DIA_BAU_7_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_7_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instances of DIA_BAU_7_STANDARD (C_Info)
{
	nr = 1;
	condition = DIA_BAU_7_STANDARD_Condition;
	information = DIA_BAU_7_STANDARD_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_BAU_7_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_STANDARD_Info()
{
	AI_Output(other,self, " DIA_BAU_7_STANDARD_15_00 " );	// What's new?
	if (chapter ==  1 )
	{
		AI_Output(self,other, " DIA_BAU_7_STANDARD_07_01 " );	// We declared independence - we no longer pay taxes to the city. The king does nothing for us anyway. We've had enough!
	};
	if (chapter ==  2 )
	{
		AI_Output(self,other, " DIA_BAU_7_STANDARD_07_02 " );	// I have nothing new to tell you now.
	};
	if (chapter ==  3 )
	{
		AI_Output(self,other, " DIA_BAU_7_STANDARD_07_03 " );	// Everyone is talking about dragons! The king will always find a way to squeeze more money out of the common people, even in times like this.
	};
	if (chapter ==  4 )
	{
		AI_Output(self,other, " DIA_BAU_7_STANDARD_07_04 " );	// Be careful: lately dark personages and various wild beasts have been pouring through the passage in droves.
	};
	if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_BAU_7_STANDARZ_07_05 " );	// Everyone is talking about the undead plague. Damn it, where did they all come from?!
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_BAU_7_STANDARD_07_06 " );	// It looks like we're all going to die soon. The orcs will spare no human!
	};
};

func void B_AssignAmbientInfos_BAU_7(var C_Npc slf)
{
	dia_bau_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_standard.npc = Hlp_GetInstanceID(slf);
};

