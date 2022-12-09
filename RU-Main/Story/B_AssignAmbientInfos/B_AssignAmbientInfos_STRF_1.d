

instance DIA_STRF_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_STRF_1_EXIT_Condition;
	information = DIA_STRF_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_1_STANDARD(C_Info)
{
	nr = 2;
	condition = DIA_STRF_1_STANDARD_Condition;
	information = DIA_STRF_1_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_STRF_1_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_STRF_1_STANDARD_Info()
{
	be int randy;
	randy = Hlp_Random( 3 );
	if(randy == 0)
	{
		AI_Output(self,other, " DIA_STRF_1_STANDARD_01_00 " );	// If I'd managed to get out of here when I had the chance, I wouldn't have to turn my back on that pig right now!
	};
	if(randy == 1)
	{
		AI_Output(self,other, " DIA_STRF_1_STANDARD_01_01 " );	// It's all because of this ore. Everything is always the same. Everyone desperately needs this damned ore.
	};
	if(randy == 2)
	{
		AI_Output(self,other, " DIA_STRF_1_STANDARD_01_02 " );	// If you tried this crap they supply us with, you'd think about rebellion too!
	};
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_STRF_1(var C_Npc slf)
{
	dia_strf_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_strf_1_standard.npc = Hlp_GetInstanceID(slf);
};

