

instance DIA_OUT_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OUT_1_EXIT_Condition;
	information = DIA_OUT_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OUT_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OUT_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OUT_1_STANDARD(C_Info)
{
	nr = 2;
	condition = DIA_OUT_1_STANDARD_Condition;
	information = DIA_OUT_1_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_OUT_1_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_OUT_1_STANDARD_Info()
{
	be int randy;
	randy = Hlp_Random( 3 );
	if(randy == 0)
	{
		AI_Output(self,other, " DIA_OUT_1_STANDARD_01_00 " );	// Ever since the barrier around the penal colony was gone, we've been in constant trouble with bandits.
	};
	if(randy == 1)
	{
		AI_Output(self,other, " DIA_OUT_1_STANDARD_01_01 " );	// You can't rely on the militia. We must protect ourselves.
	};
	if(randy == 2)
	{
		AI_Output(self,other, " DIA_OUT_1_STANDARD_01_02 " );	// I won't let anyone push me around. Neither the king, nor this fat Onar. I only fight for myself.
	};
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_OUT_1(var C_Npc slf)
{
	dia_out_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_out_1_standard.npc = Hlp_GetInstanceID(slf);
};

instance DIA_DJG_Syl_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_DJG_Syl_EXIT_Condition;
	information = DIA_DJG_Syl_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_DJG_Syl_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DJG_Syl_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_DJG_Syl(var C_Npc slf)
{
	dia_DJG_Syl_exit.npc = Hlp_GetInstanceID(slf);
};
